From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  2 Jul 2017 00:09:35 +0300
Subject: [Buildroot] [PATCH] linuxptp: don't check host headers for target
	features
Message-ID: <70c812411b4b8408a4cfac95ef66d13fea893102.1498943375.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The incdefs.sh script runs ${CROSS_COMPILE}cpp to get a list of default
headers directories. Make sure CROSS_COMPILE is set correctly to avoid check
of host headers.

Also, drop the CC command line override. Upstream makefile sets CC to
$(CROSS_COMPILE)gcc.

Should fix:
http://autobuild.buildroot.net/results/394/394414df25b0b7261b27ca5d4901fde0f639e73c/
http://autobuild.buildroot.net/results/6ad/6adbc8c77c2ca70246b31600ab66b37c56c1e89e/
http://autobuild.buildroot.net/results/70d/70dfd05acc9d951169267f2820ecedb37f0711fe/

Cc: Petr Kulhavy <brain@jikos.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linuxptp/linuxptp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 5c2257c9d781..beb2591c3224 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -11,9 +11,9 @@ LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 
 define LINUXPTP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" \
+		$(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)" \
 		-C $(@D) all
 endef
 
-- 
2.11.0
