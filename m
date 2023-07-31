Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9768CC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B9DC40649;
	Mon, 31 Jul 2023 21:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9DC40649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJ3idM0NVZsE; Mon, 31 Jul 2023 21:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51C1040BAF;
	Mon, 31 Jul 2023 21:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C1040BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5D01BF964
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 941068142B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 941068142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqld84zv69vU for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:46:03 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8488E81431
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8488E81431
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-786bb09e595so140224839f.1
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690839962; x=1691444762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUFqr6DN+9aBf8IL+HHFh5Tp2wjTyGJq7LgG3H7yAfo=;
 b=QxZBIL1CO0qO/tfph/tHmnsSYPZTmVCaK28lu8t6yv3NvVO+c8eK/rQjSSVDu2alrl
 pIw57f8sLeLXbX1sgObjgNxMM9iFlet6QvqhHGfkULkNrGz/+184bxC+Mmt4RpO9LaXu
 wISNU8G9eDzZt/6sJjr2s4kgoiNq0s1j6IABZ//oDkJibJbUtKTrF95fDPvqPi5Dpc8w
 S+0CEDfbjuQJlV9DjxtIkJphsw1JKrzTRBp5mV4PVFEAQzxOKSafpKZdZNZiLEDMr/FT
 p0idBzqppdUNUntKkAyc5rL/Pssw+i5BQrfj66510VsqT7qIJLWtdl4n0nPrudgH6g2d
 T6yg==
X-Gm-Message-State: ABy/qLbBr/acf9bPB7EKDd5aYeGJLYKLGNSSWSdi1YkB7ehelhABxyD2
 nLpECB88pqYTQ0c0E5Vi3MW5yLw99L8=
X-Google-Smtp-Source: APBJJlE09+C6AaZQ/aTA1cdrnSujfSwdfwKEpZwXX3HeXp9lG5i5cscamggte+O2Mzp9wa8F9dHVaA==
X-Received: by 2002:a05:6e02:20ef:b0:348:c75f:246c with SMTP id
 q15-20020a056e0220ef00b00348c75f246cmr8823133ilv.16.1690839961960; 
 Mon, 31 Jul 2023 14:46:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 a10-20020a92d34a000000b00346097ca74dsm3438440ilh.71.2023.07.31.14.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 14:46:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 15:45:59 -0600
Message-Id: <20230731214559.99648-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690839962; x=1691444762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hUFqr6DN+9aBf8IL+HHFh5Tp2wjTyGJq7LgG3H7yAfo=;
 b=YMvtQzsbyRR9jAzWxgjwgVwRv/zjWMPJwi8suutoSwHwhxgxe/9ucxPoRj2PfTELJn
 LyyOXwh5xR/xWBhTd9zaYdXz/5+nUq8cUaHCQyVrQXpWQ2BLFs7ZIpJmAd53t1g4fkEM
 hvhuZ3SQjc5TCYXbhxBdUdAHAjFKVXZDbwzDkPPHmRfZnGlVwLGn08NAIr9xe358OB/v
 vzNv9TH4NX6Y+ZYPmf289vvuycrMC5CvDUOhAxxkTgGLFFYRmf/2xP2EOW4ynqYJnp2F
 Gx3JNGCTBc8Cr38qvNziv3i8+HU4uTg6hIPbLpribQttrsggqPThFavUUb8bJAZAOJ2D
 eLrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YMvtQzsb
Subject: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to select BR2_PACKAGE_KBD when building systemd with vconsole.

Fixes:
systemd-vconsole-setup[129]: /usr/bin/loadkeys failed with exit status 1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea717a456..f3e561e661 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -563,6 +563,7 @@ config BR2_PACKAGE_SYSTEMD_UTMP
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
 	default y
+	select BR2_PACKAGE_KBD
 	help
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
