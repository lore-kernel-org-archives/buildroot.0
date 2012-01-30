From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 08:52:52 +0100
Subject: [Buildroot] [git commit] libevas: forcibly disable cpu optimization
	options if not applicable
Message-ID: <20120130075546.3729C9094D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a52db793e944d61947042eac6dc686577e82bd47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the configure script will automatically enable them for
potentially compatible targets.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 3a1e42d..6ad1126 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -103,19 +103,28 @@ LIBEVAS_CONF_OPT += --enable-cpu-sse
 
 ifneq ($(BR2_x86_pentium3)$(BR2_x86_pentium4)$(BR2_x86_prescott)$(BR2_x86_athlon_4)$(BR2_x86_opteron)$(BR2_x86_c32)$(BR2_x86_64_opteron),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse3
-
+else
+LIBEVAS_CONF_OPT += --disable-cpu-sse3
 endif # sse3
+else
+LIBEVAS_CONF_OPT += --disable-cpu-sse
 endif # sse
+else
+LIBEVAS_CONF_OPT += --disable-cpu-mmx
 endif # mmx
 endif # x86
 
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
 LIBEVAS_CONF_OPT += --enable-cpu-altivec
+else
+LIBEVAS_CONF_OPT += --disable-cpu-altivec
 endif
 
 ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
 # NEON is optional for A9
 LIBEVAS_CONF_OPT += --enable-cpu-neon
+else
+LIBEVAS_CONF_OPT += --disable-cpu-neon
 endif
 
 # loaders
