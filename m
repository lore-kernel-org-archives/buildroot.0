From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Jul 2012 23:37:27 +0200
Subject: [Buildroot] [PATCH v5 2/5] libevas: refactor *_CONF_OPT assignment
	with cpu-feature options
In-Reply-To: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
References: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342474650-10084-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index e716cea..c556942 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -115,23 +115,23 @@ LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
 endif
 
 # code options
-ifeq ($(BR2_i386)$(BR2_x86_64),y)
-# defaults
-LIBEVAS_CONF_OPT += --disable-cpu-mmx --disable-cpu-sse --disable-cpu-sse3
-
-# enable if cpu variant has mmx support
-ifneq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 LIBEVAS_CONF_OPT += --enable-cpu-mmx
+else
+LIBEVAS_CONF_OPT += --disable-cpu-mmx
+endif
 
-ifneq ($(BR2_x86_pentium_mmx)$(BR2_x86_pentium2)$(BR2_x86_k6)$(BR2_x86_k6_2)$(BR2_x86_athlon)$(BR2_x86_c3)$(BR2_x86_winchip_c6)$(BR2_x86_winchip2),y)
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse
+else
+LIBEVAS_CONF_OPT += --disable-cpu-sse
+endif
 
-ifneq ($(BR2_x86_pentium3)$(BR2_x86_pentium4)$(BR2_x86_prescott)$(BR2_x86_athlon_4)$(BR2_x86_opteron)$(BR2_x86_c32)$(BR2_x86_64_opteron),y)
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
 LIBEVAS_CONF_OPT += --enable-cpu-sse3
-endif # sse3
-endif # sse
-endif # mmx
-endif # x86
+else
+LIBEVAS_CONF_OPT += --disable-cpu-sse3
+endif
 
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
 LIBEVAS_CONF_OPT += --enable-cpu-altivec
-- 
1.7.11.2
