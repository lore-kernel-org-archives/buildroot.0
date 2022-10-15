Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC0BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 22:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309A160D94;
	Sat, 15 Oct 2022 22:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309A160D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxNu0qbEtLjq; Sat, 15 Oct 2022 22:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6B260D90;
	Sat, 15 Oct 2022 22:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6B260D90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11C01BF35C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D862A402B5
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D862A402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjWeq9rPQQos for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 22:09:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AFC4028A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4AFC4028A
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 22:09:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f11so12812336wrm.6
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Yd4TlOOnJY0LMdpVq3Quk0yKOUwZIsx3ClC3q7aM6s=;
 b=IHzr7Ie8VxY07Xz8cEgNE3bSSEx/Op5IKYSXWnFC/C/g8bjSJq53GeQRvQqeKx4af7
 2Oj6YNugEuqzkP7bYaYlAs/OFADAVnRVh5MYn6B/bz5JIKLP8p1YDpDptc33gmkjwBzX
 UEDnwdCyu78X8wAS87hsDXO/4zmlWBszD3aX5MxcEAwPa1Xf84akdoZiY1HCmYBCAHl1
 +l3Yo+azOSepCea8baNJWP6lT1B2jCb2Utzs6cRxw2zpYQ3TdewGYAng3uX536js3cpQ
 GGVQTT5Nog5ISP3wGxt55s/aqYFMkrF5+ZP5JvH0MWM4g2ETDslG+iqUCS8iAltvnjui
 lLqw==
X-Gm-Message-State: ACrzQf2VPVHegH9LE0EWiNDO0YQFPRLr6PcvtCYiRmG2dFFrDAKoFA99
 33tWTd88niT2iz+6YLBnULyMbPkOZCM=
X-Google-Smtp-Source: AMsMyM5dQho59NHThf7/BcvWvrj0NW7bqddq7y/BNTthitoyyqK0q/ZOmVK8QFWD4/+QfX9x2Wk0UQ==
X-Received: by 2002:a5d:490c:0:b0:22e:6545:996e with SMTP id
 x12-20020a5d490c000000b0022e6545996emr2222862wrq.523.1665871756500; 
 Sat, 15 Oct 2022 15:09:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e10-20020adfdbca000000b0022e66749437sm5011073wrj.93.2022.10.15.15.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 15:09:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 00:09:13 +0200
Message-Id: <20221015220913.151173-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Yd4TlOOnJY0LMdpVq3Quk0yKOUwZIsx3ClC3q7aM6s=;
 b=L9327lRzm8xeHqir0JT6OkdfVag2H2EXBhwNJ7DPGC9UsGzGz70ARhryJ1YZQqUHWN
 6K1wure3Rnuj2wc53ZyrBhz9fiEryYD+lmgN+1fr3L8kQilLPZQYWH375Pm3f5o6Fx4n
 bPYE2QZ1OcgRo8TkB503FJ0EqVbSNTdWxqusFC2CR7e3zhUGvvOOFAJ+DL1ftt+Mld59
 YstnHqxNfLh/FPetie+FvWVSlfgqT6IpjjZbPgdAT6Blv9f2Me4FDCZkZnsEov+fqb99
 0fc+ri4UrCev4t1hPgtfuJ0cAdtIIndWygM2aquFe4Vmtj4E9V0TJAPG1QOYmYCZkRBT
 T/lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L9327lRz
Subject: [Buildroot] [PATCH 1/1] package/libdnet: needs host-pkgconf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf is needed since bump to version 1.16.1 in commit
c8ed72c15d39cc6c676485bff8955ac5f4258138 and
https://github.com/ofalk/libdnet/commit/3a651c615e1201b5fe9413f8dc5b1671d5e5049a:

checking for Check... ./configure: line 14123: syntax error near unexpected token `CHECK,'
./configure: line 14123: `   PKG_CHECK_MODULES(CHECK, check)'

Fixes:
 - http://autobuild.buildroot.org/results/e1ff5ca46e83db2c722f782387dbb7402b8d459e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/libdnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 1e75dae323..dc56b892b4 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -14,6 +14,7 @@ LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-check=no
 LIBDNET_CONFIG_SCRIPTS = dnet-config
+LIBDNET_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBDNET_PYTHON),y)
 LIBDNET_DEPENDENCIES += host-python-cython python3
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
