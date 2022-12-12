Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CAC04FDE
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 745D7812FC;
	Mon, 12 Dec 2022 09:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 745D7812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64zS-3cNquCX; Mon, 12 Dec 2022 09:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C912B812F7;
	Mon, 12 Dec 2022 09:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C912B812F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24B951BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1C060706
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1C060706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9s4-oF4_hXG for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:50:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C113605A4
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C113605A4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:50:57 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id t17so26533575eju.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 01:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WmrhPnM3EsyGJikT3gDlstKbyY1QOrh1ddozTnhOBeg=;
 b=k10gV6pgg7v4VQ5ce28oQDOuEKr240D6+feoJUmSgz0zDaywNizB97PHMF7QLP3LrP
 kijABOHTYCmMNRF1YazMemiUtqNXqoaPQWQLkyy/26Do7hNL3+eA8Kspo6QZsdFzEFms
 YyqfmVw77roBG939XuoaxFRrlK3FguReWHb9YsqDNa2C+81C9c98CT4LnFCMkGMhQXlR
 BZdGUrERPagKEV6iDzWdNBXEOBQmPRfBBs46HK6t4Uu0X2kKBlhdnk8XCE4qA8SPQyty
 J5eQQPvadBQ9RFOBdA72rCUYSiNvPNOMYUgI/pJ6mT9YqP1Ji7vBHD15/Dv4uKTonl+T
 ujcQ==
X-Gm-Message-State: ANoB5pn2mvSAcCfV9nsNr9lOtSJH/RwEUguQ9sbf3NdlYyR/W2xubW9s
 SPjr/ezCqS2DM2ja9qbTg9ITmjDxccg=
X-Google-Smtp-Source: AA0mqf6sPR8aasajl3h7acWHPx4LfUwcjMul09JQRo34ar7Zn5Pp9tOEdjuCGcLX4bb2aTnVDsLFtQ==
X-Received: by 2002:a17:906:70c7:b0:7bf:1072:2246 with SMTP id
 g7-20020a17090670c700b007bf10722246mr13223365ejk.38.1670838655832; 
 Mon, 12 Dec 2022 01:50:55 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170906304700b00783f32d7eaesm3062154ejd.164.2022.12.12.01.50.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:50:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 10:50:49 +0100
Message-Id: <20221212095050.14950-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmrhPnM3EsyGJikT3gDlstKbyY1QOrh1ddozTnhOBeg=;
 b=Vah9MRyzpbOnJkaFEek48qe40XwLlPhC/s4Pv1NjTgs2vHCT0JgEgOdmcqgJcn5Xri
 6FLx1VRMCuDUUL5ij5lyLnZBuBlNmlNmV/Ke/eyW0LWYeVzBit0zzJdPCmiYsJw4STDY
 N4MwIp+BpAm2B33EpJsp1WD28b5qq1M8fzpJKvw8juHdNLi0DxZjE3s31GHAq6jLsHx/
 +PnYSI3t0eBXJ5AKrXHC6o54jy9DTs0qIOGgKnXI8GcppkasJY67xfY4tUoOJN/KqCl8
 cet2HWEWsopN00hjqh4qOUcYZOPZqFscc29TWCl2fa3Vdj2KJ3lYkj8SvZIlwMgE+/P6
 uqDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vah9MRyz
Subject: [Buildroot] [PATCH 1/2] package/python-munch: select missing
 runtime dependencies
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

munch requires python-setuptools and python-six packages at
runtime.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-munch/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-munch/Config.in b/package/python-munch/Config.in
index 9db2623674..ceb9fbaf32 100644
--- a/package/python-munch/Config.in
+++ b/package/python-munch/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_MUNCH
 	bool "python-munch"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Munch is a dictionary that supports attribute-style access,
 	  a la JavaScript.
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
