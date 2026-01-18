Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B92EC9830C
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4582140682;
	Sun, 18 Jan 2026 22:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AA5OGrWWMPI; Sun, 18 Jan 2026 22:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224D540664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776607;
	bh=5EKmYEknCaDlhkgMBGbpdYlDyRLZbpU5XzIBSnlanYc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WIE1KR6Fr2TqB/yiFucBeg0qn8IH0a3rkQyJE0IcZMJLn6Zkfc3EsLYygixO4HuZL
	 UxcSZx2KTGZ7jd5eu4WL0xFzuz0mFS5xOqJu9qI5BNYqJMOzcIZIfg7+SjIzjDRTSy
	 GnX92d52H8H7TymYgdMWHUvIdSGgKafjDgDcx6fDAQwZirBe8N09wJLtL3qQw8QW1z
	 Pv6OG7/3OznU8vdQWrB3uMDhy/KiLxD59gmTlH83lWcA+qpggp4bWjbrZqxJHPcpRU
	 MEJ+KnsXT0ZZSi084iiKe4jMr5bTu0Wl12iu3pbPlwYww7428b1b46ACQ2XQJEhxGk
	 aeJY40k/YZ93g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224D540664;
	Sun, 18 Jan 2026 22:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A73642A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FB5808A1
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhpP_PhBf09V for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F56680835
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F56680835
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F56680835
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3CF36A4C2C35
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 23:49:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbad-000000001R1-18Rv
 for buildroot@buildroot.org; Sun, 18 Jan 2026 22:49:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:42 +0100
Message-ID: <20260118224947.3879017-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118224947.3879017-1-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776588;
 bh=gdxs8o5J5K92EAjG6fBKAnXuN7Q/6efgCpnk/y3cxjc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YupKomGsONsqdcKqK6gYo3geKahe2yvm/5P0V+Yxjhvw+e6k7sPHe6/X3INydg6dT
 sc7eYK6YlUd6vZFM80vIg1QWUGmRWUi7ntGOY0Jlpw4CkrmS3kDFa9gxCAUlYswte9
 8JZLnjeRbdtA7pv6lLdCNz+IqSHU2Re8zhTZVUvYhPHA18ObExehXUpmkR/OmO2bto
 N/8qNVJo4DeMEI6+qdojW0XKRXuB+HH1jIcamyTUtLXsQgrWEnLXpj1Z8VNqHDMnBC
 oAUkJmsN/YLt/aRMFe8cTG5MWS4JXUOqJ9YExv+MTq2xRG/N7I3QPXu16B0qwRtsH5
 NkFcgjcq0PUNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YupKomGs
Subject: [Buildroot] [PATCH 1/6] package/php: bump version to 8.4.17
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

Release notes: https://news-web.php.net/php.announce/480

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4a9d2e4bb4..23ca842b72 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
+sha256  28b234e347286158cae921d61283eb1169d89bc9d2e5f5976567260ff38b0bfa  php-8.4.17.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7524187649..aa6050c1a7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.16
+PHP_VERSION = 8.4.17
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
