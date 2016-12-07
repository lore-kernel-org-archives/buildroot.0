From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:34:52 +0100
Subject: [Buildroot] [git commit] linux: generate KBUILD_BUILD_TIMESTAMP
	date whith LC_ALL=C
Message-ID: <20161207223711.B1AF1816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10fc02b984f6f8c06291f94e6dbef0b289fd3880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix kernel reproducible build if a non-C locale is used on the host
system.

When building the Linux kernel, scripts/gen_initramfs_list.sh does 'date
-d"$KBUILD_BUILD_TIMESTAMP" +%s'. In linux.mk, Buildroot sets
KBUILD_BUILD_TIMESTAMP to "$(shell date -d @$(SOURCE_DATE_EPOCH))".

For example, if LANG=fr_FR.UTF-8 is defined in the host system, it does
not work:

- LC_ALL=C date -d"$(LC_ALL=C date)" : ok
- LC_ALL=C date -d"$(LC_ALL=fr_FR.UTF-8 date)" : error

LANG/LC_ALL variables exported in the main Makefiles are not passed in
the $(shell ...) sub-shells.

Signed-off-by: Jean-Baptiste Tr??dez <jean-baptiste.tredez@basystemes.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e826cc..e75dcaa 100644
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
