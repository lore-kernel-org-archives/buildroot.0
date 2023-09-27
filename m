Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C80E82CBF
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 18:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 557F540292;
	Wed, 27 Sep 2023 18:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557F540292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuqWroxyaQ22; Wed, 27 Sep 2023 18:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25EF0402BA;
	Wed, 27 Sep 2023 18:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EF0402BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD0E81BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 18:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8605F6101C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 18:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8605F6101C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZPoBmLj6U56 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 18:43:15 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C937E60E53
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 18:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C937E60E53
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48A8AA4C0BF2
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:43:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59392)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlZV8-0001Pu-2H
 for buildroot@buildroot.org; Wed, 27 Sep 2023 20:43:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 20:43:10 +0200
Message-Id: <20230927184310.888176-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927184310.888176-1-bernd@kuhls.net>
References: <20230927184310.888176-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695840191;
 bh=GxlSqVrl649dOx4P/am2S1GkhmbEn3pNKGpjIWD3uQQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JimEORawB7TvOQ/DSTtPhe3Is3puWWEG6oaK7tR9VnXrs1hZYUnVaGYakvRnNfj+W
 zxIpY3+2c0D7Z6IQCaDd1Q8BZQw19eBU47HlZ8WLTQBHDvfGXm16e35tddWZDbeUv5
 QqWxfvnBVHXb8+tsY33zY5ai4H5xpB0oJdWxamEpcnQtKAykNabaknW5DzpE6uQJDS
 JmqnwPifLZmMizLKJygMKnkQS/y9WgiPdnX6Fniw5naBzvgZoXtQCyuBnbEhcMBuwH
 wSL3eeG/BHOjiQGIlD70UyQvPub3hJMS1cdzI41fRRIWvOsE+z5/MACKObbpnrhR8v
 Gm1Uqbk45SJ7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=JimEORaw
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: Fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/bce/bce46fd8aab9ef4918228e8cfc5f8b5abe71e859/

This musl-related autobuilder error occured when building alsa-lib and
is fixed by
https://patchwork.ozlabs.org/project/buildroot/patch/20230927052204.231589-1-bernd@kuhls.net/

When continuing the build of this defconfig we see a build error with
alsa-utils as well which is fixed by this patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0009-topology-include-locale.h.patch      | 33 +++++++++++++++++++
 ...nhlt-dmic-info.c-include-sys-types.h.patch | 33 +++++++++++++++++++
 package/alsa-utils/Config.in                  |  1 +
 3 files changed, 67 insertions(+)
 create mode 100644 package/alsa-utils/0009-topology-include-locale.h.patch
 create mode 100644 package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch

diff --git a/package/alsa-utils/0009-topology-include-locale.h.patch b/package/alsa-utils/0009-topology-include-locale.h.patch
new file mode 100644
index 0000000000..14a059cbf6
--- /dev/null
+++ b/package/alsa-utils/0009-topology-include-locale.h.patch
@@ -0,0 +1,33 @@
+From 8c229270f6bae83b705a03714c46067a7aa57b02 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 13:14:29 +0200
+Subject: [PATCH] topology: include locale.h
+
+This solves an issue compiling with the musl libc.
+
+Fixes: https://github.com/alsa-project/alsa-utils/issues/239
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ topology/topology.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/topology/topology.c b/topology/topology.c
+index 1840ffe..5d03a8b 100644
+--- a/topology/topology.c
++++ b/topology/topology.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <getopt.h>
+ #include <assert.h>
++#include <locale.h>
+ 
+ #include <alsa/asoundlib.h>
+ #include <alsa/topology.h>
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
new file mode 100644
index 0000000000..b5f8489703
--- /dev/null
+++ b/package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch
@@ -0,0 +1,33 @@
+From 0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 13:14:30 +0200
+Subject: [PATCH] nhlt-dmic-info.c: include sys/types.h
+
+This fixes an issue compiling with the musl libc.
+
+Fixes: https://github.com/alsa-project/alsa-utils/issues/238
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream: https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nhlt/nhlt-dmic-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
+index 3f6c64d..331555a 100644
+--- a/nhlt/nhlt-dmic-info.c
++++ b/nhlt/nhlt-dmic-info.c
+@@ -33,6 +33,7 @@
+ #include <fcntl.h>
+ #include <getopt.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <arpa/inet.h>
+ 
+ int debug = 0;
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 3429d0b406..be222501b9 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -65,6 +65,7 @@ config BR2_PACKAGE_ALSA_UTILS_APLAY
 
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
 	bool "aplaymidi"
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
