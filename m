From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 15:37:02 +0200
Subject: [Buildroot] [git commit] docs/manual: also document md5 hash
Message-ID: <20150504134035.61EF9819D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74ce748dc925ebca337d1d8fb27e425a8584d556
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We accept an md5 hash, but only if coming from upstream, and if also
accompanied with a stronger hash.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |   29 ++++++++++++++++++-----------
 1 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 639003f..6c478c2 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -415,9 +415,10 @@ The format of this file is one line for each file for which to check the
 hash, each line being space-separated, with these three fields:
 
 * the type of hash, one of:
-** +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
+** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
 * the hash of the file:
 ** for +none+, one or more non-space chars, usually just the string +xxx+
+** for +md5+, 32 hexadecimal characters
 ** for +sha1+, 40 hexadecimal characters
 ** for +sha224+, 56 hexadecimal characters
 ** for +sha256+, 64 hexadecimal characters
@@ -431,14 +432,17 @@ lines are ignored.
 There can be more than one hash for a single file, each on its own line. In
 this case, all hashes must match.
 
+.Note
 Ideally, the hashes stored in this file should match the hashes published by
 upstream, e.g. on their website, in the e-mail announcement... If upstream
-provides more than one type of hash (say, +sha1+ and +sha512+), then it is
+provides more than one type of hash (e.g. +sha1+ and +sha512+), then it is
 best to add all those hashes in the +.hash+ file. If upstream does not
-provide any hash, then compute at least one yourself, and mention this in a
-comment line above the hashes.
+provide any hash, or only provides an +md5+ hash, then compute at least one
+strong hash yourself (preferably +sha256+, but not +md5+), and mention
+this in a comment line above the hashes.
 
-*Note:* the number of spaces does not matter, so one can use spaces to
+.Note
+The number of spaces does not matter, so one can use spaces (or tabs) to
 properly align the different fields.
 
 The +none+ hash type is reserved to those archives downloaded from a
@@ -446,20 +450,23 @@ repository, like a 'git clone', a 'subversion checkout'... or archives
 downloaded with the xref:github-download-url[github helper].
 
 The example below defines a +sha1+ and a +sha256+ published by upstream for
-the main +libfoo-1.2.3.tar.bz2+ tarball, plus two locally-computed hashes,
-a +sha256+ for a downloaded patch, a +sha1+ for a downloaded binary blob,
-and an archive with no hash:
+the main +libfoo-1.2.3.tar.bz2+ tarball, an +md5+ from upstream and a
+locally-computed +sha256+ hashes for a binary blob, a +sha256+ for a
+downloaded patch, and an archive with no hash:
 
 ----
 # Hashes from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.{sha1,sha256}:
 sha1   486fb55c3efa71148fe07895fd713ea3a5ae343a                         libfoo-1.2.3.tar.bz2
 sha256 efc8103cc3bcb06bda6a781532d12701eb081ad83e8f90004b39ab81b65d4369 libfoo-1.2.3.tar.bz2
 
-# No upstream hashes for the following:
+# md5 from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.md5, sha256 locally computed:
+md5    2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
+sha256 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b libfoo-data.bin
+
+# Locally computed:
 sha256 ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9 libfoo-fix-blabla.patch
-sha1   2d608f3c318c6b7557d551a5a09314f03452f1a1                         libfoo-data.bin
 
-# Explicitly no hash for that file, comes from a git-clone:
+# No hash for 1234, comes from the github-helper:
 none   xxx                                                              libfoo-1234.tar.gz
 ----
 
