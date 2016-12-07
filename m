From: =?UTF-8?q?Jean-Baptiste=20Tr=C3=A9dez?= <jean-baptiste.tredez@basystemes.fr>
Date: Wed,  7 Dec 2016 16:20:42 +0100
Subject: [Buildroot] [PATCH v2] Makefile: generate KBUILD_BUILD_TIMESTAMP
	date whith LC_ALL=C
Message-ID: <1481124042-25089-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix kernel reproducible build if LANG=fr_FR.UTF-8 or LC_ALL=fr_FR.UTF-8 in host system.

when building linux kernel, scripts/gen_initramfs_list.sh do 'date -d"$KBUILD_BUILD_TIMESTAMP" +%s'
In buildroot makefile, KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
if LANG=fr_FR.UTF-8 in host system, it does not work :
- LC_ALL=C date -d"$(LC_ALL=C date)" : ok
- LC_ALL=C date -d"$(LC_ALL=fr_FR.UTF-8 date)" : error

LANG/LC_ALL variables exported in the main Makefiles are not used in the $(shell ...) sub-shells.

Signed-off-by: Jean-Baptiste Tr?dez <jean-baptiste.tredez@basystemes.fr>
---
Changes in v2:
	- use LC_ALL=C instead of LANG=C

 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a63d1f3..2b776a9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -99,7 +99,7 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
 	KBUILD_BUILD_USER=buildroot \
 	KBUILD_BUILD_HOST=buildroot \
-	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
+	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
 # Get the real Linux version, which tells us where kernel modules are
-- 
1.9.1
