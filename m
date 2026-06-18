Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99870CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 08:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F29D610B8;
	Thu, 18 Jun 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfP_lvk_7Nnd; Thu, 18 Jun 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76472610BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781769609;
	bh=NN0Arau3U+a5iNr4Z7hoy6GdD1kQuCTu8rmuEEcoHjA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a1zeZjgXyjnmJYSJekD+Is4Y9juzWs2jZ9Ka8r+e/wW7NONpJr4r+FmXToCPLJ6a+
	 FeEfWh0lit9rXQZ/b7C6G1fny4JthZB60CUVUcpM5cgDriGy0FebkB8bvrhmcVEcp1
	 XVR9PUdJ0A9uhuZho57jHvkiXXuYgQ7JQy0PxS6sn/rF8C3bSiTrN9NvF0M9u7LXER
	 VNq+Gw73AX52xG1lLubiDZmMhiylGoxEEE/0DWJMDY67equV8k76g50QKU4pb+1lCW
	 /VIchCP1wEnMrS8MTsNWQHEhMy1TBPv7HKWszOaODfaFOUyMKXF9PnjJvbHAozz9zs
	 /QowmMtVsdRNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76472610BB;
	Thu, 18 Jun 2026 08:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87D29131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 08:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 772A483C86
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 08:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c3C_d9qFnit for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 08:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF83683C85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF83683C85
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF83683C85
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 08:00:02 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id a7fLwIh6D5gYja7fMw1R2S; Thu, 18 Jun 2026 10:00:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 18 Jun 2026 09:59:58 +0200
Message-ID: <20260618075958.1072765-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB+ogNKRD7IDBBmRldMJFDotgdxtitbPi73LMAcrijgyctUZle+MVgFgVwGMjAV8DXS8gMLPMyZF59ruQnhrdIXRNic+Q1lOAJZMl39OKdxfZ36VgbAA
 uelVk5hPqSbS2IOpx/+cQfWH/FdqsVntZ0Db5YukBGnDETm8NQdslVGpi+ucbiDHB9bWewbr6wa9GSGmGEuH8aJvR4yRf+246uXQUW3bHLDHxS+73b/iSOvJ
 dRoQRDJPj/bV5FNuNEYGLCOtjvpHWmiclh3uU4J4EnQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781769600; bh=YpbMPmicv0Vp/tC+14nc4g2+kxm6fWAiVr0u+7xzDgA=;
 h=From:To:Subject:Date:MIME-Version;
 b=DK3i3L0aK/4EzGMXeDR1+1Oxnl+dN7DkQNrTdQdHE4q7Q1zD28l336PQVSFl5j6ee
 bQrgW5SDgoXSwpDs/EZFfeoYVvbfXv0CPRuz7QBKwxG+n+qIl/HUaAOy78SnJ1F0eE
 z5GSmS7OsZMYyCP3QOmOknuPytuhAHNhhVZ6Xj2ZPiKMlRppa/6VceH4jjCJmU0fo4
 xX/iWk0zJvF3hnfobuEaCRIw7PadrVRAsp8QiI1ajyLlH26RVdk18boTwTQXjqb9+h
 es5zIscAvybBx4gLi8Kj9LQ813V/BBOGz4z863NG7CkBaqSCQ5x8r2jsm16nWYbt0p
 lEPUFPAg4Y68w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DK3i3L0a
Subject: [Buildroot] [PATCH] package/bind: security bump to version 9.18.50
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
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.50/doc/arm/html/changelog.html

Security fix:
GL #5934
https://gitlab.isc.org/isc-projects/bind9/-/issues/5934

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index b719012de7..766540ee22 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.49/bind-9.18.49.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24  bind-9.18.49.tar.xz
+sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6c0d2f8a03..54870bfa4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.49
+BIND_VERSION = 9.18.50
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
