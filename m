Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 10:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A46F83E95;
	Fri, 18 Feb 2022 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZ9wI7A4O8ON; Fri, 18 Feb 2022 10:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BF183E74;
	Fri, 18 Feb 2022 10:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4881BF311
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5CB4014B
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoNuOPHdtjl1 for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 10:08:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2941940102
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 10:08:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so8225497wme.1
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsQn4CMdRGJyAz3pVsakdow3ItjqdKTIaqmcGVH+ljs=;
 b=o42sx1A4bNKIM/BGe3VKIGNjLCuG9dYAFk/JuOsW9FfkXW9pkrlXbuEDh1l4rLlxs1
 ANWBOrEW2qboovnOtZJz31SDicjS3xFcCqJo+E1lZTm2fS/JiruIfZCgEaDJqcYsvxd1
 0RDC2pY859SuFanR/fz7MEy+Yb/RiqgdvhLOv6NCdT6Jz54zZZstef+9Nijx5MZIohAa
 PNCa8MNac8E6pEmFChINzOSu0a+P+TesdtgUGCgX3bPAMmmCDkrEJE59hhcdyxuWpAxz
 nyYGAEbfPLmRxSVEwXC4sGx5x1rXLhNoS96AEjNXFdv5VI9erxCO6Bx4AuXJoI6hnw1g
 vIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsQn4CMdRGJyAz3pVsakdow3ItjqdKTIaqmcGVH+ljs=;
 b=3tzBS1gj+camC7cu3g2f/UqCjQSZkv1C5F73+LJ7aVylopnamkWEIo5pZ5qo1LQTVI
 +38JY34voNs3wd7+n8sWYIzIOhGWHJrGhmwvEHJZsjvdrfNsrizQv8EgODgMrCLklQWp
 MifHU/G9cYBlSn5mxXBV4oFwB2CCPFzPpvP1G0uH2QSnG7f7mtKcE+Twln7o72zFrMA8
 R344axKcRFct5ezMPFcJk9UWBoNwOaHtAS5WDup8VdszbhHHCgnSCi1jgurZq72zyTj5
 K0bBlv94a9mH75Ds7TcOQobrbxGlbhptDCSc18SZY7Sbiwj3MaoeXvly0Gk+flt40ZhA
 fDZw==
X-Gm-Message-State: AOAM530U6KIPeVtDfe7pGxDXLNg8GsisMtKjJ3JfCOacGk8DszgHuGH7
 N9/1ED1gDRDGOGmsbX3YGHqA1NK8tD4=
X-Google-Smtp-Source: ABdhPJyFnqt3bh7UNyglcUmO4gB1/0wPIbp7vHvu1MVEHZd48JvqJfmvROhFQoQU/hVGwlWFeHxERQ==
X-Received: by 2002:a05:600c:1d87:b0:37b:fdd5:bca4 with SMTP id
 p7-20020a05600c1d8700b0037bfdd5bca4mr6357212wms.4.1645178923044; 
 Fri, 18 Feb 2022 02:08:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p27sm4013640wms.39.2022.02.18.02.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:08:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 11:08:53 +0100
Message-Id: <20220218100853.677373-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pygame: replace
 PYTHON_VERSION_MAJOR
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
 Asaf Kahlon <asafka7@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PYTHON_VERSION_MAJOR by PYTHON3_VERSION_MAJOR now that python2
has been dropped

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pygame/python-pygame.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 8deb42a90c..600dd9e743 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -103,7 +103,7 @@ PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
 
 ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
 define PYTHON_PYGAME_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/pygame/examples
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/examples
 endef
 PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
