Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0B5D12663
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 17:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC6F4405F0;
	Tue,  2 Dec 2025 17:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SScNt21GHkx; Tue,  2 Dec 2025 17:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223D141186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764698364;
	bh=lhO4DYcJnEBMoVg6Gh9XmUgVC5WqLJHjBf+3CHMqiQo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T6x2qOWzHn1wLN7UrMLST8h2h4UDq04xEUF2lDY6Fc2d+udWOyZMV3vUBQI79d9P4
	 ZqP8l4qWnJ57U5zOW0p3V29C7R6Osszbe2oAGg0taIX0JA6GbUC5StxFIoAuXdYlXV
	 KzjOvkZ7MvrkzzpFa9nNxTmQU4IBcAqwT9Iz57jTCr4aIRrKSwg3g+YtU1F1/AcWN3
	 aNMBLcFq92kO5QQeXdMuaFV7ObPtfNdla7etQv07Bq84zWuW2uo8pA1icrddl8zxnu
	 dtPXgRL+4ynthXRejgbkHjpJV6Jtbd0Uz5sta8/UmWC5KlAzT1VP8h9b8v9CaMF5In
	 lHsk5Wwboi/zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223D141186;
	Tue,  2 Dec 2025 17:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C651E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC8340556
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwD-qRC83qLb for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 17:59:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77054404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77054404D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77054404D4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:59:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8F0E9A4C78C9;
 Tue,  2 Dec 2025 18:59:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51072)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQUeh-000000003JO-1tzK;
 Tue, 02 Dec 2025 17:59:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Tue,  2 Dec 2025 18:59:15 +0100
Message-ID: <20251202175915.1616935-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764698356;
 bh=w96Zkjn5+AcG82DGqs+W41hPzrtjasxGA1HJOZNYgDk=;
 h=From:To:Cc:Subject:Date:From;
 b=dUiTvyXfc92H82jbmxgJ1Xxk+ZbQDhCDU6DmwHsEwIdthuEniHey6ihQ7gmfZeMJh
 8yo8GHO6/bQlM5iQo4P0kB9I+I+leYxbbuhQ5Oj133lQ55mCdEhdKZcFYrndsHuCYD
 Mu1iK2WxDUNJMR8md/o79SO2HQMPvfL8DHEx9yBqxJR9OTNGB8X4QH3sBmJXxTJjkM
 /SHnKFO8YCW6o6MwfWI9VvEw5jlsfuYsxDt59Zekpmez700UkHU7+bFHrorXr+2n5+
 YXuYnFlXsKgdDjyVi/sFlK5U605/53lQCQPDxe5yI+2m0LJYwRsVTAiM9yv8FR/qg4
 CqU1FAE1bOeUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dUiTvyXf
Subject: [Buildroot] [PATCH/next 1/1] package/jasper: bump version to 4.2.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which are included in this release.

License file was renamed upstream:
https://github.com/jasper-software/jasper/commit/688601c736165d424b95413ea40d5571a5ccfe02

Added configure option to force builddir:
https://github.com/jasper-software/jasper/blob/version-4.2.8/build/cmake/modules/InSourceBuild.cmake

Added configure option for JAS_STDC_VERSION:
https://github.com/jasper-software/jasper/commit/b8ecbfbf293ee6086e4d40108ad730229388cd8d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jasper/0001-Fixes-367.patch |  46 --------
 package/jasper/0002-Fixes-400.patch | 169 ----------------------------
 package/jasper/jasper.hash          |   4 +-
 package/jasper/jasper.mk            |  17 ++-
 4 files changed, 13 insertions(+), 223 deletions(-)
 delete mode 100644 package/jasper/0001-Fixes-367.patch
 delete mode 100644 package/jasper/0002-Fixes-400.patch

