Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD63C4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D023C4086E;
	Sat, 12 Nov 2022 22:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D023C4086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7PA9iDkC6kp; Sat, 12 Nov 2022 22:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59B34077D;
	Sat, 12 Nov 2022 22:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59B34077D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C15C1BF279
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 22:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15C8360A68
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 22:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C8360A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOIKFIp618bo for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 22:05:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6EB607B5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A6EB607B5
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 22:05:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g12so10961463wrs.10
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 14:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMCx/VUU7aiSvqk0hNZU3fVeBFZTA0f22c2qsXxL76Y=;
 b=RznzRTDg+jc/46LRq+wdYVeOKSafrjaezpkGNCxaU7Y6o8Ht0RCLBpH7TVBf7jdVUe
 dAgOoOVgh5gEJEhenN2zY/MWHwS2x1TYcSasmqrOmRzpi4ItfYlFy2FkzBcKBHnjCU2V
 77u6Wrnj7mUGqIYivkYsAR5L0Io1xWTDzLdxl0YYqdRhnOKG8eYyBk1XlbaDGGJ3P2Za
 TpI8dIYFE3jRN81sKA3XKyGTrSkdoPa19F4s2nceaVFvg+ymZ9M/lTgBv4XJEP/vKN9Q
 TtzA3iPNa9KMJZnoivF/LqSlyRnvd0wJBzbv+C1d7exoMJ4z9JlSf0I8PCNUfNIGveBN
 mjfQ==
X-Gm-Message-State: ANoB5pmNuNTZWmYzKSekwYIHgqBVOuXyz3gDcaSSmlT1GZVOpheLHlej
 w/O/Q0hKHQlLpJT81x502rLZWZSRgTw=
X-Google-Smtp-Source: AA0mqf6C4v0FfG038Vx9OJdTekc5pr3cK/Fkn5byeGjXb43u2txtNwFDx1h32+MdnN7CBo5uGsPavg==
X-Received: by 2002:adf:fec8:0:b0:228:d897:228 with SMTP id
 q8-20020adffec8000000b00228d8970228mr4140396wrs.539.1668290738657; 
 Sat, 12 Nov 2022 14:05:38 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 by smtp.gmail.com with ESMTPSA id
 i17-20020adfefd1000000b00236b2804d79sm5450392wrp.2.2022.11.12.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 14:05:38 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 23:05:37 +0100
Message-Id: <20221112220537.2521750-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=yMCx/VUU7aiSvqk0hNZU3fVeBFZTA0f22c2qsXxL76Y=;
 b=jhCGbKtvCL2eRtQTiRAwfrU7ywRTZPNJPn9H0xpr/T7WoSMG9uItSzz5+GTGmKw+8X
 s6rTVxpPHZQ6ZsMN6kcOXmHJZ0dHnYt46+ogOPImSQRHvHETUWgj9o2wIuNd8hxIXYAT
 DDzae/31y90W+ELkZpVnY5HVWh6OvKsuuQ4NhhAXSh3pzqJbxod69t5np5dCmltRuiZE
 OVIdA4v3+j8ACRku0TIyDQVd07Y1y3u3eTArIUivBQwbqefQxr0QM/KpvQMSO+jBJR6s
 rpxysOgtRNPf1+chyDmTZMDwHrfDxB++Ny3OmafkxL96ytu70nn+K7km06AAw2Pg5mDQ
 NJHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jhCGbKtv
Subject: [Buildroot] [PATCH] package/matchbox-starup-monitor: fix build
 without C++
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

matchbox-startup-monitor is an ageing package, and uses an old
configure.ac with archaic constructs. This had generated a configure
script that incorrectly tries to look for and validate a C++ compiler:

    checking for powerpc64le-buildroot-linux-gnu-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking dependency style of no... none
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Calling autoreconf fixes the issue, as the generated configure no longer
tries to look for a C++ compiler at all anymore. Running autoreconf does
not add any new dependency, as they are already in the dependency chain
via other packages.

Fixes:
    http://autobuild.buildroot.org/results/223/223f43dd76ee907c5f25c4fee94a0f5d75614dd5/

See also similar changes:
    9993a36f5e12 package/pamtester: fix build without C++
    c05cc5de868c package/madplay: needs autoreconf
    eae18d01abc7 libmad: needs autoreconf
    43274dd3e0da package/libid3tag: needs autoreconf

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/matchbox-startup-monitor/matchbox-startup-monitor.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
index c80e75332c..cd2ae4162f 100644
--- a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -11,4 +11,9 @@ MATCHBOX_STARTUP_MONITOR_LICENSE = GPL-2.0+
 MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 
+# Obsolete constructs in the archaic configure.ac generated an outworn
+# configure script that incorrectly searches a C++ compiler. Regenerate
+# the autoconf machinery to avoid failures without a C++ compiler.
+MATCHBOX_STARTUP_MONITOR_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
