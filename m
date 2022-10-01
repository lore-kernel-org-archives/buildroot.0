Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7E4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08C841638;
	Sat,  1 Oct 2022 21:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08C841638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALiJtVwDwl2Z; Sat,  1 Oct 2022 21:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77131415FF;
	Sat,  1 Oct 2022 21:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77131415FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55541BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 907D4832E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907D4832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPkP1y37-KMl for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A538329D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A538329D
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:29:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bq9so11708841wrb.4
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 14:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zyDtvOX/5UvmkXBXT4wlGXuJo9zFDH6xVFkg1y8uTU8=;
 b=2LAly1ziYlMQN17SgPbjs/akEACRr0exWMmYFtAi90CIRJmgPVZ3bW2R5C9Zd85NVo
 ZAtWWG5aq32sTT1TiMePmIOg5jGUoGRpvC3Ow8ikLzslv1y3pRY+8KTmEJY0C5knXZv5
 SfFAUjYZS6SzA/M2RL91PiQNE/I9k7DzUimX8z+vnCIM+LpZdBec2NldHmdKgdEe+ALp
 KbsSbCsgVHVzzfIc/FPeEgiRtuXXVcViDC/ZhprSOSDJsJttNCTlkBwzb0GNEYKfarn2
 o1W3w+nZnj0szq4gDfkWnX6/w/R2MePFDAKFKEIWCmkWRQqYTU1Qos83X97uCcEkZqqf
 12BA==
X-Gm-Message-State: ACrzQf2TIXm4O5cwo5Txc3Y+ym1ZjAqvfI95rnZ1FChn4RYRDwqqWLxe
 RibUzDln7KpqM476932HCzSd4RPn5tI=
X-Google-Smtp-Source: AMsMyM72INI0OJDB/DWmc6meK2Az6G4Zbba7szpogBNfNodqEL3TNq9ouV9BQ2t0Lbw/4G6I0/RQtA==
X-Received: by 2002:a5d:5221:0:b0:22e:3004:bb17 with SMTP id
 i1-20020a5d5221000000b0022e3004bb17mr2172697wra.352.1664659783183; 
 Sat, 01 Oct 2022 14:29:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003a5f4fccd4asm11942303wmb.35.2022.10.01.14.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 14:29:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Oct 2022 23:29:37 +0200
Message-Id: <20221001212938.25577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=zyDtvOX/5UvmkXBXT4wlGXuJo9zFDH6xVFkg1y8uTU8=;
 b=LDYOIJHBNEIQ3gsvkLfKmaoLVfAVy4N76wNTLxVVzg1GS9WYp6Vt9rZdooc/4NNcnD
 gh5tR84zQCSjrOGlFoR1ljtqIJI+8S+ICUwmvNvLJQZVfIimVnJVcYrmOTNVfVTjxIIz
 6pWsCC9Va+kh7xObp55p03Fkwa3IgGRiRaWmquLthj6of5vMZKRoiyzmFgxpvZCKgouI
 WVFF2cQfn4CKOw0DawzJHdecMJtyRhwaqSQY+jRIjfprklac0Diznje0eeMdmcWhM/Mo
 9iAvtpxebMPWZDydTp9U0dmw35IaV4TQFUBuGDzdMLB007XrsWqBZvV9y1Fn+7spoWPb
 22VQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LDYOIJHB
Subject: [Buildroot] [PATCH 1/1] package/xz: bump to version 5.2.7
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

Drop patch (already in version)

https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;h=0205423e79ce8297102096b0fc8b030ddf5b2023;hb=d24a57b7fc7e5e9267b84367cb0788d3acf7f569

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/xz.hash | 3 +--
 package/xz/xz.mk   | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 9577e98e80..3aa68791fd 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df  xz-5.2.5.tar.bz2
-sha256  98c6cb1042284fe704ec30083f3fc87364ce9ed2ea51f62bbb0ee9d3448717ec  xzgrep-ZDI-CAN-16587.patch
+sha256  b65f1d0c2708e57716f4dd2216989a73847ac6fdb4168ffceb155767e22b834b  xz-5.2.7.tar.bz2
 
 # Hash for license files
 sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index cdb01e06a9..004eea94b2 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.5
+XZ_VERSION = 5.2.7
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
@@ -13,10 +13,6 @@ XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
-XZ_PATCH = xzgrep-ZDI-CAN-16587.patch
-# xzgrep-ZDI-CAN-16587.patch
-XZ_IGNORE_CVES += CVE-2022-1271
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
