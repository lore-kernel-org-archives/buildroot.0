Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B47BC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D81D400F1;
	Sat, 24 Feb 2024 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvAJJBGxtiyC; Sat, 24 Feb 2024 21:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFCD40204
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFFCD40204;
	Sat, 24 Feb 2024 21:30:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDD471BF471
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB4FE606D0
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X17XzMW9p067 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 21:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90A4360621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A4360621
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90A4360621
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 21:30:18 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d1094b5568so18643951fa.1
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708810215; x=1709415015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNivIVNZMCuU713S0DlxfaJxAJ0GOZDULgtjqTUhf5E=;
 b=wb8pBHKuEPD+aN5T6I94iOhtVyX0yzpTcLt5DcLcOymXHKH0DEBUeUtfrAKp/WFqDi
 NAlCZmjAxjOaVMONY86mZbeGVRh7rq/RjSEc7EYepj1wv30j48LXeev0ul6sqewBWvOE
 OsLpXkOaejUg9GGlhsNFjGnRxByIE3VOcumTp27A7C+Q88TN2Fz2LfmJZElo6COGRW0j
 qtGj+jVXMXCcGQ6CYVrNkH81NbUa3RLZG7KW+mjNLXGQpdaswYuSTdVpla7Zv/8IoaAB
 HNsYg8IjOVbeRKpTs4yal+RjX0UCLxa+s7Oyfq1fA+DdktOSIdaUFysm40+FhCMM8VZt
 3fYg==
X-Gm-Message-State: AOJu0YydwmIkRNrnIi88Oix/pcFtwFUaKbJ7ehbf0t9o5kgBAUSbc2Cm
 9lJTFDJrY0/e7ePZSoymJipEfCCn0faH8SounKrjaXrX5Yeef9m6JsItAqS9
X-Google-Smtp-Source: AGHT+IH2d6aZhcgystmuc1AgcEQri/WrpGBYYBVIAc8XYuU7gqjT0aoxIRl4vgQpBy9JL9jhOQY+Uw==
X-Received: by 2002:a2e:9e4b:0:b0:2d2:642c:62d8 with SMTP id
 g11-20020a2e9e4b000000b002d2642c62d8mr1658539ljk.5.1708810215342; 
 Sat, 24 Feb 2024 13:30:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b00412988cbcd0sm3350177wms.36.2024.02.24.13.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 13:30:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 22:30:08 +0100
Message-ID: <20240224213008.670294-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708810215; x=1709415015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TNivIVNZMCuU713S0DlxfaJxAJ0GOZDULgtjqTUhf5E=;
 b=ZXDxBUiEMvYU4Afzk6zSwbmuLpK/CxOgDDlLijgVKUzUkeDsd1hDfRMy1sleiiESnP
 UJjYtTn2uvHfYcS/Zk78le3WHg4RMTmsSTiOB+i/naSrXRMAJYkUrnzQ8zHf5S2sVzOq
 D6Ne2GEVG/GKss2IMBV96njKA2PNrhpTzT8t0IzbTFisOYAoZjrwqkERXdV0KIA7oaQK
 ZtOkDFpQVI/JQetwirY/RdSGQ92mEc21hbZ1GT00t6uiBrFIE6T2uJE7eHLa83Hfc50J
 GWJCZrvCez1dnABF9lw2bK9k6UYm8RU4T9cUcATMwo1xUgKjhKAdVMd1qqcebIz6beCZ
 Gtjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZXDxBUiE
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix linux-pam select
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb forgot to handle
linux-pam dependencies resulting in the following build failure:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
  Depends on [n]: BR2_ENABLE_LOCALE [=n] && BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
  Selected by [y]:
  - BR2_PACKAGE_OPENSSH [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
  Depends on [n]: BR2_ENABLE_LOCALE [=n] && BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
  Selected by [y]:
  - BR2_PACKAGE_OPENSSH [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION [=y]

[...]

configure: error: in `/home/autobuild/autobuild/instance-12/output-1/build/linux-pam-1.6.0':
configure: error: failed to find dlopen

Fixes: 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb
 - http://autobuild.buildroot.org/results/c0aac8bed08850e07cb94f501d754c3c64cdfe07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index a3038ba01f..c108569547 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
+	select BR2_PACKAGE_LINUX_PAM if \
+		BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION && \
+		BR2_ENABLE_LOCALE && BR2_USE_WCHAR && \
+		!BR2_STATIC_LIBS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
