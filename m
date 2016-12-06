From: =?UTF-8?q?Jean-Baptiste=20Tr=C3=A9dez?= <jean-baptiste.tredez@basystemes.fr>
Date: Tue,  6 Dec 2016 11:10:01 +0100
Subject: [Buildroot] [PATCH] Makefile: generate KBUILD_BUILD_TIMESTAMP date
	whith LANG=C
Message-ID: <1481019001-11035-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix kernel reproducible build if LANG=fr_FR.UTF-8 in host system.

when building linux kernel, scripts/gen_initramfs_list.sh do 'date -d"$KBUILD_BUILD_TIMESTAMP" +%s'
In buildroot makefile, KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
if LANG=fr_FR.UTF-8 in host system, it does not work :
- LANG=C date -d"$(LANG=C date)" : ok
- LANG=C date -d"$(LANG=fr_FR.UTF-8 date)" : error

Signed-off-by: Jean-Baptiste Tr?dez <jean-baptiste.tredez@basystemes.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a63d1f3..554c5f1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -99,7 +99,7 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
 	KBUILD_BUILD_USER=buildroot \
 	KBUILD_BUILD_HOST=buildroot \
-	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
+	KBUILD_BUILD_TIMESTAMP="$(shell LANG=C date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
 # Get the real Linux version, which tells us where kernel modules are
-- 
1.9.1
