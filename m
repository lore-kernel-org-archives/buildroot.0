From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2009 10:00:41 +0200
Subject: [Buildroot] [git commit] pciutils: fix build with external
	toolchains
Message-ID: <20090802080125.EEA3B777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dcb752b1654d4186d02bbaa9db3b865ac03785cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot Makefile to compile pciutils wasn't passing TARGET_LDFLAGS
to pciutils build system. Therefore, at link time, the pciutils build
system was not taking into account the important --sysroot option,
which was breaking the link with external toolchains.

Fixes bug #523.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                      |    1 +
 package/pciutils/pciutils.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 527383c..684b394 100644
--- a/CHANGES
+++ b/CHANGES
@@ -50,6 +50,7 @@
 	#495: Bump bind package to 9.5.1-P3 (security)
 	#497: OpenSSL RSA key generation hangs on x86_64
 	#509: Bump sqlite package to 3.6.16
+	#527: pciutils broken with external toolchain
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 0d8155f..976afbf 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -41,7 +41,7 @@ $(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURC
 	touch $@
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
+	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) \
 		SHAREDIR="/usr/share/misc" \
 		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
 		HOST=$(KERNEL_ARCH)-linux \
-- 
1.6.3.3