diff --git a/package/jasper/0001-Fixes-367.patch b/package/jasper/0001-Fixes-367.patch
deleted file mode 100644
index 11dfb5672f..0000000000
--- a/package/jasper/0001-Fixes-367.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From aeef5293c978158255ad4f127089644745602f2a Mon Sep 17 00:00:00 2001
-From: Michael Adams <mdadams@ece.uvic.ca>
-Date: Thu, 14 Dec 2023 19:04:19 -0800
-Subject: [PATCH] Fixes #367.
-
-Fixed an integer-overflow bug in the ICC profile parsing code.
-Added another invalid image to the test set.
-
-CVE: CVE-2023-51257
-Upstream: https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/libjasper/base/jas_icc.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
-index 905b823..2d1e91e 100644
---- a/src/libjasper/base/jas_icc.c
-+++ b/src/libjasper/base/jas_icc.c
-@@ -1295,10 +1295,22 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
- {
- 	jas_icctxt_t *txt = &attrval->data.txt;
- 	txt->string = 0;
--	if (!(txt->string = jas_malloc(cnt)))
-+	/* The string must at least contain a single null character. */
-+	if (cnt < 1) {
- 		goto error;
--	if (jas_stream_read(in, txt->string, cnt) != cnt)
-+	}
-+	if (!(txt->string = jas_malloc(cnt))) {
-+		goto error;
-+	}
-+	if (jas_stream_read(in, txt->string, cnt) != cnt) {
- 		goto error;
-+	}
-+	/* Ensure that the string is null terminated. */
-+	if (txt->string[cnt - 1] != '\0') {
-+		goto error;
-+	}
-+	/* The following line is redundant, unless we do not enforce that
-+	  the last character must be null. */
- 	txt->string[cnt - 1] = '\0';
- 	if (strlen(txt->string) + 1 != cnt)
- 		goto error;
--- 
-2.39.5
diff --git a/package/jasper/0002-Fixes-400.patch b/package/jasper/0002-Fixes-400.patch
deleted file mode 100644
index b663f1e72e..0000000000
--- a/package/jasper/0002-Fixes-400.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52 Mon Sep 17 00:00:00 2001
-From: Michael Adams <mdadams@ece.uvic.ca>
-Date: Tue, 29 Jul 2025 20:16:35 -0700
-Subject: [PATCH] Fixes #400.
-
-Added a check for a missing color component in the jas_image_chclrspc
-function.
-
-CVE: CVE-2025-8835
-Upstream: https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
-[thomas: backport to v2.0.33]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/libjasper/base/jas_image.c | 71 ++++++++++++++++++++++++++++------
- 1 file changed, 59 insertions(+), 12 deletions(-)
-
-diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
-index 68a94e1..cd99ba2 100644
---- a/src/libjasper/base/jas_image.c
-+++ b/src/libjasper/base/jas_image.c
-@@ -112,6 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
-   unsigned newprec);
- static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
-   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
-+static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
-+static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
- 
- /******************************************************************************\
- * Global data.
-@@ -409,6 +411,31 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
- 	jas_free(cmpt);
- }
- 
-+static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
-+{
-+	jas_cmcmptfmt_t* cmptfmts;
-+	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
-+		return 0;
-+	}
-+	for (int i = 0; i < n; ++i) {
-+		cmptfmts[i].buf = 0;
-+	}
-+	return cmptfmts;
-+}
-+
-+static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
-+{
-+	assert(cmptfmts);
-+	assert(n > 0);
-+	for (int i = 0; i < n; ++i) {
-+		if (cmptfmts[i].buf) {
-+			jas_free(cmptfmts[i].buf);
-+		}
-+		cmptfmts[i].buf = 0;
-+	}
-+	jas_free(cmptfmts);
-+}
-+
- /******************************************************************************\
- * Load and save operations.
- \******************************************************************************/
-@@ -1470,19 +1497,25 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
- 	jas_cmcmptfmt_t *incmptfmts;
- 	jas_cmcmptfmt_t *outcmptfmts;
- 
-+	assert(image);
-+	assert(outprof);
-+
- #if 0
- jas_eprintf("IMAGE\n");
- jas_image_dump(image, stderr);
- #endif
- 
--	if (image->numcmpts_ == 0)
-+	if (!jas_image_numcmpts(image)) {
- 		/* can't work with a file with no components;
- 		   continuing would crash because we'd attempt to
- 		   obtain information about the first component */
- 		return NULL;
-+	}
- 
- 	outimage = 0;
- 	xform = 0;
-+	incmptfmts = 0;
-+	outcmptfmts = 0;
- 	if (!(inimage = jas_image_copy(image)))
- 		goto error;
- 	image = 0;
-@@ -1565,15 +1598,21 @@ jas_image_dump(image, stderr);
- 	}
- 
- 	inpixmap.numcmpts = numinclrchans;
--	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
-+	assert(numinclrchans != 0);
-+	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
- 		abort();
- 	}
- 	inpixmap.cmptfmts = incmptfmts;
- 	for (unsigned i = 0; i < numinclrchans; ++i) {
- 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
-+		if (j < 0) {
-+			jas_eprintf("missing color component %d\n", i);
-+			goto error;
-+		}
- 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
- 			goto error;
- 		}
-+		assert(j >= 0 && j < jas_image_numcmpts(inimage));
- 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
- 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
- 		incmptfmts[i].width = width;
-@@ -1581,15 +1620,21 @@ jas_image_dump(image, stderr);
- 	}
- 
- 	outpixmap.numcmpts = numoutclrchans;
--	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
-+	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
- 		abort();
- 	}
- 	outpixmap.cmptfmts = outcmptfmts;
- 
- 	for (unsigned i = 0; i < numoutclrchans; ++i) {
- 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
--		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
-+		if (j < 0) {
-+			jas_eprintf("missing color component %d\n", i);
- 			goto error;
-+		}
-+		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
-+			goto error;
-+		}
-+		assert(j >= 0 && j < jas_image_numcmpts(outimage));
- 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
- 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
- 		outcmptfmts[i].width = width;
-@@ -1612,14 +1657,8 @@ jas_image_dump(image, stderr);
- 		}
- 	}
- 
--	for (unsigned i = 0; i < numoutclrchans; ++i) {
--		jas_free(outcmptfmts[i].buf);
--	}
--	jas_free(outcmptfmts);
--	for (unsigned i = 0; i < numinclrchans; ++i) {
--		jas_free(incmptfmts[i].buf);
--	}
--	jas_free(incmptfmts);
-+	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
-+	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
- 	jas_cmxform_destroy(xform);
- 	jas_image_destroy(inimage);
- 
-@@ -1631,6 +1670,14 @@ jas_image_dump(outimage, stderr);
- #endif
- 	return outimage;
- error:
-+	if (incmptfmts) {
-+		assert(numinclrchans);
-+		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
-+	}
-+	if (outcmptfmts) {
-+		assert(numoutclrchans);
-+		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
-+	}
- 	if (xform)
- 		jas_cmxform_destroy(xform);
- 	if (inimage)
--- 
-2.39.5
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 410bcfc683..3bda474dfa 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.33.tar.gz
-sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
+sha256  98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae  jasper-4.2.8.tar.gz
+sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE.txt
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 527ad6fa8c..a41f7cb6d8 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,22 +4,27 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.33
+JASPER_VERSION = 4.2.8
 JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-JASPER_LICENSE_FILES = LICENSE
+JASPER_LICENSE_FILES = LICENSE.txt
 JASPER_CPE_ID_VALID = YES
 JASPER_SUPPORTS_IN_SOURCE_BUILD = NO
 JASPER_CONF_OPTS = \
 	-DJAS_ENABLE_DOC=OFF \
 	-DJAS_ENABLE_PROGRAMS=OFF
 
-# 0001-Fixes-367.patch
-JASPER_IGNORE_CVES += CVE-2023-51257
+# Despite using JASPER_SUPPORTS_IN_SOURCE_BUILD = NO jasper detects an
+# in-source-build because a subdirectory inside the source directory
+# is used so we need to force the build.
+JASPER_CONF_OPTS += \
+	-DALLOW_IN_SOURCE_BUILD=ON
 
-# 0002-Fixes-400.patch
-JASPER_IGNORE_CVES += CVE-2025-8835
+# needed for cross-compile
+JASPER_STDC_VERSION="`echo __STDC_VERSION__ | $(TARGET_CROSS)cpp -E -P -`"
+JASPER_CONF_OPTS += \
+	-DJAS_STDC_VERSION=$(JASPER_STDC_VERSION)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
