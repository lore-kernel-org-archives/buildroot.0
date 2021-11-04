Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E50C433FE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 16:14:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7112E6120D
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 16:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7112E6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5DA4015B;
	Thu,  4 Nov 2021 16:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBw9eaT-7Rk4; Thu,  4 Nov 2021 16:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C14640160;
	Thu,  4 Nov 2021 16:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE3C1BF383
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 16:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A6E281024
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 16:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDPvs4GMM_bB for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 16:14:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8858981021
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 16:14:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v127so4939380wme.5
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Hoe0VjUf9L9pPuacPWguYhoTpo6K2xOlGQfVmcVCkQ=;
 b=myUWsRFE4evfDDT5CDX9sQz/18QUzqxO4hqR3dCMaTGZbX3vPcjuxTaCWrol0o2Ex8
 78F/01jmSWEkb9irn3qw+oQXbyiVWPSBAmkL9BOCSzvQhqKyUjlU83FzsyMDs67fdMbf
 g9Elw1XRK+rgeXIkZ4NA8KEmnLfARHZ8t+pp3Tc3ha2Gl1RGwE+4M4iJGKoPQLwjMtle
 QLH5x1LIg42zxrvuBQ6kzvDYEtS8kkou84B9stJLwiMlS1GMkvmXNI2Nbdp70DtdIFpU
 KkaTRa7kiBd8s4S6bM6nG5NdTnQETsV0vMv5tv03EqbTTQ6ItR4qHueZj1cRLs4UTGNy
 fXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Hoe0VjUf9L9pPuacPWguYhoTpo6K2xOlGQfVmcVCkQ=;
 b=Y7KuipN80jnqs4WsdzJbFvuw/zDV7HuEZ6/nuFHrRJFiABnJqiiZqrPCoJiGjENfpH
 3IbOGCEwEJ11a6Q4LfPfVHS1Qg6WeV5KsgcuPaSDWXszwejjZGAA8kH14ZHX2yxqvcG7
 EZ2QAU0UGjs3M4iwo9x6ekK7knDdFhPMhiRJkikk/YH6uhPj1BPmBRHpHT+3NRwoAMGI
 jEMidsFnwc+hx0SwmAGkoxjL8NwXC+lWXbpp07KRHzW+ouTRWsHwpCMD9tf/fygQKN0V
 phDOn0puewshvmdEBbM098RWbDUB1HgHnHsXeCELXdJz8+nzU8yiMe+oKDMdFBw1F2Um
 sD7Q==
X-Gm-Message-State: AOAM531FXw/3DZDwU0CUtYCCufY5pxdMsmnyEruii1y7Sco2z94noMr4
 iFDlPTYNdfNSCxxft6JPKpWWmz35xmU=
X-Google-Smtp-Source: ABdhPJzjsGFGpU0IFTtmx/4Vc2Dhl4ZICDQwHyg5sYjbQOFOHM77BMmTTXLU3YubmKI6fhWHplwAsg==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr23983096wmh.170.1636042462508; 
 Thu, 04 Nov 2021 09:14:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q193sm10224360wme.48.2021.11.04.09.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:14:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 17:12:33 +0100
Message-Id: <20211104161233.1599227-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/audit: bump to version 3.0.6
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with kernel >= 5.15
thanks to
https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c

interpret.c:48:10: fatal error: linux/ipx.h: No such file or directory
   48 | #include <linux/ipx.h>
      |          ^~~~~~~~~~~~~

Indeed, ipx.h has been dropped since
https://github.com/torvalds/linux/commit/6c9b40844751ea30c72f7a2f92f4d704bc6b2927

https://github.com/linux-audit/audit-userspace/blob/v3.0.6/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/1c8a959d8847d8942fbdf148c1b781df0d8bb4dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 4ef9a42b0d..9e16a339d6 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  994c4250d8fd43f3087a3c2ce73461832e30f1e9b278bf5bb03c3e07091155a5  audit-3.0.1.tar.gz
+sha256  c3e44d77513a42401d417dd0ceb203cf23886cb89402dea7b9494faa3f4fcc5e  audit-3.0.6.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 21a3345552..7f364ab010 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.0.1
+AUDIT_VERSION = 3.0.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
