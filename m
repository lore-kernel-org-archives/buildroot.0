From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:31 +0200
Subject: [Buildroot] [PATCH 13/14] manual: add documentation about packages'
	hashes
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <3664088ad6a362bc963227146fbcb2366ad3d629.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although md5 is, for legacy reasons, a supported hash type,
it is not documented on purpose, since it is now known to
be weak.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Changes v6 -> v7:
  - use single-line title  (Samuel)
---
 docs/manual/adding-packages-directory.txt | 66 +++++++++++++++++++++++++++++++
 support/download/check-hash               |  1 +
 2 files changed, 67 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 69b012c..c2f0a1a 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -357,3 +357,69 @@ different way, using different infrastructures:
 
 Further formatting details: see xref:writing-rules-mk[the writing
 rules].
+
+[[adding-packages-hash]]
+=== The +.hash+ file
+
+Optionally, you can add a third file, named +libfoo.hash+, that contains
+the hashes of the downloaded files for the +libfoo+ package.
+
+The hashes stored in that file are used to validate the integrity of the
+downloaded files.
+
+The format of this file is one line for each file for which to check the
+hash, each line being space-separated, with these three fields:
+
+* the type of hash, one of:
+** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
+* the hash of the file:
+** for +sha1+, 40 hexadecimal characters
+** for +sha224+, 56 hexadecimal characters
+** for +sha256+, 64 hexadecimal characters
+** for +sha384+, 96 hexadecimal characters
+** for +sha512+, 128 hexadecimal characters
+* the name of the file, without any directory component
+
+Lines starting with a +#+ sign are considered comments, and ignored. Empty
+lines are ignored.
+
+There can be more than one hash for a single file, each on its own line. In
+this case, all hashes must match.
+
+Ideally, the hashes stored in this file should match the hashes published by
+upstream, e.g. on their website, in the e-mail announcement... If upstream
+provides more than one type of hash (say, +sha1+ and +sha512+), then it is
+best to add all those hashes in the +.hash+ file. If upstream does not
+provide any hash, then compute at least one yourself, and mention this in a
+comment line above the hashes.
+
+*Note:* the number of spaces does not matter, so one can use spaces to
+properly align the different fields.
+
+The example below defines a +sha1+ and a +sha256+ published by upstream for
+the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
+a +sha256+ for a downloaded patch, and a +sha1+ for a downloaded binary blob:
+
+----
+# Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
+sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
+sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
+
+# No upstream hashes for the following:
+sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
+sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
+----
+
+If the +.hash+ file is present, and it contains one or more hashes for a
+downloaded file, the hash(es) computed by Buildroot (after download) must
+match the hash(es) stored in the +.hash+ file. If one or more hashes do
+not match, Buildroot considers this an error, deletes the downloaded file,
+and aborts.
+
+If the +.hash+ file is present, but it does not contain a hash for a
+downloaded file, no check is done for that file. If you set the
+environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
+there is no hash for a downloaded file, Buildroot considers this an
+error, deletes the downloaded file, and aborts.
+
+If the +.hash+ file is missing, then no check is done at all.
diff --git a/support/download/check-hash b/support/download/check-hash
index b13aad9..07799bb 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -22,6 +22,7 @@ check_one_hash() {
     _known="${2}"
     _file="${3}"
 
+    # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
     #       (the NIST has yet to publish the parameters).
     case "${_h}" in
-- 
1.9.1
