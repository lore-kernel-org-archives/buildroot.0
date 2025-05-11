Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B19EC3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 16:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDCC408E0;
	Sun, 11 May 2025 16:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0bj9ov8PTF0; Sun, 11 May 2025 16:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49F5C408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49F5C408EC;
	Sun, 11 May 2025 16:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23A06154
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B7540374
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzVUjCbwnPyQ for <buildroot@buildroot.org>;
 Sun, 11 May 2025 16:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A0D74010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0D74010C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A0D74010C
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b54c.dip0.t-ipconnect.de [84.161.181.76])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 879D8A4C055D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 18:14:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34132)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE9JP-000000003ud-3F4T
 for buildroot@buildroot.org; Sun, 11 May 2025 16:14:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 18:14:00 +0200
Message-Id: <20250511161400.3195076-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746980040;
 bh=Aci38QYJA1JqeM23drYkE7w0tPZ+AuoYmBBvXBVh83s=;
 h=From:To:Subject:Date:From;
 b=aa8jXgjJw85NRyHcHQaKP9q9LQUWS+8gSMOOkJBkc7Wk4ya4F58iFjyFLQWv9HlRm
 AzTA/1omOxYJK+32WcL79BrzVZpygytsgn2OYaeiF+cW3ZL58dADeYgCutxAGXihjr
 sjSM7rL0k57hiC+DledmJI0E/HxXwK3WnBDuKdUWqGRF1VIdLIu34wEsKfGkwa9/wI
 hce3mu3Jw08JRPmPKvFb8mU7kThhW0HFjCtOBgwket6is9sDlKM2mtgUis3fu18Prs
 rbsFomaCOKex0lT23GPzXP+k2wtvdaiakJUmaM/w1wAtaIgJMc1LphnckfAQOH29xa
 j631bSZWoM5+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=aa8jXgjJ
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.21
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

Changelog: https://www.php.net/ChangeLog-8.php#8.3.21

Release notes:
https://news-web.php.net/php.announce/457
https://news-web.php.net/php.announce/458

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index ba9c5bb468..8e3be2dbe1 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  976e4077dd25bec96b5dfe8938052d243bbd838f95368a204896eff12756545f  php-8.3.19.tar.xz
+sha256  4dfb329f209a552c3716394fc123bb62e80a468b55ce27fc8cb0fd5f30b9dcd6  php-8.3.21.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 374fdb2c69..ad42e57d72 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.19
+PHP_VERSION = 8.3.21
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
