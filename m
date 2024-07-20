Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D0C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 15:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 107EC403E7;
	Sat, 20 Jul 2024 15:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guCkH6yWpneb; Sat, 20 Jul 2024 15:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999BF4042B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999BF4042B;
	Sat, 20 Jul 2024 15:31:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA3A1BF30B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 15:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 696854042B
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 15:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54Y6UxD5uyoQ for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 15:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C68A4403E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68A4403E7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C68A4403E7
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 15:31:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36844375001so1348484f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 08:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721489476; x=1722094276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJ75Iw6lNFKPWtq6Z0soNRcO7+45cYdiWpFGczB73Rk=;
 b=LHfzKJpFgGMmlIpdklZJPBmpjBk7Fyxc2E4LibMeaQQZ/mRsZ36teFqfa7K4G9mvge
 xJbZdT+aXQUwoanT7MuIs7vhI8G3CgW6DsvjBwKOGDqgvP+Zx0qcc1+U4mxtJmF0vD3o
 trExFl4CjRtu0GDoo6+lt3iWepkMh2jdWBojcHW1Rnn1uBXXUvhNZe+g5Gm3mm+05BP/
 we0zEVOiEXU304cTVoW4v589TM6it9IhC2f/MtCK9BI1v8FuzjPvLbwAgWBPkOsw7PJt
 7nEPIf3E3QUrxyICkV8SLLmkj3D3qw98xkIDCHPINQ65ul/06lS83MouspZ6JgRS32q1
 slCQ==
X-Gm-Message-State: AOJu0YwfWH0PbNTVEDBoATNcJtmMU1acaLyWf6VNx3gDfhNt+gqoItdh
 G7qgwe9gk8+/kkTgtcprTY6JRlT4T3PBWadaG2MFzaI67BI5eETYjPtnZA==
X-Google-Smtp-Source: AGHT+IFYJv3lbHu4GsE3m5HRhlD9ra/EPdb4KpXJXgr0HnTUUFRXu1o9MtRAFYCkmV1sum6uw/KelQ==
X-Received: by 2002:adf:f246:0:b0:368:65a0:a423 with SMTP id
 ffacd0b85a97d-369bae3f964mr1303560f8f.27.1721489476032; 
 Sat, 20 Jul 2024 08:31:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878695a52sm4150918f8f.64.2024.07.20.08.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 08:31:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 17:31:13 +0200
Message-ID: <20240720153113.1371411-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721489476; x=1722094276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cJ75Iw6lNFKPWtq6Z0soNRcO7+45cYdiWpFGczB73Rk=;
 b=bT4UlJMEWk8xqOyx4FNj/3h3uqhOswmyvRnlVH/waF0Ij0BUfaq29j6RNNLMQqZobB
 kndX2QZMNhVtYJdyvu9dcvljFmO9DwxfQyhBm74rbEsbg6tJhu/46HhtW1iFiNYvJume
 h1jXEFBIq2K5fswrL9voWR7PKdFx+gAbSB4UgdKAI/IQAdMEnDBNHtzU1utjZwDSWhRy
 DWwueYL04Iy2OT0eZ7nGsBHBnU9Okbzu0ncruH2mRuAU2PU9CTTIvQt5eQ5yoBENhLUO
 WZezQrWMhWZcxVUE35aY+33JcsXxlbovOKMB9SelBDj2R+5aTfL+qD73FQqYmgnUjDTv
 lCcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bT4UlJME
Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix patch fuzz
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix patch fuzz to avoid the following build failure raised since commit
8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:

Applying 0002-fix-build-with-libressl-3.5.0.patch using patch:
patching file include/zbxcomms.h
Hunk #1 succeeded at 210 (offset -43 lines).
patching file src/libs/zbxcomms/tls.c
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- saving rejects to file src/libs/zbxcomms/tls.c.rej

While at it, also fix Upstream tags

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
 - http://autobuild.buildroot.org/results/75dfe12312b5479669fcdfea623d93880c675e13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                       | 2 --
 .../0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch     | 2 +-
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch   | 8 ++++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f0fa13eb4f..6d51e80b99 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1478,8 +1478,6 @@ package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch lib_patch.Ups
 package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch lib_patch.Upstream
 package/ympd/0001-only-c-language.patch lib_patch.Upstream
 package/ympd/0002-added-forward-declarations.patch lib_patch.Upstream
-package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch lib_patch.Upstream
-package/zabbix/0002-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/zic/0001-remove-dependency-check-on-version-file.patch lib_patch.Upstream
 package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch lib_patch.Upstream
 package/zip/0002-configure-Don-t-use-host-CPP.patch lib_patch.Upstream
diff --git a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
index ffb1f54ba2..6c742b0d0a 100644
--- a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
+++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zabbix/zabbix/pull/61]
+Upstream: https://github.com/zabbix/zabbix/pull/61
 ---
  m4/netsnmp.m4 | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
index acb5cfc9a6..ad6960f329 100644
--- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -30,7 +30,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent (no feedback on first patch)]
+Upstream: not sent (no feedback on first patch)
 ---
  include/zbxcomms.h      | 3 ++-
  src/libs/zbxcomms/tls.c | 5 +++--
@@ -54,9 +54,9 @@ diff --git a/src/libs/zbxcomms/tls.c b/src/libs/zbxcomms/tls.c
 index 54ab0a6ef4..bd4075b3e4 100644
 --- a/src/libs/zbxcomms/tls.c
 +++ b/src/libs/zbxcomms/tls.c
-@@ -30,8 +30,9 @@
- #include "zbxstr.h"
- #include "zbxtime.h"
+@@ -28,8 +28,9 @@
+ #include "log.h"
+ #include "zbxcrypto.h"
  
 -#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
 -/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
