Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD79110A1E7E
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 11:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 661C5606F0;
	Thu, 26 Mar 2026 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuiQMS4wuUGS; Thu, 26 Mar 2026 11:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED3060034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774525005;
	bh=78c4o4GF8g2/X55pHMFjaVdAWU6whz9OL6BXpdrGaM4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GpvvkuJ6lNOG2L1/6q8ZolvfMg0QnxBnSveE/1NVnNM+OkZ3OWHYZl7Sw5llTwc9h
	 IaaQUhEvz1evTwGro/EV50SN5d9cVESbbVaYvDR61NsLv2Ehn3iz7hejqYEYv4TF9m
	 KJrtpb4C7gW0q7J/D4UYjNMEXLhGTcVW4XbXwHV5NT34knsl+QzGSD9MkqolkyCc7F
	 kwcz87xL8pK4P21xCJBg/6DoVktyCstjW7QdkEuYo/lLysO8MT3cOXFWr4k/WOYfUL
	 gP7B6cpengI0cTooJcClOVU5nb7Lnm3bL2kNnkaum61S5zIZszkbTg0mKrCS6VPZoc
	 i7bbCBOYyLMwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED3060034;
	Thu, 26 Mar 2026 11:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0D32353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9251680D17
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHpF8eFYsmg7 for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 11:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AFE480C6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFE480C6A
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AFE480C6A
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:36:42 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-824c9da9928so797311b3a.3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 04:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774525001; x=1775129801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dbG7Jw2hXEoiloiKHys6QzcPWv7MtqVelpTMibhAIRM=;
 b=MnWe5WLkh4PGOVEalAZfJt39l+vmBreDA3c2duUwdxw6EdrijdAA5dTUkETumFsfLm
 bMPJAnfPAzt+qUnk2P6bzNB6bCH8RCR4hGO7AhuJWqg/zqcG0DjzLCpSMTanx2hHNR3L
 1FTeETVkD6ufm89fzgi4/3OH5FOKUPXNT+qgJIbTmokMuCbcpUVX2EyXJQXMWqZn79dZ
 lILUzCxVBCT9fa4YwBWSTI/ElDqLa34C90RXqEWKgEhqt8GRrwhTZxqNEY0oBzR9xky3
 ykKJZ7VZ9pSb4ivjMxBYvdybKYBXNjL7LcUfYoEEsFxu1+RRG14VW+3yVFVQSM/WYNXG
 99uA==
X-Gm-Message-State: AOJu0Yw8VVM+GOZXyiT7S28Kmhl7LdN1+ob5AXu0UGM1cCchnRArpXWM
 TiWyZzXtKom6fsn56xiIyu4KI1DCIcHuWTddE1zQQZB6AkQDFTf6oH5t3kaHH0Xb
X-Gm-Gg: ATEYQzwTbSb7g/AQhsw1a2Cr7gCmClaPmZhZFgVPQvE+LMOYjSIlFUC5hUymZAv58kg
 Sdnv9GZUk4+V1BXZrkMst0Y9iXRTys0DjCq92bIaLV64MHklCl8NbGoCmlBF0IDcicGPFU6YaBJ
 4tr9R4apUTdNXufwAaD2cZfbzM6TwVI5FXsWtvXC5XKg6bz981Z23jys73QqBlzi6xp+FfXy/yz
 kzE1J+MBHy5IUub5jQsQT3P57G58+W9an0vvAjxuA+O4ut7ogp2N9doB9qVHsRxfGOWNs85gkpD
 fE2fjl62jc6uDZvk+aJraySG33VcZABX8IfHbEASGGpRdiMMlCtqiJWSz1klRvCtopbn1HJxUFi
 QrXjUgaAOzHZfU86h2Cl7/o8ZtuudnIVp+BgrgghyHcHFMaF9Q+u0cQUFJqg2NHYnsvgfb+NH3W
 8bWiRVBNp5HXf7YEcm3mRoqwrIQRuouWeE9d/jqPKA2XrOZQ==
X-Received: by 2002:a05:6a00:3989:b0:829:7d1c:29ff with SMTP id
 d2e1a72fcca58-82c6e1211c7mr7266320b3a.57.1774525001103; 
 Thu, 26 Mar 2026 04:36:41 -0700 (PDT)
