Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA03C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27366801CF;
	Sun, 23 Mar 2025 19:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nm-HUPYslBAn; Sun, 23 Mar 2025 19:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 516DA82093
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516DA82093;
	Sun, 23 Mar 2025 19:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 633061C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497574074F
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvQtPKxg2CSu for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 540A840756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540A840756
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 540A840756
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:04:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A243AA4C35DF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:04:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQcw-000000000Sh-19Oe
 for buildroot@buildroot.org; Sun, 23 Mar 2025 19:04:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 20:04:54 +0100
Message-Id: <20250323190454.3336100-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756694;
 bh=PTWKpJ1cLW+HI1wBJSj6HRV/hsEbzihBtA9vpBw9juE=;
 h=From:To:Subject:Date:From;
 b=OCZBC+AG1TI7TpW/oNZL1h/9TP4dSHts0EAfIsyu/1hLT+iEq5tAjw3eS5XctgjA7
 jK4I39thSTLWexMSfDW8MtHrDJV4oAwxoRaFb/6LIqmyvCXTTdNREfNH/JZiwPoyI4
 Sbsg6TgwN0uiGwMQ7ST+FazcxFQQQyjY9XpgMm20BpxMXGOvJRo1MJB3R0WZtPlGgL
 lmQf3UEkKa5RKwh/+6pUawxXpXny4916KsVk9Kp/VG5tRqqaaQwqdtfr/7QGPAK7r+
 BAnK1fuqgtbPBtNwRfKWr9bzEIlvINqy68CxgrJCG/kyBZB3BoOg73hCeb2t3i9UOu
 jMhBcNCxKI1LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=OCZBC+AG
Subject: [Buildroot] [PATCH] package/ytree: bump version to 2.10
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

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 78357d4f28..e38586b0b4 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6927bf7475d777c40ecc1a8e5125316605683d91a5829a9251b44f12b09e435b  ytree-2.09.tar.gz
+sha256  3bbbbd32f568cdae3e03fc735b1783d8cba605a2ca6056d1b971143d7ddd517d  ytree-2.10.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index ec59dd8dee..162b2a1c02 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.09
+YTREE_VERSION = 2.10
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
