Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC05C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C59D83EED;
	Sat, 23 Jul 2022 16:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C59D83EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cp83jVqopn0W; Sat, 23 Jul 2022 16:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4766A83E1A;
	Sat, 23 Jul 2022 16:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4766A83E1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55C211BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3046483E1A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3046483E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XP__iuYFYjsF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7056833AE
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7056833AE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:08:40 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id f14so5710151qkm.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebtBBQgN0LLNs5MV7ymqwNNN2fFDzoTpYd5820eWyBw=;
 b=3/Vmavrrxq+PkIjcDtTCJGQ7rN0NVsz/JWobt7/YvUF1QdrFEUrI7lGDct5wV5HZsy
 JyXkXX7fLFav6g8Lobec1QuWo667ZO/FPneaHVqrP7ADH8NPUQbn2tB1/Uzrd5INxqCD
 PrkihWUUKnWoGIHVapFhh4eBihK1HJS89CrcmV/9HdI/x6JvprKuUvYBMGoslSU3lRJE
 3AV5nlolt+1mXeE4iNLVVaP1B8d9sdTwK4gppZUAwlBuzj0s2BL5ZuLTkAl4tnqpS2wt
 Yr4Cob1dZZoG0ttaCwdIHbp+L3nIX47QvcTsIlkadB68w8pUkIufkrqSgln9aNb7lMQo
 kxMQ==
X-Gm-Message-State: AJIora8Utf5sp6Q7zD3ONk5zuuOTmDiwcYB5IYIiwpr3aZQAEZvduk6Y
 Gbcyl/ZnVE6V0JD8owiqTDfPWbYLEVtiWg==
X-Google-Smtp-Source: AGRyM1uPI9GXA6e8cwnlmmnc2Oq63L66MO9TRUEO8R5kJsg+d/ZvMMebGhJJJImnGa2N8VTG3aR5ig==
X-Received: by 2002:a37:b306:0:b0:6b6:321:27a6 with SMTP id
 c6-20020a37b306000000b006b6032127a6mr3880916qkf.262.1658592519358; 
 Sat, 23 Jul 2022 09:08:39 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05620a298600b006a75a0ffc97sm6066901qkp.3.2022.07.23.09.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 09:08:38 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 12:08:37 -0400
Message-Id: <20220723160837.272337-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebtBBQgN0LLNs5MV7ymqwNNN2fFDzoTpYd5820eWyBw=;
 b=G+6lzUM6fNXyO8A9godYt2/Q2vW+na/oPDQlaUF5I0qEGVjUYsA6G2g8geVlbQIOhR
 3e7gbOyAttCOCF4hN/ro97MqljDO+K1A+KJGyav4bV9e7sPXWDvaGED4EgQ9I6BQDr2G
 JrLyhY09Ut831EPIXmmgFnpHrdmVlv1chfDCBklwMU7b4Wb68Iodqys5WZIODGCUyvYM
 VI8MocJLLElanNPQoP8yziuFBoK5Hd3YuDaJXUSTgyX0w2Lz65h58J/H23BByANlutrG
 pQ7yzR77YRToH34oKa3QUO3pTAWfjJwwzZduh+PtPFzpdTlGz9wiqFdUIFbiXoS55mh2
 qoWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G+6lzUM6
Subject: [Buildroot] [PATCH v1] utils/readme.txt: Fix typo "get-developers"
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
Cc: Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo on line 23 `get-developpers` to `get-developers`

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 utils/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index 3064ecec32..3e8833c4ea 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -20,7 +20,7 @@ genrandconfig
     (http://autobuild.buildroot.org). It selects a random toolchain from
     support/config-fragments/autobuild and randomly selects packages to build.
 
-get-developpers
+get-developers
     a script to return the list of people interested in a specific part
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
