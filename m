Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3A0C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A6A405EC;
	Wed, 17 Apr 2024 08:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGrIVN0jGm3F; Wed, 17 Apr 2024 08:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB073405F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB073405F7;
	Wed, 17 Apr 2024 08:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C46761BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B066560AF3
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zmsz_mtJRXwV for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41C7460AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C7460AEE
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41C7460AEE
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:20 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so6856524e87.1
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341178; x=1713945978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=64HZOsOjo4c3gvZOUkU6Skq7TW7vCyRnm7Rc7gX0ZMY=;
 b=dlMECIs4SdDhPRnRULrqvymIk5UAki4tqwIATLcnjnW7UH6uCrr2xnv5Dlugt/04zN
 qVOmZQ4tO46BinHMMwN7Z9t6OUV5jzWAM8b0EEk/3uTM2MQeT0s4W9oe2bKQV17fYN1Y
 lAgXUrbYlhbA0MReTqK3yHIbM2Hf7oN8XAx/Gk6FJxpvEYL5sFBIXUZ9d/5oNhbERNqP
 vTZvECxNK6bNyhQozbO4hWA5zb5MfRhttb1cue5XMYFYzkx99bR5dPS9zliC/wZ8EvBx
 8Qy2muTWlrRwNOeZODEakUbXHBMgsLNwcveqNhV5xpon+K8BCVTwLgIP4FFwf1s08tan
 tIdA==
X-Gm-Message-State: AOJu0YyrI1HKNRe/Mp/FTYKXAx88i0j5nONHsKrqPD9YBnOd0/g3wa9/
 +aXPSTHnHS1wjdIGcjuvo2XlyON0Qq5BDylAA3l/g7agvDdvIQK6NE3ql2GH
X-Google-Smtp-Source: AGHT+IG5O0Z6256z+DzayNUkdW2sqsdRClyQ3OgntYbCZZJjm/QoTJ87Oxga0FqSWGi4MtNk8a3yew==
X-Received: by 2002:a2e:9818:0:b0:2da:bbb5:283b with SMTP id
 a24-20020a2e9818000000b002dabbb5283bmr3485008ljj.35.1713341177635; 
 Wed, 17 Apr 2024 01:06:17 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:17 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:22 +0200
Message-ID: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341178; x=1713945978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=64HZOsOjo4c3gvZOUkU6Skq7TW7vCyRnm7Rc7gX0ZMY=;
 b=cYnyza0UfHkcYctMttU3RdZcDKPStvo8nE+Q8qrGRPTnpojo1Rj3cE3S5fCsLm2oOx
 pM06UiZtQGe+nRf5qQuU2bwk6Aa84ZXpntvU/Po8+YiThGOUaMtUCKfPYWPeQrxjVdte
 JpjuWruEJSID7J+331aKbOskQpLdLWW9FSbFQRFfX0qZqzydEO0hUHv7Pb1rewGA/qNT
 0owlgxsQTX5uXgdM+jlOIGtBaX6fMUGbKGjOEsnNo/XUDXv2Nm9NvQlmZRUA2m2H7Qai
 g5Blv2bgZVAo2DNvxNCGNQ1L4ohw5O72JcCXZPLkWPfZ/Uwe+7WcVSGN3EkhHEwb2SZF
 3c/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cYnyza0U
Subject: [Buildroot] [PATCH v2 01/11] package/qt6: bump version to 6.7.0
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1], [2], [3], [4], [5], [6], [7], [8] and [9].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
[3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
[4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md

[5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
[6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
[7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
[8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md

[9] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6.mk                             | 4 ++--
 package/qt6/qt6base/qt6base.hash               | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash     | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash   | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                 | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 1edb252c96..b87cb6748d 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.7
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index cb111bd405..0f45826a45 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60  qtbase-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256
+sha256  11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a40233b8b254  qtbase-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 0735df3af2..1eb0b5b460 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256
+sha256  9d49d4fd8345d8a40b63e0b65cd49c1d8286e33a7f1409bf1316763f654e19f5  qt5compat-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 98c8931962..17d5090076 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
-sha256  b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366  qtserialbus-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256
+sha256  498193a9860664f8a55f676656c45af179ac13d48184af43fc58ddf795bb76dd  qtserialbus-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9341978d86..cd51fbe435 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de  qtserialport-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256
+sha256  b1f02a3d8c9cc8ba2ffa7cca3749f1f147d327e8dfc633fd4ec3cb770d7981c9  qtserialport-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index bb239cb012..32c1a79a5c 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
-sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256
+sha256  1518f40e08ff5e6153a6e26e5b95b033413ac143b70795dc1317e7f73ebf922d  qtsvg-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
