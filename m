From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:40:55 +0200
Subject: [Buildroot] [git commit] utils/test-pkg: add option to use an
	alternate toolchains CSV file
Message-ID: <20170729133709.9FF70804E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed59f81a3cb4ddb461afa1360c7eee9b0be5e2b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When testing a package with test-pkg, it may be useful to override the
set of toolchains used. For example:
- to test with toolchains used in your company;
- to test against a subset that is known to be problematic;
- to use only toolchains you already have available locally when you
  have no network access.

Add an option to use an alternate CSV file containing the config
fragments of toolchains to try.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/test-pkg | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index f951eda..6899d44 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -5,16 +5,17 @@ TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchain
+    local cfg dir pkg random toolchains_dir toolchain
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
-    o='hc:d:p:r:'
-    O='help,config-snippet:build-dir:package:,random:'
+    o='hc:d:p:r:t:'
+    O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
     random=0
+    toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -32,6 +33,9 @@ main() {
         (-r|--random)
             random="${2}"; shift 2
             ;;
+        (-t|--toolchains-csv)
+            toolchains_csv="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -50,7 +54,7 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=($(sed -r -e 's/,.*//; /internal/d;' "${TOOLCHAINS_CSV}" \
+    toolchains=($(sed -r -e 's/,.*//; /internal/d;' "${toolchains_csv}" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
@@ -144,8 +148,13 @@ In case failures are noticed, you can fix the package and just re-run the
 same command again; it will re-run the test where it failed. If you did
 specify a package (with -p), the package build dir will be removed first.
 
-The list of toolchains is retrieved from the Buildroot autobuilders, available
-at ${TOOLCHAINS_URL}.
+The list of toolchains is retrieved from ${TOOLCHAINS_CSV}.
+Only the external toolchains are tried, because building a Buildroot toolchain
+would take too long. An alternative toolchains CSV file can be specified with
+the -t option. This file should have lines consisting of the path to the
+toolchain config fragment and the required host architecture, separated by a
+comma. The config fragments should contain only the toolchain and architecture
+settings.
 
 Options:
 
@@ -167,6 +176,11 @@ Options:
         Limit the tests to the N randomly selected toolchains, instead of
         building with all toolchains.
 
+    -t CSVFILE, --toolchains-csv CSVFILE
+        CSV file containing the paths to config fragments of toolchains to
+        try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
+        used.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
