Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEEFCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75FEF404A3;
	Sun, 15 Oct 2023 09:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FEF404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNqW9S2r-jNV; Sun, 15 Oct 2023 09:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8934D40C1E;
	Sun, 15 Oct 2023 09:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8934D40C1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E88571BF30B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C162181E4E
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C162181E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwIGmzJ_aHbk for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:33:40 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77A8C81E35
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A8C81E35
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCA65A4C0D20
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:33:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrxUl-0004D6-1i
 for buildroot@buildroot.org; Sun, 15 Oct 2023 11:33:11 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 11:33:09 +0200
Message-Id: <20231015093310.1138805-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231015093310.1138805-1-bernd@kuhls.net>
References: <20231015093310.1138805-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697362391;
 bh=a5P3D+WAFgo0ZBQ9z0Nx2qq1X+VcuQxPFVlWd487Umo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oQlpJva6uEsxab9NOUPNDrG0Cvx6CbL01GIi1gGhhiG4qXTwKlebXsuvflqpOpYDz
 rozFvX+2aTOGF4hIJdiFGfnx5XHXcqOXZktDUJaNpsKDonejRUp87PG1F2C8ixaKEg
 FVBDQBkJ8LRLzZfGnLixPRoc5o8kjnO1GLtA6ZUFeS2aLyCZbOmCB7bZR7zWpqD8JX
 eIPZ63YErdph3eGc+0rv1XxxphH6K1tK4SlfL201I9B/iQVh97huTyDvkHOvP9zo3N
 pWtOPxGOEpufpVNxLoRiH6BN20e70wAFEaI4CamP9Nx4MDzrzr74Ia1GpUWv0DA8y9
 wabIkPweQu4Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=oQlpJva6
Subject: [Buildroot] [PATCH v2 3/4] package/alsa-utils: Fix musl build
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
http://autobuild.buildroot.net/results/5a0/5a03cba08bf24d61c816b8e2f257c18004bad3d7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed left-over from previous try to fix
    http://autobuild.buildroot.net/results/e26/e269f862ebade30cf870d783a1006aba8fedc129/
   (Baruch)

 .../0009-topology-include-locale.h.patch      | 33 +++++++++++++++++++
 ...nhlt-dmic-info.c-include-sys-types.h.patch | 33 +++++++++++++++++++
 2 files changed, 66 insertions(+)
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
