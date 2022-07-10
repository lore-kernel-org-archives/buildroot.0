Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64176C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB61660B4D;
	Sun, 10 Jul 2022 21:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB61660B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgIOnRNqJBXp; Sun, 10 Jul 2022 21:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F7F60E5A;
	Sun, 10 Jul 2022 21:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F7F60E5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7FB41BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A00FE4094B
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00FE4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVlweLrw1Y6t for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C8D40943
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46C8D40943
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:37:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a5so4766378wrx.12
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qpydvjtKnmMQKDpEC5m1GtgoB5QErEs00YY86wsEfE=;
 b=W+XDmIh55AGxzCa66yPB4bo+PHE0vFIBb6yualL+J25/Pge4R1gyck6pXVdHYjRT29
 BAWUguS+2PJbm3+IVg3H8zz/zHEV8X2QyqifbfQ1f16zrsztm6BWH+GtCSVCzRK2l6fL
 iR7YmHD5DhuFUDMeHRlL/c2lAdKY8ud8F9i6Krpfr51V1t+lHrw4n0VD3aCkxu9ytXEO
 +Bw/3DggRxePxfEGpTBH+Z1uQHRch0YXRkseRo9V6NiuEYgfVX9LI+jlybHDfF2Q1oOS
 98r1P97nwRLJVL+GS+CDKXgbZX1JByGqwa6+ospiKzfq+U4+/G03FsvsSq6y+Yg4EsuM
 w/EQ==
X-Gm-Message-State: AJIora/QFi+u9FP3q5/jnkDa2zokXwkEnCaAYG2eQiaxina2PMIvXRpn
 zTV4zrOa9NFOByOH5z9zh6bs2pYYhps=
X-Google-Smtp-Source: AGRyM1u/3ZHXJS8YZq+pl2KmOkiW5RKvoIgyPDWR5dX/HM1sgTo9IKPmJOA04ArVql3P2DBjDCHbCw==
X-Received: by 2002:adf:dc0d:0:b0:21d:ea5:710f with SMTP id
 t13-20020adfdc0d000000b0021d0ea5710fmr13891035wri.48.1657489074301; 
 Sun, 10 Jul 2022 14:37:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a056000023a00b0021d96b3b6adsm4301376wrz.106.2022.07.10.14.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:37:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:34:58 +0200
Message-Id: <20220710213458.877978-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qpydvjtKnmMQKDpEC5m1GtgoB5QErEs00YY86wsEfE=;
 b=cfvlQtD9UuvYMqWBodR71JnEFyT1PFIeiR+vDZNOHTnS3sEC8Gl8yMaRUW7v2Rz+4O
 oczsfbxx9LVnsFgvI2CW5I5GFhAx0soqUaHB6QvJSdl9olavRQcUCTN7bpmd+KOdSkOx
 7j2t5ykXjRtq4SS2m8lZM/As2RTQiOec7s5bOUu0+3v3aBtElpdpazffne0IpfBjOMSY
 TAWO/V6ib1l0gt2DEfmtfMoR6Ou1gdjrlYlLx1vD1YFmtYe8awoWSV/Wr/w2SZpz8weX
 kRQ1yBtOYmrPAttzBBa6aBzhTem0cTAddQyMYemmLkgeTOvk+yuEPXmZ8pYeZQ6p/qwf
 S2eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cfvlQtD9
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version 0.10.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-tools/gupnp-tools.hash | 4 ++--
 package/gupnp-tools/gupnp-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 28a1d26ede..37983b0c92 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
-sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
+sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 7b34de52a0..96bcbffa49 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
