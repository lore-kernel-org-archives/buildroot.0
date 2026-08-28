Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DECC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 05:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F5E40843;
	Fri, 28 Aug 2026 05:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBhQkmf4_ad3; Fri, 28 Aug 2026 05:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787893953;
	bh=WBEklSMl8DOmmY7Dwn2WBOgYP7NYp9cKWDozLrtOnKM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HmihNNZgEc9SOwlNQlkIBBIop1+4ip5CWR7/x8aYCzJ1AnDlxTKqJQ8vHjQq7/q4Y
	 I2bm0xnKx8N/i9Al4tIp8NoloWiBcAGB+tLiNitDPrBtjeFjRUTPN4ANu4EPuB5573
	 rE0e4ZKqbF4TNGfVmhYq/fQR6ys3xl0JoJ0RlgGHGXNtNW1XkYXn1izXVvSYwYCUFw
	 uz37uZ5v/7BdRkwSbolMFs5Wh4uj5bPEFVd5HHnNGqSCHUr5l5cM5WSYKwQFU+F5lB
	 JkmHrDmUL0wuavf2H1KaAUWpc2RDxplwfEtx+/Bw8CBO2jbB1wKaF6Gz6BjO0CmkG5
	 IMcOeuODTuxMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00765407FB;
	Fri, 28 Aug 2026 05:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8519A127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 05:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A4F2606B9
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 05:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNy0RXtjLRgt for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 05:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WeIew8bc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A1D760626
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 05:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787893945;
 bh=drh98jiA+a1wbETJ/LANNzfS6fpOyoqHvWUndKx3+Tk=;
 h=From:To:Subject:Date:From;
 b=WeIew8bcnud7NINwYqW0SBJWQOOccenDt6Mq1qfRL0pgkV7qFjnNe/U0cUwUq3bWG
 xvnzflrPIkvh3GyuUMzKmF6pWXWWfh6oNthiPjf3cz0GyqhH9QrlqMUPTIvGg5R/5h
 71kKDdoRz3Mbmp0ra1TTpZiEggUNsXHTSX8n0/I3y7PqaoxgRu1T43PGRQh/wz55gY
 fklESu9nvedTGVm7yx+ns9FdB9034adPRQWXGlHxvq7xWnhgz57K9nVhaDAuYTmZuG
 yp0OWMGd54nmfF3nTlPfnlmwhNTKJDkGomzFypIfDmYHbOG7u7C9rK7FMSOpug6GBY
 U/X5c0KYuWL3w==
Received: from fli4l.lan.fli4l (p54a1b0fb.dip0.t-ipconnect.de [84.161.176.251])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF62CA4C00B2
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 07:12:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57690)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wzot7-000000007RI-29Ei
 for buildroot@buildroot.org; Fri, 28 Aug 2026 05:12:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 07:12:25 +0200
Message-ID: <20260828051225.42832-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.5.10
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

https://news-web.php.net/php.announce/504
"This is a bugfix release."

https://www.php.net/ChangeLog-8.php#8.5.10
https://github.com/php/php-src/blob/php-8.5.10/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commit/2d75fdd5f55437ea5572397b65851d307b06e0d3

 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c093ecdacd..0b3d87fd97 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  0db7855f25bcd0ab1d592cdb35e284d6f6a5d2ae0f6f621122e364cc39b708f4  php-8.5.9.tar.xz
+sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 05eb4b9092..ac5730a22c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.9
+PHP_VERSION = 8.5.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
