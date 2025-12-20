Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179CAE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD7A60E64;
	Sat, 20 Dec 2025 21:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVAAbra3owCq; Sat, 20 Dec 2025 21:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8A060E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267026;
	bh=J+5PoO6JbA73gKaBHe74tBFfRd3floayG3MCvyPuKJU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O1027NY7ZlOyvnIG7YonQJ8siziLqJe3GUHfMKBm/oH0IQQxMI+GwlOLxkIu5zMNS
	 CDnABlxgXkDUmvadpqw1CDNm0SIu5go9GcNPWqQp5mGdEkUVkPm7L8VM3AsUXJyPjo
	 US19Py4P75Nr8f2EmxtRw/6Mc6uHkE5FWXhgGqY6q55kxRVo8hAIqhk0vNyZ0uQD5n
	 Kh1pNR1ztF9gi4O7Yr2T2CGt7wkMwq0PygT6gIc0sXqVnElQ7BrZk7azviwiJw+L24
	 xzSl9BCLUgFfHAVVmbObYO/7zT/hNHO72xpv4h3VE8S7mVjSNDuXCW4D70rtEGMidT
	 b8yKWzEJz8EhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF8A060E33;
	Sat, 20 Dec 2025 21:43:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BACD119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D5C818CA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjP3LGz7H4P6 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D42180972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D42180972
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D42180972
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D317AA4C4D73;
 Sat, 20 Dec 2025 22:42:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-0yc4;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:55 +0100
Message-ID: <20251220214206.1089100-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266929;
 bh=4qa5qbUoqqjfFLS0yi9Koq4cOya5O37ejyI8+C5trO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ByOG5Kju+FUFm+t3f2aYjTejYLWOWxI0XBuXN28YwecuEtEkmvLWdqeTRO88lfg6z
 gfURb7sI39QBkXsmO+71fCKBWVEIVkC/e/CTk3eD01TtRXpyr006ADkVbJ9w6t8W96
 n7pNXmURF2dxsOOzywj3W39h8xVu8lH7pUG+clc5DT0SEgzh7BUymv1BdUUVcnwmon
 TTvR1eCWtyVUvOaTGP726KE+NhVkvh+V8xZt+eTACwCoFkgDyllnaYRIgGK/tSX+aJ
 V/skGgOu4fqJ7jcVKYCg06vISSxn+1Ca8SyA9fGAn1fTlcZXeLdZ4NOxu5T+AQDGN+
 fKcVEpmMP7l6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ByOG5Kju
Subject: [Buildroot] [PATCH 07/18] package/python-filelock: security bump
 version to 3.20.1
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tox-dev/filelock/releases/tag/3.20.1

Fixes CVE-2025-68146: https://github.com/advisories/GHSA-w853-jp5j-5j7f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index f47e8fdb5a..30bd3b1c97 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  0b9c4280769cd87d874711c13adf50bc  filelock-3.20.0.tar.gz
-sha256  711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4  filelock-3.20.0.tar.gz
+md5  273703b56caed22470cda2a528182fef  filelock-3.20.1.tar.gz
+sha256  b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c  filelock-3.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 8201fb1e66..ec958869a0 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.20.0
+PYTHON_FILELOCK_VERSION = 3.20.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/58/46/0028a82567109b5ef6e4d2a1f04a583fb513e6cf9527fcdd09afd817deeb
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/a7/23/ce7a1126827cedeb958fc043d61745754464eb56c5937c35bbf2b8e26f34
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
