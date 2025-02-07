Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07FC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 596A084B59;
	Fri,  7 Feb 2025 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrcIfVKZyv57; Fri,  7 Feb 2025 18:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64AD584B5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64AD584B5F;
	Fri,  7 Feb 2025 18:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD7CCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4D684B5F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PEIiC2O0MCj for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A76184B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A76184B59
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A76184B59
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:21:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A7CCA4C490D
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:20:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52104)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgSyC-000000003HO-3YKb
 for buildroot@buildroot.org; Fri, 07 Feb 2025 18:20:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 19:20:53 +0100
Message-Id: <20250207182053.2746473-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738952453;
 bh=Eqwq3KRtXZrfokqyZhVj6j8TXnFvTpyvdrJuYy1VvSs=;
 h=From:To:Subject:Date:From;
 b=GQCg1QdLagQzvaynGHV1ToA6uqGN/j0d9MgUQjoAfM1TuQva/QqNA8yjZ9EpY+zzy
 ZKz0ukw5n6V31BMViXF4g2muv80GZVy52/0qzyAKVw77EjgqrdxC2NvChaU6a4BBNm
 JWXFjShchTekcHugIwBQC8iumQ8qzAYpZfb72ivS1hb6Z8KcUMgUaN+59lE+Plkpm1
 lc8iDRWb8Fk5O5tGWNbs/5WN3s6wYZdRAIKufFDraC999nCWPYWv7yKqgKuDUT2fPD
 dE2raRriOPYsC4jTjWFTuCWplHUo4ZxcKsrat5NuNX1rq2VKVnT6bgX7fa2n1xP1Ef
 hg2boIF1WCJZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=GQCg1QdL
Subject: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.14
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
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-14/17242

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index eb0ab728d2..def488d516 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.13.tar.gz.sha256sum
-sha256  9baf26c387a2820b3942da572146e6eb77c2bc66862af6297cd02a074e6fba28  tor-0.4.8.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.14.tar.gz.sha256sum
+sha256  5047e1ded12d9aac4eb858f7634a627714dd58ce99053d517691a4b304a66d10  tor-0.4.8.14.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 042ed75a7b..f4e1efb051 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.13
+TOR_VERSION = 0.4.8.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
