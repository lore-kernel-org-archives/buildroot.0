Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C600D68BFA
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 12:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B6260811;
	Sun, 17 Nov 2024 12:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsIaHHmLEDn7; Sun, 17 Nov 2024 12:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2CA260B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CA260B49;
	Sun, 17 Nov 2024 12:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FDD9B14
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B2A61126
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9wvMbVflXCY for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 12:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B36960811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B36960811
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B36960811
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:55:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C8D0AB0054E;
 Sun, 17 Nov 2024 13:55:10 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 13:54:49 +0100
Message-ID: <20241117125450.543605-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731848112;
 bh=lacAvbluWKWfumgRnOmRTVy+QGZKHD2ky3KFHLNyLe4=;
 h=From:To:Cc:Subject:Date:From;
 b=FAdnY/3JdFsZo9PN91fyPpWWc2h4J9WtBU6zzAxHWdZKKp2ol0269mA34DtgYtvCz
 kubTUVi7U80S1Ba+LixvYBDzprY48Km51CPl4/mzYFeRCo+bCFb+jQFNLwdfZAsEXr
 Z79Q0NzpCTSAmYM4Vc/RmbmXc+K1GCmiofg213X3h5GLgWbjX03HWZ48591G7vRWcx
 vvdiL4mJpkx60SMfBm7dGjloAUkAUg6WDgM2y5gHMMszshgYq4iqn0yFdTT0dDrd3v
 wZNH6F3NyUrl8I5LhuFn072+TS/BCIiGq10+SaXAOyGfmUibRuvj7y2JVHrkEAlp0v
 jfo54EwluF0cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FAdnY/3J
Subject: [Buildroot] [PATCH next 1/1] package/nettle: update _SITE to use
 BR2_GNU_MIRROR
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

The nettle package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

Note: the nettle _SITE was updated to ftp.gnu.org in commit [4].

[1] https://www.lysator.liu.se/~nisse/nettle/
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/92f0ef5eaa74af28b2b7b7abbe021bce2aba4875

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 22a41ba55b..3f30fd761d 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETTLE_VERSION = 3.10
-NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
+NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
