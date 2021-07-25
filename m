Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB09C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:48:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1325A60F38
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1325A60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D887E60625;
	Sun, 25 Jul 2021 15:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hv6tRdYk4nv8; Sun, 25 Jul 2021 15:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34736605B3;
	Sun, 25 Jul 2021 15:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 806711BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C95C40369
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0qYHF6nxg0J for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3D734035B
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:48:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p5so2832812wro.7
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anVlclrMthdghUx7dla/3WYQoML+lHO1us//QQM82LQ=;
 b=L35GpxznugNO8Qn83l3TkYp/fX0A26LZKIbaUEzMPzlsF3Pf7fCgvufF8XbarddDOd
 2P1HgxEUJZTCdRPhKxEG20/+ciRiyTxQGfLJPIUm8uZMfHvABt5Mpsj/GcwlMUM4+BTW
 tHcDDP4wc7Uq++iE823j6fnb6d1W9qly7RyL6OVzjsWqI1Nm10YJNM+nAlS364ENkB7e
 LGmRczEIT50tcbWGr9woaRCqlFhZ2Is6eyJ+YC/chPCSQzkvY9jRijlBwVlCC7A8OrZG
 27KHtXxr0GmZi64gKKlt/6y2bWO7XX/SCQhXxX0PdwA/GzrVsoO42FDqzTD20aw2N9oy
 7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anVlclrMthdghUx7dla/3WYQoML+lHO1us//QQM82LQ=;
 b=LQpct1GMU6wi60/WrZd0N/+agV/Q3PMNkx+w8saN/gefiOWtgACUnoH37oE17PmM3q
 HUE1tF8qSlmgLt+x5uS4G2lz8W/+ioyHP0AxoGb5auPZMjBcv09SAk4LA8rHsCE8o5dx
 IojoEhMTr1VUwWLyOitJtkgPckrJ3O47TnkNlbnjjJVeOBf+MPlTFNCAjV3LBR6yaU+1
 yPs9K4RRL6KBBX9IwnzXvK8OP/1CnGH0Hli6W928TK0RgnDOo1dXDkbrfn+fz99HY1KC
 XVsN/PjRx/cHy6FsTJFmB3RH8LiwySnRykKZ18eaBkRIXdjhVywxBd8ffd9OroMj8XPw
 t7qQ==
X-Gm-Message-State: AOAM530+Y+evl70T5cVbuD6XffZ1s3730KRptfp8RV+vXDoN5sbuRcrJ
 WBuJULU/WEG2O8XAPvOIMKMX+KTuyUhcUA==
X-Google-Smtp-Source: ABdhPJwF5Tyo8UZetMqp0DXR1e8kncYmJGFgdazKTyjYdqJ3JHLJbNN0sYay63ttnPGuOELE9x91Mw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr8328384wrs.252.1627228132685; 
 Sun, 25 Jul 2021 08:48:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id f15sm7111762wre.66.2021.07.25.08.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 08:48:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 17:48:35 +0200
Message-Id: <20210725154835.903338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/quota: add SELinux refpolicy module
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SELinux support for quota is provided by the admin/quota refpolicy
module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/quota.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 12d12b1296..0c751d4436 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -11,6 +11,7 @@ QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 QUOTA_CPE_ID_VENDOR = jan_kara
 QUOTA_CPE_ID_PRODUCT = linux_diskquota
+QUOTA_SELINUX_MODULES = quota
 QUOTA_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 QUOTA_CONF_OPTS = --disable-pie
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
