Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72466D68BF9
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D0B60743;
	Sun, 17 Nov 2024 12:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6xlbv_CLIa0; Sun, 17 Nov 2024 12:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4B546073E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B546073E;
	Sun, 17 Nov 2024 12:39:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42548DB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22EA96073E
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAg0HP3p8B9X for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 12:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30BEE60729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30BEE60729
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30BEE60729
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:39:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 08DE6B00563;
 Sun, 17 Nov 2024 13:39:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 13:38:39 +0100
Message-ID: <20241117123839.536725-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731847153;
 bh=ElSBdcOJDsHD6/JP3YIyojo3lEttQmng1EOSE5bonyU=;
 h=From:To:Cc:Subject:Date:From;
 b=bGshpRjvtvaHNP+kT5n6SG3updEVb+TeVprvyuV61V4YmeynQDWMFq0N152p2+Fmg
 wMGQPQ8h0iHsXWttzNh3LEz75oEfNAE4Tq9rJNif5PJBvJqn7rndnMY8MBHIjrw7Gn
 kuWsp8Bvor6wuqRE8q2dkWrQYFMGZYu8c07ONY94mAOJnlWdX3+WOTSkt8q+q7sKXu
 I3jgqc9C2uuLcDH7423SXehPo+ChsPNuW2EAurzRo2m7fTLy3+RwkSEGDtDPGaL7S8
 BCeJyrO3JSwgUFgt+jOY2d6aWT6RUDlGwkYndwYBczhE6tEHzIZs1Q5UjOpj26oMi4
 bhgSqA3/Zi3tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bGshpRjv
Subject: [Buildroot] [PATCH next 1/1] package/octave: update _SITE to use
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

The octave package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

[1] https://www.octave.org/download
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 2e2fe0f989..34d9288c75 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OCTAVE_VERSION = 9.2.0
-OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
+OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
 OCTAVE_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
