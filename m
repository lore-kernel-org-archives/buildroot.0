Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 17:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD4C408C8;
	Sun,  5 Nov 2023 17:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FD4C408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmNxVBzofDxx; Sun,  5 Nov 2023 17:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F32408AF;
	Sun,  5 Nov 2023 17:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F32408AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9601BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7FF081F81
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FF081F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nbwHNkMol-Q for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 17:14:16 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFE6D80BD6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 17:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFE6D80BD6
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32faea0fa1fso1923504f8f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 09:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699204453; x=1699809253;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swLOwpIV5MMmPTLuOaa2e9gyZW0oOi6bp/uyDaI8X9c=;
 b=EMLdGZ5EoE713pwCOAQvIKDaeIi8VbaJOHXbbw4xz/7CRbzsyvZKJH2Ze7+vsY6l3J
 iK/jEfqvlGW9TT0QohAKPZAIKPCk9EE/KZWXJRmxvGDtuhukxt+A4eW9yeVD005ZhHWD
 5bT73PJItwE95EDjjdILm5qYWhdIKzdBct0dmxSGjpBAwVFMc/EOTkcz3j4oc+tBil2X
 70OHxshNq6TnGfKDaHZQNlANVPTeZS/C+5TSv1iE2lwXWa+0GA0qBtOWzk3fYHOkjgiD
 sBzSA9dgdYFp2yTNdwyrfuwKUqCdwoyTinQV6AgVW63QgckUVayal2QkOI/mZTCvVfTT
 tGsg==
X-Gm-Message-State: AOJu0YwcEid5F4cZNbn0NfOOjuLBbMCAnULONHNrAzq7rRtN8exGVtkY
 xDcCYeZPEdzO9v8o/gFbd8kTSixp6t4=
X-Google-Smtp-Source: AGHT+IGhF1/outOA6szV9qrev00cPjAHXTaRjqqdP7giKC5i+BnjVEVNRnTCefhTdWRPTgXMjEawmg==
X-Received: by 2002:a5d:64ad:0:b0:32d:d973:b546 with SMTP id
 m13-20020a5d64ad000000b0032dd973b546mr10400851wrp.0.1699204452793; 
 Sun, 05 Nov 2023 09:14:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b004068de50c64sm9559324wmb.46.2023.11.05.09.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 09:14:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 18:14:08 +0100
Message-ID: <20231105171408.103503-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699204453; x=1699809253; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swLOwpIV5MMmPTLuOaa2e9gyZW0oOi6bp/uyDaI8X9c=;
 b=D7gsWDkyPlGmeu0OO88bLzQ/cuR73SCRZhe/x4Gd9tlKNWLnLraY54Rc1vTaOsMgjD
 JJ0WGuX1z4XCc+ZidBK1vvKw+3BLgBmb2HYfhiVxIOm9+ASN/A4mwTXxInDXFx+6cUYf
 2R3NSqCfXkBBdKPNViZRES1X5RWXXqpdqRSadFKk6Ic9ylqA0fgMaO2mxnLeG+8l0opo
 jCzhkpzFCz7VbWofyrDI3p9JtXBt0SLHjroTYwSvIGkZvtq6JCNSLJCySaO8dcWCM3rF
 A5vfpqhst3pVVq1KJnefgzg540+3WrQ23EyLMxv1jQsxB6vlrxyTleO86uEcxsph8Jcr
 XKJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D7gsWDky
Subject: [Buildroot] [PATCH 1/1] package/kvmtool: add KVMTOOL_CPE_ID_VENDOR
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

cpe:2.3:a:kvmtool_project:kvmtool is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/9B4C8068-B4EB-487F-958A-353BD3F494D1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kvmtool/kvmtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index df6ae7e0f1..9c58e44876 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -17,6 +17,7 @@ KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
+KVMTOOL_CPE_ID_VENDOR = kvmtool_project
 
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
