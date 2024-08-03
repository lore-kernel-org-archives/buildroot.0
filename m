Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA310C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BDA403E3;
	Sat,  3 Aug 2024 10:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kuzy0M3YT7kL; Sat,  3 Aug 2024 10:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B4440450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B4440450;
	Sat,  3 Aug 2024 10:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29A941BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 170826064C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7lW5ke0XpWc for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CDEC60626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDEC60626
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CDEC60626
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:45:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E5A1A4C013B
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 12:45:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42268)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCGp-000000003F8-30ja
 for buildroot@buildroot.org; Sat, 03 Aug 2024 10:45:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:45:55 +0200
Message-Id: <20240803104555.2574177-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722681956;
 bh=eKz5xhaSMXe2AqaKdHMHCLpzMU+3ElVwXaUAMVqUg0A=;
 h=From:To:Subject:Date:From;
 b=Gf9nqI/odXwA4qdQ6098n32uO32suWpgomzVQ8bkJnY1hS/C9dOHZAaXtwcpNaoLJ
 3XYtdNNCdrSQz+D0up55mrnFPXrYIsPZP1TS9EtLkKJzFsOq7RRSYJToAgamNyQ8sf
 DmZLTxfXC1Bxx5dNdB35o9OIjpL471osR/8Gu5/eRc0daoURL2kaOla7WANLnEv5U/
 UQxGhjvhtlqsB+UIhhtMo/jHkWuh1CYwH5D4+35VK/yMonHCBmmhDeL2Dy0hMSSB9x
 gqzA8Yu6KSJwVkH28kHG5NngUMS2x1dtfZ6OiJwQsoHGoj5kaZ81qfwKLVcJ+Tq52z
 vAMF/GW+2x3zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Gf9nqI/o
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.10
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

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/434

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 59a82b001d..3a6f60680b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  bf4d7b8ea60a356064f88485278bd6f941a230ec16f0fc401574ce1445ad6c77  php-8.3.9.tar.xz
+sha256  a0f2179d00931fe7631a12cbc3428f898ca3d99fe564260c115af381d2a1978d  php-8.3.10.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 3fdce8186a..0487c03b61 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.9
+PHP_VERSION = 8.3.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
