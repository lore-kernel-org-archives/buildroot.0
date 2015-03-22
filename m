From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 16:21:02 +0100
Subject: [Buildroot] [PATCH 3/7 v3] support/download: add explicit no-hash
	support
In-Reply-To: <cover.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <93d0033f46edcbeeb4de1e7bfad36e7970fb24b4.1427037564.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to explicitly state that an archive has no hash.

This can be used for archives downloaded from a repository, like a
git-clone or a subversion checkout, or using the github helper.

This will come in handy when we'll eventually make hashes mandatory as
soon as a .hash file exists: for some packages, like gcc, some versions
are downloaded as archives from upstream, while other versions may come
from a GitHub repository (via the github herlper).

In this case, a .hash file would exist, that contains hashes for the
downloaded tarballs, but archives downloaded from the repository would
not have a hash (since it is currently not possible to have reproducible
such archives). So, we'd need a way to explicitly state there is no
hash, on purpose, for those archives.

So, add 'none' as a new type of hash.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt | 13 +++++++++++--
 support/download/check-hash               |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 132c702..0f8bb64 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -423,8 +423,9 @@ The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
 
 * the type of hash, one of:
-** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
+** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
 * the hash of the file:
+** for +none+, one or more non-space chars, usually just the string +xxx+
 ** for +sha1+, 40 hexadecimal characters
 ** for +sha224+, 56 hexadecimal characters
 ** for +sha256+, 64 hexadecimal characters
@@ -448,9 +449,14 @@ comment line above the hashes.
 *Note:* the number of spaces does not matter, so one can use spaces to
 properly align the different fields.
 
+The +none+ hash type is reserved to those archives downloaded from a
+repository, like a 'git clone', a 'subversion checkout'... or archives
+downloaded with the xref:github-download-url[github helper].
+
 The example below defines a +sha1+ and a +sha256+ published by upstream for
 the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
-a +sha256+ for a downloaded patch, and a +sha1+ for a downloaded binary blob:
+a +sha256+ for a downloaded patch, a +sha1+ for a downloaded binary blob,
+and an archive with no hash:
 
 ----
 # Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
@@ -460,6 +466,9 @@ sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1
 # No upstream hashes for the following:
 sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
 sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
+
+# Explicitly no hash for that file, comes from a git-clone:
+none   xxx                                                              libfoo-1234.tar.gz
 ----
 
 If the +.hash+ file is present, and it contains one or more hashes for a
diff --git a/support/download/check-hash b/support/download/check-hash
index cee64ef..d0a4ab9 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -38,7 +38,9 @@ check_one_hash() {
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
     #       (the NIST has yet to publish the parameters).
+    # Note: 'none' means there is explicitly no hash for that file.
     case "${_h}" in
+        none) return 0;;
         md5|sha1)                       ;;
         sha224|sha256|sha384|sha512)    ;;
         *) # Unknown hash, exit with error
-- 
1.9.1
