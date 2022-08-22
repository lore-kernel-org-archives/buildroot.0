Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED75C32774
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 18:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2692660BF1;
	Mon, 22 Aug 2022 18:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2692660BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly1VD23CdYr4; Mon, 22 Aug 2022 18:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC7860A6C;
	Mon, 22 Aug 2022 18:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC7860A6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D08B1BF3E8
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25275817D3
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25275817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1uoXtMG33qh for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 18:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1DB817B0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F1DB817B0
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 18:29:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h5so13470525wru.7
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 11:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=f2S5qYl2+X/0nMIjUyVqHBTpV/cnbrxBijOfWbytlz0=;
 b=VdR21S+ItSS/T2FL/wh8TRKXADuiWXT5E9Mtj5wI2mIjR1Ny3wnOGRWZvAUBn62eQD
 sTWOUkih8RNbDovXA3pi78RBD93GsPht6ZLkAZS6CurDgiRLOaEZWw0RZupVUZvs8jxw
 B1yTg9afyggOqivXybicNEFo6jvYxesROzsoMGnk4l5IKCibSkHXvVXBLqjdLYlE4Ajt
 nqCRGCbQuT9Sc1boQMv/9zCck6sJozuS8xpvvVPzwTnVA+EkaO8aCv2fgxEnDdZlGSpu
 PekLIAXNor94mhWveRJ0/GihjC4kYIQyvQf3Pjw/V40qgqAnadm8gqrBhIuYi0tFO2On
 /J9Q==
X-Gm-Message-State: ACgBeo3/ULj6FT0IdAOIiLJXgLBsSEr7wAMVH5eArF/n29IJUbm2K34i
 C3rIUYj7K9QC/XomycSaw4XSsx7M1oY=
X-Google-Smtp-Source: AA6agR4lh5wKZTfB0D0/Noa08sVHRXH+lnssTuoXMQM6xeRGtIfaAGb5kwB+MBsMyK1VJIhG0EPe+g==
X-Received: by 2002:a05:6000:1ac8:b0:220:8168:126b with SMTP id
 i8-20020a0560001ac800b002208168126bmr11520348wry.288.1661192959472; 
 Mon, 22 Aug 2022 11:29:19 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adff94e000000b00225232c03fdsm14060206wrr.27.2022.08.22.11.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:29:18 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Aug 2022 20:29:14 +0200
Message-Id: <20220822182914.1691397-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=f2S5qYl2+X/0nMIjUyVqHBTpV/cnbrxBijOfWbytlz0=;
 b=OR1p5ZVmHtmSYX1XNGNPqeiKAt0pynCrRdp4IMYV2e2X3M/8sxj6Cmu6SJzQ48MCf3
 EX/f1/fPTjjfl5RumtTxRtscWV+bItN7sFSFGdV2imnjeTm5pu+H+TcEOVqQ4+dtev2H
 EwP9TpzWUQ+yNhB7AtUZdkewYyUBxpbRaaxb4z6GHNzaIKlgo0YzhQSETfHn5U6O6uFq
 XTFywjLjeWE7jAu/wvbUPwzpBC7wU2XXyKCIn83ARy6bKWHuMb6BizCJASC0JpRykVJV
 FrW6FxOsgoJGJLoHpmVtZ965o9g+7oU2v0NAoVj5FZCv2PKhQ+BD5hMa23FePF7NLuxH
 GV5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OR1p5ZVm
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c044563b3..cadcb20f4 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.18/strace-5.18.tar.xz.asc
-sha256  60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db3d1187  strace-5.18.tar.xz
+# https://strace.io/files/5.19/strace-5.19.tar.xz.asc
+sha256  aa3dc1c8e60e4f6ff3d396514aa247f3c7bf719d8a8dc4dd4fa793be786beca3  strace-5.19.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0e1cb04c4..7bdf36a47 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.18
+STRACE_VERSION = 5.19
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
