Return-Path: <SRS0=WOAM=PR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428D3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 22:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3F760187
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 22:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F3F760187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22744401E4;
	Fri, 29 Oct 2021 22:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvFgmJFXdCOn; Fri, 29 Oct 2021 22:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461434016A;
	Fri, 29 Oct 2021 22:03:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 509321BF41A
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 410A140162
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 22:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVHOm_8aLh69 for <buildroot@lists.busybox.net>;
 Fri, 29 Oct 2021 22:03:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6181C4015C
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 22:03:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p14so18776164wrd.10
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 15:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXdNJGdTKs8PO++5aE/Ij7aD+av77s5BNecM449Sgcc=;
 b=VsyPgdDvqVRvUiTkt1yxDXlW0tPTtVGmygzPIQ/IC7l85X+7hbE+wuL1a1XPsU/N8g
 6S9pFbGDLv3rmRTTb8I3Aru2TQYR1Y13whf52zQqU7XRedApX/oOzPjVKm+SPrhYYevf
 q+z3CmhBPHCfwOm0zoi+kvSk7CAv+z3H3d0n9sxc8KhO9U5azVmkyhVZSVaD+P6LVZTj
 7kSLJidDuRPc+AjvL/s7iD7kBbyyfTXglq2n8Pj9NM65Fbru4+syoSN8hoYqXLqd4XLH
 HS9oV3bfa+/5x0j9Q/Vz7E6XIig9Kps9G32Ui50IzAtxVv9w2MHXo2a4nXXLkOCNES6t
 u5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXdNJGdTKs8PO++5aE/Ij7aD+av77s5BNecM449Sgcc=;
 b=P2Dh0U2A6xkoPu+W32MYpEdC8Tp+m6BiS1Kg6SeIUtm3A5CP20tHqnln5zbBjTeWgK
 8cvrOVWvCC8dPB5yITydv3zeWHNjEEEY+9tRAsxiNFLgpctqWOmEFBdgTyf+4HRZKy4g
 E8f71QDrfut+GEk9sJxYtytfV49AbYIVbDg/EdMKln84RXwJZTnD8t1OHtOxe7q8uC6R
 MfVJjq/WZ/yEduq0+KjVwN7ioxgUIYlFxb2i8vqsmMzjrEkbp/BvdETpOyrDMYVH2+ti
 GtLdCWs5Lpr2X2djLek9IghSlOodx8Lr/2B6Ldco87QD9MtKQ5EbvbN5EM3ljkMXhk9V
 /jCg==
X-Gm-Message-State: AOAM531VDxrxAZ94jKtzkur1TBjPRvNLW6DdPuIreZF2yfGEQAVmiKBO
 clp7srtUcXfcwZULoPUKMN4uuSW2qgY=
X-Google-Smtp-Source: ABdhPJy2esE1GYKMKHnpM4eFkk3yCDmHCEcv7TXNS2M6QhJCoMTiTv+4klXUDfnKByDPDUFX04DYnQ==
X-Received: by 2002:a05:6000:156e:: with SMTP id
 14mr17879637wrz.358.1635545022674; 
 Fri, 29 Oct 2021 15:03:42 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t1sm7526127wre.32.2021.10.29.15.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 15:03:42 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 00:03:36 +0200
Message-Id: <20211029220336.169520-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: TestPythonPy[2,3]Incremental
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
Cc: Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The recent python-incremental version bump (commit
fd03cb5a12981a9c34b0025ff3ae4b8456342724) added a change/fix
in incremental.Version().

python-incremental 17.5.0 return: "[package, version 1.2.3rc4]")
python-incremental 21.3.0 return: "[package, version 1.2.3.rc4]")

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552692
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552693

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
---
 support/testing/tests/package/sample_python_incremental.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_incremental.py b/support/testing/tests/package/sample_python_incremental.py
index b6e2aa803c..efab8b2067 100644
--- a/support/testing/tests/package/sample_python_incremental.py
+++ b/support/testing/tests/package/sample_python_incremental.py
@@ -1,3 +1,3 @@
 import incremental
 v = incremental.Version("package", 1, 2, 3, release_candidate=4)
-assert(str(v) == "[package, version 1.2.3rc4]")
+assert(str(v) == "[package, version 1.2.3.rc4]")
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
