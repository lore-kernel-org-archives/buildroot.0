Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F03C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 16:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E3481764;
	Tue, 12 Jul 2022 16:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E3481764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCgQfFNrJ1Wd; Tue, 12 Jul 2022 16:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07ED8161D;
	Tue, 12 Jul 2022 16:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07ED8161D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C60171BF3C8
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC4D41B39
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC4D41B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHgrIznPYvci for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 16:32:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691E5410C1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 691E5410C1
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 16:32:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o19-20020a05600c511300b003a2de48b4bbso5704066wms.5
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 09:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zc/H5UmgoEY1M8RcBJCZUaUGozFPteIJIGvRgf2KmI=;
 b=f3Kp/lZgoYBkCE/o0IRoZimr+k7IJXr59Nb3i0MUCMYafuhdjsKmmhFaYbnYRTBwWu
 cZ4W4iisgZybWRaQZATF+afaZpTU/FOpPylYIbqP6HOd7kDzxsUO0QxIGlGaKh7VQ+Ew
 2M/jqNt/RG8Wflspfjl9TBSNnAEZgLFJ5k3uhUD/luGrA0IiNu6csc15CjRUY+B5+od6
 dVnKuoh12TZC+7Ta7l2y9Cp86F0ZkhpxHL5NxuNWavCFJm/LQURFyz1MteF+kwiITqxU
 rvJVuyB1XgSyp4EqcNpfdcCbqBTiqn0q5vwO54HT1nP3p+tQLOApn5kkzJtlimPfT1w2
 vjUg==
X-Gm-Message-State: AJIora9I3ifrgFfuAmM9C05JSfN870DG8YPj2He36MxiTIj3PX+5zZpF
 5TgVHAs4Ovv4m+GbSMD4N6aEzQ9S/1I=
X-Google-Smtp-Source: AGRyM1ttPvu6BFTPxt3Ogrsw/KjdxeOCVGMACBJd8NyqUpkcSDuR1YeSNSo8kx2TrMJcReVek+y5/Q==
X-Received: by 2002:a7b:c845:0:b0:3a2:e5e1:5097 with SMTP id
 c5-20020a7bc845000000b003a2e5e15097mr4852006wml.15.1657643544450; 
 Tue, 12 Jul 2022 09:32:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a7bcb45000000b0039c811077d3sm9652595wmj.22.2022.07.12.09.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 09:32:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 18:29:23 +0200
Message-Id: <20220712162923.1583408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zc/H5UmgoEY1M8RcBJCZUaUGozFPteIJIGvRgf2KmI=;
 b=l4Bd1TVz4qUAlqdN57AZsrz5gVrL19NXzXv8KH8ZZUOFcPdiuxFatwUP2R74M7yZjm
 7jFt/jAgGUtI0jVmerM1fTQHyfsAK5GN6GNbCAy4iCuSxIQ2bkf9yPcv/xBWOyhwOQy+
 4TVSosMjgy1SSkJMo23VDAducTYeJPC2niODCyIDrrgsbIjoHXXMge6Pa0L8DflFyAT+
 ObNekW5SIM3SV90tY6idJHHa1gHW3RIxEyv3uQg+h/YKfXFYouollB9P9r9dTKGLX0iy
 MVd/ZfKgEDjYastqd3ETF71DRVtOAkjRaWPZqawG+38gGIx/DYDOBJtTCDesfxUmqZ9M
 PHRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l4Bd1TVz
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: select musl-fts if needed
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

Fix the following build failure raised since commit
4138151e447e69771e2579ea5a3daa89c56d41a8:

Makefile:576: *** musl-fts is in the dependency chain of tcpreplay that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/629aabd00cebcad980bf707a70642a67ad4472ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcpreplay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 5e36452cf4..9e5509114e 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Tcpreplay is a tool for replaying network traffic from files
 	  saved with tcpdump or other tools which write pcap(3) files.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
