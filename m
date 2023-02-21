Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E3FC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 11:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B72B42CD8;
	Tue, 21 Feb 2023 11:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B72B42CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjIG1RhHd66Y; Tue, 21 Feb 2023 11:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0620442CDE;
	Tue, 21 Feb 2023 11:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0620442CDE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 587991BF33F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F15940CD7
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F15940CD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpmE42f_cJYU for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 11:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF970400DC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF970400DC
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:50:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o14so3360440wms.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 03:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdFkNM/NOqsobTbxqG8eIwyUpVKWUaRpgikntXY1I5A=;
 b=hAiCugZ/ybloik0Zhx8QG2xmldPxXTlS+rMBdU2t9G93PnMQJT2PCPNOoS8dslrdbf
 4qCBysMiKpaB1FbNYVxTE3teJ6OI8e2jwAq/Fi7sI7m3gEEthhLGTUU0PDCrS4zUbGIa
 XnlUkPdlKh3XWrv073dKBC3pVqAv+hWBYuynvY37GR6mNigPlNl+eidUC528DOW03toS
 UZVeT5Iv1EKYidvHvbvs3FQGKpFbVNAW4djsLA6sP7JCzwK1GvOc5kd9utCuz/gQapZb
 EPP8aAlw0xveyz0ulrwcNuXSzT5qLLDWtieXM5KfKIrDap0wtqD4BLgqn34fqJI4LhbH
 nb6A==
X-Gm-Message-State: AO0yUKUI2QA1F5wuOCtk4eCnewYQNx7y1Ez9ehBQ9V8khRDd6zOlhoAR
 l9vzyKtoHJGiDRx3wYlMg7qPhROSytI=
X-Google-Smtp-Source: AK7set+WX3frQ8rBnXmVOwbyW+2yEm4S2YCm0BebE8pwAfga4KigSWsNMWU4fwD9/TK5XPcnV5L4dA==
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr2597786wmn.33.1676980206204; 
 Tue, 21 Feb 2023 03:50:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c350600b003e0238d9101sm4909788wmq.31.2023.02.21.03.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 03:50:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 12:50:01 +0100
Message-Id: <20230221115001.190317-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdFkNM/NOqsobTbxqG8eIwyUpVKWUaRpgikntXY1I5A=;
 b=QdDoT8LCgTaX4q0xpfbkuHWfiNTfW9R9dC2/FQdjbx2AXBtBlezMA3y+CsU1RekOct
 b5SYdd/8msPZPdO6RDay/x7aNrfKhQBebaPTCiYuSxlPgN61Tch3N1E4oE+HnB7OUSfP
 /fZMCENFpJ1Zj51VglMBHo1gctYcjN2GRRzQ/q9r8DkiBIfILlVIrHKuGW9IMTMnapJH
 0P0AJBGUwNLUg4JfPHMPIAm2+EjYHamD9Z1d3sMrUgnuE/QtWgTz7yhDF0B46GumX3Sm
 hS2IBm5hNdjfXNk/PtDcctjbrxdJS59CjiGbiJNX521GzZDv/43pbuJSg4FtUzN1b5g2
 gv7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QdDoT8LC
Subject: [Buildroot] [PATCH 1/1] package/pcre2: drop JIT sparc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

JIT sparc support has been dropped since version 10.41 and
https://github.com/PCRE2Project/pcre2/commit/b67d5682019fd192a615a1d5ed254b564f54126b
resulting in the following build failure since bump to version 10.42 in
commit 64a03682cc1a90a311b2331224deac62f8c8940f:

src/pcre2_jit_compile.c:82:2: error: #error Unsupported architecture
   82 | #error Unsupported architecture
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d8246c9e3e54547cdb7d94dcdbf376d292dfd787

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcre2/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index f06f1914f3..ba4719dd3d 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc
-	default y if BR2_sparc
 
 config BR2_PACKAGE_PCRE2_JIT
 	bool "enable JIT support"
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
