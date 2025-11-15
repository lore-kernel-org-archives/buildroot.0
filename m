Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9BECEBF87
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 23:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04358608B8;
	Sat, 15 Nov 2025 23:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1ZvPQR2aGhD; Sat, 15 Nov 2025 23:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E5A608A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E5A608A5;
	Sat, 15 Nov 2025 23:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7859158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD427405B8
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4cCmxDsrKFO for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 23:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 502C440597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 502C440597
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 502C440597
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 23:08:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04F04A4C6AA1;
 Sun, 16 Nov 2025 00:08:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKPNv-000000002zv-2ouD;
 Sat, 15 Nov 2025 23:08:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 16 Nov 2025 00:08:47 +0100
Message-ID: <20251115230847.2727702-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763248128;
 bh=gGqU3Sb9+DM0g+d85v7RJI5tLW6lsYPMXLxDclRI00o=;
 h=From:To:Cc:Subject:Date:From;
 b=MjobXFXUhDqU7P1No86ecmUfFMqnzNuazT8vtAL/aCF5JdiGs5tPLX1JJi8j/+vjw
 AeUflSclVPDvdDJmxm3XLqWBe3OQI5qKVCH7aFEYrY+Jk663sQOB4XN/LdAV3AOoDH
 wDGvI41ZkoIBxkHs34g1x3IoEh8wGYrCZ791z+EQWQ9m5bHyKjHnahLWVWeIsAwovr
 OmKsLm65SE0D3kI9SBMAvZ7DP/NBmu8pXgvoesGG2HIl5jXBr+Rie2ulG985rj1Cj8
 Gh7vWM9qXxyyD26nGb13KBJ8meie1iLEmFold+jDIiAHSUGoiq8hW47gUP7rZFdfyn
 ebQiPX8SXhTtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=MjobXFXU
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix merged-bin
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

mv: '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/bin/arping'
 and '/home/autobuild/autobuild/instance-2/output-1/per-package/iputils/target/usr/sbin/arping'
 are the same file

Fixes:
https://autobuild.buildroot.net/results/dae/daeebb090f6d11d77840dd61add9bc422c6bc2fa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iputils/iputils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e00513229..1a5d3e3678 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -32,10 +32,12 @@ IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
 # move some binaries to the same location as where Busybox installs
 # the corresponding applets, so that we have a single version of the
 # tools (from iputils)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 define IPUTILS_MOVE_ARPING_BINARY
 	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
+endif
 
 else
 IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
