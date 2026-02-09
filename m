Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF08E94603
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 20:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1273860E73;
	Mon,  9 Feb 2026 20:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh5zSKtukoM4; Mon,  9 Feb 2026 20:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A15660E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770669150;
	bh=e8rwO6WNVCKjBA9aX/mH7sTY4HeOPGJ8bmZ7tJwS6Cc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DtEHw1+h4hN1gyhBv9UEDN1ToW/2ZfH3q6zJPMr9J40Nygq7Xc7mzfjSaxQJaF+WJ
	 XEjBPga6DwsYYjSAqXrNRa2JEUMsGRvBwFVEdnneM7A8OICmW9fAqpvWk3jtoHrV5q
	 muu4C6ZRb+vUFBGKCBKY4W8tzCIcuGAykLXZ95uq7a50PmFwpHPqUW8OgqQcefIzF8
	 Kd3YFZJZZX/mzhkPdS9OESjYgrSIQHNBvwU6ZHfmvCfwWqFUT8ev+z3C0oeb19a5px
	 rjlThVCmhJdt6Xv201DhnCI2z1VrWtlS1JZMA/TinqzxTW5Lp6z1f/diOhYIXBBFWg
	 g7iXE30BFfDjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A15660E84;
	Mon,  9 Feb 2026 20:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 807B4F2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 625B540919
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2OKbd5TAXsT for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 20:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37B97408DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B97408DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37B97408DB
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 20:32:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b67.dip0.t-ipconnect.de [91.58.11.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6667A4C07FE;
 Mon,  9 Feb 2026 21:32:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32924)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vpXvX-0000000026i-4B96;
 Mon, 09 Feb 2026 20:32:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Mon,  9 Feb 2026 21:32:12 +0100
Message-ID: <20260209203212.3837393-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770669132;
 bh=wY4rj6fkic0loc/Fc0qHuJwWtwLGbswdJ+KCD86sRkI=;
 h=From:To:Cc:Subject:Date:From;
 b=qZbqfeNEsdjPh12owGx7X+h8foU7PE5Y4PbWfMzDQyUG0t4JU2OSUWWeebg+Orlsx
 snuNtseUUM4H5s6iSwiAL3IH2+44StUQNraTNBE7wD/oWrWsEoPUFm/wRDL3RyowtO
 a6k/2hWu/1YMUj+iIPRxGB9A/7oMYhMMTeBk5GPP0HeBbcl7kUS4OrxBxt9Xx/ZPXW
 znJyVBJ+m9LjCtSI3vPo0Flrb85mR/CgKxqFUcpeNHMAdZiCx5YB2ynNO+2LVzHoFz
 VhoxuGFj9WuewujpPQbfaqb5QDJ0CgNbdVVCKLndZtD7bFKlg5gZVr1hPKdPQiNDSs
 JHe1v6g+aII6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qZbqfeNE
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.02.04
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

https://lists.infradead.org/pipermail/wireless-regdb/2026-February/001830.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4b2c67965f..39fc1a78d5 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3  wireless-regdb-2025.10.07.tar.xz
+sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 055238be5e..31bc9e9a22 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2025.10.07
+WIRELESS_REGDB_VERSION = 2026.02.04
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
