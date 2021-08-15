Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C4AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA91C6135F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA91C6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB444033D;
	Sun, 15 Aug 2021 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IlraMAakJrC; Sun, 15 Aug 2021 19:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17BF40332;
	Sun, 15 Aug 2021 19:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 994BB1BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882E54035B
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7Ni7PrSQqLe for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F11DA40332
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r6so20755184wrt.4
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AML2vSSkimuVHzIBhEres9UOJMz8tGvWI7dLcbCb2Kk=;
 b=Szdp7jSbastp1OyTm8WELGeU3uRZX0PT9XvUAL5DIetDPYPszFxW4Agpj4yrjZMdmY
 ZG+7UqXMAwrChOAbm7s3OagNjKmxlac5La1yfJoKl7cRmie5pvLwuBy/l5JoZ49twiRd
 KJrF3mHLkKK1YJ+rIdR73ROfWSf90s/7QOcJM5GnmOjlU2mte3ps3PE6LuJRYLyD5XB1
 VF7mx9xXyu28n494IJdTY3vTN3XrViIr/hvLnXsP6NYsw5mFVTRZdgY7E5E9MMifIEPp
 B7lThL4bV+cEwDMsA+Vac8UH8no0/kOZeZeo9QanTKPFzGqqXAiQ1FgHMnTGzZY7oYbu
 RWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AML2vSSkimuVHzIBhEres9UOJMz8tGvWI7dLcbCb2Kk=;
 b=FfduCnu9DVP/PAerLgn9p02dtu8ixQLYFY0NFUHeGJvt762gTzdhlnsNiQTbYT43Jm
 2uXyJ/HlQgoGfcYqzts/lSssD2b5t+tevDfiQ9fmTgQGL8Fzl/djC+bkoQOqNm91m+u9
 oOnMD9dPxo9G8yECtvR2RT+EPwLotKZ4cPen6I1VL7Brq3kzlRmFUhirDqepZVcgZxQs
 y9mFrAdOGhM5Zb/7adEWroHpjnrc/VLMWoUrVttknQQqaPEmHh5Kt2uiDArT8WybA48K
 YF9fSO11nXW6K9l951sS9iIqIeb/+BOBZwThAYIJ+kgdttLT1jv+tqhe3a7vbmOjugw3
 /SEA==
X-Gm-Message-State: AOAM530kLEnG54B4FVasxuowXt1kaA9m7ddMuoKbDyj/uHPTA5W/v5ID
 9AhpsIUDffQmgwI/MmzczP5vg0Fic7kdpgNy
X-Google-Smtp-Source: ABdhPJxDlDORT8qYu3JM9z3+UefoUZMfWqWDDwEUUdd8mzE55GiBvUJtjaXBVlS1vtIg6rZdnZ4nyA==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr15180940wrn.66.1629057227908; 
 Sun, 15 Aug 2021 12:53:47 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:47 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:35 +0300
Message-Id: <20210815195340.12027-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: depend comment
 on BR2_PACKAGE_PYTHON3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cryptography/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 5a2e6da900..da4252d6da 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -17,4 +17,5 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	  https://cryptography.io
 
 comment "python-cryptography needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
