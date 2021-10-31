Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEB0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 22:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A3560EE9
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 22:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4A3560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C22E401BB;
	Sun, 31 Oct 2021 22:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOr-jHGMSLdE; Sun, 31 Oct 2021 22:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46CB340100;
	Sun, 31 Oct 2021 22:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63D1A1BF2F6
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 22:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B83F40100
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 22:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q07h-G8bq-nI for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 22:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B532400EB
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 22:42:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id b71so720370wmd.2
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcsfJwC0Noe2AzGseBstAE66LWdsLDLj1GoNmGxC2d8=;
 b=N4y1X+KDRbqrFsC0mFqUOlspEZ1Io2cU36UXeItJdX92wTfufsVsxntlmfw1bdPrmm
 5iR4n1ORJpdDpSB0LMJ8IlXteANL0FPQoEf3SKxdAJkUQIH0eJKmOoo2waK+lPlNloK6
 YEm0NIx+v2V0rzjTHrfKfBga6HXPLG7n9ARykw8DidHOkz8ElPKWfAFavAOhdbUvUuvb
 z7Hc/uAz2gTpgOe9D2NdH/3g5rloBsVX5SPU5ns+EoUy3nJO882lTt+GeLbH7yumv96V
 Zsg6vz8Z9MzLU3cYjULxoMRXB5FpbyL4LlqcRLbpty5/dmDRbdsonemxywEIgE33CuZL
 qVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcsfJwC0Noe2AzGseBstAE66LWdsLDLj1GoNmGxC2d8=;
 b=Ko6F07fKbcKoZPCWtVmxGhOxMI124pdXUwnChC5nReirFdZpOfMncu/0zg7n8yDH/B
 vUcN9Kt9Zum7ScM3jbPdvSTTcEmDPAzYPBCTtYQ1uA7K2nOlKS8XGsvL3R5rnfmiLx+W
 viQNgGgb2BA9jxekl9r5GnQzP/CEPiuJZTQ+BL2LUtYHLURgBqM4nA8Nf7SFRr7zsozI
 2R5CeL/AhkcPKPQE+3MJ8jDn3aAkHQZ1zfTcI0tjjkZT3gUufVv2me6ZzFTW4tfDHR4y
 WcQTACZWk18lBSANKyDUBTOkgMYVNmP5xIJ+bxJYVuyfYSfVwHq7FVvyxJpp8VGkQVol
 gqHw==
X-Gm-Message-State: AOAM532tuWj6eLJRNTiYk4wh0j96vHDxnnmmF73reaa9dDrxa1xcg4GZ
 SUS7dpWpuGkmyMGeOJoUSFYkR2e+qsY=
X-Google-Smtp-Source: ABdhPJwfhZVNRK+T3RiXZtN4F7fHflfTuuViiXnvkPDrBIGDUsk6Zt11WKrJn2V7PnxXVbLR344uDQ==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr26827137wmk.93.1635720131357; 
 Sun, 31 Oct 2021 15:42:11 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id f15sm2645377wrt.26.2021.10.31.15.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 15:42:10 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 23:42:07 +0100
Message-Id: <20211031224207.1385633-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

policy/modules/system/systemd.te requires xdg module enabled [1]
otherwise refpolicy fail to build:

policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

[1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
---
 package/refpolicy/refpolicy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 975c3b584c..b1d101e311 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -69,6 +69,7 @@ REFPOLICY_MODULES = \
 	sysnetwork \
 	unconfined \
 	userdomain \
+	$(if $(BR2_PACKAGE_SYSTEMD),xdg) \
 	$(PACKAGES_SELINUX_MODULES) \
 	$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES)) \
 	$(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
