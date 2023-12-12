Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7F4C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 12:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F21409FB;
	Tue, 12 Dec 2023 12:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F21409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly2QnCQCSbZB; Tue, 12 Dec 2023 12:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC32408A2;
	Tue, 12 Dec 2023 12:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC32408A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C509A1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D6E08254A
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D6E08254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxt8-O3QCeB5 for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 12:02:02 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7178B82531
 for <buildroot@busybox.net>; Tue, 12 Dec 2023 12:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7178B82531
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a22deb95d21so118060366b.3
 for <buildroot@busybox.net>; Tue, 12 Dec 2023 04:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702382520; x=1702987320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6XDxlxeZdZ9t1aIFkT8jTLVr/YJDLn3glx4tfDubwY8=;
 b=IG93Ilwl3qVlOa6ndQX7hW1vO/+VKvJuGBLznXo1lHwJ9+hev2vogT1emXlabN3Qm2
 uDK3p/LH/DgT8kB+T0UJcLLOhFmqOMUxXUJ3s1ZEO7R970l6CChBnQH5n4MYcytklFoF
 dYtk+VNyJf2uh/1L46THWmbVeewfn2bkyZgH1U9f1Oh6zcrIyPQ6dY/MqKTWlsaerhbT
 WXLBEVPdRmsFMpamHE30uSQ/CfmlytiI4NOIZe8xAFJXj/v7Z/fB6VK4DehXFYGS5y3g
 sLrzBxkYBYtY/MdMuGUUnfxweKrN5wMMtrfOUypgqJ/IJ1zGcHjWhy6+Lie8BsBYlqKR
 Nneg==
X-Gm-Message-State: AOJu0Yz62bS8LS65iM75gxrZMnvKyEyeU/cXkkfS6AWcNKPPFtTaIQD3
 cjFOI28eb+Fm7T/+bkllE8oStw9uAio=
X-Google-Smtp-Source: AGHT+IExgkH1DFshrX6RjNX+fA2az194oFweM6TOUhKI3CCuvG36ZOAdxpeXbKTTo/42+kWqe3T3Ug==
X-Received: by 2002:a17:906:4447:b0:a19:a19b:c729 with SMTP id
 i7-20020a170906444700b00a19a19bc729mr2993729ejp.121.1702382520321; 
 Tue, 12 Dec 2023 04:02:00 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 tk3-20020a170907c28300b00a1cd54ec021sm6201018ejc.57.2023.12.12.04.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 04:02:00 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Dec 2023 13:01:50 +0100
Message-Id: <20231212120150.7925-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702382520; x=1702987320; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6XDxlxeZdZ9t1aIFkT8jTLVr/YJDLn3glx4tfDubwY8=;
 b=YXSoBYeHvtfNO/jXMmtaNpTeQrHJxHwWEMxa4QoR5QgnmHL3bpOduhan1iaooNR69k
 qmC4OUsXFrJTY9vvLe9SgrFu9vcuUf97VRCitO3MsLYk/RGbz1bVBJ7zuVxEFQh8qSjM
 ip4CL6iQ+N0r9MNM0l9PNXWUgasvWz1PoLpd2RBYsZL64SZDBX9KeGX4Io/TaZ3QR1sp
 MXY9UfL8Oh9Jv6wspbk4k2lTZdEr83cweyu3zNT0nuF9I4lq1SmzYq7tTCxVnOd2vx2s
 T6vdiSWerRHydDN+nAXtrg7NUMMiBd2Uc5c6Ft4anikzUyFeFLKk00WG76E+U7s4it4t
 PmYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YXSoBYeH
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.9
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
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3508cbb14..2946b991a 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41e82d81d2fc9449028dab31fd460df1da29130bcb7388222842e778cf34625c  open62541-v1.3.8-br1.tar.gz
+sha256  8ca1f20dba4fc103893d74d29e41c336ab67a1725512b03eaaf6060658525b43  open62541-v1.3.9-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 16ef51ed3..17abd4a37 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.8
+OPEN62541_VERSION = v1.3.9
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
