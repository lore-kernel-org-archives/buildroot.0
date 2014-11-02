From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Nov 2014 16:25:53 +0100
Subject: [Buildroot] [PATCH 1/5] docs/manual: also document md5 hash
In-Reply-To: <cover.1414941796.git.yann.morin.1998@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
Message-ID: <b3269bb4ac2ddd0ccc68d363a2af062cb8c81ff6.1414941796.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We accept an md5 hash, but only if comming from upstream, and id
also accompanied with a stronger hash.

Thanks to Maxime for the interactive review! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 33 ++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c145829..174e567 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -376,8 +376,9 @@ The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
 
 * the type of hash, one of:
-** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
+** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
 * the hash of the file:
+** for +md5+, 32 hexadecimal characters
 ** for +sha1+, 40 hexadecimal characters
 ** for +sha224+, 56 hexadecimal characters
 ** for +sha256+, 64 hexadecimal characters
@@ -391,28 +392,36 @@ lines are ignored.
 There can be more than one hash for a single file, each on its own line. In
 this case, all hashes must match.
 
-Ideally, the hashes stored in this file should match the hashes published by
-upstream, e.g. on their website, in the e-mail announcement... If upstream
-provides more than one type of hash (say, +sha1+ and +sha512+), then it is
-best to add all those hashes in the +.hash+ file. If upstream does not
-provide any hash, then compute at least one yourself, and mention this in a
-comment line above the hashes.
+*Note:* Ideally, the hashes stored in this file should match the hashes
+published by upstream, e.g. on their website, in the e-mail announcement...
+If upstream provides more than one type of hash (e.g. +sha1+ and +sha512+),
+then it is best to add all those hashes in the +.hash+ file. If upstream
+does not provide any hash, or only provides an +md5+ hash, then compute at
+least one strong hash yourself (like +sha1+ or +sha256+, but not +md5+),
+and mention this in a comment line above the hashes.
 
 *Note:* the number of spaces does not matter, so one can use spaces to
 properly align the different fields.
 
-The example below defines a +sha1+ and a +sha256+ published by upstream for
-the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
-a +sha256+ for a downloaded patch, and a +sha1+ for a downloaded binary blob:
+The example below defines:
+
+* a +sha1+ and a +sha256+ published by upstream for the main
+  +libfoo-1.2.3.tar.bz2+ tarball,
+* an +md5+ from upstream and a locally-computed +sha256+ for a downloaded
+  binary blob,
+* a +sha256+ from upstream for a downloaded patch.
 
 ----
 # Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
 sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
 sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
 
-# No upstream hashes for the following:
+# md5 from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.md5, sha256 locally computed:
+md5    2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
+sha256 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b libfoo-data.bin
+
+# Upstream has no hash, so locally computed:
 sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
-sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
 ----
 
 If the +.hash+ file is present, and it contains one or more hashes for a
-- 
1.9.1
