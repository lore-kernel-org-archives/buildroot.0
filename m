Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE154CDE004
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE89760D5C;
	Wed, 24 Jun 2026 14:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2epUaFmAFhg; Wed, 24 Jun 2026 14:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECECF60BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310028;
	bh=IY9KG1+OIwScSjGWRMjb33NDcQfVRtO7Xi7P5IAMopQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LTZvlk9c+KyQbwAoqRTcAVyOYGiJhEibhqJJwbs758nyr1Re6Effj78GNtWDKRDQp
	 bYI8Zb0dFWAQp7giHjOiyN1w1sI5A8KxzH/jllRVSiQ72Oz6QqYxq1GL973Uijvwx7
	 tlzxmAbvhYbcoxV8rOdIRz2vp1xEs2SbS8ZhRPdQXKZrbi/oY6jlXxkt47vk9lKQjC
	 Y9sAw70WlybqXz/QxW+Ouk2ibRba9cT0/H30cXKuHBWMPLttGerGo/JP3CuDa+u+GH
	 4WOQKubpqScZRyDhMk2syZGSiTXp4ozMTuw17R6Pz34zYgt/gGqubxYZ8SL78Cqo10
	 1xySvw4FWKjRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECECF60BE0;
	Wed, 24 Jun 2026 14:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AED3E363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A59FC60B04
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3XNRkCsOEtA for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07DCB6084C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07DCB6084C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07DCB6084C
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-46cf972f281so152583f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310014; x=1782914814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DgyaSXV004utxWR5M0ZfAgaAcsyHHuWlXg2CY0rFZ/8=;
 b=FwblC+JP1DVclEnEqfdPM47QllrFH7fTRKTsf7xG7UXQWxxA4yn+fKYi7XNJohE92c
 LsWmO5dpEMFhrylar/UWlzT6LGRzlD24UwjOGbRFnYxypV+jkDpthUTkJngTrZxUCn/C
 +OU+ZXvj59CfLimkKYQ0okmoi7GVe7APkNWMDGGfm2GeuY9iIxFA0eubw3P/wI2wKd6e
 hUrp5XVGFZgvrla3QMjq1td/ka4Kza5GJWRNvDJijGKhBnZA5d4ISLNoUhH9KSGX4CXp
 V2eI2CQ1GOoL4VRISrsLM6SqCvTEyiENi4Ldbp1n2vN63y3f3HkTrwh8f6XQAqJ4LvOP
 jqAQ==
X-Gm-Message-State: AOJu0YxULVQ4aTyWci8ZcD2Oqs3ADFoEzPkszU5K71UYjpZpffVK4/xX
 E5FxlM2ZV5B7KB/aq1kKCNVonsxVz7OmNuAGKXCqR6KeBrw7YX/nAMlEKR8SusNKr1pOBAQR9Yw
 ryLPF
X-Gm-Gg: AfdE7cnLnobV3hUXkBGxGtcMyRRWnZ++9Rgc2p0pW6hK1MRuRhsRMSESx6CnUFjGYxq
 Wf+wud3pebE7pdBDw3NLgY55OKOq+P0GcctFngqFh2wFSIBasS724qLNkxPGrbefUuNRylwfw7c
 jGHpvOvh7bzn4S2FuTfJ/SWy6ziZG+7bqIpdfDQfi26+XGfin0671GqXEOck1isXO75GuIQLYbk
 Q6LDHYj6YxeL4QZgcIZo0ZV8QaCvddE+8Jd1Y3pAXJQy+TSa6eUGwCR/Y819ZFW5uuIcbb9tc8v
 qh0DhctyFSxxx2lFb+2/XBIOtfNQfGEW6J9NxbZlDMXbnbrii5DIfTsliBX/FW7fiiTZ6/SPXgw
 vsrF51rudDSR8S1uFM3Zwhi0uZA8puRsLyTZVyVp+BESsvHnGKhdrH/d/EfJirIIZWsfbmhVjic
 VCDXyk
X-Received: by 2002:a05:600c:c059:10b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-49260840572mr39016565e9.8.1782310013768; 
 Wed, 24 Jun 2026 07:06:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:41 +0200
Message-ID: <20260624140645.185318-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310014; x=1782914814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgyaSXV004utxWR5M0ZfAgaAcsyHHuWlXg2CY0rFZ/8=;
 b=JwjiOFQWUFZ4RKSQbP8A2yrakeCekKQ+UYc1+N0T2aCG0XXF6+RZhDcBe2rx5Br1T1
 Uz770Xi3ytwFkY34OBbptTihFds500A1crGxRYbH4lydTeO9WEFGcq2we+rg5LzrE3fz
 Hcnkauw/ZNby7S/NtjPFidxoKkZ8daqoheEMfC+DwIotltWw7MEEXM2VaIfuWbGmEmKk
 dpA6yuwrlKtbhK4lGzewKo16eFP6wpEG0HdMpZo/Zt/vhUJ96ZEcmCGlNSHKJkNKKfLf
 lDH7wSkjDBeK09+UqnnjIbff3hcez49YalCVdbWCZDQlWn/m7WNUO3X1vklzF1FXQBYA
 NxCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JwjiOFQW
Subject: [Buildroot] [RFC PATCH 10/14] package/libuci: add vulnerability
 details
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those vulnerabilities has already been addressed upstream but no new
package version have been released with those fixes.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libuci/libuci.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 3c7e12baae..2af8f719f3 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -13,8 +13,9 @@ LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-# Fixed in commit 19e29ffc15dbd958e8e6a648ee0982c68353516f, older than LIBUCI_VERSION
 LIBUCI_IGNORE_CVES += CVE-2019-15513
+LIBUCI_CVE-2019-15513_STATUS = fixed
+LIBUCI_CVE-2019-15513_DETAIL = 19e29ffc15dbd958e8e6a648ee0982c68353516f
 
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
