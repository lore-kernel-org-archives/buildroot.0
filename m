Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6C4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 17:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3596128E
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 17:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF3596128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E8780FF4;
	Wed, 17 Nov 2021 17:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8t3P5arADOI; Wed, 17 Nov 2021 17:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E98E180E09;
	Wed, 17 Nov 2021 17:39:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D236A1BF34F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 17:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2A9180E09
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 17:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzjYXMgIMfAv for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 17:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5E9A80DB1
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 17:39:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d5so6243045wrc.1
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 09:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nhWzhVNO00vclKESH6sl5x0mjo9c3aywq/QEwovFOZ8=;
 b=Q40HYj1dSLvGQRmeN4Tyy6IPdKhTpkFD1MpvEC4O5ytSHdsLkeU340O6qM/Z+j6z5O
 dijL7G6I3L1SRpKUadVP50AMb6/P2HVcidtS8Or017+QiGSiXyhYj59L0Vl7DT3lgzBA
 /snm/UnegORp5N9VtIQ0247f2RITHB5Ngd2VBt0eCnOw46kifBE7E1o9QcecNN3C3BSZ
 AU/8PxDnpVq3dIqqLYOXqzh+JBKtGGuzWnJYEPjN9XIpgMFaLU8q46/4rVhHD+dD4ktC
 F4eDlLSCXodMPT+ZB/D85v6e2fxq18+DbhJbgmApRCoLBtdBR1KJxBc/rkhzBAb9kwhM
 RTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nhWzhVNO00vclKESH6sl5x0mjo9c3aywq/QEwovFOZ8=;
 b=SuHTOUrWdnAgx4NNE2xjr7c3+psePsEltJyB13uhvoeVPdsqUBVVgcw/ktozWyVL63
 huSNmBVn0SVuzua7IWJC2E5Bpzm5eFxgOpMa7Xn7z1qrgbj17VZhp7RLdTAs+esjUnZU
 X8YgBFJG7fpYRM0aWSiV2tkia7WIFQVGrM12fcMFuaq2oxSGdd9qr8nzKqq9gdlJznG/
 9b/UME42VRgA1WI6xcDikfvS4R7PMFL6Tg+PKD3V0H/7n+6CRyyDMOZakAnzwJJuPUuL
 7ZZw6OLw3iIuloVdEGUbnfSHXt/z0vooVNXd7zcFSVlF+OtND7VgoijKFHo/DAfzj/Co
 EwUg==
X-Gm-Message-State: AOAM533sOydJ/t+Z1QsL4vBIkWmEhFX3zeY+6q/a9TRmQSSqF9NAYw5Q
 HosgZ4q2CxmyEYBLwbbGeWXawzHqV7I=
X-Google-Smtp-Source: ABdhPJzt1PmJQCLtUCNBDyGWMCSKQX0udZOxhFnLw3tPwx9nAMoSj6w7B/gqTS4bRKuygQEW+CE5zg==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr22513117wrv.13.1637170747399; 
 Wed, 17 Nov 2021 09:39:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a9sm489073wrt.66.2021.11.17.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:39:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 18:36:58 +0100
Message-Id: <20211117173658.994653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/seatd: daemon needs MMU
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

Fix the following build failure raised since bump to version 0.6.2 in
commit c54f85ca0d2ba7b73c899a27e62c67d3389617b8 and
https://github.com/kennylevinsen/seatd/commit/1e98727ae9dfdb23316249a4f32b3169d956e417:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: seatd-launch.p/seatd-launch_seatd-launch.c.o: in function `main':
seatd-launch.c:(.text.startup+0x8a): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/5219b6dac714886c7fa4d3687a13b9dff8338df2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/seatd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/Config.in b/package/seatd/Config.in
index 2c2efcb04e..5473b237ce 100644
--- a/package/seatd/Config.in
+++ b/package/seatd/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SEATD_BUILTIN
 
 config BR2_PACKAGE_SEATD_DAEMON
 	bool "seatd daemon"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Build the seatd daemon and support for it inside libseat.
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
