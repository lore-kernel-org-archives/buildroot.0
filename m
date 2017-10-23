From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 23 Oct 2017 12:11:35 -0400
Subject: [Buildroot] [PATCHv2] support/download: print dl hash if not
	provided
Message-ID: <20171023161135.8799-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a hash file exists but the hash is not provided, the script exits
without any information about the hash of the downloaded file.

	ERROR: No hash found for rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz

Now, the script hashes the downloaded file and suggests its sha256 to
the user.

	$ make
	...
	>>> rpi-userland a7976021a89451de0d008aa48f16c4e88872899b Downloading
	--2017-10-23 15:29:46--  https://github.com/raspberrypi/userland/archive/a7976021a89451de0d008aa48f16c4e88872899b/rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
	...
	ERROR: No hash found for rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
	ERROR: Please find a hash in the upstream announcement or website and add it to package/rpi-userland//rpi-userland.hash
	ERROR: If upstream doesn't provide a hash and the source is trusted, consider adding these lines:
	# Locally calculated from download
	sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d0
	...

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Hi all,

I tested it without hash file, the build succeed

	$ rm -Rf output/build/rpi-userland-*
	$ rm -f package/rpi-userland/rpi-userland.hash
	$ make && echo succeed
	...
	succeed

I tested it with an empty hash file, the build failed

	$ rm -Rf output/build/rpi-userland-*
	$ rm -f package/rpi-userland/rpi-userland.hash
	$ touch package/rpi-userland/rpi-userland.hash
	$ make || echo oops
	...
	ERROR: No hash found for rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
	ERROR: Please find a hash in the upstream announcement or website and add it to package/rpi-userland//rpi-userland.hash
	ERROR: If upstream doesn't provide a hash and the source is trusted, consider adding these lines:
	# Locally calculated from download
sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
	...
	oops

I tested it with the new locally computed hash, the build succeed

	$ rm -Rf output/build/rpi-userland-*
	$ cat <<EOF >package/rpi-userland/rpi-userland.hash
# Locally calculated from download
sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
EOF
	$ make && echo succeed
	..
	succeed

Regards,
Gael

Changes since v1:
	reword error message as suggested by Arnout.

 support/download/check-hash | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index fe9c10570e..663efa014f 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -41,14 +41,12 @@ if [ ! -f "${h_file}" ]; then
     exit 0
 fi
 
-# Check one hash for a file
+# Compute hash for a file
 # $1: algo hash
-# $2: known hash
-# $3: file (full path)
-check_one_hash() {
+# $2: file (full path)
+compute_hash() {
     _h="${1}"
-    _known="${2}"
-    _file="${3}"
+    _file="${2}"
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -67,8 +65,20 @@ check_one_hash() {
             ;;
     esac
 
+    ${_h}sum "${_file}" |cut -d ' ' -f 1
+}
+
+# Check one hash for a file
+# $1: algo hash
+# $2: known hash
+# $3: file (full path)
+check_one_hash() {
+    _h="${1}"
+    _known="${2}"
+    _file="${3}"
+
     # Do the hashes match?
-    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    _hash=$( compute_hash "${_h}" "${_file}" )
     if [ "${_hash}" = "${_known}" ]; then
         printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
         return 0
@@ -106,6 +116,13 @@ if [ ${nb_checks} -eq 0 ]; then
         exit 0
         ;;
     esac
+
+    h="sha256"
+    hash=$( compute_hash "${h}" "${file}" )
     printf "ERROR: No hash found for %s\n" "${base}" >&2
+    printf "ERROR: Please find a hash in the upstream announcement or website and add it to ${h_file}\n" >&2
+    printf "ERROR: If upstream doesn't provide a hash and the source is trusted, consider adding these lines:\n" >&2
+    printf "# Locally calculated from download\n" >&2
+    printf "${h} ${hash} ${base}\n" >&2
     exit 3
 fi
-- 
2.11.0
