From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 May 2015 18:40:46 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: disable ptrace with
	xtensa and uClibc-ng
Message-ID: <1431880846-28839-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uCLibc-ng needs to backport the uClibc commit
de6561f6669308e5d2297589b39a217d4c14df1c to add
PT_GETSIGINFO definition.

This commit is already merged in uClibc-snapshot used by
Buildroot's toolchains for xtensa.

For now, disable ptrace with xtensa uClibc-ng toolchains.

Thanks to Gergely Imreh for the initial investigation and
patch:
http://patchwork.ozlabs.org/patch/470073/

Fixes:
http://autobuild.buildroot.net/results/77b/77b82e5b437d0778b3f6a3813f2c0a5c39b52db9

Reported-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/enlightenment/enlightenment.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..ac15642 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -34,6 +34,11 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
 ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
 endif
 
+# uClibc-ng has an old incomplete sys/ptrace.h for xtensa
+ifeq ($(BR2_UCLIBC_VERSION_NG)$(BR2_xtensa),yy)
+ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
+endif
+
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
-- 
1.9.3
