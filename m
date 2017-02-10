From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 10 Feb 2017 11:34:08 -0200
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with GCC
	older than v4.9
Message-ID: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
this flag requires GCC v4.9 or later. Older versions fail, complaining
about the unrecognized command line option.

The problem is not detectable in the autobuilders because they redirect
the output to files/pipes and ccache adds the offending flag only when
stderr is a terminal.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Change-Id: I0574c7527b24d9e21119961adfa1c7aa17337314

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Makefile.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5d591e9..6a010b1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -237,6 +237,13 @@ export PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
 TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
+# When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
+# this flag requires GCC v4.9 or later. Older versions fail, complaining
+# about unrecognized command line option.
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
+	TARGET_MAKE_ENV += GCC_COLORS=""
+endif
+
 TARGET_CONFIGURE_OPTS = \
 	$(TARGET_MAKE_ENV) \
 	AR="$(TARGET_AR)" \
@@ -286,6 +293,11 @@ HOST_MAKE_ENV = \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
 
+# Prevent ccache from passing '-fdiagnostics-color' (see above).
+ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
+	HOST_MAKE_ENV += GCC_COLORS=""
+endif
+
 HOST_CONFIGURE_OPTS = \
 	$(HOST_MAKE_ENV) \
 	AR="$(HOSTAR)" \
-- 
2.7.4
