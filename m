Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809AFC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A1540B2C;
	Sun, 24 Jul 2022 02:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A1540B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8ATV6Eh5wwv; Sun, 24 Jul 2022 02:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11C1640B2B;
	Sun, 24 Jul 2022 02:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11C1640B2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48C4C1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EDC7847EA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EDC7847EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qmsMD4ru8aa for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:16:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBAC847E3
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FBAC847E3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:16:04 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n138so6337654iod.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUAt9bdjAipmmG8GGpT2JoNLQLicmMPff54Arf4Tw9g=;
 b=zoDmFxq56EXx/r0z+SnSPlpJns/55FesB0d4sEf7/Sk6W6jxfzPQJ/ufzL8PEh0MoR
 8R4jo1vvX7lZGwqB/+u6HZTS7Inl6X3pVZXg7FdpKRpbFKOmxGBgVOUFQf7qkWtOTL3O
 dRkP2V/03CuiO6TyL467NfWEfNVyJt4ByAGGxJSAnIFzUi5BGqk1Fij7uu3Eo2syET30
 i6z38yt/NWkvN2GPknT4UROmh4zNnIrANHJua5deI9ctmhOaTYseAqg8DfNifkr+ECkf
 abRnERo5Nv+mkhdNg1jEiZvHUCoya7Xkkq4SnXAaOAp75T0p3fEabTB+YPJrLamC2Y8u
 vH6w==
X-Gm-Message-State: AJIora+hVfXPx0XrzFVvRldy2tSKtSVqcDyWvJJUfEhUaO9v1M4woAgR
 wTNkzn68Mo2ijk0aTwDWCSLcfjjiVLqbog==
X-Google-Smtp-Source: AGRyM1ua7gzoDvtoL0gVAo/YtyJShztYwSVr+q4OOtpjem3KJvBDTwyVbxqXSzT1HIrXXaVllZRXIg==
X-Received: by 2002:a02:a890:0:b0:33f:22b8:cb0b with SMTP id
 l16-20020a02a890000000b0033f22b8cb0bmr2729790jam.136.1658628963173; 
 Sat, 23 Jul 2022 19:16:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 17-20020a056e020cb100b002dc789a3dddsm3379065ilg.5.2022.07.23.19.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:16:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:16:00 -0600
Message-Id: <20220724021600.1015661-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUAt9bdjAipmmG8GGpT2JoNLQLicmMPff54Arf4Tw9g=;
 b=Jcr/+ys/QZtvc5B2EuIqSSPCjEqPJf2lf7KXJkHDXi05DGPkDyQkpBJngRtlJoqxpb
 fBFJgmCtGadlyUAJutR1TreOwsYlCSgNqs4kxHlZHp4tyF6TcPMot/3NoRzaFMJugS/T
 XwmRNO1qYyooOV/NSPL0nm3lquvRoPpBQ8oMmrAJCPwHP43Z08jYbEG5EZ6uT7NsYnMm
 kjLtlljIumaKKuyXnAgFF3dorxh6jc1BuT6HX6Jv9Lx8Wkx6QrjQY9TBT6wKZAcNThfB
 IEQFpqY2TJVmkLgF5q7xW9IsZw7AmVEAdfhFgGomUai117bP5HFgWUVnujmpQuoykvbs
 M6Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Jcr/+ys/
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 22.6.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index cc68f822a3..149cb6bb50 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  b0b5e10bfea95f32900708be705efcf0  autobahn-22.3.2.tar.gz
-sha256  58a887c7a196bb08d8b6624cb3695f493a9e5c9f00fd350d8d6f829b47ff9036  autobahn-22.3.2.tar.gz
+md5  9087a228146cd58c6fe734540ba1aa79  autobahn-22.6.1.tar.gz
+sha256  fb63e946d5c2dd0df680851e84e65624a494ce87c999f2a4944e4f2d81bf4498  autobahn-22.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 37256ec8f6..6bf71f7a00 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 22.3.2
+PYTHON_AUTOBAHN_VERSION = 22.6.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e9/a7/4dea20063b78eb50a54182494ae634cffc0ed6208bf775771f374a9fb8bc
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/62/af/1ec79d8f1ac2f92554428688986522abb919baa36c64d04174b5588b22c1
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
