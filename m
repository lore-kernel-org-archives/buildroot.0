From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Dec 2016 17:12:27 +0100
Subject: [Buildroot] [git commit] kexec: fix build when BR2_STRIP_none=y
Message-ID: <20161202161747.249B981E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba19cb915ac3475487d4a1b46d014fcabeb71fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: add a comment explaining why this is done]
Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 4ca55e5..0a74369 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -10,6 +10,9 @@ KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPLv2
 KEXEC_LICENSE_FILES = COPYING
 
+# Makefile expects $STRIP -o to work, so needed for BR2_STRIP_none
+KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
+
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
 KEXEC_DEPENDENCIES = zlib
