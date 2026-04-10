Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094F9F36BAC
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 05:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B61F4058B;
	Fri, 10 Apr 2026 05:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkW2IvEzEYyt; Fri, 10 Apr 2026 05:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A61B44055F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775798404;
	bh=22s/KRqbDyCv/vAAwP2d4jElPI897X/8tGzy/ktjDkE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SmPmNiuKrPXCtqRbyY1adP8zv+hYJtScTze4qCl6StaB0y9lN8je2G7VqADMRltj1
	 +D5SUvklrfhgUu6Fd7j5b/5PHhd5lth9EbdqekA7AfIdaB4nKzN8Z+fgszAcQjVjWQ
	 S7W19hUFJAwz+tT2CASWEZZvQH6s3FGKYR4qifqQzS05UHTVzDu/zKMWpcG2TmY2rT
	 qPNhQiE2UYCBg5JgGE6NKIlwrdhISDTUuEuC9x3d4H7JYGGP0RwN/5NQN+8val8IYq
	 JGyMqjS8RCSz1BOqpWGox0sKX38yrHC8Tt2nsfj4jenot27WIfaLWKYybSswulmB2L
	 Nk9xLf2NwlfJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61B44055F;
	Fri, 10 Apr 2026 05:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B5A237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8A794010A
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpicUtsBHViF for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 05:20:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C237340070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C237340070
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C237340070
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:20:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a090a.dip0.t-ipconnect.de [91.58.9.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84D5CA4C063B
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:20:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wB4Hg-000000007AA-1q6A
 for buildroot@buildroot.org; Fri, 10 Apr 2026 05:20:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 07:20:00 +0200
Message-ID: <20260410052000.26329-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775798400;
 bh=rzqYLdPatcbU/XrO7jxHh/10m8uMMKU1wjHemovHxgE=;
 h=From:To:Subject:Date:From;
 b=YTKUCUjfqzi6rss9EuWP1JZxDG9fLjb29RycEyo5qiM4SzPC6ofW7FwZiHgsi5ohV
 Se2q8FO0QWmIdARwQUGcICXJ74BJ6zx5nu9UEmqihlUoaBOdngtBALijevZU5xpTd/
 4aHsqqbUl3WodTarvJGUx7pTQFSoB3EOBfJptls0Fy54GauHQAFMqa9MBQMGl13kJd
 OzuCJYJwNwSx72zR1wyfF5vu/k4JSICbV3SZuwhdounlRgPtRr3wXWER0PxS4e+nU1
 CRq974TKYeFqgQhoBcE8j+YOMIGdzzQBsDHvZ7NzvDPVvcZwzodHSjXn7ycxQDeIVy
 K8ypdte8ohB8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YTKUCUjf
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.5
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

https://www.php.net/ChangeLog-8.php#8.5.5
https://news-web.php.net/php.announce/488

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 7fdb76b01a..d400f8e0bb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  c1569f1f543f6b025c583cdc0e730e5c5833c603618613f1aa8e75d1524b8c91  php-8.5.4.tar.xz
+sha256  95bec382f4bd00570a8ef52a58ec04d8d9b9a90494781f1c106d1b274a3902f2  php-8.5.5.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 220fb8c5c0..9976884001 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.4
+PHP_VERSION = 8.5.5
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
