Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53580C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:51:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D039663254
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D039663254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 712C26080D;
	Thu, 16 Sep 2021 16:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fb5cmtKG372E; Thu, 16 Sep 2021 16:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7502F60812;
	Thu, 16 Sep 2021 16:50:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF6931BF3E5
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EEBD407CB
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 16:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6tXByEP2Sdu for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 16:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C1A0407CA
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 16:50:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j134-20020a1c238c000000b0030b32367649so1479593wmj.3
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbIIcZ4q9kC8rLR1PA5yB0SNKydJxuk+oFq2jan4300=;
 b=HdOU7ApM5IWvdFN6TBi8ohUBoOdW2QIvcE3G65Edx4hAUFeaQFl2hUe3qcXkjKV8vK
 Pc/99uLaWsAGQFEi0blSSlq8GF+RNqZrjICSf9BZfI8XyqQAc3uI3muBINGq+bOCyygV
 CbYFUh1jtW367QeyGpr1DBofuAe6AzE0OxWfnE/TpoOcGNGIRPE9/sOtgHnvdALDappk
 fZKoZ94dcn6lYcvGy+ZwmMaucd8iQsccJnmhOM570aJdqByCOEPB9OvlVhSdfVu3K6iV
 ZOgpb6IQ71484AZLq33d8Ju/fXj7JyCCJ+mTzvVkL76XEVkwLQt7azFxmCslopsirGqq
 OAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbIIcZ4q9kC8rLR1PA5yB0SNKydJxuk+oFq2jan4300=;
 b=ZJ8bX3pgSSSu9uLPofcf2wsy5Ir0mJHHZlUFGRQPW/NFJHwRhDVsjjxZkgZqLD40nL
 T61wEfiWUGNiBltzJCQnQnvFTksT3+3MblcXn/5nWiNyVACCk5eNSXwiTxbikEyKGFcD
 YkgHIuiU/bA/AvC4vZ4ie4y/viTmOfSKNXdAZDA2f1i6oeYUwPuhcVN4I3JuisFB9Yhf
 +5qmj6qLgW709VQocr9kMtpJj9/EgaEB26QV9yxXRquqpwpxz6EovVaKjH7Q4q6/CwG+
 6BSmJ99dcTIXBxynmZIMkZ406Y9fDVnBRbd6iVB527udqvbvrJDGXUwxFQ0f8cGMOvHK
 hFUg==
X-Gm-Message-State: AOAM531NavNNWbx73LNvGdIhY+nZUoM+XdVsDbvcYYHdnDleP+9DUmwC
 7TymBOaij1zdeinh9sgZNOaKid/N5a8=
X-Google-Smtp-Source: ABdhPJxAZpMHqoW6dPYo7eBGFQEDbd5n8HEpMuYCBF7XPfK31BlyeUX3fhz7sNt4v+PcHXj5NXnu9w==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr6127355wmj.120.1631811049597; 
 Thu, 16 Sep 2021 09:50:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id i5sm3825946wrc.86.2021.09.16.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:50:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 18:50:40 +0200
Message-Id: <20210916165040.1941425-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.0.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/opencontainers/runc/releases/tag/v1.0.2
https://github.com/opencontainers/runc/releases/tag/v1.0.1
https://github.com/opencontainers/runc/releases/tag/v1.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 598bd3067f..365beac21d 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
+sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 62b9f09bf2..e77ef8111e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-RUNC_VERSION_MAJOR = 1.0.0
-RUNC_VERSION_MINOR = rc95
-RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
+RUNC_VERSION = 1.0.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
-RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
-RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
