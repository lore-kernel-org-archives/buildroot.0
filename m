Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8BA107761D
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAFD960C22;
	Wed, 18 Mar 2026 20:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyzNbsBsYH23; Wed, 18 Mar 2026 20:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB6A060DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773866975;
	bh=epbnpmZZUeD3NMAve/pl7sE/gnWDmIjD6WMs1K+lxfA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YOhRdxHwtQ8SQrrav9rt2hZEXbNvYoafFUfMMabbkWg1Z+Dqgu1USGStFA4aanwsq
	 9sggG0REO2NA7aBCN7tNNn04H40ssQ/YydBQu5zvQtthvMQ0NmJzqSJhth1Pj6KAJW
	 9GDUzRQfcZhGxToK4mkHb6DQkVuoALR+WC8zGUBOe1aEw2oBGxeURJFv8UVY7IZews
	 ttmqYes91vrRR+Np6fZI8gwvjm9Z1jcyyAep2WO07Q9MUbxn+amJTaAo9+XBNp1JKm
	 aOBYorJHB0OnP3yx1Ti8/Yn6axFT2UFe49H3Ogn53NGwcfF8VV5Pj977ISF3lpUurJ
	 CnkI+TUBtb5xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6A060DA3;
	Wed, 18 Mar 2026 20:49:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB371B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7905B60DA3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oH7qFPygD_Rd for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CA9D60C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CA9D60C22
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CA9D60C22
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:49:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce09.dip0.t-ipconnect.de [79.214.206.9])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BFD4A4C0DB1;
 Wed, 18 Mar 2026 21:49:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39266)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w2xpX-0000000068Q-2lXd;
 Wed, 18 Mar 2026 20:49:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Mar 2026 21:49:28 +0100
Message-ID: <20260318204928.3438683-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773866968;
 bh=DIrkxSccTHTS32f3rwx/iTwAbUvxQBS51msvLsVORSQ=;
 h=From:To:Cc:Subject:Date:From;
 b=n4n/CGw3lQZMnRCQJ/VLYEmEG856ggi8BKAGr/OrEOTR0NbWI3xU7QGNfGX7I23qO
 YW73EOuhS1jewl4onCYiOzJbhFZ0ZD+7TEkvAsvs5YOVyZNlU/Y0kth+xZciDCTNtp
 0TxukIDxcDYX+9QDeiKvu2lwho792PA/pcP/oTCkaBbnQqlQVLKABFVjUXk066lXYJ
 wcavSPCUdWpC4kHrCj62yKvHzX21W/aOMwUUKPeZ7PsrA57CZYbRI86hcq9iik2hCu
 Y8CDPNE0AZzsPHDqc6l27Jv2FbDe0SJ3o9mttdS92eS0Gi5JO9m68aMiWqvTWN2uoK
 XiNe8WcEESJuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=n4n/CGw3
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.5
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

https://github.com/libexpat/libexpat/blob/R_2_7_5/expat/Changes

Fixes CVE-2026-32776, CVE-2026-32777 & CVE-2026-32778.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 7536e7cb1d..37a9c2ab9f 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
-sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
+sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 215c34e9cf..68af751233 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.4
+EXPAT_VERSION = 2.7.5
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
