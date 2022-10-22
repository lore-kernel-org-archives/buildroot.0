Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D38C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FFE607B5;
	Sat, 22 Oct 2022 20:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FFE607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gz3wWH846BwJ; Sat, 22 Oct 2022 20:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B326079B;
	Sat, 22 Oct 2022 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B326079B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35AD41BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DB0A6079B
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB0A6079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BONtBwfrL4BZ for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:29:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B98560797
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B98560797
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:29:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so7266377wmr.2
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiZ5lMO35XsTQttnXuds2kAIx0A78FHRTV026r8WQug=;
 b=xjTGABHC3sRzDIUIgFW13sbhOlU24Wj57V/x2OlaYsryW+WL6pLsUmorGgLndWNutm
 aFCwIG02jZQwl3kQXbaCH4kEkuRYmheCKsISn1iW2FkPGb3MjaqXdb3kjaM8gllsmBEA
 8QnGTxOVX89x5V/7cxsuP/g3ZteCm+hNMnr/EzkbATzEduIL1xpezytr1hasAysUrY+A
 dZQQXV2J5dgwfBO4K/nQRSHmVC4zR7TYRuvqMpL00VPZgRGUC7EzogdPItC1l1ErH6h9
 SydlQXNv9bEWPOnlqb7RGTLAS1dgH/lEzdNY48HFrpHIZ5to5QL8zXpv6t4TgDSHuE3o
 ZA2A==
X-Gm-Message-State: ACrzQf3DMDu6PiqUdgIie8tcX0ZVjo3q+gjSZWXbe6CyV/HaRxbLPd01
 l6Q8gVD7HxQ01yOrKSZejUxEsJzncVs=
X-Google-Smtp-Source: AMsMyM7nTxwxOoVuAxGzPKz66MLgOS4oPK8qYh+d0iu0913oUHeSTQQ2LCmvXTBs3oHxbDtVd4nRJw==
X-Received: by 2002:a05:600c:1994:b0:3c9:a5e8:add6 with SMTP id
 t20-20020a05600c199400b003c9a5e8add6mr3145447wmq.110.1666470539704; 
 Sat, 22 Oct 2022 13:28:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 az24-20020a05600c601800b003c7087f6ca8sm6605864wmb.2.2022.10.22.13.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:28:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:28:57 +0200
Message-Id: <20221022202857.128289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiZ5lMO35XsTQttnXuds2kAIx0A78FHRTV026r8WQug=;
 b=iAzbPU5QebKNge/O/xfTYtUhIJxT3Ehfv83sEamQ5+403q8lrC1afeW/tYzq55XIfl
 0TuAgGyE5QZwdQINOsltSJYL6lV2SyeWGLVvz/FV9WwVkJn3Uuhh7viuGbdcZXTjVcpv
 jiMgW5rusW0aCpeSR/VVrRLaCgWa5fyDp94f2ASzTLc5xiyaPVrVR0xt3DJzYfD3AhJ8
 JUU+kMXdH55AXgeb0gDGbctLOp8M8V79ZVHwWoQmEIVLPDKbPreJpeLx8F0TN3enuQnE
 WH9kaSVZr8t/X4RTIi6+JpKqbdkdkV5IpLpGfDm87b8y0SWGuDdIPCop7wbQpIgXTwtq
 +cfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iAzbPU5Q
Subject: [Buildroot] [PATCH 1/1] package/usbguard: bump to version 1.1.2
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/USBGuard/usbguard/blob/usbguard-1.1.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.hash | 4 ++--
 package/usbguard/usbguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
index a69240b3f9..6c10dc9d3e 100644
--- a/package/usbguard/usbguard.hash
+++ b/package/usbguard/usbguard.hash
@@ -1,5 +1,5 @@
-# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.1/usbguard-1.1.1.tar.gz.sum
-sha256  460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432  usbguard-1.1.1.tar.gz
+# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.2/usbguard-1.1.2.tar.gz.sum
+sha256  dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934  usbguard-1.1.2.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 614b7d655d..ca539a55f5 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBGUARD_VERSION = 1.1.1
+USBGUARD_VERSION = 1.1.2
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
