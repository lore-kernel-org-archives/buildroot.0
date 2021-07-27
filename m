Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E803C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:23:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572E6617E4
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 572E6617E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2223840346;
	Tue, 27 Jul 2021 10:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0MflQxznI_P; Tue, 27 Jul 2021 10:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CBB84033D;
	Tue, 27 Jul 2021 10:23:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32EF71BF279
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18A864033D
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVdoJF0PblDf for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EDA54032B
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:22:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p5so9450150wro.7
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BqQctAd/Y13+PF+D6Oz4Z06iiD5pNX+GOg9FjpUDBqA=;
 b=UJBWv8wifF+pj7r1G+BeAB4tR72wTF734b33YDFtB4YH99dCBfwXX9+95tDyLYVUHv
 u2oK5rIBTBW0y6WMBQevXJsNOJ3lP4+sq1YnXfKs5W6fUPgzf7ku/uKnNEk2bhNRkJ4C
 BrBK0D6fPe7vC6gs7wEPnGKFiHrrdVf5Gct18Ivl0HM6iv+bnRhqk31oP28fyOy9vJk/
 xZh0iRRdartREvKPhj5G4HHsXhBPH1eV+98cki7MZ7nAvmC0nO9/4OYj33DPfBR9G75P
 gK8Js1bDqAprR1nqZhuqEYuBieHnKuo5HgsAfxTbeWo+8AxmcVuBIHdzcohnLsuTHnip
 DH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BqQctAd/Y13+PF+D6Oz4Z06iiD5pNX+GOg9FjpUDBqA=;
 b=cMsoWg33pJSmKHRyC3s6/5RdeQ3ZlCNckWC3PfbvnpdvFHaGl3mDQfQRQLV06mx+TI
 TGzazIojIHjKa1Wc1yVfQzkgw8omxN5wcFHCPtEH+Gc8+8FE94+YxvVdJmgJDFTw+oLm
 q9vWEQqFhEiYeyOXGXfZz8ZLrFAbBKkV2JA8/wbKZF/mELiSfKjSDj7naI1D1MAfMpDr
 3erNcIES4oMd07MlQTdc7/CEAtG67npQpBl0IfU7SoLgC+yIta7JDZ6/6JY9z6WWI/OV
 BnWAKcRZe4kQoNakXLI5ev4LoILCnHEa8eBYCO9lHGFLWVCb+JhndVVE/cDzIGykeZwZ
 9T1g==
X-Gm-Message-State: AOAM532riFehz+HXjt5JL/7hDAkjUf6SZeeeQtFvoPVAQayOLU0JDEI2
 1wqoOfezVbbg6WnvYdCyvZOANgyHqEzc6A==
X-Google-Smtp-Source: ABdhPJxMZ0AOXVOdyLHdd+tbfwqTM2cFgQjstgEPM0cqvoh5a4DoULf4y/89T6sKnrC+A28HIhn9oQ==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr3364428wrt.204.1627381376054; 
 Tue, 27 Jul 2021 03:22:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h8sm1871985wmb.35.2021.07.27.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:22:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:22:46 +0200
Message-Id: <20210727102246.2353464-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.1.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-1-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 6e1ca32851..1b58c50065 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  957688c6a521561992d4f2f27cf9feb239c7c6c0042c6061c0e474a7dd26cc91  mutt-2.0.7.tar.gz
+sha256  4ae6d60f7f19854c375cc1c27b5768b71e9f450c2adc10c22e45de8a27de524a  mutt-2.1.1.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index d7fcc01ad2..a8734855f8 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.0.7
+MUTT_VERSION = 2.1.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
