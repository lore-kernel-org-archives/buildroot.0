Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836C5D1BDF2
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CBD80E14;
	Mon,  4 Nov 2024 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0QMTlmYYWPW; Mon,  4 Nov 2024 21:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2C280E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B2C280E18;
	Mon,  4 Nov 2024 21:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B47B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A281440574
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQ7t4JXH8Iu1 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C79B40165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C79B40165
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C79B40165
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:15:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56776B00571;
 Mon,  4 Nov 2024 22:15:43 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon,  4 Nov 2024 22:15:36 +0100
Message-ID: <20241104211536.640566-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730754944;
 bh=6LU9C7dV9jNBEABLwOviYSkBvCmCjBC/7OesX4T9FlQ=;
 h=From:To:Cc:Subject:Date:From;
 b=iAaABhJ+4aHtAEhNHnFl96Iw/pDuFVIpYitEzFkAi+po+V77ogrAwoJBA1p7SFfX3
 ykQPPajz4EwbMsnMQKgF4HK5Kvp56x7Op1ReeCPM5SOExVeTgV4VKc9+lNoJk7X8Oa
 F7YyS9KO3HshD80655EDsS4UBFoQy31mzOoUoYL5JzJZbqtdykgAUeHaf/xzf52KrS
 yVx1kFMOqrGNP1edwXNhLpW0+bdfI7qPVPf6ej/nJVprXnhMjWE77ikqgy9X+wtEiP
 50eRl07/dvnfiLrtcujxeuw+nME+Qg+ZYhNzuSkx6wVFx8Vpaec3+DWa9bPY5C/t7j
 FuPcaiYQ3MOxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iAaABhJ+
Subject: [Buildroot] [PATCH 1/1] package/opkg: add optional libsolv
 dependency
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

opkg configure script supports the --with-libsolv option since v0.3.2.
See [1].

Note that the opkg internal statisfaction solver is beeing deprecated as
of v0.7.0. See the note in changelog [2].

[1] https://git.yoctoproject.org/opkg/commit?id=bc2d3413e7dd61dd0001cc30b7785880c26eada4
[2] https://git.yoctoproject.org/opkg/tree/CHANGELOG.md?h=v0.7.0#n12

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) at:
https://gitlab.com/jolivain/buildroot/-/pipelines/1526813066
---
 package/opkg/opkg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 0323a49f0b..9daa38c1f1 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -44,6 +44,13 @@ else
 OPKG_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOLV),y)
+OPKG_DEPENDENCIES += libsolv
+OPKG_CONF_OPTS += --with-libsolv
+else
+OPKG_CONF_OPTS += --without-libsolv
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 OPKG_DEPENDENCIES += lz4
 OPKG_CONF_OPTS += --enable-lz4
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
