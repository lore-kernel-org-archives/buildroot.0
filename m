Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09299C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4DF81B7B;
	Sun, 24 Mar 2024 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KuvLK-R2hpFT; Sun, 24 Mar 2024 13:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E336481DD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E336481DD8;
	Sun, 24 Mar 2024 13:07:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 158D41BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 024CE605F8
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3DQx1czTH9M for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 172B160780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172B160780
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 172B160780
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:07:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90B79A4C3335;
 Sun, 24 Mar 2024 14:07:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49344)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNZJ-000000005iJ-42XF;
 Sun, 24 Mar 2024 13:07:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:07:20 +0100
Message-Id: <20240324130721.29945-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324130721.29945-1-bernd@kuhls.net>
References: <20240324130721.29945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285642;
 bh=ZZxXnFUnMYMrGrqnuoLXIWYF6CYVk+Iu0HQMRQpriG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EsdZWU/55QsEaS4TFcAhvQwZHadvnrufNTSVyNetpLI0MjKBNRnnFZLEtEW1A5A0B
 krVk1xzaNf/g5A224JO2KD5r8gn3RzkftQcmccgz40O4ZFmej5ZUBYlWwX9QxQCzVZ
 PMBKNEKy6hNnBuaqOEvsC0uAVRE8iRsVMMCeyk32i9tVcowSZi7n6rdz79PRCIhpz1
 pgzQEN+FXqgIqakMxUfyAOMwdLbFQ4jQAmDjtSpZKoCnRUwxWzttaQP8XGENqx84TG
 ptXC6QyxiXp1Q/sL7eJKLoXrdnh1gaJsMwos/gbex77BQipRnj+SCKW/T1/jddfH2N
 h97+8cNGRv5ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=EsdZWU/5
Subject: [Buildroot] [PATCH 4/5] package/libva-utils: bump version to 2.21.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/intel/libva-utils/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index f82a251ef8..2c80435ca6 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  97413a7ec27ec479b97ffc7ab8acebe053615224a4b051602859cf9f88e4e889  libva-utils-2.20.1.tar.gz
+sha256  15ca12bd11c7001c04af5079512754fea6ba8d79151b9f07908c99b27622714e  libva-utils-2.21.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 1f53964789..f58685e51b 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.20.1
+LIBVA_UTILS_VERSION = 2.21.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
