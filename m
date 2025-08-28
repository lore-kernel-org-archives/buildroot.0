Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24097C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 11:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF59A60D7B;
	Thu, 28 Aug 2025 11:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qirskt_KU9fZ; Thu, 28 Aug 2025 11:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4044260D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4044260D92;
	Thu, 28 Aug 2025 11:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01504B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBDAD40D56
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3URlEpXZw1zG for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 11:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2798140D55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2798140D55
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2798140D55
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BD0E1C6B3A3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:21:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D19560303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 11:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76E321C22D316; 
 Thu, 28 Aug 2025 13:22:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 13:22:01 +0200
Message-ID: <20250828112203.136135-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828112203.136135-1-thomas.petazzoni@bootlin.com>
References: <20250828112203.136135-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756380131; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=5pMv+U+0Oto1aCGVcIWOLaZ3nrEOsF8P4ES0xMkMu8o=;
 b=X38kotttDdAMaLkQUOwTSSnw93Sf8FoHZ4g07q3QJgKYGybzjt9ZPqErKJXikQk8HAiWV2
 1JZw81q6zKS8kY4Z1eRagzFsOzDxridodx6vsNXpcJtGWdJ4hRY4ZyeGuq6fUjHWnvj844
 OjYP+73LVr4QUyCgTY1F0zok96ALCqY+4lMpBu72/FGuWlH3sK3HDb6KZpZEY3oLSmYDPS
 OeQo78DRtV4w/uDikD6E5mH4aCz/QQBfW30kSRR0QrtwZVQuYk3MhNOXiS76r+ptvolIX6
 5hAdogh3kB+WZ5UV4Xmo+oBLPRGnvTRamCJiCo/Hk9P4L3zteiz4+hiUw8/4pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=X38kottt
Subject: [Buildroot] [PATCH 2/3] package/libsvgtiny: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package hasn't been updated in years. It has new releases, such
as 1.0.8 from December 2023, but nobody updated to it.

Doing the version bump is not straightforward, and the original
package submitter, Peter Korsgaard, is no longer using it. This
package also had no reverse dependency, and no maintainer in the
DEVELOPERS file.

Therefore, let's drop this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   4 -
 .../0001-disable-debug-printfs.patch          | 125 ------------------
 package/libsvgtiny/0002-Remove-Werror.patch   |  44 ------
 ...-inlines-and-non-inlines-calling-one.patch |  36 -----
 ...nclude-gperf-generated-code-directly.patch |  99 --------------
 ...ient-svgtiny_list-.c-add-missing-std.patch |  42 ------
 package/libsvgtiny/Config.in                  |   9 --
 package/libsvgtiny/libsvgtiny.hash            |   3 -
 package/libsvgtiny/libsvgtiny.mk              |  47 -------
 9 files changed, 409 deletions(-)
 delete mode 100644 package/libsvgtiny/0001-disable-debug-printfs.patch
 delete mode 100644 package/libsvgtiny/0002-Remove-Werror.patch
 delete mode 100644 package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
 delete mode 100644 package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
 delete mode 100644 package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
 delete mode 100644 package/libsvgtiny/Config.in
 delete mode 100644 package/libsvgtiny/libsvgtiny.hash
 delete mode 100644 package/libsvgtiny/libsvgtiny.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index bc315b3640..fb63cf6a77 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -653,10 +653,6 @@ package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch lib_patch.Upstream
 package/libsvg/0001-fix-expat-static-declaration.patch lib_patch.Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch lib_patch.Upstream
