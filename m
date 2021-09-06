Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94FDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4E460F70
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 09:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A4E460F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20FB1403CA;
	Mon,  6 Sep 2021 09:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptCueKfs1FTg; Mon,  6 Sep 2021 09:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3756840142;
	Mon,  6 Sep 2021 09:42:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8284E1BF3BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DDC340142
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 09:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsFvFFBKxggG for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 09:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7516A400CF
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 09:42:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z4so8883637wrr.6
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIF4Ap6xwzGnUcqFZ0kEb5/KSBSKmysXJAmsmG6iTXk=;
 b=gheg7NNTlRaaoofVQxE6lQH1WLMnBVFYYG4bks4Q08JzVsA+PIrzDkwUVIN6U0R4x0
 yP+n7DAo98QP8kJbomC5YXPvJ6G4NRkh4x4AmxdOj1DuTqIXJ0yH+wPwIr2fOF4cwcvc
 qRFpDNpLWq1I+J1N+AbanTWmMtqOWm6PEtzz684ljSujXYZdDj3V8Ok5InLEoEenRhhZ
 6N37TZSYgfsrjRRUHiIeDsUh/aLLRuopFNmXLX+UAXkGaFjktwpmDarbmMmT5P4j1XPd
 A3ZLiYI0SqU2hn1Y1Mu6eBHjrenmbCEOWqqAutvOEoBXjOiWizf6LkLBXjAM25i/SJR/
 2qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIF4Ap6xwzGnUcqFZ0kEb5/KSBSKmysXJAmsmG6iTXk=;
 b=aLAcB1Rf+DZv/s93So5vwWOyjoDe7y++dvSRoiEoy+V4P94+WZdiS5JL7FtQm39lLn
 o4+kr9j7PSrvWx8VdGVR/wX05ODXHCi46dbO3vzr/5EvhfpbYScTzlPli7imR0hMl+PN
 nW4Ikumyu/dG7VPkcdPsTsoC6R2klQl2FJoEkefESdUOY1kreZFnbAryf6FDUeHqlc0O
 HF28URlED+Ye3ECZzXFDUpiYSVbVXfsDFS0kb0XnpbqFnxpLjxBWL4sPx8DS0AAtJLoT
 uFUtopIyJFLfRuNiM+1pvg4/74I6b1b0pXH8YxJwD7bYn1ZLKFxUlsjtHkGvI4tWE9VM
 LrDg==
X-Gm-Message-State: AOAM532aerxBHlHbQWWQNaaVkGZ6Xar8qJ0g1S8RC5txmH5V8GL5zU8C
 0BuKONOg0RjOcM7sx1obnWY452lTA8s=
X-Google-Smtp-Source: ABdhPJwaugmOYBayfzUlrI4OdzTK95GJnK2A/ASLfxLQ6yEiWyVwfsU5aHDWCyErQkBEnHRqhVnHOw==
X-Received: by 2002:adf:c451:: with SMTP id a17mr12355846wrg.254.1630921353121; 
 Mon, 06 Sep 2021 02:42:33 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id l26sm6727653wmi.13.2021.09.06.02.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:42:32 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 11:42:12 +0200
Message-Id: <20210906094214.6142-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Add support to build imx8 images using
 mainline uboot
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Xavier Roumegue <xroumegue@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

New U-Boot version support building the flash.bin bootimage using
binman. For that the imx specific firmware files like (LP)DDR and HDMI
firmware has to be located in the u-boot builddirectory.

Xavier Roumegue already posted a patchset [1] to add this support but did no
follow up version after getting review comments.

I have taken up these comments and prepared the patchset.

[1] https://lists.buildroot.org/pipermail/buildroot/2020-November/599906.html

Heiko Thiery (3):
  package/freescale-imx/firmware-imx: copy all (lp)ddr files
    unconditionaly
  boot/uboot: copy ATF bl31 binary to uboot package dir
  boot/uboot: copy IMX firmware files to uboot package dir

 boot/uboot/Config.in                          | 12 +++++++
 boot/uboot/uboot.mk                           | 35 +++++++++++++++++++
 .../firmware-imx/firmware-imx.mk              | 10 ++++++
 3 files changed, 57 insertions(+)

-- 
2.30.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
