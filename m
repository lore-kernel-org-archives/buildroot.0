From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 15:25:23 +0100
Subject: [Buildroot] [git commit master 1/1] slang: fix mips build failure
Message-ID: <20110225142552.0B38C8F625@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34ce7fb6230674cccfc3d329004f3224e95ec09e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3295

Fix MIPS build failure as reported by Thomas Petazzoni.

We're forcing CFLAGS and busting -fPIC in the process.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/slang/slang.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 74c800b..0c604d9 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -8,8 +8,10 @@ SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
 SLANG_SITE = http://www.uclibc.org/
 SLANG_INSTALL_STAGING = YES
 
+# We need to add -fPIC since we're busting original CFLAGS
+# that have it, see bug #3295
 define SLANG_BUILD_CMDS
-	$(MAKE1) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE1) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC" \
 	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
-- 
1.7.3.4
