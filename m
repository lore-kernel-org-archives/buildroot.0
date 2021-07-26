Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89899C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B11560D07
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B11560D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AB96402B7;
	Mon, 26 Jul 2021 09:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkO08yqj5eQv; Mon, 26 Jul 2021 09:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52443402A2;
	Mon, 26 Jul 2021 09:00:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDBB61BF354
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB49F6078A
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZ6ZCdqtgJS8 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:00:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5278A6078E
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:00:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so7667940wmj.1
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aRJLHRwe2CyeiJJofCFEqJdMCxgVhu7i5ZdHOasMEo8=;
 b=GPoQq6GZkCffPcUwQw0f4IfiExxUIjtTuZrpFbXSktLPQ9tBd3+j3t2K79dZYESE/V
 jz7oNg0sBm4B1dPVikpfz3TbHL3dNVZSgMSgvWZKUaniMQkbrDNROXs1KQ6prQ8Y8/vN
 WKUaSBfV4CaPAZMUcstfVkA9oG4pUcjzfmAM+5y/ewuTcsN7UZhmdGp07i+dEeoixacR
 4kY0WniZ33rMa6PYyd3uqsHiWpPUbUFt5WcZ0SiLXZGsYPGX4uVL9wAPlExltUNdDlUD
 k+gOWdHQZ7z+wbCM69I0lhiGLyBcowl58r8KjSYOXsnvJS9BMX8L8gsDTriedlKGsYoU
 FiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aRJLHRwe2CyeiJJofCFEqJdMCxgVhu7i5ZdHOasMEo8=;
 b=ZfLFkyq7aj+BpCnTp/9QyS30mnN4gCP+Gr2fbxI3poN9egs69fckBionJZVXEdP72u
 zX5DGcOb2xx4LPznH90rqYuzQn1cxbyl40FhiMEa7x+cYhI6GoMZ18T7qDDBeuL/idPk
 42CP5x1QMaS1JmeY8JaeDASLlP0B8eS0i5qaXUJWViQ9pfOKJGWAQuUeRX0rVkx6Xe9H
 bAFU7kxU9I83EQMmgLtGgDIx4EnXrnQa5nHY/6pcNPBe+cCt4a6g8pkwN3+nM1Zk+0Q2
 AuCDJSNRaAsZmgrtLhu6sVIU2SnX0P1a6qO41B5kfd77pNoyZlZysR9qsFSRqqXlWp9A
 R2Ew==
X-Gm-Message-State: AOAM531zI1T7srkk7dFV2cyTcm4b6SZsVhuw5NsdrF/jPef1cZbAkoNf
 caXYmQj55ByoDZSktcVxokM9L+bQbaMjiA==
X-Google-Smtp-Source: ABdhPJwhjLQZ9qswNi1KGEEB8szUWE5GynoVbkpmUL+9HvtBywSqwhDq0lHwIcLiDdozmmxeyTg3KA==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr536831wmf.24.1627290004340; 
 Mon, 26 Jul 2021 02:00:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id a8sm41632081wrt.61.2021.07.26.02.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:00:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:59:53 +0200
Message-Id: <20210726085953.1711020-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lirc-tools: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for lirc-tools is added by the services/lircd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lirc-tools/lirc-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index d66f4e9925..27aa5b97cc 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -9,6 +9,7 @@ LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPL-2.0+
 LIRC_TOOLS_LICENSE_FILES = COPYING
+LIRC_TOOLS_SELINUX_MODULES = lircd
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 # Patching configure.ac and Makefile.am
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
