Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A102C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:51:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714FA6112E
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 714FA6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF7140E47;
	Fri, 19 Nov 2021 16:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6R6wRN2rH0dK; Fri, 19 Nov 2021 16:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F61E410A6;
	Fri, 19 Nov 2021 16:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8421BF21A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF6A410A6
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0e7XzP-nzW-g for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:51:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62E2D40E47
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:51:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i12so9089082wmq.4
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciXZVbVzQh7yxCku70WmF+/u+i/kZbL30wbOBc4GVLs=;
 b=lQO+WZb9Wi+Wq7LBYiTs8Qu88voYq95qE0KcoG9MvJw2RNzjpULDolc9zH6RyT7QNm
 4Ae8gZzHvOPhn5JT5t/y3UL/Fp+yEoPjaw6N/HFmoinK7B9NKcO7g3Upl1geE4c29o7L
 Ci4EuCWeTl5+7oPt/Uk7dyA2AaXBXZLaYvLwgOYYLW1Ak2BmmREnVMw3gf8LiXs1rDZp
 q0WnroWvW0HXGkGrxcmKWrPaPLUWReZyyKnT98MaUkf1q32YBus9OjFFLTFfTGnYwZyi
 n2wHAQgOJu9BRQuquQoKMlg9WcoPTMeHUxZJ/+srtf8RhYce2YQeshwK6WiVHlQulI5z
 ZWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciXZVbVzQh7yxCku70WmF+/u+i/kZbL30wbOBc4GVLs=;
 b=ZR8/YIBVGd/oJ/Q+sj314HDhVEtW4JzW9IsKLostLYr1JmPmMky5DmZg7r0fN8TDW3
 DmmX8yhqIFgcOFiBKkXdjJJIJzcBYxMt8WvVIHWoxmpH48mwPBjr+47Gkgh61J/GoV0c
 j9gvyq7I5+xVmWvJMGUm9CyxhumqlEFR/tlNjIyxyMm3eVcsmgVc7XzxJg3+XHL85iX4
 V/zQV8vTd4he6+2jRq4Xl5k0AvXhUpoas2T9zmehNfiLa+5kF60p817MJTox4OYFfDgc
 tJPojnGkZkgnOnGMCOx9/vHCGQFuiXIRwk+x/oocKMm+OVmixQjRdRYpYBIFPB/umtMm
 7r+w==
X-Gm-Message-State: AOAM533mT8ms22P5tzAgWAQtl4vZ8FuXc+AtzyW08sNzZLss1e1rOvID
 69LJz2D0LsWCTqvXcZuIjHokEYfzzCM=
X-Google-Smtp-Source: ABdhPJxc2dMP0qEVIUPSbEfQ62V9sPLpb1EQPOTRMkR44g195Q4LoblTImcM1Hwc4Srfc1XuLqcvMg==
X-Received: by 2002:a7b:c752:: with SMTP id w18mr1324954wmk.96.1637340707351; 
 Fri, 19 Nov 2021 08:51:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t11sm240238wrz.97.2021.11.19.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:51:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 17:49:26 +0100
Message-Id: <20211119164926.2410106-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: set CONFIG_NFSD
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14346

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nfs-utils/nfs-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 763dd57ace..07b44b5a93 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -90,6 +90,10 @@ NFS_UTILS_CONF_OPTS += --without-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
+define NFS_UTILS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD)
+endef
+
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
