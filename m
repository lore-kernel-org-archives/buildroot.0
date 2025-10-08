Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF9CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B040881758;
	Wed,  8 Oct 2025 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRcoK42cLTLK; Wed,  8 Oct 2025 15:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A3E816D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A3E816D7;
	Wed,  8 Oct 2025 15:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95477119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874EC40A1F
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se0CLWEUnVRD for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 15:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BFA140ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFA140ADD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BFA140ADD
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 15:16:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b31b.dip0.t-ipconnect.de [84.161.179.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CB31A4C638D
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:16:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54428)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v6Vtw-000000006PF-3Z8l
 for buildroot@buildroot.org; Wed, 08 Oct 2025 15:16:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 17:16:24 +0200
Message-ID: <20251008151624.20338-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759936585;
 bh=qF95xSiyfXvDbTOA+r0q6EJe+i+bgtNnLa3hYg70YI4=;
 h=From:To:Subject:Date:From;
 b=fshB7CPJAaqI36rTcxXHNke0+aPZoSVlvFtI+i7sP464WzKBUckyk32BAAf2yT7n6
 flge0PpDucnD0pAFWdHnxUI5cEG653Em7ovwwoICeY2U/zK8D/pkYUhRshaYN8kJ1c
 joIIEDMDSTmf7rWJoYQo0Cc/P9c27Px2719hV0jaNoEd8TnPHKY62hDefmec5RIZn1
 IX97t443Usn4tAyyOc+Ef3LUI8swoTw1RgOaYdqgxIozpixNG/DFaqG+CFyNtbuA47
 ZcYlGNrNuZ6I/kioyi7qe3mrqEIsnwgUX8Z9uGzlbKwCq+U4rDZcstp3THbzVpxAjb
 y6pfV5/tsuktg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=fshB7CPJ
Subject: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to 2.4.0
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

Switched build system to CMake to avoid autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index 125bcd47a5..853f3b90bb 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43b23dfac2f64a3aff55d64be096ffc7b73842c3f5665caff44975633a975a99  soundtouch-2.3.3.tar.gz
+sha256  3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  soundtouch-2.4.0.tar.gz
 sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 099539250c..0d8d8eeba3 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.3.3
+LIBSOUNDTOUCH_VERSION = 2.4.0
 LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
 LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
-LIBSOUNDTOUCH_AUTORECONF = YES
 LIBSOUNDTOUCH_INSTALL_STAGING = YES
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
