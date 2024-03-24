Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3518BC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 12:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7A781E9D;
	Sun, 24 Mar 2024 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXSaAriTw9uQ; Sun, 24 Mar 2024 12:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E03818CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E03818CA;
	Sun, 24 Mar 2024 12:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824411BF574
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661D3405F9
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMIcRh_EKhXI for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 12:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13934405F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13934405F3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13934405F3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 12:32:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4148849e542so821705e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 05:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711283522; x=1711888322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uQQv3/wgMHLVuvQd4koUkgkuRsDXo8tZr3hTHtT07go=;
 b=AunC42I4jnAzfy6z7AG8Ws/0p8b4o8p6LSDi6OSBwLflS/sH6vmRVJUcRVX75Beex9
 I066CL+H4buDe1zQkkArdiahsdMQmV4ppgmyvgXfpcods3GsoV+DyFqvKpQkJVvx7GQL
 JHGSwye7/pLAt1TPyMubvYEF/VMNeAMgdXKsB3AOzKNcr5cjEaYccdm2FrYOFAQJ4eF8
 DxSA2VHkPX8AgpQZxTWkdOZ+YhPO0n6anKhcMpQUG2hFtNP1G8rbDlBG2Fixyhgj2Evm
 R4mahbb65IgdZRC4XL8WlbZEeudkjUWG1QpdqQnxMQmE5NaA+o3OmhpytQNx27qP3saA
 QLGw==
X-Gm-Message-State: AOJu0Yxbm+FVX5gtnh+IgrNnxzoZa8rNtZ8/oxchATE+e/LGGU7I4cBC
 BiFU6ltFFi8+D47Mvt0d4AQvtv16I+S2KvtUJe3PoEqMYiOjoFBvg0ugTNCv
X-Google-Smtp-Source: AGHT+IFXyD19DsbKRr2MU39MIoBZ/TcC9bS0/hcQ2m8toLNGKrmrTr3DP0UwmEtvWWWGsgVPC+4X8A==
X-Received: by 2002:a7b:c416:0:b0:414:a17:b5fb with SMTP id
 k22-20020a7bc416000000b004140a17b5fbmr2963184wmi.38.1711283521776; 
 Sun, 24 Mar 2024 05:32:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b00414854cd257sm3015896wmo.20.2024.03.24.05.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 05:32:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 13:31:59 +0100
Message-ID: <20240324123159.527191-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711283522; x=1711888322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uQQv3/wgMHLVuvQd4koUkgkuRsDXo8tZr3hTHtT07go=;
 b=g9rpwjcv8IIRyOS6KHFr/Z1SDkHvZdRt/SnRYykGDokxZGBuFFP7y0YY2laIPSzdkD
 Q/MVkGk0iQGw4DpYo5nPoAUY6qSeRM6UYa5JiEN/rkLEM8xqtkecSmuu6sCMdzLHztCy
 dTibJKHx3nS+FyQ3/lcabIri6u7bivD6aWc+R+2yQi11L/Gbhcmh0Q8XQiL6V0Mqujit
 XVEyBeGWVPkht+7Wnbgh3lkcAZpqSjoilJCUYhM+Snivi96V0mXvj/iQMR/ScMqThWpp
 Xf4+jXbNMTQra1cDid5ta4v65IotA7Un8micUc/dUCIZpYuJ1vPpiXP6SaYjWuqpgkMl
 CIWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g9rpwjcv
Subject: [Buildroot] [PATCH 1/1] package/neon: drop unrecognized rpath option
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

rpath is an unrecognized option since the addition of the package in
commit 59a9c02e1355bcd630a207e8be319a044597ad1d

Fixes: 59a9c02e1355bcd630a207e8be319a044597ad1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 96ee608780..93870b9966 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -10,7 +10,7 @@ NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
-NEON_CONF_OPTS = --without-gssapi --disable-rpath
+NEON_CONF_OPTS = --without-gssapi
 NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
