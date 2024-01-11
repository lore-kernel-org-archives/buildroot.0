Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D5EC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A364A42471;
	Thu, 11 Jan 2024 19:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A364A42471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgshGGg8LWZn; Thu, 11 Jan 2024 19:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB8F42527;
	Thu, 11 Jan 2024 19:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB8F42527
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71D501BF82C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5782B843E4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5782B843E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWi3SG3RD-Jo for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 19:40:28 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DE62843E2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 19:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE62843E2
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso73385155e9.1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705002025; x=1705606825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNtaGwz9fiedWJVFgdA0gRjzsh3BrcpgC9Y08CFriR0=;
 b=FbQnUwcibpNJB9MJpT3HczrFw0xHU+aWYgARA0poj+cuRBknK/KdEC8Ej7gVdc6h9z
 FWlQMeIQPzuQDD13nrclWl2usftUKMJNou8cjWX+jVuaXgth/Ma4zTxab8eESTMH57rm
 2ujS4IuacR1XhIrp5eZxXFyUyZHCEhlBHl71b25iyVJyXDC/Ns+nRy8zGcwhVUpZANBp
 /51u/Hqpti1wCKS+lZNgu3VO1am7TY7eDdayaUetZul5C7M6TItmn+yYQd4I/cKl1iux
 kpn36q913hMYZNm/PcNUVQPjANjZz3f0UtZw9D6GooJGFzMDUyoPdaSgDJEVZUpP4SdJ
 xqZQ==
X-Gm-Message-State: AOJu0Yy4maJDwTdhT8Eetpfny3CgQ79VriPCqXAF3P977zBz5kW3M0U1
 p88MKPt/ReZtYkJkT2TdcOAnmDSDtgs=
X-Google-Smtp-Source: AGHT+IFoo6olN95Am/HVmwFgRauIDL05j3kP6+JRuWkbKJDNBgk9l+bpfBvkiwUDZJFs/82iVS+6JQ==
X-Received: by 2002:a05:600c:1c20:b0:40d:746e:4ca0 with SMTP id
 j32-20020a05600c1c2000b0040d746e4ca0mr149547wms.135.1705002025429; 
 Thu, 11 Jan 2024 11:40:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fl13-20020a05600c0b8d00b0040d8cd116e4sm6973462wmb.37.2024.01.11.11.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 11:40:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 20:40:21 +0100
Message-ID: <20240111194021.2570675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705002025; x=1705606825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oNtaGwz9fiedWJVFgdA0gRjzsh3BrcpgC9Y08CFriR0=;
 b=IwsTu3mbTsaX2fHfT9AThHSfuQzFy5MsELNXx5pqpIybQW8A17dRosLhe5xvjZ+VDt
 zRvjm51Z7UwJbJVFbr3VwiHksMM3QO6Nd/k29V2MOI29XZ2sHoVCd3iU+2VLF8HktFSZ
 iVNnGeEw+glBpOX/ShewQI+IRSad2t3OU/o2K6pd/BrlgOjWHes9DBcFoPn1c6/u+rrN
 K6dCJTA/iKcNVCkiBbTm1ODsEXw4IKtwkc7YU2h2mRfW6l/4dkaOouZRIuoMy9Yi/PNH
 HFJLJVMckwCGWX4FTSSPmCD/rh52/ujkTur65DkvliWwVJpHD4SvCXMkv2abHIRCXG/R
 8Nvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IwsTu3mb
Subject: [Buildroot] [PATCH 1/1] package/criu: disable mips
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mips raises the following build failure since the addition of the
package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

compel/arch/mips/plugins/std/memcpy.S:7: Error: opcode not supported on this processor: mips32 (mips32) `dadd $2,$0,$4'
compel/arch/mips/plugins/std/memcpy.S:8: Error: opcode not supported on this processor: mips32 (mips32) `daddiu $13,$0,0'

Indeed, dadd and daddiu are specific to mips64

Building on mips64 doesn't work either as it raises the following build
failure:

/tmp/ccArXSfi.s:305: Error: opcode not supported on this processor: mips64 (mips64) `rdhwr $2,$29'

Fixes:
 - http://autobuild.buildroot.org/results/b0341d0654e66bdac2c91d5949be3810a961d9da
 - http://autobuild.buildroot.org/results/b7b8860476de04980bd8c7241d3dd5a01a0251c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/criu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index b3bb830768..fc0da823b3 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV7M
 	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
-	default y if BR2_mips
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
 	# CRIU has "some" support for s390 but it is not included due to
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
