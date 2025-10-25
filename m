Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D4ECCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 07:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7724606C7;
	Sat, 25 Oct 2025 07:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mMPpYkt21rT; Sat, 25 Oct 2025 07:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E280E606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E280E606EA;
	Sat, 25 Oct 2025 07:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E359D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B33A40A44
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMDXBIAsZQOm for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 07:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2653340A40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2653340A40
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2653340A40
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf49.dip0.t-ipconnect.de [79.214.207.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFD23A4C33E8
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 09:05:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51124)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCYLY-000000000oq-2dZ3
 for buildroot@buildroot.org; Sat, 25 Oct 2025 07:05:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 09:05:52 +0200
Message-ID: <20251025070552.3338312-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761375952;
 bh=a3aGliaZO4mTV3h+FbSsNEl4YTApQpYr488ly8eBA6o=;
 h=From:To:Subject:Date:From;
 b=PSEmJ9D7Fy65SePL7wGATGu4nSh243ikRjdfMc2tZaxcl6rvCam3S5LaRm3BVzf/R
 VV/g2nWwSkzQTzAY01OOOfTNMbSDEE7GUubbXrPpY1u3sfvs6/F0bzgbA8VzmeaLyT
 MJtDUl8HlwD+tTsS2/wbltKjVqNxhIrOi6R/eYbdzIOLvrHxlixXHvui+B3AF/AlO6
 SMS14gbFCuPaNuq+Jz4CVHR9SfPgiSJqBl/K/X+3z+LbLoixow3BROgn4SDdxJbvuR
 l7WdqUDfTQAs/1OdvLhgplYkVYkw/l6jylpSm39IWImL8ddGHh9jt7rOk6tXB2tWW/
 Jyt61LdVYfJhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=PSEmJ9D7
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.14
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
https://www.php.net/releases/8.4/en.php
https://news-web.php.net/php.announce/471

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6774ba1936..80feeb731c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  b4f27adf30bcf262eacf93c78250dd811980f20f3b90d79a3dc11248681842df  php-8.4.13.tar.xz
+sha256  bac90ee7cf738e814c89b6b27d4d2c4b70e50942a420837e1a22f5fd5f9867a3  php-8.4.14.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index db9308dd7f..4aca21a5d8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.13
+PHP_VERSION = 8.4.14
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
