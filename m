Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CD6C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 22:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C397401DD;
	Mon, 19 Dec 2022 22:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C397401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHLjgvqrbBG5; Mon, 19 Dec 2022 22:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF5840137;
	Mon, 19 Dec 2022 22:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF5840137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89A4B1BF348
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6386F408ED
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6386F408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TfJalr8eOpN for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 22:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBB3408A7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EBB3408A7
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 22:58:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so7002504wma.3
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 14:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HhWZ/aAGF0vyeI2cvR5O61fRBtBuYX7vaSsa2HqaXc=;
 b=ud/pn6lN9YE4/X+4fMrk+f5O4DsCO1TWda0uxQahKuUTMbuea34UXkxxPT4g9O6JyG
 E+XpLpyM2x6M45on04joMeHyxyP2o+XG566aqHRPdg7RXfXc07ycXcYKpIjtER1y0Ea2
 3mvil+APchRzlyOkysHLtCQnzwDZlZuM4mHwUSYpLgex5wevvay9vLo5QRPLFF6fvUxA
 I9/H1w4QAQME0LpKmV6Uxy5iiyi7KGmNgejtX+lcMrMqT0/YNO9UacbudqN4pEm7RrSC
 3R0TmusGiJ/nkc2n5y2zii7Dx5h/tSCiTStySPSpbGu6X68nOXyTDixFxf8JyT0+Irhb
 1Tag==
X-Gm-Message-State: ANoB5pnFka/76XTLduzDUnF8MJB/FvMvWV6CqymrMJi36eiSOUErmC39
 ey2hv/R+yPW2Tgb1OJkgAkU0cJp6m7g=
X-Google-Smtp-Source: AA0mqf4S9dVbpPeQJddHXgaCz4BzZtxNAo3AQ8hd79LXb7jb69FOs3/pv4wDQvrRg/O19r38ZHHimg==
X-Received: by 2002:a05:600c:2252:b0:3d2:196c:270c with SMTP id
 a18-20020a05600c225200b003d2196c270cmr27558345wmm.31.1671490708682; 
 Mon, 19 Dec 2022 14:58:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c092300b003b3307fb98fsm13101400wmp.24.2022.12.19.14.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 14:58:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 23:58:20 +0100
Message-Id: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8HhWZ/aAGF0vyeI2cvR5O61fRBtBuYX7vaSsa2HqaXc=;
 b=CExxtrj7xZfYnOq69oWyrA+Z/MfM4F5vRhZnfA2QlX+5sLe7aB3jGOcZXsg7gCTNY6
 Ut/zSFr9khtVfzUO+4tGLPzW355RrgA9E2VLQK0ju3V0l7CPsW+lHnAyeejHKl8EHazo
 TL0ZqDXdfOVs/3klEDnDwjGQuo5lM4gsIaiW/B7wz8zg0baxazWtdH4QLqwFBJAbmvFg
 aHjShcF8tJnKk1itJuBJjCi5T3rVA3BxtDVKJJfFHsTPtVFRPcpVAHLvYqSeAGxqajaZ
 bX+09omr0hvlYYyCyhCx16wV1NdNf6zVUpLtxG380OtpwoW+vqN4QaHMTLYiDbVpUJuQ
 At1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CExxtrj7
Subject: [Buildroot] [PATCH 1/1] package/lightning; fix build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.2.0 in
commit af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:

jit_disasm.c: In function 'fprintf_styled':
jit_disasm.c:57:27: error: parameter name omitted
   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
      |                           ^~~~~~
jit_disasm.c:57:35: error: parameter name omitted
   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-lib-jit_disasm.c-fix-build.patch     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/lightning/0001-lib-jit_disasm.c-fix-build.patch

diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
new file mode 100644
index 0000000000..f0bedc1817
--- /dev/null
+++ b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
@@ -0,0 +1,41 @@
+From 6d3ba4fb38ef3af61d8b7fc5c7781ed244ccf9fe Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 19 Dec 2022 23:36:48 +0100
+Subject: [PATCH] lib/jit_disasm.c: fix build
+
+Fix the following build failure raised since
+http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:
+
+jit_disasm.c: In function 'fprintf_styled':
+jit_disasm.c:57:27: error: parameter name omitted
+   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
+      |                           ^~~~~~
+jit_disasm.c:57:35: error: parameter name omitted
+   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
+      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to lightning@gnu.org]
+---
+ lib/jit_disasm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
+index 58a269b..68c966d 100644
+--- a/lib/jit_disasm.c
++++ b/lib/jit_disasm.c
+@@ -54,7 +54,7 @@ static FILE			 *disasm_stream;
+ #endif
+ 
+ #if BINUTILS_2_38
+-static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
++static int fprintf_styled(void * stream, enum disassembler_style style, const char* fmt, ...)
+ {
+   va_list args;
+   int r;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
