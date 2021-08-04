Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A4AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31B860EB2
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D31B860EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AF434034D;
	Wed,  4 Aug 2021 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yV65A60r4P8a; Wed,  4 Aug 2021 10:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1E99400F8;
	Wed,  4 Aug 2021 10:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D191BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 033E4405EE
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8FerTSLXCXP for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09CD8405E3
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:22:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m12so1595792wru.12
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wmFxJHUvaQORV8pE9PwGSGIDa4YpoK+snnqd/mWP8HA=;
 b=rnDFGBdQjIXYx1rVsXW78ddP58SlZfplh1lvq93OtBsoVRNjg/7dwMvRsDiF0IMccg
 +UrnmmA5ava61hxyncls34EiMR7CwwEK/bP1Loi7SdGyDV4hQi+ftH3/ze4WawlroW31
 wUIDKc/AifDpJ6+NCO53UywmxQXvWx9ML2WQUIIPRTTEsaDomWW6hVuuskUtCNkA6hEZ
 HXTa55PFdGl5jJt6OA7GWHKij9H0267hNZKooWnUkc5iH7Lq7T/Mf8whb4mQzWHMEcPK
 43qo8EDgo1Eyo92F08gsMJRW95/ULdJYjATzIoHbk8rftbW1xBbj0cNmG/1ItCSBqTLB
 8yPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wmFxJHUvaQORV8pE9PwGSGIDa4YpoK+snnqd/mWP8HA=;
 b=WB7vpyEGJPqZIa/mzZNlYYr8efHcfa6aAfDIJHejIaX9L+QmZrXuXfFwk0yrdz9agF
 YHe7Rcly6h4VN1NiROx2ZeVmEnG4ErAcl157D7tnvR+i/eKnGJzC7foKB7D6CeO6plfq
 N53zUBdeatfDw8YZ7Xp6CjU5ucRxzVREvDDNx4vzjEDQBUeelG+t1f7G5aAjbeEuT2PQ
 WzDk7B+9GaKHZ5Vv1pdJ/kxV/NXF1Kk3q0r8wziX2qMdyzcUG2yr4Sc+kljVowlgiWFX
 UabTmqJZoaZc5jxxBo1wCy0t5ta911al/7G+WqEAH5Kg9AsCLV74UNDAbvrK9r6IS9R9
 WSAQ==
X-Gm-Message-State: AOAM531S/D+7Sc70fkr2Fxxmi9eSB+lu5UhqgIJmyR44miOMsyPuZEFS
 9jPNFP3RG9dkK2+c2+dL9wilEc52wzv8Lg==
X-Google-Smtp-Source: ABdhPJy8Co1NyGwkAzoZmu4Vgs7N+6q8AMHEigqsmtI8iVDFSDKNvZRjeFD/nlYN04ixY7UJEsTnlw==
X-Received: by 2002:a5d:6589:: with SMTP id q9mr28663307wru.284.1628072548900; 
 Wed, 04 Aug 2021 03:22:28 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id n30sm2329164wra.1.2021.08.04.03.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:22:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:22:21 +0200
Message-Id: <20210804102221.933892-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add SELinux module
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

Support for wireshark is added by the apps/wireshark module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 6ee4b20391..75b9c8b897 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -10,6 +10,7 @@ WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_CPE_ID_VENDOR = wireshark
+WIRESHARK_SELINUX_MODULES = wireshark
 WIRESHARK_DEPENDENCIES = \
 	c-ares \
 	host-pkgconf \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
