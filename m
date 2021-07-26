Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0C9C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD6E60F38
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DD6E60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C26B402B8;
	Mon, 26 Jul 2021 09:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZaKtl-OyULu; Mon, 26 Jul 2021 09:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6712C402AF;
	Mon, 26 Jul 2021 09:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD03E1BF354
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1AE760845
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BE508onoorQ for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36B68605BA
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:03:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 9-20020a05600c26c9b02901e44e9caa2aso5755637wmv.4
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcSLT4lv2D+NRlQhy9UhTNmITWdWXEr8N+mURI1PH4M=;
 b=j1OXr0y0ODToLzYhN0EjyDKPl/5w75AGRqucHnruM00ZsZVZ+QmrjkKBrvY64W/9BI
 9IH4uorH6mlRIfOxH4PfWsQ8ZeaQQBnLwWHdf84cirgHmM/aoNA6orKaIzdgYLBCJurA
 N5jYfN8lGZT1t5Jm4zqyCPck2fev/5z3s5ZJYQ9BmdOLsan3U6NlestTd0T4RS6PgfOW
 UTAed+qK6dtOjX+BHFtMtJ5uHrZMGMsm2GIfGrjdW/TJz/T41YiXSE84JJwUyuikTHWa
 eHm7x4lI1BWSAbULravDsgh7e6CqFiOPhFBHixoIKx5RZoNOwTNwHQkhBXsgkllOTuKJ
 cZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fcSLT4lv2D+NRlQhy9UhTNmITWdWXEr8N+mURI1PH4M=;
 b=s+mRqyB5url+P/OTmoLrexAv1QTJ7P9243QQdGdrYYQ/Lxdiw5lm1wuI40i/gEuUne
 C8oFYZv4zu5LPXQviIy6r1iLCwlgDSGGg2WNk1RNTKMkvNiJCpPfDF5KZQP+Q8KRIGx3
 APxtTsAMJvgSE6BW4J5EfbdRrNSANvgTdDKwdKRWJcSomCrTLa0XwnRJQRoZE5iKQqRI
 0TthxicH/iNQl2ftSlzYZuogqHk/7lDJEs54MxjAJj0WcD4b6Myhjb/OF9WV5MWUW8Bf
 u+kwDRo+QLw0fHSEFnW3rq9QwtZ+OA6rOo8qnnibqC2zIeTW0CQPQGemkZoKQp/vqjuv
 YzPA==
X-Gm-Message-State: AOAM531drj4fbmhMsO5hwNdxWOYF6yMNmkKBmPwj73Za6OBluFGDP/GK
 1n1G64l/C3SsSt27HK8m9XeYknpvWn+A8w==
X-Google-Smtp-Source: ABdhPJyc109FaXgMvNf15sSC2NsXFr4c2VrocxZYb8d960b8UMzWdwoyWRLyV3ayqVOh6WOuuF+pkA==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr15917330wmj.25.1627290231289; 
 Mon, 26 Jul 2021 02:03:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n5sm11485183wmq.17.2021.07.26.02.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:03:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:03:46 +0200
Message-Id: <20210726090346.1711476-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/memcached: add SELinux module
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

Support for memcached is added by the services/memcached module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index d649ce7652..2a504846bb 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -12,6 +12,7 @@ MEMCACHED_CONF_OPTS = --disable-coverage
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
+MEMCACHED_SELINUX_MODULES = memcached
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
