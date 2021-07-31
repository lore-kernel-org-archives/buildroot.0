Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D620FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC2560F92
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC2560F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7855E83487;
	Sat, 31 Jul 2021 20:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oU2vwoz1Novt; Sat, 31 Jul 2021 20:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50638343B;
	Sat, 31 Jul 2021 20:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA301BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29811402D1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYAJPXDmXKK4 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:39:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A114402AA
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:39:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 669791827C5; Sat, 31 Jul 2021 22:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627763991; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LvnsMk1rbFwSplV5uN69g6iMDtB9uC6Fc4QOLU3mCsQ=;
 b=RhpVP7zOBLqIiavJhjigunOSXeydYcyYzZgcIx2fwaTWYdpbyfPpoVaIM/UCdzzOSVOTNU
 u+ERQUpqacwtAnkxMVGqP0hpoqiRGByutMvc8xnxsdRE1YimG8pNj2VOah2NovNAI/vlf2
 weBLw7DwgdQRLrfGwlx2hu1qgOySbAA=
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:38:09 +0200
Message-Id: <20210731203814.68125-8-buildroot@heine.tech>
In-Reply-To: <20210731203814.68125-1-buildroot@heine.tech>
References: <20210731203814.68125-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH 07/10] package/pulseaudio: enable BlueZ Audio
 Plugins
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
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

When BlueZ is enabled ensure to select the BlueZ Audio Plugins.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/pulseaudio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 6600006a60..dcc88f3841 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
