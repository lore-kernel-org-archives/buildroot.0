Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37C4FF8850
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 06:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B4F849D8;
	Mon, 27 Apr 2026 06:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emjBXD1BfhuC; Mon, 27 Apr 2026 06:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC22A849AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777269978;
	bh=tLHhOFvBw1BNkSN6/+hoqd+ZrXYSsV6Onu3/EtGZgSo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WvRAMMWP/eHkhoY5kHJxRW5SPWp8CpDHYziBo3ShIX9Wp+lXSWT51nF37BaJml2Cl
	 EE5i8PmiiOlpoYlxqvZPkVXgVUs7qdLoByvhvCU7OODbuLcPjxA2ry0cKelqj6x0hx
	 GgW6p5ICP0wMFqJAZUODxfM8LUoOp3VtPWefx6QOBILCB6aQedkZNtH8fMnxCYjJfd
	 jKel+APYxt82Sa/Hz8fKI5ev3aMQ06UgfigVHn3O0sAzXwNvOJXFRJa/AcK6eLw4w/
	 qK1yQfxkcwxM5s6mg7E5m3Mkg1wUY2MdIYqbOEYBASZRXGaoLkT8v4DhchWM/0F4Ne
	 PfLQ+vmL8ujSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC22A849AF;
	Mon, 27 Apr 2026 06:06:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F1D231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25F284256E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raZoOQy62YeI for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 06:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B9FF400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B9FF400B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B9FF400B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:06:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27D40A4C0CD6
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 08:06:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60632)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHF6h-000000007iU-1i5z
 for buildroot@buildroot.org; Mon, 27 Apr 2026 06:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 08:06:11 +0200
Message-ID: <20260427060611.107651-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777269972;
 bh=PrFqygd9+xB13uGSOAGT+y8LJsTpPqDK7+VH5VJWknY=;
 h=From:To:Subject:Date:From;
 b=Qdne/D6hC1S85PtXQNEQKaBIXWjff/8L9YpIbYkEwHGnf9rCDbTDYPQGjIjo5AXIV
 1cuyzhFvFlWMeOt/u+7u7cFodZQyqcxBotcQScMySZxz9UP9LNVIhz3rTz4I7EVGde
 YYwZjw87+sHABf1auCkiT6aX5+n8i6ruzIpJaIwD/thtxG5QZxTwOI84hdIKBFITG2
 Muo0fiROW8AxnYH2VjuBfqi7Z9BWIeyfGWb88RhQkt25PpLsW4ldgjBWNiTAyH/TM/
 XRK2pzqkoBmeToC9bUc5P6qPv67UOsJ1s3Sne5brB9Q/wqgNielM5KtJqXYfQBAN33
 p5vKAFMJakSaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Qdne/D6h
Subject: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.12
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

https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index e38586b0b4..d986b68518 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3bbbbd32f568cdae3e03fc735b1783d8cba605a2ca6056d1b971143d7ddd517d  ytree-2.10.tar.gz
+sha256  2366d2d5fc1f644460323863e5be9974584bc9b2d66d7247165a8ff1a0991114  ytree-2.12.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 162b2a1c02..c597367f9a 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.10
+YTREE_VERSION = 2.12
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
