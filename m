Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A94ACD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 579F581FBB;
	Sun,  7 Apr 2024 11:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15GI_rG4512l; Sun,  7 Apr 2024 11:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C58C81FCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C58C81FCF;
	Sun,  7 Apr 2024 11:45:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C224D1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFBE081FBB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0NxnCwCyUzi for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D57DA81FCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57DA81FCF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D57DA81FCF
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:45:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71A14A4C2DA5;
 Sun,  7 Apr 2024 13:44:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx5-000000005Wv-12Ft;
 Sun, 07 Apr 2024 11:44:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:30 +0200
Message-Id: <20240407114445.683504-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490287;
 bh=56eIXd9y4b1JU6lKGDSpoax8BaI60Z6iz3vNTSlG8lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Povx1AJjdmCaL+Wvo7LzfRqFgZwFMmVbhTyk9cKZJlzUM/4kqYdYzUqHhMBE2KN5e
 cH/Tc/x2MQznS6XS+yp0CIyEIyNuVCayyIrBQIzACXYUEu1p+N3vJQO82Ar7Zz1nTZ
 6t7cP+Q8KpE0XzvJ15y89dI6Ly5R0KzW6EHgaf8OalmyUWyWw5Vy9SfcftcR/g/NvU
 Jmt/RTw5Lzs1j4KVg/HPbJlzD0PFkM5blFx1qCZkwQ2AGwTEMeLLIvwDkGklxkmJ9u
 vSZjGV6JaraDlOTsb5+FrX9Xy2Fq3kKYlOxk2XFJWOfYVV3IJAEYRvUQ+B8JdkLzLd
 jrIpa6aQOPSPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Povx1AJj
Subject: [Buildroot] [PATCH v2 05/20] package/ffmpeg: add optional support
 for libvpl
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added with commit
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=7158f1e64d9b76afea78537a35c465447df0cff8

"It will fail to run configure script if both libmfx and libvpl are
enabled.

It is recommended to use oneVPL for new work, even for currently
available hardwares"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index acd5a7d8b2..87c482656c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -321,11 +321,14 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
-ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
-FFMPEG_CONF_OPTS += --enable-libmfx
+ifeq ($(BR2_PACKAGE_LIBVPL),y)
+FFMPEG_CONF_OPTS += --enable-libvpl --disable-libmfx
+FFMPEG_DEPENDENCIES += libvpl
+else ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
+FFMPEG_CONF_OPTS += --disable-libvpl --enable-libmfx
 FFMPEG_DEPENDENCIES += intel-mediasdk
 else
-FFMPEG_CONF_OPTS += --disable-libmfx
+FFMPEG_CONF_OPTS += --disable-libvpl --disable-libmfx
 endif
 
 ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
