Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5666F99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70E28227E;
	Sat, 18 Apr 2026 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hNmOu-ugjRD; Sat, 18 Apr 2026 16:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD3282275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776531195;
	bh=lsHUKfYtsOqnSi9wy9xqabebATcStkw888mNfobFz84=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VKLOfShyS1yGSMKatK28v8CSa/RiX8Z7r250CyLs777Hwg1kb+Q6+QUikLr3HuzVq
	 BTHGrO3gbDguIMgq3QZeaMhf3F9K3ALCDMxvX+JwO4e6CyBIkwXlLoK3ogO/L4rN67
	 xoE7e/eP36PUmWDVZ1kN0oEfmrTKt5iUMlrnayn8cc50RbB9RLnGbedv1l26PNtklq
	 yQUL4fHNHLKCkY0ajiLnIZFNN5zoXRg3Uicmzefhwup+jQfLqfpD0ES9Grt4AsSppp
	 C460zaoOlX5i549JQA4QVj4s5pbYJhJfRSOS2UiOHlbEC4uhsUkg+A9rW2sHS7xO63
	 ZaE6K+FphRMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD3282275;
	Sat, 18 Apr 2026 16:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0797A347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED6A140133
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xPH6khFz5Gk for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 16:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.164;
 helo=smtpdh20-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4F964002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F964002D
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4F964002D
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 16:53:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id E8upwnnISEZ9tE8upw75zV; Sat, 18 Apr 2026 18:53:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 18 Apr 2026 18:51:03 +0200
Message-ID: <20260418165103.696186-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLxFKv/oy9FrnhEk5zwhG6q/K3rlKyu2p8ZecZDDmI8JIaZykgurtxBUBNkcDaCe2yYWxf61F7vxUIPrnpC0x9KPv4ntEs7S5uMlQgOarwaGJ6TLEuVj
 GAK1RJ7mnMNyYhBt90r/sDckjymHkIyiod1ifVhzSZBAWDY80vzWZS7LmblZxQ8krcJG2f48Uga+PDwLlQ6dQKPUNr8VsYRf67eP3Bfly4LiI35sfCR+yT1e
 Bi0CzoU9sYRx4o4gOgQWtE7pETnIt0XNG4MjhLVM0kg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1776531188; bh=8KDX3XEp781JKn5JYsxqE7Wq3wJ2OMnJlppF4QshucE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Xnb5X26t9hHtHbxsseI1WihyWkEH2LqH2HMPQSfW7F4JvVN7MsiB4zhZALSfog+VX
 0RpWPOEPUb5Ploc6Z8pZRf0FxZYTZSpJdDg4LIQ9vGqQ7X7UG6ndkuDXMpy6Sxar8r
 ea9kfE7T6shgbJ5I8r3hSKT8DLZ7lkpqgVnAAbcudEINbodDRLBK2lx6MRCGevf+D2
 8xFWefXp3hBrLTtvW7kk/XsPa1V4NzljARqGUt5K9+lU0dWJjQWz2B/4pwFSAN0Kox
 dFSyQAdB7C1bq6OaDxjiOerglaHF/w9UjK0/OO/lVUUOVNWQ9WaSB7vecYwoqolfGo
 dEdYkdGwNLl7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Xnb5X26t
Subject: [Buildroot] [PATCH] package/dash: security bump to version 0.5.13.3
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

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759

Fixes CVE-2026-31323.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index aa41d10af6..9959db4dab 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
-sha512  7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f  dash-0.5.13.2.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.3.tar.gz.sha512sum
+sha512  4f463ea9d9bd72cb9852578a43ce04a211e2e775782f4cb6b2af328d51f80fcf9cff3255c519f60027f7b0d8b9d3c9ebed100925bf6324bbef81381ebd3c77ae 261024 dash-0.5.13.3.tar.gz
 # Locally calculated
-sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
+sha256  a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1  dash-0.5.13.3.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 547fe8c9b0..8c9224782c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.2
+DASH_VERSION = 0.5.13.3
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
