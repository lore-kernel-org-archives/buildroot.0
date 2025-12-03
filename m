Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795BD15DB6
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 17:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E59461717;
	Wed,  3 Dec 2025 17:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXoxa2uJK-fk; Wed,  3 Dec 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C4A616E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764781223;
	bh=DwS99kjb/P3djaO3Fw/sy0nzmsC72mVKUpH93My3GQ4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q1MOvBbB4NiIYoLfmFYPxRdAh8uN2eXVAO6MYm26eUeaV/0tOAE+HneNbPS78jOMT
	 PPKDV1z0+mHqyRe4ZBFdAuU5F1RIzLuZReBi2WtjBSfdjDs3UDHSIflePA4n2SrQD8
	 ZE40eHev/gus8QEgkzURxhIVJdSi+zM1byQ7FHFvEuA7F3mQ/L94MM53WezYUz2YXz
	 8ssz5jn4paD5RFOOkutQAZh0g3Mz7TEhP3ahVkhVGZvYBZxcwehK8hzurZGoQRiZG6
	 RmmgTnhq6+p489sAOKrRUuQbJaWK1eNCtBGDlnwgySpn3t4LK5upNlmjT4LQVlP4/k
	 tYtlvqarswHgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C4A616E6;
	Wed,  3 Dec 2025 17:00:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0303CE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFB4483D20
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvOjvCeOIhwn for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 17:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8184C83CF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8184C83CF7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8184C83CF7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 17:00:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C42CA4C77FE
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:00:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37270)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQqCw-0000000084Q-1r1m
 for buildroot@buildroot.org; Wed, 03 Dec 2025 17:00:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 18:00:02 +0100
Message-ID: <20251203170002.1768608-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764781203;
 bh=D34oLPvsT5Yzh8WEiiesKYZqhmq0U9O7/aVfj4Q2TB4=;
 h=From:To:Subject:Date:From;
 b=aeo0upN9fttVln1bNDJmXsW2wTMsCxJEQlxSqMztY8jPFwWKcskGuvw/o4OKl/GcW
 2hlaKQ0YBsqWciIqXnWzdolWc0cU5p2oW2QONYnwQE3zAU5P8tAEY67DqZYGbH7qFg
 T/F7cRhAUOfaOwZEjeQW6CFsgfT/K0sqE2NyaWKVXTtJQ43HqCEAYVqlbGsjjbSHJU
 bl2p+3z0msw+mi0Gi93POaUMwA5GLZ8IqsaXDQoFsh9jkCsgxZMqL6Fk8E9AR2owzK
 JBLa1tEMtDlh5zlfXSS30Z+eGbhYwyEWkK9t7aY1e8iZHYxM9WFcU9QbzBwioY07Rv
 WfQsPxovp4Vwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aeo0upN9
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.18-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes of this bugfix release:
https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.18-Omega

Removed patch 0001 which is included in this release:
https://github.com/xbmc/inputstream.adaptive/commit/a224dc66e93aa0d79152ef283cc7dd2207f7cf7d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-gcc-15.patch          | 31 -------------------
 .../kodi-inputstream-adaptive.hash            |  2 +-
 .../kodi-inputstream-adaptive.mk              |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch

diff --git a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
deleted file mode 100644
index 79daea00bc..0000000000
--- a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8ee42c56f1f5f959ce1c66ad4b33235a0b69c774 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 17 May 2025 12:19:09 +0200
-Subject: [PATCH] Fix build with gcc-15
-
-Upstream: not applicable
-
-The code which included uint16_t was removed in the to-be-released
-Piers branch:
-https://github.com/xbmc/inputstream.adaptive/commit/2afe7b8801d2da3059bfb2df0e5a6981fb9e46e9#diff-3dcaf13e4dbb2a79fa703382b7469e3c4ab1f0994928a5c0fca2627b8a9c8eac
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/common/AdaptiveUtils.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/AdaptiveUtils.h b/src/common/AdaptiveUtils.h
-index 7563cb86..89812532 100644
---- a/src/common/AdaptiveUtils.h
-+++ b/src/common/AdaptiveUtils.h
-@@ -13,6 +13,7 @@
- #include <memory>
- #include <string_view>
- #include <vector>
-+#include <cstdint>
- 
- // forwards
- class AP4_Movie;
--- 
-2.39.5
-
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index b3bbd1b06c..c2339a3d33 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f07c72cc0aa4b379a41c991adae7ccbb31ba5f94da13e986d84e53b67e332bdc  kodi-inputstream-adaptive-21.5.17-Omega.tar.gz
+sha256  a62ef86fc616c37ff7fa53ff7dfe2a73ee21f48af306a9f82c5bb5fe05245dad  kodi-inputstream-adaptive-21.5.18-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index a886960721..3e0ead12c9 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.17-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.18-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
