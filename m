Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5277BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 22:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1682404AB;
	Fri, 14 Oct 2022 22:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1682404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iJKkEv2qibE; Fri, 14 Oct 2022 22:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2DAD404F7;
	Fri, 14 Oct 2022 22:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DAD404F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5C41BF844
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69D7981D11
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 22:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D7981D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXXvoypc8ZnY for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 22:04:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C1E8176E
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57C1E8176E
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 22:04:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bp11so9590590wrb.9
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 15:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGVKR4Aod1N7KmsVwAPm+4MqdKjhM6UT/Uq//R+UnNM=;
 b=V7eM6WcKDyx74z59mJpAhqomabbg0Wnpf3vCK8CJqpjnbv9thkBSgHsXk3JsBYQGJl
 ADB/QnHLzqmVVQI2ZIJyRoE7pU0RIv60VdZ52VczZFvDqEAvVNjjrnlRR9uE51t9+63a
 PDlVoAtLlHDfEif8+D+41CryMjB7eQ4C4RF4IAov053cLicVrdUe2B1WU+WbyYQeYKHE
 l2/lMI9VOSUkkuGdldFDeYVt8PemM89eeG1M9jj3tOsMHC/zFIuGVNd20uyLY50A3U7M
 ytWe/mXcRM93O+YshAYrPHS61ysL+SRXVuUvKwKDC/98+s90OsSAQLtDEkyfYJ6WvG3+
 mq3Q==
X-Gm-Message-State: ACrzQf0rBZIp2zX3n6Z1X8bNGOF3EKXDFvtULQPdmgXPuFTyUZ27o9b/
 Ervh4PMNfqURK8EGCbnHs7y6Alns3Xo=
X-Google-Smtp-Source: AMsMyM7iq9qASxVJQlYIfDe2+t/RRDqMKLTJLyrEY5WOFM+yUFOZ5YYREVJV/kmti4F0OSYCh01oKw==
X-Received: by 2002:a5d:4bcd:0:b0:22c:dfba:6b61 with SMTP id
 l13-20020a5d4bcd000000b0022cdfba6b61mr4501172wrt.424.1665785062028; 
 Fri, 14 Oct 2022 15:04:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i29-20020a1c541d000000b003c41144b3cfsm8113605wmb.20.2022.10.14.15.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 15:04:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 00:04:17 +0200
Message-Id: <20221014220417.7167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGVKR4Aod1N7KmsVwAPm+4MqdKjhM6UT/Uq//R+UnNM=;
 b=L/UlHfXnRe01eFmSDqJKA2YYzD8f7V/5agne9n0nKSFvfSuTgciPMn4uj/+svVZg4v
 EfYocrz4QEK02aejnprkqEaldAidEHaV5cKc/RQmUvFhawE2neoDFC2nUWiyS2f2bouL
 kRckS23c4kHc1NN/yP0MC/MGbAIqIc8AFMQJRbWexTTnpB7AWUwU7gZZ/P8Su9BckJPM
 4xaBzf1Gl+4AgcKl8MWrodcUBMs3zTJ27yhhkaI9oMwk/VQVZImC5aKONeqWjLI6c1wD
 i6JIt1jdHq0CaBzgine9Ng0PyFdaNtDBR0oKrYQmd2aQCbWPer1hrpevZeBNm/liZf32
 ds8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L/UlHfXn
Subject: [Buildroot] [PATCH 1/1] package/agent-proxy: fix AGENT_PROXY_VERSION
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, Rufus Segar <rhs@riseup.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make AGENT_PROXY_VERSION compliant with release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/agent-proxy/agent-proxy.hash | 2 +-
 package/agent-proxy/agent-proxy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/agent-proxy/agent-proxy.hash b/package/agent-proxy/agent-proxy.hash
index bd0e814d20..685dd4fbaf 100644
--- a/package/agent-proxy/agent-proxy.hash
+++ b/package/agent-proxy/agent-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4db014339b5bbdae3d98e814844e1b80d87b663a343f7d33fdb89fdbb02f16d  agent-proxy-agent-proxy-1.97-br1.tar.gz
+sha256  b1667b36074c10ebd6dd1f89eda75d5877bc8e06ecf2919f18e75a7a5a9de19b  agent-proxy-1.97.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/agent-proxy/agent-proxy.mk b/package/agent-proxy/agent-proxy.mk
index 46108aef02..c8844ccbf1 100644
--- a/package/agent-proxy/agent-proxy.mk
+++ b/package/agent-proxy/agent-proxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AGENT_PROXY_VERSION = agent-proxy-1.97
-AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+AGENT_PROXY_VERSION = 1.97
+AGENT_PROXY_SITE = https://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/snapshot
 AGENT_PROXY_LICENSE = GPL-2.0
 AGENT_PROXY_LICENSE_FILES = COPYING
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
