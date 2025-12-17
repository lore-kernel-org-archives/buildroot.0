Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25402D68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE55960A38;
	Wed, 17 Dec 2025 22:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkLbod4SXDvm; Wed, 17 Dec 2025 22:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F016060869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766010808;
	bh=Besaw6xqhX6EUnhCJxujLhS2v+Ka3tBtEtBjsmoXG/s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F3S+C5/8elbqpTPlsWog3Y4j9GwyM3Vsvvn+lhEECQlXY+azUe1rPw1AqSwPtJeod
	 mNq+ZPeHuqd3mR2iHdGKaF2+jibMI85571CfoGgyurGRukBzvxI2Yrw0BE37FsxwrS
	 8vItIW9O1LdiHiKPMmJKD8C3Fr01WBbJg2om4kv+Ag8IItYprjCExZ2wrdZkkhRcFp
	 yn89b5qZijfTUBlvn/eLoqrVgF5iLPrbwudsqc9vgxs0EcbD62SPguM5whBkT+RepO
	 k5jL/NixvGXnopIegI7INaLUiyA78D5Za0yGhpIHv4j4j/0Li3Wh70VAwCbeHQOi9N
	 30zWj4upp/jKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F016060869;
	Wed, 17 Dec 2025 22:33:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB74535B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B219940B0A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rUO5YA6QcnK for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1F1140954
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F1140954
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1F1140954
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:33:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 62FDB1A229A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:33:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3A3A56072F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:33:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C68D9102F0ADF; Wed, 17 Dec 2025 23:33:18 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Dec 2025 23:33:16 +0100
Message-ID: <20251217223317.1993455-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766010799; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=r4KfgTvw8viYpd74d7DhpddUhzJ7PE/K5RMZD4s0jZk=;
 b=hIYpcEYg7rFp0a8UlWXDEWlmU22fHlGR/4N4pMTiQE3j6C6YrPjcUiLeRcS5yOIHNXOo+i
 W1sA7y2i1zczrELQ3gP/daX1Z+Oqpj3NUrSabl804qfTiesMNauQFwKDviHSCR1fJYewfM
 iaVRYgtWlHnAaRkRiyjtRts8MejrRa4SgT7crwtp45sczr8MtGfbQ/1iCXLeHL8kn56AAO
 olZTT9DqLPhzZAS3am6eViUXPa2BoZ01gPh4UStWRP7VbrlHaHkC2zGkBznkNJ6KxfPYvN
 u7axiRDNKKKFFo0H8gdEBnD/fbqZnSaPtQ14hVp1XbwYEtVpvGRQNrCWGGdolQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hIYpcEYg
Subject: [Buildroot] [PATCH] package/cppdb: fix compatibility with CMake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

We didn't submit the patch upstream, because contrary to cppcms, cppdb
seems completely dead. Last commit is from 2012 at
https://sourceforge.net/p/cppcms/code/HEAD/tree/cppdb/.

There are no known autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
If people prefer to drop this package, it would be totally fine for
me.
---
 ...s.txt-fix-compatibility-with-CMake-4.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch

diff --git a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
new file mode 100644
index 0000000000..3bba81f563
--- /dev/null
+++ b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
@@ -0,0 +1,24 @@
+From 27003c60a05dd3921538323a53b1650e289cba8c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 17 Dec 2025 22:27:33 +0100
+Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
+
+Upstream: N/A, dead upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5e81b09..32ff3a6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ project(cppdb)
+ 
+ set(CPPDB_MAJOR 0)
+-- 
+2.52.0
+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
