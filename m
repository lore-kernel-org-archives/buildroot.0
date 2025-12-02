Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D992BD12673
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF567613C6;
	Tue,  2 Dec 2025 21:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wygf0Xn8Ddg4; Tue,  2 Dec 2025 21:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9C6612FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764709359;
	bh=DJb4IpDLWuSIxKGfMzGJygYL1sFyYQCnZdcJ6ASat+0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YgdqJN87BSw7VcFBZdh2JIcWg2VKOKwCYQZ4u6//CaQ0ZZz0b2sh5ABifWUjLqDnH
	 sn6VY4RzBzLXgDh0gbbrlkJ/dF7W8NAhsicNuPWyyDAwDF+nROSylRS7Ptad/oyKeY
	 XxgjILQxPYmIi0fIypIj25mIWs4Or9wr31A10UxO/P69L9yBmVH4Ze1Nfwgm9q7p6G
	 v/LKTvnf82CtTbyRwZXFOQ32xA6JWm+QnPIZjYNcyEeucNuxGwOk8gKZzLfDNbjmv8
	 +2vBXw7zgGAsOkwD21gwwm//cPTjOjvYpD4sHNhZQyBDqGlwzLNQ/cKGGJClIwC/sQ
	 IGigDuGoqM5gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9C6612FD;
	Tue,  2 Dec 2025 21:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 326E4E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2439584035
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6JaUt-jQ2Y8 for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DB5184033
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB5184033
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DB5184033
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:02:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CD98A4C77FA;
 Tue,  2 Dec 2025 22:02:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34836)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQXW5-000000001ZW-2Ide;
 Tue, 02 Dec 2025 21:02:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Tue,  2 Dec 2025 22:02:33 +0100
Message-ID: <20251202210233.2588746-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764709354;
 bh=CwaDnTh/f90c709CmY9R3IsGgWJkxYTXh4po1sCnVJk=;
 h=From:To:Cc:Subject:Date:From;
 b=gbbeBKmVrOqGhHSkIxFgNL0sUmHU3Yktp8hLc9hUkRrCj2luwbTkwoDVu7ufZMhPg
 P2lReCOO7FaGo80mqbu84rcpc+amANea+KPgy3h3+gR2/Z5giyLrpXJ/8rCDT+46vS
 L6srGoabR0AH24SD5PMJfdjHxIJ9GKNvTKQY4SnT0FDgYTsuCmQKvtDXb/G3GqS4q6
 x8JUCF9XHkTuvaIGvmIjqx52t+s2SV3eu7XdTuHKKJF8bQRNbScBveEe21txwTogcK
 0z4HxOjS9LMmf3mxDOLeJuKBDJs90wlo1TXrNpd3lyjjLnbsiUpwomdupeoDgE1he8
 AzXRX240FHjYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gbbeBKmV
Subject: [Buildroot] [PATCH/next 1/1] package/cli11: bump version to 2.6.1
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

Release notes: https://github.com/CLIUtils/CLI11/releases

Updated license hash due to copyright year and version bumps:
https://github.com/CLIUtils/CLI11/commits/v2.6.1/LICENSE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cli11/cli11.hash | 4 ++--
 package/cli11/cli11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
index 42ab5d1311..787e9535c0 100644
--- a/package/cli11/cli11.hash
+++ b/package/cli11/cli11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aac0ab42108131ac5d3344a9db0fdf25c4db652296641955720a4fbe52334e22  cli11-2.3.2.tar.gz
-sha256  4110754959bd99e0ebc34001ed0402ff5f371364e83f9db6d1e230d02368984f  LICENSE
+sha256  377691f3fac2b340f12a2f79f523c780564578ba3d6eaf5238e9f35895d5ba95  cli11-2.6.1.tar.gz
+sha256  3a70a5dffdaefe4c434660a8270f679ae18dd3c34208fb0b461a665bfcfe3e97  LICENSE
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
index 349c14fe60..b47e531f05 100644
--- a/package/cli11/cli11.mk
+++ b/package/cli11/cli11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLI11_VERSION = 2.3.2
+CLI11_VERSION = 2.6.1
 CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
 CLI11_LICENSE = BSD-3-Clause
 CLI11_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
