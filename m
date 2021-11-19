Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF4EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:58:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D99C61212
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D99C61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F322A80DDE;
	Fri, 19 Nov 2021 17:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wzy7auL2DEqy; Fri, 19 Nov 2021 17:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F64980CC6;
	Fri, 19 Nov 2021 17:58:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7F341BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A419040367
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHdIbTcLF-AG for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:58:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67906402F7
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:58:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso11104941wmr.4
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwV2unrhli6uSX5Hl75EcmGVOdYLhi3MYfzbFMnwsjw=;
 b=o4CoDTcOZxQj73NVPFMKx8620A8bPKDW6YwJBLgeqJrFcGKz88o15ezUDa4B8s6DF1
 cpbWxhDY5V0nNq0K0EGa/v/wlYRXlwpJJDaSlLgwYzI9bbDEoUhSH5dHDJkkxaK5k/7O
 DQJXMwN69dHC4r1pUcrovUPd1CmXkorTNuN69DfeZBF8NJLXYrVtI5CW8+zx0wNQLiQk
 yWw+f8i9orfzo3Xc5FBqAZI/TdP9WVg+BnCRjuKfdO2WM5vt8p5qxwZkX551G4gt+UmI
 El/a65Df+0Wag8mXaCJePM5GO3EPf4STpJu6h1fgFTrCfNxh/tuN8dhcWtjkZKrSNYXk
 ySTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwV2unrhli6uSX5Hl75EcmGVOdYLhi3MYfzbFMnwsjw=;
 b=4iIGOmLCG3DooRBWWSC3CIx/E+azWr1qi+kHLxQ7VhmLe8MkHWEoLOsz5oubbntpDO
 nggl7ggtu7z8s7WFb0hbfCpVXFCbb79lRYa+ndpzel02Ch/IcN8V4Hp6pGpNQSQkv+D3
 v67eBilqe1X1gs65Kx+vHm/FIzOnWzWnubOCDr1xSxeJuilq2qZAgFgQi90LWVqwDEf1
 4ThQZQ327aId12ZLAm5GZraZp/FSmn0xl2M+i1Z6RTglEdMNftg5fw8M0nZhY+pax/of
 C7V1OV9MO7TPRK3ONKvkW8bk3Eztfd9c5SQP+5hFeqfEShIuhDLY3/UAst6xIB4MoCf+
 i59g==
X-Gm-Message-State: AOAM531TeLnTN8sAymRWEPhkIXaU9qLMQlQFuEuejqVmPm33nt2zknkL
 bnKnxxyUNYBa0SRlLho+BwqEKnTWJ88=
X-Google-Smtp-Source: ABdhPJx1mFvP/TM4g60m6TlO8W68PlxHRD6WAU+AeOozsvXRJkt09zmpHb9jkjmkCxkgfs8PLFUSKA==
X-Received: by 2002:a05:600c:500b:: with SMTP id
 n11mr1948021wmr.38.1637344694352; 
 Fri, 19 Nov 2021 09:58:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id k37sm404225wms.21.2021.11.19.09.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:58:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 18:55:53 +0100
Message-Id: <20211119175553.2413433-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
References: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/2] package/boost: threads needs date-time
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 7 raised since commit
4e267a7d3d5d350710a81ada188a1629348e4b4a because until cmake 3.21.3 and
https://github.com/Kitware/CMake/commit/1ad0c5ae53fc0c4f774166337f0e9c93c578cf9b,
cmake assumed that boost threads depends on boost date-time. As, we
can't patch all cmake in the field, just select boost date-time.

-- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time

Fixes:
 - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commit message to explain the relationship with cmake

 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1c405a36c3..8310294ffd 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -348,6 +348,7 @@ config BR2_PACKAGE_BOOST_THREAD
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