-package/libsvgtiny/0001-disable-debug-printfs.patch lib_patch.Upstream
-package/libsvgtiny/0002-Remove-Werror.patch lib_patch.Upstream
-package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch lib_patch.Upstream
-package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch lib_patch.Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
diff --git a/package/libsvgtiny/0001-disable-debug-printfs.patch b/package/libsvgtiny/0001-disable-debug-printfs.patch
deleted file mode 100644
index 72ed21ccfa..0000000000
--- a/package/libsvgtiny/0001-disable-debug-printfs.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-svntiny: svntiny_gradient.c: only print debugging if GRADIENT_DEBUG is enabled
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/svgtiny_gradient.c |   23 ++++++++++++++++++++++-
- 1 file changed, 22 insertions(+), 1 deletion(-)
-
-Index: libsvgtiny/src/svgtiny_gradient.c
-===================================================================
---- libsvgtiny.orig/src/svgtiny_gradient.c
-+++ libsvgtiny/src/svgtiny_gradient.c
-@@ -30,8 +30,9 @@ void svgtiny_find_gradient(const char *i
- {
- 	xmlNode *gradient;
- 
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "svgtiny_find_gradient: id \"%s\"\n", id);
--
-+#endif
- 	state->linear_gradient_stop_count = 0;
- 	state->gradient_x1 = "0%";
- 	state->gradient_y1 = "0%";
-@@ -47,13 +48,17 @@ void svgtiny_find_gradient(const char *i
- 
- 	gradient = svgtiny_find_element_by_id(
- 			(xmlNode *) state->document, id);
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "gradient %p\n", (void *) gradient);
-+#endif
- 	if (!gradient) {
- 		fprintf(stderr, "gradient \"%s\" not found\n", id);
- 		return;
- 	}
- 
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "gradient name \"%s\"\n", gradient->name);
-+#endif
- 	if (strcmp((const char *) gradient->name, "linearGradient") == 0) {
- 		svgtiny_parse_linear_gradient(gradient, state);
- 	}
-@@ -98,8 +103,10 @@ svgtiny_code svgtiny_parse_linear_gradie
- 				return svgtiny_OUT_OF_MEMORY;
- 			svgtiny_parse_transform(s, &a, &b, &c, &d, &e, &f);
- 			free(s);
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "transform %g %g %g %g %g %g\n",
- 					a, b, c, d, e, f);
-+#endif
- 			state->gradient_transform.a = a;
- 			state->gradient_transform.b = b;
- 			state->gradient_transform.c = c;
-@@ -143,7 +150,9 @@ svgtiny_code svgtiny_parse_linear_gradie
- 		}
- 
- 		if (offset != -1 && color != svgtiny_TRANSPARENT) {
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "stop %g %x\n", offset, color);
-+#endif
- 			state->gradient_stop[i].offset = offset;
- 			state->gradient_stop[i].color = color;
- 			i++;
-@@ -220,9 +229,11 @@ svgtiny_code svgtiny_add_path_linear_gra
- 	#endif
- 
- 	/* compute gradient vector */
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "x1 %s, y1 %s, x2 %s, y2 %s\n",
- 			state->gradient_x1, state->gradient_y1,
- 			state->gradient_x2, state->gradient_y2);
-+#endif
- 	if (!state->gradient_user_space_on_use) {
- 		gradient_x0 = object_x0 +
- 				svgtiny_parse_length(state->gradient_x1,
-@@ -297,9 +308,11 @@ svgtiny_code svgtiny_add_path_linear_gra
- 
- 	/* invert gradient transform for applying to vertices */
- 	svgtiny_invert_matrix(&state->gradient_transform.a, trans);
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "inverse transform %g %g %g %g %g %g\n",
- 			trans[0], trans[1], trans[2], trans[3],
- 			trans[4], trans[5]);
-+#endif
- 
- 	/* compute points on the path for triangle vertices */
- 	/* r, r0, r1 are distance along gradient vector */
-@@ -372,8 +385,10 @@ svgtiny_code svgtiny_add_path_linear_gra
- 		steps = ceilf(fabsf(r1 - r0) / 0.05);
- 		if (steps == 0)
- 			steps = 1;
-+#ifdef GRADIENT_DEBUG
- 		fprintf(stderr, "r0 %g, r1 %g, steps %i\n",
- 				r0, r1, steps);
-+#endif
- 
- 		/* loop through intermediate points */
- 		for (z = 1; z != steps; z++) {
-@@ -398,7 +413,9 @@ svgtiny_code svgtiny_add_path_linear_gra
- 			r = ((x_trans - gradient_x0) * gradient_dx +
- 					(y_trans - gradient_y0) * gradient_dy) /
- 					gradient_norm_squared;
-+#ifdef GRADIENT_DEBUG
- 			fprintf(stderr, "(%g %g [%g]) ", x, y, r);
-+#endif
- 			point = svgtiny_list_push(pts);
- 			if (!point) {
- 				svgtiny_list_free(pts);
-@@ -412,14 +429,18 @@ svgtiny_code svgtiny_add_path_linear_gra
- 				min_pt = svgtiny_list_size(pts) - 1;
- 			}
- 		}
-+#ifdef GRADIENT_DEBUG
- 		fprintf(stderr, "\n");
-+#endif
- 
- 		/* next segment start point is this segment end point */
- 		x0 = x1;
- 		y0 = y1;
- 	}
-+#ifdef GRADIENT_DEBUG
- 	fprintf(stderr, "pts size %i, min_pt %i, min_r %.3f\n",
- 			svgtiny_list_size(pts), min_pt, min_r);
-+#endif
- 
- 	/* render triangles */
- 	stop_count = state->linear_gradient_stop_count;
diff --git a/package/libsvgtiny/0002-Remove-Werror.patch b/package/libsvgtiny/0002-Remove-Werror.patch
deleted file mode 100644
index c8b0c0b9ef..0000000000
--- a/package/libsvgtiny/0002-Remove-Werror.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Remove -Werror from Makefile
-
-glibc-2.20 includes some changes to the include/features.h file
-introduced by this commit:
-
-  https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78
-
-Those changes make libsvgtiny fail because some warnings are thrown and
-the build system is using the -Werror option. We disable this to be able
-to build it, or otherwise we will see errors like this one:
-
-GPERF: src/colors.gperf
-COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
-In file included from
-/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
-		 from src/colors.gperf:16:
-/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
-error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
-_DEFAULT_SOURCE" [-Werror=cpp]
-
-and this one:
-
-In file included from src/colors.gperf:18:0:
-/home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
-error: "strndup" redefined [-Werror]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/Makefile b/Makefile
---- a/Makefile	2010-01-03 23:37:39.000000000 +0000
-+++ b/Makefile	2014-12-11 11:35:37.241903884 +0000
-@@ -13,12 +13,6 @@ TESTRUNNER := $(ECHO)
- WARNFLAGS := -Wall -W -Wundef -Wpointer-arith -Wcast-align \
- 	-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes \
- 	-Wmissing-declarations -Wnested-externs -pedantic
--# BeOS/Haiku/AmigaOS4 standard library headers create warnings
--ifneq ($(TARGET),beos)
--  ifneq ($(TARGET),AmigaOS)
--    WARNFLAGS := $(WARNFLAGS) -Werror
--  endif
--endif
- CFLAGS := -D_BSD_SOURCE -I$(CURDIR)/include/ \
- 	-I$(CURDIR)/src $(WARNFLAGS) $(CFLAGS)
- ifneq ($(GCCVER),2)
diff --git a/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch b/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
deleted file mode 100644
index 9285477d25..0000000000
--- a/package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 21b4836ac9d6c6725590a925daa5d17eda9843e9 Mon Sep 17 00:00:00 2001
-From: Daniel Silverstone <dsilvers@digital-scurf.org>
-Date: Sat, 26 Apr 2014 16:24:54 +0100
-Subject: Hopefully silence warnings about inlines and non inlines calling one
- another.
-
-[Retrieved from:
-https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=21b4836ac9d6c6725590a925daa5d17eda9843e9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/colors.gperf | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/src/colors.gperf b/src/colors.gperf
-index 89152d2..96d5b9e 100644
---- a/src/colors.gperf
-+++ b/src/colors.gperf
-@@ -16,6 +16,15 @@
- #include <string.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
-+
-+/* This unusual define shennanigan is to try and prevent the gperf
-+ * generated function from being inlined.  This is pointless given
-+ * it (a) is in a separate .c file and (b) has external linkage.
-+ */
-+#ifdef __inline
-+#undef __inline
-+#define __inline
-+#endif
- %}
- 
- struct svgtiny_named_color;
--- 
-cgit v1.2.1
-
diff --git a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
deleted file mode 100644
index b5443e9912..0000000000
--- a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 4390f1c84e8fee51fc22468821e6fc158e783053 Mon Sep 17 00:00:00 2001
-From: Michael Drake <michael.drake@codethink.co.uk>
-Date: Thu, 20 Apr 2017 10:51:07 +0100
-Subject: Build: Include gperf-generated code directly.
-
-Previously we built the generated code separatly and then linked to
-it.  However, this caused problems with certain compilers and gperf
-versions.  This change includes the generated code directly in
-svgtiny.c instead, which is the only place its used.
-
-[Retrieved from:
-https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=4390f1c84e8fee51fc22468821e6fc158e783053]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/Makefile           | 13 +++++++------
- src/colors.gperf       |  8 --------
- src/svgtiny.c          |  3 +++
- src/svgtiny_internal.h |  5 -----
- 4 files changed, 10 insertions(+), 19 deletions(-)
-
-(limited to 'src')
-
-diff --git a/src/Makefile b/src/Makefile
-index a979720..fb8a72f 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -1,13 +1,14 @@
- # Sources
- DIR_SOURCES := svgtiny.c svgtiny_gradient.c svgtiny_list.c
- 
--SOURCES := $(SOURCES) $(BUILDDIR)/src_colors.c
-+SOURCES := $(SOURCES)
- 
--$(BUILDDIR)/src_colors.c: src/colors.gperf
-+$(DIR)autogenerated_colors.c: src/colors.gperf
- 	$(VQ)$(ECHO) "   GPERF: $<"
--	$(Q)gperf --output-file=$@.tmp $<
--# Hack for GCC 4.2 compatibility (gperf 3.0.4 solves this properly)
--	$(Q)$(SED) -e 's/#ifdef __GNUC_STDC_INLINE__/#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__/' $@.tmp >$@
--	$(Q)$(RM) $@.tmp
-+	$(Q)gperf --output-file=$@ $<
-+
-+PRE_TARGETS := $(DIR)autogenerated_colors.c
-+
-+CLEAN_ITEMS := $(DIR)autogenerated_colors.c
- 
- include build/makefiles/Makefile.subdir
-diff --git a/src/colors.gperf b/src/colors.gperf
-index 96d5b9e..a836787 100644
---- a/src/colors.gperf
-+++ b/src/colors.gperf
-@@ -17,14 +17,6 @@
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
--/* This unusual define shennanigan is to try and prevent the gperf
-- * generated function from being inlined.  This is pointless given
-- * it (a) is in a separate .c file and (b) has external linkage.
-- */
--#ifdef __inline
--#undef __inline
--#define __inline
--#endif
- %}
- 
- struct svgtiny_named_color;
-diff --git a/src/svgtiny.c b/src/svgtiny.c
-index 4661a58..bbefb88 100644
---- a/src/svgtiny.c
-+++ b/src/svgtiny.c
-@@ -17,6 +17,9 @@
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
-+/* Source file generated by `gperf`. */
-+#include "autogenerated_colors.c"
-+
- #ifndef M_PI
- #define M_PI		3.14159265358979323846
- #endif
-diff --git a/src/svgtiny_internal.h b/src/svgtiny_internal.h
-index 158d230..6bf5d64 100644
---- a/src/svgtiny_internal.h
-+++ b/src/svgtiny_internal.h
-@@ -87,9 +87,4 @@
- void *svgtiny_list_push(struct svgtiny_list *list);
- void svgtiny_list_free(struct svgtiny_list *list);
- 
--/* colors.gperf */
--const struct svgtiny_named_color *
--		svgtiny_color_lookup(register const char *str,
--				register unsigned int len);
--
- #endif
--- 
-cgit v1.2.1
-
diff --git a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
deleted file mode 100644
index 17e63ba541..0000000000
--- a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1d86ce7e6ea9fae8285eed23d838f87ab3ac083c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 19 Aug 2025 23:28:35 +0200
-Subject: [PATCH] src/{svgtiny_gradient,svgtiny_list}.c: add missing <stdlib.h>
-
-Needed to get the prototype for malloc()/free().
-
-Upstream: N/A, already fixed upstream in a later release (but as part
-of a larger commit)
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/svgtiny_gradient.c | 1 +
- src/svgtiny_list.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/svgtiny_gradient.c b/src/svgtiny_gradient.c
-index 3a8db73..5172223 100644
---- a/src/svgtiny_gradient.c
-+++ b/src/svgtiny_gradient.c
-@@ -8,6 +8,7 @@
- #include <assert.h>
- #include <math.h>
- #include <string.h>
-+#include <stdlib.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
-diff --git a/src/svgtiny_list.c b/src/svgtiny_list.c
-index 53cfb34..91e2c98 100644
---- a/src/svgtiny_list.c
-+++ b/src/svgtiny_list.c
-@@ -11,6 +11,7 @@
-  */
- 
- #include <assert.h>
-+#include <stdlib.h>
- #include "svgtiny.h"
- #include "svgtiny_internal.h"
- 
--- 
-2.50.1
-
diff --git a/package/libsvgtiny/Config.in b/package/libsvgtiny/Config.in
deleted file mode 100644
index 836dec210e..0000000000
--- a/package/libsvgtiny/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_LIBSVGTINY
-	bool "libsvgtiny"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  Libsvgtiny is an implementation of SVG Tiny, written in C.
-	  It is currently in development for use with NetSurf and is
-	  intended to be suitable for use in other projects too.
-
-	  http://www.netsurf-browser.org/projects/libsvgtiny/
diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
deleted file mode 100644
index 55f4093e19..0000000000
--- a/package/libsvgtiny/libsvgtiny.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  758641d339b324a76294ef08e323faa2cefb557793f437c08af7deb3b73a453e  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06-git4.tar.gz
-sha256  92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
deleted file mode 100644
index 55ce4327fe..0000000000
--- a/package/libsvgtiny/libsvgtiny.mk
+++ /dev/null
@@ -1,47 +0,0 @@
-################################################################################
-#
-# libsvgtiny
-#
-################################################################################
-
-LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
-LIBSVGTINY_SITE_METHOD = git
-LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
-LIBSVGTINY_INSTALL_STAGING = YES
-LIBSVGTINY_DEPENDENCIES = \
-	libxml2 host-gperf host-pkgconf host-netsurf-buildsystem
-LIBSVGTINY_LICENSE = MIT
-LIBSVGTINY_LICENSE_FILES = README
-
-# The libsvgtiny build system cannot build both the shared and static
-# libraries. So when the Buildroot configuration requests to build
-# both the shared and static variants, we build only the shared one.
-ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-LIBSVGTINY_COMPONENT_TYPE = lib-shared
-else
-LIBSVGTINY_COMPONENT_TYPE = lib-static
-endif
-
-define LIBSVGTINY_CONFIGURE_CMDS
-	ln -sf $(HOST_DIR)/share/netsurf-buildsystem $(@D)/build
-endef
-
-# Use $(MAKE1) since parallel build fails
-define LIBSVGTINY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=/usr \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
-endef
-
-define LIBSVGTINY_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
-endef
-
-define LIBSVGTINY_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE1) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
-		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE) install
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
