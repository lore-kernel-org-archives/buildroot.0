Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D023EE728C5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C45640012;
	Fri, 29 Sep 2023 16:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C45640012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3FLLqDmKmqb; Fri, 29 Sep 2023 16:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 247214051F;
	Fri, 29 Sep 2023 16:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 247214051F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 961F21BF27E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C66460BD0
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C66460BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPJtv_lu7w0r for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 16:12:17 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3257560ADD
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 16:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3257560ADD
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4053c6f0db8so138029005e9.3
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 09:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696003935; x=1696608735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78oUQbE6UGeCN6D6KA+8BQVojTO4tgvj9ln1MeVj/1Y=;
 b=cc9FaOqNog9Fp++k41VWH4xPXNKHelZHRlcQKDqD29bfI0YmDxj+ld3m2MOssMF1UK
 dCXiDsaovilb8Jhc7uk9/iN+6/1+Euch4jMDH7sGNrkrWKK+xCl/aTcxEEdKcObaUmtF
 CoambJrUfg83MwieFeduqRw4HB9NCyHCvgKzPREOtkNvmzF7Ded+QDE2SyOyuAuGR94Z
 cxpmbmkKVL1K8/evKSR8xpi9Vc54GB+JxSMHCm90VVhmOyB8iIKMQRpzlIr4v8uXOGKE
 u/PXA79L1YBD7n+H/YHNR36x3IQuWLmliBPxUWnCW9xaJlWrTaqQWANBe2BWMcMhO/pz
 DSZw==
X-Gm-Message-State: AOJu0Yz70aPQKr3Dd1dEtbUmAaGAFtmvuF5Cwy+qzNB5Ebml7IHVm4vq
 +lXhDjb8aBKQgCsY6ViFiF32tmoRFNs=
X-Google-Smtp-Source: AGHT+IHI+nFOM7zQJ0HW07HGC4zO3DMJeNMy0sHYZz+TdwS/pA4x77uDQN/+K0Aelr2pAIPCNHGy3w==
X-Received: by 2002:a7b:c410:0:b0:403:bb04:2908 with SMTP id
 k16-20020a7bc410000000b00403bb042908mr4014588wmi.23.1696003934377; 
 Fri, 29 Sep 2023 09:12:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003fc02e8ea68sm1711391wmk.13.2023.09.29.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 09:12:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 18:12:07 +0200
Message-Id: <20230929161208.1106775-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696003935; x=1696608735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=78oUQbE6UGeCN6D6KA+8BQVojTO4tgvj9ln1MeVj/1Y=;
 b=GBgZD16DAjKn5jEZ3imZKQtZ8TYUM5OsnZE8SyjPbb5tgnHZ6JZGusbY07da02X36v
 Cq/IXYuDk+SBlC4dslyp6ds0ycv8v4phXUmK0tVoaXC5Z1gT1y933J8MKc3OBOdJqojq
 I6AlHmeAPTgOrjwhBQY4783mWbuocYqPrS+3fZTBUgKHe1GPeFSlG+1m/onTmD+fh6ix
 b8AlVqeQI2IrzLEKnTyPgAZgqCqxXMBHSTsWdhzcpURu5IIvzpbIdindT6FpdSrUwo0e
 cLHUCVxXN3Xyqu4QnMccotSn+GkYBDvn9I6ZO+8QALWw+FRVexjf8+3TFy081oD3hQbG
 d5iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GBgZD16D
Subject: [Buildroot] [PATCH 1/2] package/powertop: picutils is optional,
 not mandatory
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
Cc: Steven Noonan <steven@uplinklabs.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pciutils is optional, not mandatory since version 2.1 and the addition
of the package in commit 0adc0e24eed72efca0097c7567319f07b8af6d94 and
https://github.com/fenrus75/powertop/commit/98ca605e7cf856795facc4a3a4f9c5b9baf1cab1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/powertop/Config.in   | 1 -
 package/powertop/powertop.mk | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index 0f323a7bfb..fd88a3d0eb 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_POWERTOP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBNL
 	help
 	  A tool to diagnose issues with power consumption and power
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index c3e8d2549c..681f5fda46 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -6,7 +6,8 @@
 
 POWERTOP_VERSION = 2.13
 POWERTOP_SITE = https://01.org/sites/default/files/downloads
-POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
+POWERTOP_DEPENDENCIES = ncurses libnl host-pkgconf \
+	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
 	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
