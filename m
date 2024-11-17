Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7438AD68BFA
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 13:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1C4600B9;
	Sun, 17 Nov 2024 13:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lD41m_kUkjMC; Sun, 17 Nov 2024 13:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E8260607
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E8260607;
	Sun, 17 Nov 2024 13:13:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 524B0AF0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 13:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4069D404C9
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 13:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcmTA4L0N3n3 for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 13:13:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEC9B404C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC9B404C6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEC9B404C6
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 13:13:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9A561B0053D;
 Sun, 17 Nov 2024 14:13:49 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 14:13:42 +0100
Message-ID: <20241117131342.551472-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731849232;
 bh=/yiG9owqOMl4djw+m52yCEcEDOUzv7t0yFZZnrI0Ov0=;
 h=From:To:Cc:Subject:Date:From;
 b=CeNL3c8KUIb2ZjDw56eJyZ2slgtnowmwLk4Q+QYlMEHpyho1y7+iv5hmawyyUEEOY
 nl9NXy0eOTR3aJJ03exRbcF3joc+wF4+5YPRTkOr7mPe1JXFrz8e9hNVU4fPdkeIhU
 mkdo+gtsLtcvTaE7TRbi7fZzbrNbUckJ0dTIenYSome7qaLwWFFOhsyixiaF5brh4H
 dNVZuuv7RboCzT3dEspLUVSQp584YcVpSntqKbvzCCIskUHtV5i1fCqs73+bfMBWn2
 2bp2cvJxqh/rQSY3GqZLLLXPKajknzVgrQKXuy4VIvhtdO22NFirTysdzO4KUuqSh4
 szgEJAGLDVdXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CeNL3c8K
Subject: [Buildroot] [PATCH next 1/1] boot/grub2: update _SITE to use
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

The grub2 package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

Note: Commit [4] introduced the grub2 package using BR2_GNU_MIRROR.
Commit [5] changed it to use "http://ftp.gnu.org/gnu/grub" without
providing a justification for that change.

[1] https://www.gnu.org/software/grub/grub-download.html
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/c24fdb3680019d18f0cb7c02a90975ee9fe9613c
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/5ffafd2353f5d67dc74c7f3784dfe48d4080435e

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 4df12774a3..0896029322 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GRUB2_VERSION = 2.12
-GRUB2_SITE = http://ftp.gnu.org/gnu/grub
+GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
