Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07A3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB44E6108C
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB44E6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8805A8176B;
	Sun, 12 Sep 2021 14:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XAyjAlYDSHZ; Sun, 12 Sep 2021 14:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0346280F8E;
	Sun, 12 Sep 2021 14:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A98121BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99233404CF
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kf5B01wsXzdB for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9094404C2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t8so5367980wrq.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hl2oPUEIsVeHTcKlOklC2PVffDP9ya2K73vJRf3DNE4=;
 b=cMIqM8nQyM2JgQK04K1jAnx6G0z0U/4WFVML2HivHfluv9ClG8m1AhwUFDlfviaYO2
 WbxqnJ1AsnIs662bVxnIJZPMGOpLTZb8MYfoHE4Ob0ge0vYjF5bE8IYpQYssqNOJ2N8g
 Q/rCW7fn/FeFQJZC4ae96mrUm+4Vxvp0XgHqZnaP7a0InR3bwjwNLGTnKBWYYpf9bwDP
 Hi8q4avdQ1xJ+S9EdIit7OlLZ3mOvpgUMsMWxpeloqtvZRSlHPf2ohJSNL9XaJ04fxvU
 KLdkc55bE0dC7GGf8gbnd0CUf5PoAUMtKysuwm7Bb7buwVSzu6b4hWxBixAijAH7mDjr
 gHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hl2oPUEIsVeHTcKlOklC2PVffDP9ya2K73vJRf3DNE4=;
 b=HgL8yV2DZ0FGbJJdNe+p2NFbEAp3d8DncnrQO+L4i/vkPDWTZLoCTDthiffQX16Xxh
 nGwsK1kAfou/5pKQzpl+D7/0njZJcZhtJLu/fPVasJ4bQH0QnlNGOF2OCSmpr7WcRgeE
 h2IcaP3nkUwoF/Z3Bi4zBTI0+Y6+AMrEKO5GxtJpxjEDZF19CLUNVM+Ax+mxRgAevAs0
 wZY9UmddMgjjvvIiYqwc/gO/dnUMQexDM5J0UpYv4AM4+tbD2coyg973mmfBvxtKFGG6
 pw3/Ugi6lIIrXIK5N5GHc/5Y054q+dFCNXDLqngh7V6inQFDi2IM+805hkTDnNYN5STy
 k9ig==
X-Gm-Message-State: AOAM530VXsWIIwh5LyYfDieWV/oFLVx0NPApP4EhPHFG83+Ii4Gg706l
 3XMA6K7N+1VKx0blEgvxF96xysDyWyg=
X-Google-Smtp-Source: ABdhPJyexRRKvU/grWi0zhUIKJwGCNFTkBsZipdZzpuzZ8b1fZTZmvV6hz98aFsp7W9o5VtDdzTvsA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr7757939wrv.81.1631455917240; 
 Sun, 12 Sep 2021 07:11:57 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:56 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:38 +0200
Message-Id: <20210912141140.253778-12-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 14/16] support/testing: test_ubi: add image
 format on the qemu command line
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Adding the Image format on the Qemu command line avoid this warning:

"WARNING: Image format was not specified for 'output/TestUbi/images/rootfs.ubi' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions."

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/fs/test_ubi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 8148e5f336..eeb55b1d59 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -32,7 +32,7 @@ class TestUbi(infra.basetest.BRTest):
                            kernel_cmdline=["root=ubi0:rootfs",
                                            "ubi.mtd=0",
                                            "rootfstype=ubifs"],
-                           options=["-drive", "file={},if=pflash".format(img)])
+                           options=["-drive", "file={},if=pflash,format=raw".format(img)])
         self.emulator.login()
         cmd = "mount | grep 'ubi0:rootfs on / type ubifs'"
         _, exit_code = self.emulator.run(cmd)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