Received: from fedora ([2409:40e5:11a6:4157:6782:ab8c:40e4:4b38])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82c7d20fc0fsm3041549b3a.19.2026.03.26.04.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 04:36:40 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, romain.naour@gmail.com, br025@umbiko.net,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Mar 2026 17:06:19 +0530
Message-ID: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303182128.1242999-1-chakrabortyshubham66@gmail.com>
References: <20260303182128.1242999-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774525001; x=1775129801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbG7Jw2hXEoiloiKHys6QzcPWv7MtqVelpTMibhAIRM=;
 b=R3ompXQlDYzAWrddvbt2FpqNNKKXk2GIgAZYnWr0bnI5CL4LxCyyylXG/faHzjqqvk
 i77qqalP1fzrZXsAtQVEa6XX8f0MWiaMX9iWa8r9SIHAfZ3XtbI8ibFBbnztHJsXlqw5
 6T0a6QIjH1Xv5nSrTnSa6G1N4euJQb60oU9ecCzlvwUy/4xcT2AaW0uhwBqIaIsDH1BX
 EfhApcp9hOqom6v9EMdVswgiteXEQkpF3HJPGuv2XVZ+rwrP7ASR+2fGHwDtM37FQT6/
 zZEtin9fBHWle3SUsxRLq7Wcp+yrMxZkSm+n+QJvbSihhuAKtE9AUesA5Q4UvvfiLz7C
 ARTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=R3ompXQl
Subject: [Buildroot] [PATCH v3] package/icu: fix static linking with icu-uc
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

Extend the existing patch to also add -lstdc++ to the Libs
field, fixing static linking issues with libicuuc.a.

This combines the previous 0003 and 0004 changes into a
single patch, following review feedback from Andreas.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v2 -> v3:
  - Merge previous 0003 and 0004 into a single patch
  - Extend existing fix to also add -lstdc++ to Libs (static linking case)
  - Keep original authorship and add my Signed-off-by below Romain's
  - Update commit message and description based on review feedback
---
 .../0003-fix-static-linking-with-icu-uc.patch | 29 ++++++++++++-------
 ...atic-linking-with-icu-uc-static-musl.patch | 26 -----------------
 2 files changed, 19 insertions(+), 36 deletions(-)
 delete mode 100644 package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch

diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
index 36a3d1f696..ec393254e8 100644
--- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -3,9 +3,6 @@ From: Romain Naour <romain.naour@openwide.fr>
 Date: Wed, 22 Jul 2015 22:43:25 +0200
 Subject: [PATCH] fix static linking with icu-uc
 
-During static linking with a C application and libicuuc.a,
--lstdc++ is required.
-
 Add -lstdc++ in Libs.private of icu-uc.pc.
 
 Fixes:
@@ -13,14 +10,26 @@ http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+This patch currently addresses linking against stdc++ for shared-library
+builds. Add -lstdc++ to the static build flags also, to fix 'undefined
+reference' errors when linking programs like xmlcatalog (libxml2)
+with musl static toolchains.
+
+Upstream: Inactive-Upstream [Buildroot specific]
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ source/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
---- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
-+++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
-@@ -279,7 +279,7 @@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+diff --git icu.orig/source/Makefile.in icu/source/Makefile.in
+--- icu.orig/source/Makefile.in
++++ icu/source/Makefile.in
+@@ -279,10 +279,10 @@ config/icu-uc.pc: config/icu.pc Makefile icudefs.mk
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
  else
  	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
 -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
diff --git a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
deleted file mode 100644
index e17f6ac775..0000000000
--- a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
-From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-Date: Tue, 3 Mar 2026 10:00:00 +0000
-Subject: [PATCH] fix static linking with icu-uc (static case)
-
-During static linking with a C application and libicuuc.a,
--lstdc++ is required. The previous patch (0003) only addressed the
-shared library case (Libs.private). This patch adds -lstdc++ to the
-main Libs line for the static case to fix undefined reference
-errors when linking programs like xmlcatalog (libxml2) with
-musl toolchains.
-
-Upstream: Inactive-Upstream [Buildroot specific]
-Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
----
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
---- icu.orig/source/Makefile.in
-+++ icu/source/Makefile.in
-@@ -281,3 +281,3 @@
- ifeq ($(ENABLE_SHARED),)
--	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
-+	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
- else
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
