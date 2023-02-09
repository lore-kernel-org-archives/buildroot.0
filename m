Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8C6C636CC
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 01:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8489D81242;
	Thu,  9 Feb 2023 01:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8489D81242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NohtLvmwkvzR; Thu,  9 Feb 2023 01:53:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F87C811F8;
	Thu,  9 Feb 2023 01:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F87C811F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D03FC1BF963
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 01:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A32FC61033
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 01:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32FC61033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r58pdIya2uee for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 01:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5075760D79
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5075760D79
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 01:53:35 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x26-20020a056830115a00b0068bbc0ee3eeso159993otq.0
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 17:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9mhvRljObWln69Q44hkgUxxxAEVADd2VSOCTlFFsqI=;
 b=0J9DyAO8bGBbJ3+miFVUw7JB7YXQJNESPhebMMgZe64E37EASmnu2bUBqTt4xhSq4o
 92Abs+Yn7zEQLhw+qY4ysmBPRUC52kclb/IbuazAyzwz+qqyWtaZCdKm+TeSvXVeh7b7
 j3pG0G4hT0O3Uslq7SUCD4WqppATiRdl6Pk6rUoJvjw1P4LxdHnh3a12x7HpL5rM+ZOv
 6xObr8OPkf5u6/SILVhiBuDqRlWZqxXEYL5TGiti9Z+T23NRr2plWamo2jP0Ni8Q80vf
 3RyZiAnFp8480lqN9ZcOgxTAkWSqgJoA2JmaTPGGe9UqW/wkUCkcmV9rwH9VNCyxgteQ
 yIWg==
X-Gm-Message-State: AO0yUKX+KGuUqCy8cVGVj+cLIWoHUXIHnlaEo6wxZaEOjqFeoqyRdLkD
 KgfqxPqBnpe3/zloZ8nmJZdI0lLaIxE=
X-Google-Smtp-Source: AK7set+CxMM+b8nAZRDIMz2elw1/FO20x5kfHNSCrCdxESZV5y260nJPO6XX8WVhujjYFZv3pF4osA==
X-Received: by 2002:a9d:4c6:0:b0:68d:5a31:af3b with SMTP id
 64-20020a9d04c6000000b0068d5a31af3bmr181564otm.14.1675907613991; 
 Wed, 08 Feb 2023 17:53:33 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a9d5e19000000b00684e55f4541sm426oti.70.2023.02.08.17.53.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 17:53:33 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:53:18 -0800
Message-Id: <20230209015319.28176-1-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u9mhvRljObWln69Q44hkgUxxxAEVADd2VSOCTlFFsqI=;
 b=QDcJAZO7i4r6/k9L6u/Dz1XDRdHKnBryv2xNC2aKASVbUaDiFjsL9G6rD1OuPpRwQa
 gSGcp8U1qjX4J2nHVnLNofmVd0Xf9jss9TduGkc83lypS9YFemtC6w+xvKvW5p/RWiVZ
 QYxBflzvN5z9mILeI6ADpJzBK80Be5kxDAiVEH322k10169D5PZ2DDZ5GkOk13RXBz3B
 896GhFCQ2YkvOZZepE/qawR3Kxv+eeVf1mNLZunIZGHHkVz9lp+MDQK6zcY1ZO1xnDNm
 zNfli+1X4sDFTor6RKNPyUJlY0w6dg3uCW3jd+sBnegTyJziq4rvUaX3wOnIMm9P4vnG
 Q/1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QDcJAZO7
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add a setlocalversion rsync
 hook when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Charles Hardin <charles.hardin@chargepoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
    #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..e340d2cf11 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,18 @@ UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
+ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
+define UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(UBOOT_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+UBOOT_POST_RSYNC_HOOKS += UBOOT_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
