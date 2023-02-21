Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E5C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A7282EB5;
	Tue, 21 Feb 2023 13:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A7282EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNbJchhLxch4; Tue, 21 Feb 2023 13:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA4482E29;
	Tue, 21 Feb 2023 13:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA4482E29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172A61BF45A
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F293F82E29
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F293F82E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXHxCL0esrlo for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6F782DD9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA6F782DD9
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:00:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3462393wms.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 05:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KI6FkbTALVm7AkTanGD0OtdSliLPYZOdFhsk1jyfd90=;
 b=fpLjR5WRRRUAmYq8G7Zpq0IyhBg/iw6snkhMpSGhqkc7vW+aZaViUZAAu+7ifEQK8c
 vIZ4j55SqFL7HeuaRA2wClp6gJsPEwak3b9D3Mq6/mjhOApxtPZknA84RTeUv4aQcR3P
 5LqiR7rFMAzNo0C3yY5a5X/Blg51RKCggt8Tpo0wM2asbCp3NL+3sm24Sib84cMatOyr
 mLEgTI+dUi1LwQXhv4Ln4oZRvgNx7zpKLYBQZE90ce8wSIRFeAuGo45YbeHp8XZN58PJ
 jdQvuu8/6pWgEWbhuQLnVI8DI0s/92j0n39iI+OV1jZ+pL25yEZ0Bc/sXjlOrv1i4BpW
 AFsQ==
X-Gm-Message-State: AO0yUKUkilDxwoX62UZsyPpUireY194on+N0iyZeK04IR6wlz+V5BeFo
 ucOrz/8fWTEMShbj9PpSJ2r+0HbBfcI=
X-Google-Smtp-Source: AK7set/PEV5oT/vgyZqrMLHQemv2FE0gUd5ThV4wTOQKi/tHwWlHXcK8eV6YKXHuHfqseKnhCGFsWQ==
X-Received: by 2002:a05:600c:a692:b0:3db:3476:6f02 with SMTP id
 ip18-20020a05600ca69200b003db34766f02mr3455953wmb.41.1676984443204; 
 Tue, 21 Feb 2023 05:00:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc858000000b003e11ad0750csm1811470wml.47.2023.02.21.05.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:00:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:00:40 +0100
Message-Id: <20230221130040.868693-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KI6FkbTALVm7AkTanGD0OtdSliLPYZOdFhsk1jyfd90=;
 b=YgBMIhyCnJsxY5sqTMFwCRogxeqhTODyF/wjniiJ/RGxyUv9ltpbLt2AKMzS1C1cuj
 pZ/QrSz0OhFYUHlAEjy5R6DBnRYf+22Cj+bABvP++hmaahDnoQWXDaPN8dN5TZ9hGBK4
 Cmst4SJS6x4kbK4vvsHxhiIjUBwEeLNKWYKHTaUpyveWPoomeL2Ntv+IgBTfZNzLPJAR
 9NGds/4hBBJ/aZtFxbQTefOd/WChtPo7068JvWZN422so2cjnU3nR42vEWwgmQmhCWzt
 MdID4X/ZYzxQ1DRwQP5wPTJJukMIYG3b8wijV1uwDy0Utpne8aLrxmcmgslpc5ukhYi7
 idWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YgBMIhyC
Subject: [Buildroot] [PATCH 1/1] package/network-manager: fix build with
 -Dmodem_manager=false
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

Fix the following build failure with -Dmodem_manager=false raised since
commit c36f6938858d3246ca493dacc925717586e2ea0f:

../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".

Fixes:
 - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...build-failure-with-Dmodem_manager-fa.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch

diff --git a/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
new file mode 100644
index 0000000000..648be027e0
--- /dev/null
+++ b/package/network-manager/0002-meson.build-fix-build-failure-with-Dmodem_manager-fa.patch
@@ -0,0 +1,38 @@
+From 736a2c356c1c4871e8c4e70be622c65c87d3bca8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Feb 2023 13:03:00 +0100
+Subject: [PATCH] meson.build: fix build failure with -Dmodem_manager=false
+
+Fix the following build failure with -Dmodem_manager=false raised since
+https://gitlab.freedesktop.org/ffontaine/NetworkManager/-/commit/03ba04d4784fa4fc7ec31455070fb5ecf25ade23:
+
+../output-1/build/network-manager-1.40.10/meson.build:1060:0: ERROR: Unknown variable "mobile_broadband_provider_info_database".
+
+Fixes:
+ - http://autobuild.buildroot.org/results/896879c8e8ce022556ee834216ced2f962ff279c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1544]
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 84ce52c736..b79240efc0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1057,7 +1057,9 @@ output += '  jansson: ' + jansson_msg + '\n'
+ output += '  iptables: ' + config_h.get('IPTABLES_PATH') + '\n'
+ output += '  nft: ' + config_h.get('NFT_PATH') + '\n'
+ output += '  modemmanager-1: ' + enable_modem_manager.to_string() + '\n'
+-output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
++if enable_modem_manager
++  output += '  mobile-broadband-provider-info-database: ' + mobile_broadband_provider_info_database + '\n'
++endif
+ output += '  ofono: ' + enable_ofono.to_string() + '\n'
+ output += '  concheck: ' + enable_concheck.to_string() + '\n'
+ output += '  libteamdctl: ' + enable_teamdctl.to_string() + '\n'
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
