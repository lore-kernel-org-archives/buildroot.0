Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56481C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 09:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01BF84057E;
	Mon, 20 Dec 2021 09:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3e1kjHMlI-9; Mon, 20 Dec 2021 09:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 100DB401D5;
	Mon, 20 Dec 2021 09:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB571BF3F6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B8160C1B
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Rgfgz6sUJ1x for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 09:38:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E62F960C1D
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 09:38:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v7so11462902wrv.12
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6q0gsRMwrCuGrn7sOHhQ8ZCQ/CNR+OmjNyezG9tqhI=;
 b=Awj1u0rtu55QcfW+Wo3JEL1VPc675KPIBMM+hfYlfse+GRe71b8SkxN9aHVDGO/pnJ
 4XCU0TUswFeEjrJo84mv75t11ELMHwG+9PVG+vfHfJW0X+EcJhXlGbZeuZbVw8Djrpwx
 oJ6UTzbVOSrRPQShvhdtOWHIYVcLY/5kpe+gNaBLbglAtEs2XVlpTiEgWrlFocZsDRRB
 karoEz+9Y0NPHwjQXf7Q8MHvVKWHynQdt3osGD+johQMIJ9bS8rvSV5OOnQcIeZj6MKO
 bmsMWNuHHlLGHiBbKSH9htBr6apmnBPq3PSu7nVreOU9mYDOEGZgDXGF/6CSVFv9hTnx
 j0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6q0gsRMwrCuGrn7sOHhQ8ZCQ/CNR+OmjNyezG9tqhI=;
 b=N9E9PFHp5GHHKmqhPHNy5NyRy7SLsXGQagAPzt0YI0yyPP2HpgmrLD7OjOtwBoe8el
 ui6ycm4HhJiyc4VgZW+FFPW2NsLHFlZjn/Pkbcm6lGpScfLt2ZDRRfIQCDCGqKG2Gc5p
 Ev4iYO7L0oxtqvA4L8wLW/EkCZb4q1M6LUysC3F14rnDSzim2tdTk8MUTHatPCOxMKLT
 /Gn9ma8ezMQ0/RHYGePej00wchoqK5+bjJTs3+/L4uXRHHsxojrOHqG+GR2Vu5w9OSTD
 dxqtQQLGiWBjDi8scGAH39Dze+YgQwem/bQqb/zp/mEEIIp3rmlyNkaSysqRiMVeoSDs
 Ji1g==
X-Gm-Message-State: AOAM530j4KHrVJJ+4+hyVHpaLoMgCQshFF0JLK3dW98dNXwISdseXoAw
 5vonlnpDW8EyTp7dXXrImeMj7E7EuI/yHw==
X-Google-Smtp-Source: ABdhPJzE7qLDB19IQPOw9fGK4RbGhv9SmXSE8zFdOHOMTcF+XctBK5Z6+Fu8MVPj23yL5SeF6Yrz0w==
X-Received: by 2002:a05:6000:3c1:: with SMTP id
 b1mr7218206wrg.394.1639993106018; 
 Mon, 20 Dec 2021 01:38:26 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id i12sm5645303wrp.96.2021.12.20.01.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:38:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 10:37:50 +0100
Message-Id: <20211220093750.1930337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: bump to version 21.12
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

https://github.com/merbanan/rtl_433/releases/tag/21.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtl_433/rtl_433.hash | 2 +-
 package/rtl_433/rtl_433.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 9ace444b78..fd479dfd21 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d8b87535b4e65264018771b6b288259d81137482fc938d01e0c03ac071c03bd5  rtl_433-21.05.tar.gz
+sha256  b362ef3410adec64aee7ad8e6d4d74875f1b3d59ef6fb4856e96adc03876dc65  rtl_433-21.12.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index df00c09518..a5139ddae6 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 21.05
+RTL_433_VERSION = 21.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
