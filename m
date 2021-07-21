Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB9FC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:50:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F6261029
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F6261029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BC44036D;
	Wed, 21 Jul 2021 06:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbvxPy1EiUgt; Wed, 21 Jul 2021 06:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4DA40363;
	Wed, 21 Jul 2021 06:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1171BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C0D402CB
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lemw01E7MiYu for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:50:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F260401F3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:50:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i94so940562wri.4
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLoI5eA7opBV9vxsZ5QvtsOzFGbUPhc2WuZcaudj5Yo=;
 b=WslFo8GVeCvFa790hMKZQMQkMrzHyc13FoLZtQNc2j6R1aBGP9lYTOXi0Sa0FHS4i5
 XHLczSfPIxzC5vtH1lT+6bE60pMn394U4+HYxvHJbdQOdipLujsGGD1WbgYtNopGOHKK
 /klpaij5Fh6TGWwb58qMW94Pk+8zBEq4nZRLDWQF5Am73T1fhFppqWfpi6Bij8guPXtB
 UDkVoQ5Vth9nZFZ5BlubTDiUeI9iIMlSUKsGn8tf95UY8qaPhksBlNe+qNavxFUapudW
 ffZhLXQ7Kcebei2l8WlIGZgjJ4C6bX6Oj4MpMZ00getoICYl147AKv5yBNSVDybVLyMK
 ne5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLoI5eA7opBV9vxsZ5QvtsOzFGbUPhc2WuZcaudj5Yo=;
 b=iQxVs/dWELn9BWnTY4/8iR+JO565r1UYDWQWiugBfrMoZOynrzRWxP9yEoE0q7j6sd
 w2pUQYks66G5vCYL5C4OhPfvALedzO+BBPu/w0Dx0wq6kyRsScrrdaYgAIg/4/QSxSIv
 Y3e3Z+/ddQcBGEUTvy0gTwEWC9x9HF6gXaGwqnLX/G7o/+BVL+A1hC4FWVmaQlmwK5Ph
 UpgMxKYEZn1hotZGz0l4icBCoiiXcpS3vf2VcdjmsaFbirHcWJmQgQkdmEERvgHKae/U
 wOyeWxLHjocisQsYYY8Mw9003g6PQeDxZN+FcQYZzWpiHpuc6PRN0ORnkUZOjksyro0G
 pBFA==
X-Gm-Message-State: AOAM531IJv2KY5YLKq9dUPGSaSG7L0+/ZFYLi0t2PCCI4uv3uB1CGPqM
 z3nVZlNOYtmcx7f/ColsWkJfrEnhgei/Ig==
X-Google-Smtp-Source: ABdhPJy1yV/JVPyBv2lMpJHSxwxvNmadoSz4TV5gEa6w8Fwd66RaN2xGdBfeg+NZxzTKXq2rIYKHKA==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr41922022wrn.113.1626850227293; 
 Tue, 20 Jul 2021 23:50:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id b16sm26139262wrw.46.2021.07.20.23.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:50:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 08:50:21 +0200
Message-Id: <20210721065021.441548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: fix legal info
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit 9ca64820db6766ad51bc835c86948cbe2c87e209 forgot to update hash of
darkhttpd.c

Fixes:
 - http://autobuild.buildroot.org/results/a1503d8d6f67a3742350b0188b0b2621afe5c476

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/darkhttpd/darkhttpd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index c6520ba5b2..af5a2bf8c9 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256  1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2  darkhttpd-1.13.tar.gz
-sha256  3239739831a668d1273c0ef5ae1b2147e0f423288b16ed997d7e695cc7e0a6c9  darkhttpd.c
+sha256  44e784df460954c7760e2eeae69aecb12a3d23ca1c0a4f6047c3c6452b2e2f49  darkhttpd.c
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
