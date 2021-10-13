Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766FDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E494A61168
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E494A61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E7160ACB;
	Wed, 13 Oct 2021 16:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g_-z71G4F7Bt; Wed, 13 Oct 2021 16:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E6E60AC1;
	Wed, 13 Oct 2021 16:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9731F1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 872614075F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qifWS5Z97YYL for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:11:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A13E40744
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:11:56 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2627626pjb.4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31enCK/XFWK+NIQGJj8unpD5iXAjl3vLrH1q8ApILUM=;
 b=EwPsBLJihfAaQmtbox5kW/lEftNAHT70lUT5sc/7Nt3m+XM0ycivNrEbNznen1og05
 dWKGATDZsu1r95HJmHbtD5ZROau9mgL6lxCnftuo1TZhWRmrlwb3SooE5KfMJiSgEZ23
 macluEqjrAwRO/b2PcLZi6t+MJ2vlQcmy5YXsVRaaBRjXyHOChyUjsMpXeWfPpkemGsM
 mOHYQaugwPHLI/2bAzVbNPQkQQPVKhGBE3u1itV9wqJobYrDVJGYeKG13O7iZJOaCC6N
 2H6v2yoFGS/ewsHaugaHOHn0ELV/xHpDQULDBAIhUMRCXGoLYPMgAgHUeznIqzGGi8qO
 jCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31enCK/XFWK+NIQGJj8unpD5iXAjl3vLrH1q8ApILUM=;
 b=ZDIlrpJvExEW6J/+l4ZsX7NnWSe5C9qNTFXwRyADjI5jLcSD8xPDVk1lY4envhy8Np
 6/lP7xPpAO5w/+lXfTiYapFKeeVJMkcJ5DmsgGW/DxN/jDvvxn0yhRk5y6ZBzeE3UbEN
 PHnCPlUu5b+z/pCQV+Hy9L0QdvLkxbijaokFJMxndvY0UZjOtTe5ri4nzfqvwlwzbE8l
 kdcW+UrM/8DnDHSLXFzsES7cTqIZs+kXOsEWRRwf89wZWJ1QCskK0Ljhp2XRBLVlpOom
 B306tiUbcZHcy5owRH7P7t24n7KELLCcnVcT9Mpl6KL2bBdMjRf7ECv9TuUptWQg56K5
 i2ZQ==
X-Gm-Message-State: AOAM531RKIfest0t9/U++tV3HlBv94jtZyNieOvA553qEy2IKUHFpSab
 hbLwB0PpXF8dxYWSz2qrihPhdPn2hMk=
X-Google-Smtp-Source: ABdhPJzeEToIWGsYrIt7QhNoPtXjMajRPvxp/01aQmhLCmSi+s0Cyg+D0Pbj8HO8B2iBSZ/KtxbFNA==
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr14599260pjg.118.1634141515299; 
 Wed, 13 Oct 2021 09:11:55 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id oc8sm22832pjb.15.2021.10.13.09.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:11:55 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 09:11:52 -0700
Message-Id: <20211013161152.74649-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: depend on host-python3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wpewebkit builds without issue using host-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/wpewebkit/wpewebkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5d5b5f744d..0242f7a288 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -14,7 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
+WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
