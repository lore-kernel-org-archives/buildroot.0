Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B237C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:38:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EE960E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4EE960E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB4040665;
	Wed,  4 Aug 2021 10:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWjltrJDNpiT; Wed,  4 Aug 2021 10:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CF94063A;
	Wed,  4 Aug 2021 10:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F96D1BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E96A4034D
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpJx-t3Mvrl8 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63103400F8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:38:35 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso3414744wms.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kzLxuM5HJ9Zj5rFTVRIDsb8G/qDj9WREaaA5+qBWqcg=;
 b=n1fK56NjgXvp3qlK20t4QW0p8vfaNlIuzhL6j2CclJ6qFK+pV1d6/WDpyymoFx35kx
 07w7MqrsW7DLvSceyMELek1+3+IAHHzjzGfnrDwHR84d0hJvetRWrq1XE/D4xDEOBJAz
 uQCQQE1EsIbQi+uyXZP31gGXr6SV4bLAKiaiv/5qaBQLCCZqcNy2JfkDmymQZ32hws0n
 K8Y0EyEzeg4ZCfFfaX5AWrO9QSMdJhZ6/BbXeTjcnzNZ8PnGOlPVUlaEDS39MsIuTgtD
 ScNm7DqC90lWT85dtBxYNyJ61wqJqvuNKGjB1oDJG6TFpsG625WbIz4E+rOhtiVk+l2B
 CggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kzLxuM5HJ9Zj5rFTVRIDsb8G/qDj9WREaaA5+qBWqcg=;
 b=NmPl2M8qBsxAVWIOPFxCY63gYhbgPbE1Bug8gS9tvNermceS16eAV15n3bOiRbP7XI
 BjGb/SQT8ew0tAsHMmGCyVcUIfQnY40FcH3UbZbKMhOvX+b7XB4536x36aK6jRtB+WMN
 iHnfjyMuUMytmUZiHflnSZoIde2QZi7wneY+ZlBTOZnsoI+fs1CUVi5X+o21Zfuq0FyT
 f3bKYggXI0u8mW3gFyrggwCTUzoMzrpeyRdehLZHsTBMUSEC8wUwgQyIgLHbgjPMnQKH
 9EL+0jbi785/fwtmPWi8OvQBneuNi7WMEVZlWKmEdLNJqPRZka2N9Ftn5FyokZuyJJxz
 0nVA==
X-Gm-Message-State: AOAM531gxhosOJe20kFTlMuOZq3z+WMpawCqpBg6YpXMyrnJo7Zr8xVz
 q/Ic4NB5gDa89opjl+8uvOpfgfwup8/rFA==
X-Google-Smtp-Source: ABdhPJzDUVM1t41jC1wDAAOtuNBfOvC3dDP7LkkJ62ys8U6CENA6mC36ph8DXOZXSrt4TslYBDc+RA==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr19933207wmj.126.1628073513463; 
 Wed, 04 Aug 2021 03:38:33 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id g5sm5330048wmh.31.2021.08.04.03.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:38:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:38:22 +0200
Message-Id: <20210804103822.935709-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for pulseaudio is added by the apps/pulseaudio module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 19e08f55ae..372cd98da8 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,6 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
+PULSEAUDIO_SELINUX_MODULES = pulseaudio
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
