Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E76C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BDBC846C5;
	Thu, 30 Nov 2023 22:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BDBC846C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NFdV8Yt7X5n; Thu, 30 Nov 2023 22:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46AC846C6;
	Thu, 30 Nov 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46AC846C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8131BF355
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 876B06FA3B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876B06FA3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDa-8BJ5LHrO for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:11:12 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7374F6FA30
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7374F6FA30
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so990890f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 14:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701382270; x=1701987070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rMFYIDnxUBwwxTPIv4/rmX7WByfb8qSpP/vmAwUSO70=;
 b=H4eHp0wb2Oc1NiyBlsS3KThoq9k6Yza7u7GWVKCkoEZj2ihwTGTw+A2NU1Uc+7IGmb
 Wwu1eVbrLFLtdjCrMVnEI0wO95vKa7ph3kbZOp06HPqX06x/O4Ron6iLJmJl5hUaeIQ2
 Y1MOtMtw8fgUAG8PjjvaJxho3BLaSuz2Zqbn0J/EYIqxhsV89zgJtBb7OXLyB+2jDBgi
 z2kd35sUKc3P2rsJyoZWAb5T4hPDs0pJdEBxGCpMusvlQP0kE9h1FLG2ze6Ohz9c+Bm0
 ULKDlQQSMLgAZGWnF8CPQ+9UmEaA0cQBbK1moV9IdpJMVI4lMEohOiEtHtjgBCqS8n6i
 Jy0A==
X-Gm-Message-State: AOJu0YyskFMp/4OlifJyeHHEPS0B4//Z6XvxkR+Qro/90qXVK/iDRE7S
 6iNkkjB/GQqce73tTQS02C5xTLLfbSU=
X-Google-Smtp-Source: AGHT+IGrK8kVdeMFP+CXXG7XWZVknk6NaQX7FUCgCGrjaoDlyX+f0dpiwJ46dLOwkRu6B7KWvatw8A==
X-Received: by 2002:adf:ee52:0:b0:333:a20:f824 with SMTP id
 w18-20020adfee52000000b003330a20f824mr108973wro.17.1701382269720; 
 Thu, 30 Nov 2023 14:11:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6a49000000b0033172f984eesm2562903wrw.50.2023.11.30.14.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 14:11:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:11:01 +0100
Message-ID: <20231130221101.314097-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701382270; x=1701987070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rMFYIDnxUBwwxTPIv4/rmX7WByfb8qSpP/vmAwUSO70=;
 b=GXqY0BjtLtrf5Mm+7wfgB8aus5aOA2/ylaygEAwxGi50OOZ+TEdXhDLj29gQImTt6h
 1rXyY7CNZW80IcoipGI31qLRhjKXFjtpp+zE+ufEZtz6jyi/5AfcuT1+p1/48RzR0CYp
 SLWhBc0nt5GnN3i7C/Ntiv1UgXINXRPR6MyGdLDBRjQ/O8Ark9pMv+0KSV2c6IUdKX1Z
 kMAZ7pCMtU1q5vv2sDBrIN02kz4yRxR4PC2/uncrvZ2WDSPiQB+PRGcqjVKKoA+5Sbrb
 a3UGHsqejCvdz3KhQHk2WRzL4onuwwu7ib/K3jOc6rATzqgciAJ21HzD6MkWue1WZ0yh
 BZGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GXqY0Bjt
Subject: [Buildroot] [PATCH 1/1] package/monit: fix openssl static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--with-ssl-dir will exclusively search for dynamic library so use
--with-ssl-static to fix the following openssl static build failure
raised since bump to version 5.33.0 in commit
8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

checking for static SSL support... disabled
checking for SSL support... enabled
checking for SSL include directory... /home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/include
checking for SSL library directory... /lib64

[...]

mipsel-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/lib64'

Fixes:
 - http://autobuild.buildroot.org/results/4189decbafb5d28c11d89ddac792b4610abeaff1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 4766ce3d9e..f3e16a3e4f 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -27,7 +27,12 @@ MONIT_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
-MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
+MONIT_CONF_OPTS += --with-ssl
+ifeq ($(BR2_STATIC_LIBS),y)
+MONIT_CONF_OPTS += --with-ssl-static=$(STAGING_DIR)/usr
+else
+MONIT_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
+endif
 MONIT_DEPENDENCIES += host-pkgconf openssl
 else
 MONIT_CONF_OPTS += --without-ssl
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
