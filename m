Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26064CD1297
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 09:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFA34049E;
	Sun,  9 Nov 2025 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZPe4tcHYiS4; Sun,  9 Nov 2025 09:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E31AA4060C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E31AA4060C;
	Sun,  9 Nov 2025 09:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DDB25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 09:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0BD940345
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 09:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5ksCbtmh-zo for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 09:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72D354024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D354024E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72D354024E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 09:40:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED87CA4C4303;
 Sun,  9 Nov 2025 10:40:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33010)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vI1uY-000000002yt-127p;
 Sun, 09 Nov 2025 09:40:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sun,  9 Nov 2025 10:40:38 +0100
Message-ID: <20251109094038.2098652-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762681239;
 bh=oFwJS5rOWf3GgqCuXWrySz0IG9uBkRY2D4zHuRczOuo=;
 h=From:To:Cc:Subject:Date:From;
 b=xktmSK158wPS2GnYiOJjKITY1/q/w6/HXoCK+vY0h0EcGlnm0T8jIw9ocnaZzVMwQ
 y4QmuXSuIR7iGijmpUplIXTvVlYDNbqdyx0hQrcjuWY7SRM0rO/Fqje8QX6n0NiONB
 8v6a4zjCIvQKKGPvoVJRZdS53uh773p3CspYwrJN9Q5IHAT+lclINF0ly1A/kwgIq9
 LDBWVbljDIcpvsTrtJnoNvAIria1TUTT/8+qQceMBMD1MIjBwib2KAdTu9H4rrF8cq
 G23q38Am0ZSZMGYdY4Z097NmSfciturdJ4V6TTULvzWnhMd+2tce9wJyFicE5h6qI1
 yRphDK874tyZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=xktmSK15
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump version to 1.7.8
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

Release notes:
https://lists.infradead.org/pipermail/kexec/2025-October/034120.html
https://lists.infradead.org/pipermail/kexec/2025-April/032607.html
https://lists.infradead.org/pipermail/kexec/2024-October/030984.html

Switched to github helper due to upstream not providing tarballs anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 9083ced423..99a92c2dec 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c53f1e5e11e75e4896197df795bee63b3d46b8821fbc3368f7a240861b543b5  makedumpfile-1.7.5.tar.gz
+sha256  b54e88bef256c589eb4adce17bc856da898a762626fe54f76a77a7f22ad9a844  makedumpfile-1.7.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 5fa1331910..af510598ad 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.5
-MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
+MAKEDUMPFILE_VERSION = 1.7.8
+MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
 MAKEDUMPFILE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
