Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08247EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78750417A1;
	Mon, 10 Jul 2023 21:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78750417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09Tzk0zfmeZI; Mon, 10 Jul 2023 21:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950AB4179C;
	Mon, 10 Jul 2023 21:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950AB4179C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B64071BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C97E81EEB
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C97E81EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS9QUFPRHysE for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF32981EE4
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF32981EE4
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:27:09 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-345fcf8951fso16709165ab.1
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 14:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689024428; x=1691616428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AsDrH/IZadTkynNNmnxJN8P/7G5I8xNUspNOcBw+xUQ=;
 b=WC5khwgcKXwUCdiTUVuwNMhxJcsNiSXQ+TVgwFbidZUEdpHev7Wv8CsWAv7wOvg/E6
 /tUddveYjhNEG9dA7qEQ1QiYy73gM9n+UmDsYsOLfx0vZyknZn6UJbbt6lWv67lGkuzw
 YhIcTjXSCLXTq17/E4WElB9A8Ng7DMEHzmC8BJ5iacdZWHprn/zD0Wco/Lpcki5p4atz
 7pfOmiU2Q02RWzxDaG35eSFTmEl89sVOxyU4nyKDNhx7NfkMbDFal81avy7MfsDwkHGB
 eZeGLXrPLO+iMfhHcegKTF3XiH1CcPNyEPVIpbTp9tvxkIW3QBMBF+hxHwerS9G9w/2j
 qI1g==
X-Gm-Message-State: ABy/qLZWSQMwKHJIfWmIIiHd88iitBbny53M8WQTshvSFxsrWu+CBksV
 R9H5uXWLjrvMejSGqa61+WRUxRg3nMM=
X-Google-Smtp-Source: APBJJlGeC1pt9fqb8MTX0fdFSfeKRSkRKS92nYG0ZIYfwYy3sll32i0viPAqoGQj6yMgaJ2ZmxDU7A==
X-Received: by 2002:a92:c688:0:b0:345:ced4:b340 with SMTP id
 o8-20020a92c688000000b00345ced4b340mr14612030ilg.8.1689024428550; 
 Mon, 10 Jul 2023 14:27:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 v24-20020a02cbb8000000b0041f552e4aa2sm101973jap.135.2023.07.10.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 14:27:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 15:26:53 -0600
Message-Id: <20230710212653.3153894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689024428; x=1691616428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AsDrH/IZadTkynNNmnxJN8P/7G5I8xNUspNOcBw+xUQ=;
 b=F24PI0cjMME7qWCHDTBDitsEoNCXu/PxbIz1YdtfYIocJPvUCfbkg92tqnRilweLXI
 QJDwK1ldio5CM05qizbDxOFXJ8lAtpi9etFO0Xe1cYN8Q4nUgu9+sCJrP6odIM2bsNLQ
 GaeLYlW9jLdL2K7GSvfVcdN5fkgUfbXWLZGZoVkgMy55HnG4wv4XAEhrywC+po2Wn7Ow
 Tlkm30pTe3xJdtFgnfToLtJyPNrBtHjRqxxV9bno2NQX0i0UCk4Gkl6OprWH9BvikJ3y
 4/HkauFmAGKR5MBv0BdXj3gd5KYuaD4MlB5XJed7EhGL4MwQWS5zq8DBFSfdKV/A4a/v
 4DKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=F24PI0cj
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Remove Michael Rommel
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
Cc: rommel@layer-7.net, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removal requested via email:

could you somehow please remove me as maintainer from this package.
I am since many years not using builtroot anymore and have no longer
systems with which I could do patch requests.
I am going into retirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3237c90c39..95f5305d6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2079,11 +2079,6 @@ F:	package/protobuf/
 F:	package/re2/
 F:	package/spdlog/
 
-N:	Michael Rommel <rommel@layer-7.net>
-F:	package/knock/
-F:	package/python-crc16/
-F:	package/python-pyzmq/
-
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
