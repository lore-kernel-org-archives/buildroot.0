From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:45 +0100
Subject: [Buildroot] [PATCH 12/13] manual: add documentation about packages'
	hashes
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <f76fe6c9f9d2ffd40e2c60f98f0ad0f7ca5fa0d7.1393781650.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index e56e59a..11f5c58 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -346,3 +346,60 @@ different way, using different infrastructures:
 
 Further formatting details: see xref:writing-rules-mk[the writing
 rules].
+
+The +.hash+ file
+~~~~~~~~~~~~~~~~
+[[adding-packages-hash]]
+
+Optionally, you can add a third file, named +libfoo.hash+, that contains
+the hashes of the downloaded files for the +libfoo+ package.
+
+The hashes stored in that file are used to validate the integrity of the
+downloaded files.
+
+The format for this file is one line for each file for which to check the
+hash, each line being space-separated, with these two fields:
+
+* the hash of the file, one of:
+** +sha1+, 40 hexa-decimal characters
+** +sha224+, 56 hexa-decimal characters
+** +sha256+, 64 hexa-decimal characters
+** +sha384+, 96 hexa-decimal characters
+** +sha512+, 128 hexa-decimal characters
+* the name of the file, without any directory component
+
+Lines starting with a +#+ sign are considered comments, and ignored. Empty
+lines are ignored.
+
+There can be more than one hash for a single file, each of its own line. In
+this case, all hashes must match.
+
+Ideally, the hashes stored in this file should match the hashes published by
+upstream, eg, on their website, in the email announcement... If no such info
+is available, then compute them yourself, and state so in a comment line
+above the hashes.
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
+486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
+efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
+
+# No upstream hashes for the following:
+ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
+2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
+----
+
+If the +.hash+ file is present, and there is one or more hashes for a
+downloaded file, the hash(es) of the downloaded file must match the
+hash(es) stored in the +.hash+ file. If one hash does not match, this is
+considered an error, and Buildroot aborts.
+
+If the +.hash+ file is present, but there is no hash for a downloaded file,
+or if the +.hash+ file is missing, then no check is done.
-- 
1.8.3.2
