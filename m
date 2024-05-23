Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31922C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 20:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6C660640;
	Thu, 23 May 2024 20:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkQEbzYBfTB5; Thu, 23 May 2024 20:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1228060613
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1228060613;
	Thu, 23 May 2024 20:09:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E93A41BF471
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D39D041973
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 20:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B85TwEtdzyFS for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 20:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FDCE41872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FDCE41872
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FDCE41872
 for <buildroot@buildroot.org>; Thu, 23 May 2024 20:09:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5167B00535;
 Thu, 23 May 2024 22:09:13 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 22:09:07 +0200
Message-ID: <20240523200907.13799-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716494955;
 bh=EAUN/kICP6SmNw3+w9pnK1aQjj1vF5+9p/jyuatmFMM=;
 h=From:To:Cc:Subject:Date:From;
 b=lHRxNdgMVwUyWApO9GLE02fh9uDCEiAdrXydq67927quLhDeuL2le0GKXwcWnalN9
 FehpqnSCV1pqTiuLT+5GJ44HplVuBwzM77+BvB46AWclb/lLG/if+RoJGF+t+PUPwj
 WltrZhJeT2H4WS+hCxnJLxmDxSsUXnTNslNZsSqLoUgloOK/trTj+pqJAg7t8OEvZt
 bTNii/K/xe0/aq/QNWbSHM6sMUPLJJc2NXXUVfOX01xQkNJRVyCHDeMjHR0VoqGyCs
 8RCZfBWr/jZX1Q7DgbpKtR7ZJfGqNFjYdBCnx3njHGfbUvRM633hSo9ZVjXdvCbdAR
 8sQ9hSJVswmsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lHRxNdgM
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional zlib support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index b84e043679b..853f767d971 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -28,4 +28,11 @@ else
 OCTAVE_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OCTAVE_CONF_OPTS += --with-z
+OCTAVE_DEPENDENCIES += zlib
+else
+OCTAVE_CONF_OPTS += --without-z
+endif
+
 $(eval $(autotools-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
