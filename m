From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 2 Dec 2016 12:51:57 +0100
Subject: [Buildroot] [PATCH] kexec: fix build when BR2_STRIP_none=y
Message-ID: <1480679517-551-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_STRIP is set to none, a dummy 'true' app is used instead of
strip utility. However, kexec package always requires a real strip
executable as it is used to generate intermediate files during the build
process.

If 'true' is used the build system runs the following command:

true --strip-debug -o purgatory/purgatory.ro purgatory/purgatory.ro.sym

which obviously doesn't do anything useful and the build later fails
with:

bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
/bin/sh: purgatory/purgatory.ro: No such file or directory
kexec/Makefile:7: recipe for target 'kexec/purgatory.c' failed
make[2]: *** [kexec/purgatory.c] Error 1

To resolve it always specify STRIP=$(CROSS_COMPILE)strip, regardless of
buildroot configuration.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/kexec/kexec.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 4ca55e5..08c5424 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -10,6 +10,8 @@ KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
 KEXEC_LICENSE_FILES = COPYING
 
+KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
+
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
 KEXEC_DEPENDENCIES = zlib
-- 
2.7.4
