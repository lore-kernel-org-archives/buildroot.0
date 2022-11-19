Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3452AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 23:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA0A04023B;
	Sat, 19 Nov 2022 23:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0A04023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSWMLpXbayvs; Sat, 19 Nov 2022 23:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDAF840520;
	Sat, 19 Nov 2022 23:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAF840520
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7222B1BF3E1
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 23:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46DA9401A2
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 23:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46DA9401A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0COlRX8ucL5P for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 23:37:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78444013C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A78444013C
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 23:37:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o30so6130761wms.2
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 15:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nf3+ljFq6Ti9m9Z+kA2fK/tqY1SBfr4fQXE6u6mqMGE=;
 b=THCTtjusXBaSG1hD2zuPqLtazEWgHKVz67Rtp4QbxICaPviM2FoZpDW5eqRSFcZr8t
 cPmNqr/0TzD3zoLYl4EcYp3QLEZZuw4hLCgcIzVcICSCVOha1NM0kwG9OlpCL0ZAosvo
 59S9VY90G5E5ctxmsz4+pWA5SoftBti4UjujXLI1LdgFsFQoQI/IjoGMVrc+7IOErERR
 aLYSIaZi3iHIcocd/OaSbfEESDorORp0cd6SCcU7MilgCupy8lykFYkmsWZuUIaMRN7r
 MIiFfP/+47kuhPhJQhkT6/EZUzpa+pdU7H5ET2ny3Te93Wc4zyvXiIg4a40KdwT/vNiW
 vGow==
X-Gm-Message-State: ANoB5pnOzTebaG3fJy4MHFpApbSXbXol+4pgM9B0sTlqXYCaFn9wVbEa
 YnyMuHRFkE+l+jVlj6nHS6KevxcEXnA=
X-Google-Smtp-Source: AA0mqf5AUArNA0x1a9V/UvYscfU3wUtBYNqUn69LiLwpgrbyWP1mLmDlN0GUD1093gP3y311yB+x0w==
X-Received: by 2002:a05:600c:a3a2:b0:3cf:7267:5b40 with SMTP id
 hn34-20020a05600ca3a200b003cf72675b40mr8674400wmb.164.1668901034227; 
 Sat, 19 Nov 2022 15:37:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b0024166413a4fsm7357288wrm.37.2022.11.19.15.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 15:37:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 00:37:06 +0100
Message-Id: <20221119233706.52949-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nf3+ljFq6Ti9m9Z+kA2fK/tqY1SBfr4fQXE6u6mqMGE=;
 b=oa/oWSkK0wglE/76rHQ29keWnqp2bhk6KBqakGAQ/+kio2y3Vh7kmrjysR53Qf2Veq
 qw0seNP3w4zAR2kELZ7ryumDbmHxmwwuq0O1ndObLI20K56nh7W9IgYi4V9lxfd6UlQb
 0P+L/O0LrG5dB6IdEpp33oWGmCLr4OG4FOVHXtZp8rmzRLpfFlpp9U9dEk1TS30nDC6O
 bpBZNKvhcamPn3I2+4os8bK4JbI4M6ZCx5EFy7IWMe3UPTI8AujHkrWgVxVeAMOtGVI0
 TzawuSBdvwb9u+wukCj1umn6mdDU6shiOX+I0asau4pbPj9kEnuwabymGo6nFhXQZHso
 1m5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oa/oWSkK
Subject: [Buildroot] [PATCH 1/1] package/sysstat: security bump to version
 12.6.1
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

Fix CVE-2022-39377: sysstat is a set of system performance tools for the
Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
but prior to 12.7.1, allocate_structures contains a size_t overflow in
sa_common.c. The allocate_structures function insufficiently checks
bounds before arithmetic multiplication, allowing for an overflow in the
size allocated for the buffer representing system activities. This issue
may lead to Remote Code Execution (RCE).

https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x
https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index b573f312c6..b47f000e57 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
+sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
 # Locally calculated
-sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
+sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 6948f6b390..377396d986 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.4.2
+SYSSTAT_VERSION = 12.6.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
