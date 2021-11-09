Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C01C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:20:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D52F611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D52F611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C8E8100D;
	Tue,  9 Nov 2021 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApLNvEs0TbCs; Tue,  9 Nov 2021 17:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9C08100A;
	Tue,  9 Nov 2021 17:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2E7A1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F0540433
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HO4mNk2aqHNM for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:20:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D935403D4
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:20:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso2490295wmd.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzihMqQkUpb0yxBgNlXcnquTV2lxhTAmBXiEQLf26lY=;
 b=FIDJ01KOwj0w6K3wdTumDmuFedDNQ/BwP0c8pl5Uxa002jRS6cE4KS5/QwObYfoK7Z
 dXe7VdlN7Kiv0BZEamg5Q/kLPfE3lafVV5PWaxNRbXGSOfsuZjGzjbKDoyb4dJE3VuhR
 0ZTkZ2dGbpXR1glBvi6mV/o5PFuwvRjKIvKrVwxjpfBfCaGp4rNKjzwwytBbmCE2fBzK
 2CuZ/0hZiJQGJJm4xqZ3NUWCIqBqxZJp74RnRe70FhjKG18A44Md+N2yOgWzb6/zqK3B
 /J7abY6P+OoxuVYXSufiTIDxE8zYUC1dUhrBu+PXAMIBQX9Zij/2cq1zDYlx6ZHnIYkC
 I/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzihMqQkUpb0yxBgNlXcnquTV2lxhTAmBXiEQLf26lY=;
 b=rBYXpj2orY4WziiAHNREQ4VXQnIZc+PTrYTbZEnx04JOZ7kEk55kpidSOglVih2ZpF
 8dWzdlZgyD0xycZe9U+Rc2edfnZHElxupm+P0UD1kcPzr800zOFEkWOqX2mCRwFDdpnx
 MQrpF9t4T5ZVAKt6ZTujDhbwVtzRvw4P+rWWpNMNtEfuiWHvY8vSEZ/xiwCYjNbvhSQs
 kRtgTt9Gpm8XrhPfZnSXUACk6IO3GEx9mguWXv7VXFWyQEern0gavX14dkBcbN6DBROj
 X3ZYSY3wnZ6iWB/u7GU6IjX91JmClOIZxt4FHx+/Iv5kWk4aeG31kRSdlXI1t0EXzTqN
 loXw==
X-Gm-Message-State: AOAM532hvqWbE0DSR6076Wv4COBcFl+dY0Zyt5YNx4XXIUd+n+AcK1Ff
 EyQw0ydonwlN+MmFQQfRgsQlSOjue4I=
X-Google-Smtp-Source: ABdhPJzBkppAGaL4RmylybxPttuBIt/wy+XBDC5ptbkmQW9J+JIURXSkoybrvYiNiUQtV8bjkNsYDQ==
X-Received: by 2002:a05:600c:3653:: with SMTP id
 y19mr9053715wmq.90.1636478405910; 
 Tue, 09 Nov 2021 09:20:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z6sm4569314wmp.1.2021.11.09.09.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:20:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:18:02 +0100
Message-Id: <20211109171802.456900-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glog: don't override dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override GLOG_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glog/glog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 9d31732a88..2863e78345 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -13,7 +13,7 @@ GLOG_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
-GLOG_DEPENDENCIES = gflags
+GLOG_DEPENDENCIES += gflags
 GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
 else
 GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
