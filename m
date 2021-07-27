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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A2FC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DEA61406
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35DEA61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E954B607A4;
	Tue, 27 Jul 2021 10:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kigymgm0osSv; Tue, 27 Jul 2021 10:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6A3607F1;
	Tue, 27 Jul 2021 10:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 680F31BF37E
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B29403BB
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlDATKkgEru7 for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 176EB40205
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:03:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j2so14445730wrx.9
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d9U3oJCGJMHsm2sa75/j1nMMn2JBzWQaqbd6Or36OJ0=;
 b=iLjb1OhJu7dIAXyKwu9QEC60H8xgH5qxiBVFdwQn8j+v0a6PygQt7o2qumnYhKbc3q
 qX9dTzmeC+qatzYwcEohDlovRdyimY8XQcTGdFzHFc5duIoqD0vjq6FxdWA/4+EZVla0
 OIrfQeH0bCMOu/ubYK/KmGQyjW23QmtWKKNDpTUtNjRsaLwn6iaeJx51OADQTyHO8m7D
 XhGqrhs9r+LR+iSyb2B8nLwIDjtwGw3StN1DlajD6TTWczzZm68sr2ytLbAQl0WJqJKb
 ZULYXjnDthcRYg83zwtFfmubPQhoCrS8Y9N3cVQKlS06Gax5QosqsS+ANtWkg3ZxK1yA
 m6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d9U3oJCGJMHsm2sa75/j1nMMn2JBzWQaqbd6Or36OJ0=;
 b=rOB63KP7iBEA3HIGQ6D+Yr+y+U8/rARjUhoCq7bz7+wQQ3F/jUCMRLMnrSyudoY6ya
 4kUKOTylW6gTPLCTYmi7uYXMjaF9pXuu5KTX/gVMe93U9Lj33TzdD2/cDBBk49lf9EUw
 JdPq59jt/qZ653ESB2gxQd7T/BPgEh975I3WHF1Lxrl2R2yEUtCFJmIzbyYN9qy/oB/0
 7FWOIE+U59yewXc/CdFS6pvJKoaxqUXQm44DMkWxJdJRJh6CRluWi0js3g+tusaQLnWS
 MT779Ynb59Pex8FieWXnn1UwnW2Tulgy+9YzNdxCaWoDyHnAvu4UMS4SSdD4jjWnHz0e
 EPAw==
X-Gm-Message-State: AOAM530dk7eutTbKJD9QbUE33OGB31yCzKsIgjl81XJQRsVsnBq8GU4D
 DXh8lBwmgQZinPedXM8Gx2A1WzoQJnhk0g==
X-Google-Smtp-Source: ABdhPJz3xmJvmuDw7JW5QWxIbO23h75d2YiFaVJZmGO3ZKNGgCOEX/u9r6DjOHYPLFApMFcv5appaQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr23991950wru.57.1627380231063; 
 Tue, 27 Jul 2021 03:03:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h4sm2721752wru.2.2021.07.27.03.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:03:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:03:41 +0200
Message-Id: <20210727100341.2316813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.2
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

https://gitlab.com/libidn/libidn2/-/blob/v2.3.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index fb8b449d2a..bc96d7e15a 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256  8af684943836b8b53965d5f5b6714ef13c26c91eaa36ce7d242e3d21f5d40f2d  libidn2-2.3.1.tar.gz
+sha256  76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91  libidn2-2.3.2.tar.gz
 
 # Hash for license files:
 sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index a03d9378c7..19fbe4aafd 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.1
+LIBIDN2_VERSION = 2.3.2
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
