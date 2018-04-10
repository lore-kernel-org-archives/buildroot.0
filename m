From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Apr 2018 12:59:45 +0300
Subject: [Buildroot] [PATCH] picocom: disable custom baud rate for musl libc
Message-ID: <04f165bfdd9c1e98e3e8485e392e77b003c92ace.1523354385.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 3.1 picocom enabled custom baud rate support for x86
targets. This requires the c_ispeed and c_opseed field in struct termios
that musl libc does not provide. Disable this feature to fix the build.

Fixes:
http://autobuild.buildroot.net/results/28e/28ec584484dedfd6ef473dfd9dd24481e27ce2b3/
http://autobuild.buildroot.net/results/912/912493a8f99416524a5897634ae62604436e9b51/
http://autobuild.buildroot.net/results/65d/65d0f449822f296dfe6b9be0e03a5a855f700a9e/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/picocom/picocom.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index d27c7343766c..4889115ad631 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -9,8 +9,14 @@ PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
+# musl libc has no c_{i,o}speed field in struct termios
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+PICOCOM_CPPFLAGS += -DNO_CUSTOM_BAUD
+endif
+
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		CPPFLAGS="$(TARGET_CPPFLAGS) $(PICOCOM_CPPFLAGS)" $(MAKE) -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
-- 
2.16.3
