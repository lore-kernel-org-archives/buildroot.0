Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D411DC5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5AB9606AA;
	Mon, 10 Aug 2026 08:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5N8IvBFCDjQ; Mon, 10 Aug 2026 08:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6951606AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786352230;
	bh=1M061R/PHKkB1R1yt64CGDoOgmAdo3QVoBLDmIygnaE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aGNkOG6E1R+MF+5WwgAx5fUKPHdn+CAuUO6kjN3sSP/KbzPGm96cJ64179Q1TGXYh
	 hA/+ycVdjOzbraCXlU069oKThMuw5IlLP0+7x7xeHRrV7aSWPCT0eINGZPqh8GqblB
	 Bung38FXKK2assHChiwXXMO2L8uH3TaJPcLLKVLUyANaK9Eg2rBKkMvq7vgYMkOZn0
	 ukkha81KvVEZpUhA73oypaqFyazKEMlocLAJk5u7YeezttQzgI6Id+dSOgPkY4gh3N
	 ljJl+vy6pYLP56mBMw37Oj2Ssruf9aaVf7ck7DJBi1pFbkOCc/hQ4wK+1Lh/bDcCcV
	 thfsaP/KUSd0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6951606AE;
	Mon, 10 Aug 2026 08:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0533223F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB812606AE
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OWq9kqoxxyH for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:57:09 +0000 (UTC)
X-Greylist: delayed 457 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Aug 2026 08:57:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34BBD6064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BBD6064C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.24;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34BBD6064C
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:57:07 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1N4Q4m-1x3kx62ShS-016t8y; Mon, 10
 Aug 2026 10:44:22 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 10:43:11 +0200
Message-ID: <20260810084351.22262-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oubXfdmc80W02SNIeMI7ebAPw8ILOTFPZ/d0WwNcm1WqQ/LWv36
 bdNGxTXjAs+BR7BncZO9zwomQOU4tURqnArvrGrOidrPdj/p7wug4kE+HKoXF5DG00j4wMk
 nXlJS3ntKCbNSKEq0FjmToWem8/K1YZI8cNJTQDbzOUjgQZrqVmD97FJ/9jcL3CU6PBJIOU
 YKXZZRDW28z3KZYVVvG/Q==
UI-OutboundReport: notjunk:1;M01:P0:tBadClHQcOQ=;VuMPjPV7wHXPc4w9KzTGR7g91rT
 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
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: security bump version to
 1.9.6
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

v1.9.5 fixes CVE-2026-53586, CVE-2026-53587, CVE-2026-53585,
CVE-2026-53584, CVE-2026-53583.  v1.9.6 fixes other non-security issues.

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.5
https://github.com/libgit2/libgit2/releases/tag/v1.9.6

v1.9.5 also replaces a bundled vulnerable libpcre with libpcre2 and
updated the PCRE license in COPYING as a result.  This is mostly useful
on Windows; On POSIX systems, libgit2 can use regcomp() and Buildroot
already asks for it.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index f30f0c528c..38486c4e4d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  824b73bd13647800fe4b566a1008ae77fea0e3e3424edab632fcfd8c0b14ba8b  libgit2-1.9.4.tar.gz
-sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
+sha256  a88a42a4ea9bdab7aa8686eead3bf7d9c6dd74529caca16ab22eaa92433d31d9  libgit2-1.9.6.tar.gz
+sha256  e0938121c0554985fe17196ac38fc590d149268e9c46e0c0e7a2eae1354fae71  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 5f18be9550..b4d9984540 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.4
+LIBGIT2_VERSION = 1.9.6
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
