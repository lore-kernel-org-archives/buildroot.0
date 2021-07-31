Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E10C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:49:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A180F60FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A180F60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652CE834BA;
	Sat, 31 Jul 2021 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdSD1ePQZTKT; Sat, 31 Jul 2021 08:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C434883415;
	Sat, 31 Jul 2021 08:49:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E49D1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4755E83415
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvrgL13xSVvp for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34D53833CA
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:49:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n12so14467071wrr.2
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TluVO97RQrqg4off005EDOwGOQhoTiix7q/oVC7H6/s=;
 b=pO/xFrmhmrXTsO3uiso4ertlOo3p1isH8Hf/oHMZImJDPfp9zvZevgk9wDD3/7MhBO
 z6SZx/MyE9UBdzPKNJ4TvfZE9VAIFdafvednISaUYGh1lQfwKplxM9xrwEgLfuycREqK
 QUeDscQ8CLMXIRg3jAGPG1u/ncTqYTGtox6PTdxKcgYo4BDGqRCS/6x+pw5JQErgFxBc
 kaPWd9mOFmcTuGkdgHyer8qiQfzfY10DyXLxr7SM8l2yoyFrXvMwW5Gbd03fLl9ybkw9
 j+FU7MVN27I7QtLdRSPV4QP+ZYgk9QfbHbn2E0nnTFBYtEG9+C3xyBNtslLA0wLBU0bz
 Q28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TluVO97RQrqg4off005EDOwGOQhoTiix7q/oVC7H6/s=;
 b=lKwbGDr5IpQqARKYapFirF95EX/ZuRJbZm1m2k/92lIJddqBHhr/6wa9h0CIPzDtei
 CAWC8viiLq+2hREb5b7y9p/Xhd4MjwIhCbW0eNEF9PmTn2gMLyOZzKS+0olBY5xXe/jN
 KYnxP6l+p6+FfDIP0Z2XwN2yVSoCYvyAdFelQArmwc7rB8ltkjVFJOlbAV1g9ohas733
 sh4TnRxGSzaD93OkL37aaHcZ9XSz3WajlmEnS/2WmUomVcKahhTOoRJ7W6fy3hcYJYa9
 tsvl2uXYzuvi5891Wv348Q8vIIBTBmrrkyktBvJLbxYi15MOvN1yV7vOccpmeXjErjLW
 iJZg==
X-Gm-Message-State: AOAM533IE0fNk0KUjHlsVaM5nbv42iS+V4hNekVXzOt6B7w69OhAmGh4
 LFDs+pn+0B5cVw8hfJ1RCI4yNsZ95zpBbQ==
X-Google-Smtp-Source: ABdhPJwYS6tyJATfQ2E1+PTrgbgVI+qnfnQA5io6gzMTJE86bRI8bdfFEqmTLAzlKQMXJKmyJ2GKqg==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr7526452wru.115.1627721379149; 
 Sat, 31 Jul 2021 01:49:39 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id z17sm4443259wrt.47.2021.07.31.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:49:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:49:31 +0200
Message-Id: <20210731084931.623919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix SELinux
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add apache module as for now it is unconditionally used in collectd.fc
to fix build failure raised since
4f20ad546fd89e8e2dee7b40ebea9878e72d082f

Fixes:
 - http://autobuild.buildroot.org/results/94d8adab9fd0083e24d5112ae7daa56e7944793b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9901abfd16..9bfbc784ab 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -13,7 +13,7 @@ COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_CPE_ID_VENDOR = collectd
-COLLECTD_SELINUX_MODULES = collectd
+COLLECTD_SELINUX_MODULES = apache collectd
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
