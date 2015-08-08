From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:04 -0000
Subject: [Buildroot] [git commit branch/next] package/enlightenment: disable
	ptrace with xtensa and uClibc-ng
Message-ID: <20150808105559.364A37FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cce148558119047254981aab686deff16dbba1eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
