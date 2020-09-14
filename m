From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 14 Sep 2020 18:48:42 -0500
Subject: [Buildroot] [RFC] support/cargo: split main package from vendor code
Message-ID: <20200914234842.9043-1-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow top-level packages to be split from the main code and vendor code
so they will be archived separately. In this commit, it focuses on a
main app compared to the open-source pieces pulled through crates.io
required building for a rust package. In general, anything that will
have a "backend2" (possibly Python/pip, Node/NPM, Rust/Cargo and so on)
would be able to leverage this system.

Instead of a single <app>-<version>.tar.gz we end up with that file plus
<app>-<version>-vendor.tar.gz which must be extracted into the main
source as a post-extract step.

This is a hacky initial implementation, and will need more cleanup.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 support/download/cargo                        | 26 +++++++++++++++++--
 support/download/dl-wrapper                   | 25 ++++++++++++++++++
 .../scripts/find-vendor-licenses              |  7 ++++-
 3 files changed, 55 insertions(+), 3 deletions(-)
 rename package/ripgrep/find_vendor_licenses.sh => support/scripts/find-vendor-licenses (64%)

diff --git a/support/download/cargo b/support/download/cargo
index 0ce94cf16b..6162c908d4 100755
--- a/support/download/cargo
+++ b/support/download/cargo
@@ -29,13 +29,19 @@ if [ $# -le 2 ] ; then
     exit 1
 fi;
 
+buildroot_dir=$(pwd)
 tmpd="$(mktemp -d -p "$2")"
 cd "${tmpd}"
 
 tar xf "${1}"
 cd ./*/
 echo "Running cargo vendor."
-CARGO_HOME="${3}"/cargo_home cargo vendor -q --locked VENDOR
+CARGO_HOME="${3}"/cargo_home cargo vendor -q --locked ../VENDOR
+pushd ../VENDOR
+mkdir licenses
+${buildroot_dir}/support/scripts/find-vendor-licenses . | xargs -I{} cp --parents {} -t licenses/
+popd
+
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
 cat <<EOF >.cargo/config
@@ -56,10 +62,26 @@ date="2020-02-06 01:02:03"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
 # sources.buildroot.org and used in the *.hash files
-echo "Creating final archive."
+echo "Creating updated source archive, which will use the captured vendor info."
 tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
     --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
 gzip -6 -n <new.tar >new.tar.gz
 mv "${1}" "${1}".old
 mv new.tar.gz "${1}"
 rm "${1}".old
+
+# Cache the vendor portion
+
+# Generate the archive, sort with the C locale so that it is reproducible.
+find "$(basename "$OLDPWD/../VENDOR")" -not -type d -print0 >vendor-files.list
+LC_ALL=C sort -z <vendor-files.list >vendor-files.list.sorted
+# let's use a fixed hardcoded date to be reproducible
+date="2020-02-06 01:02:03"
+
+# Create GNU-format tarballs, since that's the format of the tarballs on
+# sources.buildroot.org and used in the *.hash files
+echo "Creating vendor info archive."
+tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
+    --owner=0 --group=0 --mtime="${date}" -T vendor-files.list.sorted
+gzip -6 -n <new.tar >vendor.tar.gz
+mv vendor.tar.gz ${1}-vendor
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5e52b3e60f..70dfa6f231 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -115,6 +115,9 @@ main() {
         tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
         tmpf="${tmpd}/output"
 
+        # Some backends may also pull in recursive-vendor code (such as cargo)
+        tmpf_vendor="${tmpf}-vendor"
+
         # Helpers expect to run in a directory that is *really* trashable, so
         # they are free to create whatever files and/or sub-dirs they might need.
         # Doing the 'cd' here rather than in all backends is easier.
@@ -176,6 +179,7 @@ main() {
     # tmp_output is in the same directory as the final output, so we can
     # later move it atomically.
     tmp_output="$(mktemp "${output}.XXXXXX")"
+    tmp_vendor_output="$(mktemp "${output/.tar.gz/-vendor.tar.gz}.XXXXXX")"
 
     # 'mktemp' creates files with 'go=-rwx', so the files are not accessible
     # to users other than the one doing the download (and root, of course).
@@ -192,6 +196,13 @@ main() {
     new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
     chmod ${new_mode} "${tmp_output}"
 
+    # same logic for vendor...
+    if [ ! -z "$backend2" ]; then
+        [ -x "${tmpf_vendor}" ] && new_mode=755 || new_mode=644
+        new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
+        chmod ${new_mode} "${tmp_vendor_output}"
+    fi
+
     # We must *not* unlink tmp_output, otherwise there is a small window
     # during which another download process may create the same tmp_output
     # name (very, very unlikely; but not impossible.)
@@ -206,6 +217,13 @@ main() {
         rm -rf "${tmpd}" "${tmp_output}"
         exit 1
     fi
+
+    if [ ! -z "$backend2" ]; then
+        if ! cat "${tmpf_vendor}" >>"${tmp_vendor_output}"; then
+            rm -rf "${tmpd}" "${tmp_vendor_output}"
+            exit 1
+        fi
+    fi
     rm -rf "${tmpd}"
 
     # tmp_output and output are on the same filesystem, so POSIX guarantees
@@ -217,6 +235,13 @@ main() {
         exit 1
     fi
 
+    if [ ! -z "$backend2" ]; then
+        if ! mv -f "${tmp_vendor_output}" "${output/.tar.gz/-vendor.tar.gz}"; then
+            rm -f "${tmp_vendor_output}"
+            exit 1
+        fi
+    fi
+
     return ${rc}
 }
 
diff --git a/package/ripgrep/find_vendor_licenses.sh b/support/scripts/find-vendor-licenses
similarity index 64%
rename from package/ripgrep/find_vendor_licenses.sh
rename to support/scripts/find-vendor-licenses
index fd8638e399..d48227e28f 100755
--- a/package/ripgrep/find_vendor_licenses.sh
+++ b/support/scripts/find-vendor-licenses
@@ -1,6 +1,11 @@
 #!/bin/sh
 # to run from the extracted final sources
-find VENDOR/ -type f \
+
+if [ $# != 1 ] || [ ! -d "$1" ]; then
+    echo "usage: $0 <path-to-vendor-loc>"
+fi
+
+find $1 -type f \
     \( -iname '*license*' -o -iname 'licence*' -o -iname 'copying*' -o -iname 'copyright*' \) \
     -a -not -name '*.a' | \
     sort
-- 
2.17.1
