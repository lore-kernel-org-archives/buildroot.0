Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A89C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:09:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC5561026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DC5561026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E707940594;
	Fri, 10 Sep 2021 14:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmlkVdFOLsVt; Fri, 10 Sep 2021 14:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01B974029B;
	Fri, 10 Sep 2021 14:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBBE51BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6DF74068C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0sOr4WQZbO8 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:09:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8A5240660
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:09:41 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id e21so4466699ejz.12
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIF4Ap6xwzGnUcqFZ0kEb5/KSBSKmysXJAmsmG6iTXk=;
 b=QHW06/qTd6ElAmE+isUR+8TNM8gKlLvJlO5Hn2eu+udpNG54g3+vOUyfrm8FO+T1C1
 /GUC0p4xCuy2mHXcBv0IBrCo05Njl9xeq5FGvhic6By90LGvu4AxxC5QnFEjz0FFRLhy
 q4kkvum1Qnvuktj97QzH+KEVp+FXBqCqjapluOcvbUszosneENHsdZQyMXZxf1vLuvzk
 f0rCaAHZNKiRfvKq6hU3dzkTxvrwGHYt4igEiaPdPbhZU6n2VLykROewrLilAb+d43Dg
 ejIWW8thCPoS116rq8IvE78ZIvQTaekfK8u/Wqq2U88HSCErQRBOgbO4AX47sPPB5i3b
 +DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIF4Ap6xwzGnUcqFZ0kEb5/KSBSKmysXJAmsmG6iTXk=;
 b=DFdpAFhvyW8qMvjilugjQlGsQwnfrJbGgLLxVRJR9jjboM4xNvwzdGytEXvUHTg+IC
 aKsIqMACD3jQNRxTIM0URA/vvOI3AyMvtN7JsX4mrPivMaqMCARiwIZA7Rf53q2o7Upk
 Aol2oED00gWF+Nv7kgB7qAAJJFVEnmvvHEtTXRQ1VNDzP/+TvoanU7pXI2odEfWUMd4x
 Gic72mFlAb8k0ASCyxUNBjA1FjdFWncBuLYFbljcR9+IT4h7ivztnRVAMT0fQSV1hYCK
 cZZoQRbSXcNeHBlhtODys21OksfdhJKIukUo3eH6OmJBinF5OAE5OKhdk1X5CjP1yPRn
 l6Zg==
X-Gm-Message-State: AOAM532YYmItZvt7HLqRjrUaqUUfLgDWKy8csAfFYRP+dJqNSB9teCMa
 1jTQGejFsLYMsYl7Zwla3NQQGaIIqZw=
X-Google-Smtp-Source: ABdhPJxTDgVuYz1jnuY4vNCaInhqUK5IItqCiaUAl9ngVXL9cIJs6aVhR4SBY3rUcgNzv6mMTv3mVA==
X-Received: by 2002:a17:906:408c:: with SMTP id
 u12mr9656447ejj.413.1631282979909; 
 Fri, 10 Sep 2021 07:09:39 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id c10sm2536754eje.37.2021.09.10.07.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:09:39 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 16:09:23 +0200
Message-Id: <20210910140925.28138-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/3] Add support to build imx8 images using
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
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
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
