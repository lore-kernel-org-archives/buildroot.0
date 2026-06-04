Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D75CD6E74
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 17:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D874EBB0;
	Thu,  4 Jun 2026 17:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9P3Z2qBYNO7; Thu,  4 Jun 2026 17:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9A464EBAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780594518;
	bh=tSdu42by/eX6e68Oq1GqApO/bKXs53c+2uNfe+JMR0s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KSKbGi0ZbLznffZyV6HdwJfvevtMtaUENJcZLM+Uu/h8G5armeZ0najwb9J6MgyjN
	 9oujFjFkDAeTDhbc4OI5uIpfRssISIH0MfX1zNKScshx5Q2tdfW6VFWUTa4p6vMSmV
	 Lsc1uS+l7KwGvZHHwtSPcjBJbDCfOG0ZF2/eDctM2ZaTcUSktwrsp4BMTMc9dmgIbw
	 gH5pVKwIz+qznSPlgRqcfzzUzU+/xjZSsHL9Z7S3u+0yGd2mPy5oANBx+PhA0hBshA
	 3CCxAZVQe3isqk07AEbsaNLyC4z9ZJqIt3ALvROFNOGo0TaPT7C43t9m9l6i87lCJo
	 Tncy2tk1vY5AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A464EBAB;
	Thu,  4 Jun 2026 17:35:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5594A192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7574EBAA
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff9yD53DCC1t for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 17:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B67004EBAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67004EBAB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B67004EBAB
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:35:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16556A4C39AD
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:35:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46344)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVByJ-000000004fT-1JE0
 for buildroot@buildroot.org; Thu, 04 Jun 2026 17:35:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 19:35:11 +0200
Message-ID: <20260604173511.2134198-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780594512;
 bh=DZk5TrnQ3+caxEOoAqdlgywdIFanXRmarQTVdVJEa2Q=;
 h=From:To:Subject:Date:From;
 b=N1LAYxhZ3seXzIEpWbPHCVEhoYqZhdoHHQ0G3IG1I6zHR9ZYSpspKol8rVeYsOZCW
 CyoTuEvw6Sjjazd9qXKbQ6WwooLRLsvrSBuiwEkM8ZX7QWj+Yuo8MOA83Vdu9SbQg/
 KBie6kPzqzyv8bV2cSYo3+ieqs6PTaTdGSN5tbTqEjSB/yk+huLfi8seNpPl51MC0l
 VzFC4yPXmwbcrfdZwAIalxfjCdXBhZZziNfMTpefzJJkKsIyNuwYH8TnVrpnDV7DX3
 GT1ZnW4QoL8jhAu0xHfB19PfcN9InfMNPVYtZaXcfovdo+fKNeGd28iWksRaGx7k3F
 zy7VQrgSwTDjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N1LAYxhZ
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.5.7
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

https://www.php.net/ChangeLog-8.php#8.5.7
https://news-web.php.net/php.announce/493
https://github.com/php/php-src/blob/php-8.5.7/NEWS

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/aa433b2c6ff34f634db24183cf2aac2bd9616d01

 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c85df44d73..2a89d03ecd 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
+sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0eae93fac2..0bfb12a8eb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.6
+PHP_VERSION = 8.5.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
