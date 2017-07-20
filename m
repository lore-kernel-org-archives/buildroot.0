From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 19 Jul 2017 23:18:36 -0400
Subject: [Buildroot] [PATCH] support/download: print dl hash if not provided
Message-ID: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a hash file exists but the hash is not provided, the script exits
without any information about the hash of the downloaded file.

        ERROR: No hash found for rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz

Now, the script hashes the downloaded file and suggests its sha256 to
the user.

	$ make
	...
	>>> rpi-userland 771a9aa7155442615bbe4cd6cf87b29b90cd228a Downloading
	--2017-07-19 21:38:39--  https://github.com/raspberrypi/userland/archive/771a9aa7155442615bbe4cd6cf87b29b90cd228a/rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
	...
	ERROR: No hash found for rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
	ERROR: If the source is trusted, consider adding these lines to package/rpi-userland//rpi-userland.hash
	# Locally calculated from download
	sha256 771fb1be53414b00a9213f24bd9c88059cf76b72c5e21ac613b267d3e58d3715 rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
	...

It also fixes check_one_hash description. check_one_hash() takes three
arguments:
 - algo hash
 - known hash
 - file to hash

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 support/download/check-hash | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index c1ff53c02..b18447f86 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -41,13 +41,12 @@ if [ ! -f "${h_file}" ]; then
     exit 0
 fi
 
-# Check one hash for a file
-# $1: known hash
+# Compute hash for a file
+# $1: algo hash
 # $2: file (full path)
-check_one_hash() {
+compute_hash() {
     _h="${1}"
-    _known="${2}"
-    _file="${3}"
+    _file="${2}"
 
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
@@ -66,8 +65,20 @@ check_one_hash() {
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
@@ -105,6 +116,12 @@ if [ ${nb_checks} -eq 0 ]; then
         exit 0
         ;;
     esac
+
+    h="sha256"
+    hash=$( compute_hash "${h}" "${file}" )
     printf "ERROR: No hash found for %s\n" "${base}" >&2
+    printf "ERROR: If the source is trusted, consider adding these lines to ${h_file}\n" >&2
+    printf "# Locally calculated from download\n" >&2
+    printf "${h} ${hash} ${base}\n" >&2
     exit 3
 fi
-- 
2.13.2
