From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 22:26:32 +0200
Subject: [Buildroot] [git commit] cryptopp: bump to 5.6.5
Message-ID: <20161022203101.35BC4819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da90437be784fa88e1f149067056096dd6847c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps cryptopp from 5.6.3 to 5.6.5 in order to fix bug

The commit f707b9ef1688d4429ca6239cf2dc236440974681, which Buildroot
was downloading as a patch to fix build with older gcc versions, has
been merged upstream as of 5.6.4, is therefore no longer necessary,
and dropped in this commit.

In addition, Andrey Volkov in the bug report #9321, proposed to add a
number of patches to cryptopp to solve issues when using
tegrarcm. Those patches are the following ones:

 - patch 0: moving to autotools as the build system. This is not
   strictly a bug fix, and is not necessary.

 - patch 1: merged upstream in
   "3941be18891a6a87626b7c70f715ca91c61c08c3 Fixed hang on ARM
   platforms in Integer::DivideThreeWordsByTwo", which is part of
   5.6.5.

 - patch 2: merged upstream in
   "9fca0c28023a177106cf58a3de6da610f185a6e4 Work around issue on
   ARMEL in MultiplyTop and GCC. ARMHF is OK", which is part of 5.6.5.

 - patch 3: merged upstream in
   "dce2317195a7d9aa77b159fd1beddaf8358f6243 Increase range for GCC
   workaround on ARMEL. After speaking with AP from GCC, he states
   some issues are still likely present in Master, which is GCC 6.0",
   which is part of 5.6.5

 - patch 4: merged upstream in
   "605744d8260c6ada033805c13ae0b2646acf18d6 Fixed SecBlock append
   when "this == t", fixed assert, added validation test (Issue 92)",
   which is part of 5.6.5

 - patch 5: merged upstream in
   "9f335d719ebc27f58251559240de0077ec42c583 Fix the Rijndael timing
   attack counter measure", which is part of 5.6.5

 - patch 6: merged upstream in
   "d8b02cfaafd7350ed0f876cd5da405cff330d537 Fixed m68k detection
   (Issue 153)", which is part of 5.6.5

 - patch 7: merged upstream in
   "c82fd655ed7465db8d21a0e0559c304a7a86d298 Cleared assert in debug
   builds (Issue 138)", which is part of 5.6.5

Bottom line: none of the patches proposed by Andrey Volkov are
necessary if we bump to 5.6.5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptopp/cryptopp.hash | 3 +--
 package/cryptopp/cryptopp.mk   | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index bf59c04..577638c 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,3 +1,2 @@
 # Locally computed
-sha256  9390670a14170dd0f48a6b6b06f74269ef4b056d4718a1a329f6f6069dc957c9  cryptopp563.zip
-sha256  74b88c2caf7cf843bdc74d3331adaf83e516167cc8eebe66a79612189549cfa4  f707b9ef1688d4429ca6239cf2dc236440974681.patch
+sha256  a75ef486fe3128008bbb201efee3dcdcffbe791120952910883b26337ec32c34  cryptopp565.zip
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index df07cf6..86a2da1 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 5.6.3
+CRYPTOPP_VERSION = 5.6.5
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com/
-# Upstream patch needed to fix the build with gcc < 4.5
-CRYPTOPP_PATCH = https://github.com/weidai11/cryptopp/commit/f707b9ef1688d4429ca6239cf2dc236440974681.patch
 CRYPTOPP_LICENSE = Boost-v1.0
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
