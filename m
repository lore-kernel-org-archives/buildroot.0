Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50EBCD4F25
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 20:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9004B402D5;
	Wed,  4 Sep 2024 20:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3-LO5zUgVOL; Wed,  4 Sep 2024 20:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1D8402EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1D8402EA;
	Wed,  4 Sep 2024 20:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7741BF3E1
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86709402EA
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bd8Upn7TAyx for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 20:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF4A5402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4A5402D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF4A5402D5
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 20:28:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0828.dip0.t-ipconnect.de [91.58.8.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE8FFA4C0242
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 22:28:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38150)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1slwcG-000000008K4-2fxZ
 for buildroot@buildroot.org; Wed, 04 Sep 2024 20:28:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 22:28:36 +0200
Message-Id: <20240904202836.2645949-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725481716;
 bh=ITkQdauYIYyzKZmNtTA3imS+s74cRus0FZIvKtIO7vs=;
 h=From:To:Subject:Date:From;
 b=pzc40RdQ7P+nP2uOcBVNfE5aXiZ2DrDzNmhcwC3JfuESeqd01mFEqfczEL/k2vIS7
 uw5MaTeNMWAr/Ackl7YF4+FRXdkwT7BLzYG706GNtvZn/6AE/fIauFyChvC7BSMZMy
 oTmRS1ZXDokteGCjoHgzEfbrmRPTX6bJpVH67m2X2rJzIIWwK/jwLSyK9Q+RCosx31
 WZaX4XbNKdHkM8rQlNhY5+xXS0LGsHxqpFO/R84tgvtKsy05v4GkUDt0sQPGBbTkpi
 LE3V92YIeQbAqwW9BAJWgpT5c1EgWYmZ7epmj0oyUbe+e/cAJoxULIX4EEsJ5QQIYK
 02/6VZl/UP3sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=pzc40RdQ
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-20505 & CVE-2024-20506:
https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index b2b7bfb987..8e8351cf00 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  12dcd842b6c46e5a9fdf2f5c16304efafe53310ac4605990465651b0c42227b2  clamav-1.0.6.tar.gz
+sha256  f4d67240a8b2e882e18f864529040084617de066cdab9b7684951ace6ea6f3cf  clamav-1.0.7.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index eb3abaa21c..d748a33db7 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.6
+CLAMAV_VERSION = 1.0.7
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
