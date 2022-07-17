Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E2CC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6320840A97;
	Sun, 17 Jul 2022 21:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6320840A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWfPlcZV-MYn; Sun, 17 Jul 2022 21:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6897A404D3;
	Sun, 17 Jul 2022 21:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6897A404D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D83A1BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7790560A6D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7790560A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W1CUjyE_san for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 670E36080A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 670E36080A
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:11:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r14so14589426wrg.1
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cwJpKGqEwWHROloyRzSD5xzEqkuFsTtyGA2nIB9dac=;
 b=xN/mffzvEIF9pm2pt4q+TZ5B0/OB14m0stMMY5rP/83wv0HQ6F9rkHmtN8eH1jGaZe
 zzYiMMH9wPXPgHb54z1hy8Vr5i/huNW0XbiN2nQII29bWGButG9a22i+msQocgA4l3yK
 gkPshqeAVbV8ViiQzh8F2wPQ+SLHOXXj6DM/+94VeghHt5XPzylxKM2pTnmV2XGM7mfJ
 5EjjBXQ1Iu+QHZ8nh4YuBvX9MkRD/231JFS5WPui78r0N2OObWq0meDRt1+HU1zWEpTo
 RI+ZDLRfmozeAdRer9UmWQWXYBavzY7TTWtcPlVk8rmJwh59+A65Kle146UZGBDja5oJ
 z4Kw==
X-Gm-Message-State: AJIora/I1rNZTl8lV5cC8oV0IpgRbPAFvRz0oJ4sUGeKBPWC+8UOZ9M0
 D4PDfbhkLXw/Ekn7uSTb7ZrebW6mD0Y=
X-Google-Smtp-Source: AGRyM1tSRMRIPYPCIZFLuLKT7QLxz1Sj0NCgsAuBY7K/tptrRrcCYO3Z5YBAn08+Ot+wAja8LrpzEw==
X-Received: by 2002:adf:e40e:0:b0:21d:6de7:e787 with SMTP id
 g14-20020adfe40e000000b0021d6de7e787mr19776180wrm.488.1658092302035; 
 Sun, 17 Jul 2022 14:11:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003a2e27fc275sm13596725wms.12.2022.07.17.14.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 14:11:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:08:28 +0200
Message-Id: <20220717210828.2592538-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cwJpKGqEwWHROloyRzSD5xzEqkuFsTtyGA2nIB9dac=;
 b=KOCAIbbYRmR+I22K/bz73k2ebv9uCL3+K7Cb1+6/SRPmwa0p8GIv/ET3VfinW3g+86
 plRC+hrcSQ8pBtM3pltPCBbK5WAQFB2wuRO2QP5pVM7YtRlKeVK1+CjS/s5b32fES/ME
 EiMmEGtrEeN8E+sXG/2fEYnQ8wpmOvRUjSVh4B7yXEi6pxknBIY/hcjYbd1dadUMMOq8
 rpUR8Ff5qADFvXOBgUpE4W7dbAc0mmopvl/MgoJCcJsQV+9w5hELJRjWDDoA7gVHtjp4
 CKwgm4xxpT0EbCZ24TnIfX4Oi9M0vfNedVid3+59u5SKeQH1qC2jwesdqNFGlqp62fzs
 FLdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KOCAIbbY
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix build without linux-pam
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
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit
86deafe8635738c3f9efcbda5b22883504d59129:

make: *** No rule to make target '--disable-pam', needed by '/nvmedata/autobuild/instance-0/output-1/build/lxc-4.0.12/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/ce1be5a8152f7c9aa0f6e59abff035f97a3fd423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index abe4f0804a..cece27411e 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -55,7 +55,7 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 LXC_CONF_OPTS += --enable-pam
 LXC_DEPENDENCIES += linux-pam
 else
-LXC_DEPENDENCIES += --disable-pam
+LXC_CONF_OPTS += --disable-pam
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
