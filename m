Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559EAC001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1129760DE5;
	Sat, 15 Jul 2023 15:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1129760DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4wuzbOiBBYs; Sat, 15 Jul 2023 15:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F5E60E31;
	Sat, 15 Jul 2023 15:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F5E60E31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B99A81BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FCEB81D35
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCEB81D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUCYFFaVyjMJ for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:07:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4DCE809F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4DCE809F5
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:07:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8776A4C0FDE;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-2J;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:29 +0200
Message-Id: <20230715150536.2959313-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=u/7futC1Nv6v5C/xP3vrOB2QAc1JXaQTM3pwmQOFM6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FFzDvzkwhUISHxOHrmGBDqAA/YDcQpBzNnST6I+SSslUGH6IgPrlVx/X4CpRZInuH
 auFdJKaT3s62q3mCpXB40GBEt2fCiM2s4pYEhBHcmQdFoLoOYzpbeulkymU2qZUMIw
 9r/z5a+0XW/ao3eNRN4p7MzaLC7teBkd5yONRsXNh4F8tBYyhC1nd3AVbL20ZnfMjA
 zBndmWnW56b437RjTFySvjlr07esPiZzQG9FMwAEXJcUIKmkiPS56CL1ml+bOvRHka
 ayK/47ItY97TYFrZZVnXF+2m7Yn9w6QO4FQyP+5mt3kgoMOJmL0giv49oed5oE3TlQ
 KZejhXW4IC6wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FFzDvzkw
Subject: [Buildroot] [PATCH 13/20] package/erlang-p1-tls: bump version to
 1.1.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to copyright year bump:
https://github.com/processone/fast_tls/commit/f5d6858f3d3c176e4c4194f4247b349c9676bdf0

Changelog:
https://github.com/processone/fast_tls/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 32d90ef7a0..9a14a44293 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5377671fed74a61518a742bc52d73941039d6e3c6e192133c7feaf5a83e1275b  erlang-p1-tls-1.1.13.tar.gz
-sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
+sha256  8c38768998e8ee0aa2bf5831bc25deeb4ea2e08bd52e26b2abfd654504fbe4f9  erlang-p1-tls-1.1.16.tar.gz
+sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 1f79bf90c1..c16a124068 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.13
+ERLANG_P1_TLS_VERSION = 1.1.16
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
