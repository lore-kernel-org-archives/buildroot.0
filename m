Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A63BD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 22:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB22081303;
	Sat, 13 Dec 2025 22:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srNkaQJWNC7C; Sat, 13 Dec 2025 22:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8329812F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765665948;
	bh=hcc1YfInnFN3VSg3CVY0hLMFf+rRjnYEDOVvslef2Cg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2H+bAXh0NU0+bYeSVCg0MploxIU2DlG5ACpK8+bRVvWED5ZwOZBiGs4W/eazUZ9P
	 mxX+lx5x3LJhSv+StldISGxN2rJydiU/HOxjiK8cx+HU5hTgZoGJ1omAcJ9H/usBnB
	 JB8XUxBEnzeSvyPGYUqFtrK5e/hKefwZNPFgcO6tqIfT9esS/TmFlIX4dwoaP2CZj+
	 ftOS3ldcngKkheWOPol375jhozIPQTWIBFchTmVosXT2kKit882eOtiDPwPuq9rcjO
	 YItF/n6bwbfZoXxPKOKISSPLGYGyMJ1rETytq8EUuzrlKMyhkYmenqcTiquxA+QOG3
	 t/vE3wBm8UbRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8329812F7;
	Sat, 13 Dec 2025 22:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E547B13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB1B6401E3
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMzdkHG3b-90 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 22:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B48540130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B48540130
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B48540130
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 22:45:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c513.dip0.t-ipconnect.de [79.214.197.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B4A0A4C37CA;
 Sat, 13 Dec 2025 23:45:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUYMv-000000007lS-0U8s;
 Sat, 13 Dec 2025 22:45:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 23:45:41 +0100
Message-ID: <20251213224541.1760321-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765665942;
 bh=dCL3CimihelklqqB3Augrna787CuyxvPy720oSOVjhk=;
 h=From:To:Cc:Subject:Date:From;
 b=KX0rzXnaSCm7NHRrWUVejIls4/DzAds0ZBhcplhS748yc1xT5w5fRmvAHw+HAMIau
 RjAWps2UmWvHsHY9mcuno1x9yAcVbFFtQhJoRYH8GdX7f16ULDqzaFs/rQJaECBFvp
 A4y/IRI/gbEEeCM2MauqUeeKRQ+s9CYEFXTwNw5kv8w3p+VJTvcK+pVpiTWffcproE
 Em0AQS5s6yx3sXhbZEpgKMiwAp8GCEx7jjcHFDoXOgZxx/621fBkIYbdcRXvIfTNZy
 X80d9qufrDF806FjEi9h/3cRjlbRKx/lPw2t2EZrIOkFQCztfET232R+Nn440hz1pL
 vLzpAsU0+3kSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=KX0rzXna
Subject: [Buildroot] [PATCH 1/1] package/bpftrace: bump version to 0.24.2
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

https://github.com/bpftrace/bpftrace/blob/v0.24.2/CHANGELOG.md

Version 0.24.0 contains: "Add support for LLVM 21"

Buildroot commit d6a7c0226333138721ae722b89e31a82cfb22ae0 bumped llvm to
the 21 series causing a build error with bpftrace:

CMake Error at CMakeLists.txt:168 (message):
  Unsupported LLVM version found via
  /home/autobuild/autobuild/instance-14/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include:
  21

CMake Error at CMakeLists.txt:169 (message):
  Only versions between 16 and 20 are supported

Fixes:
https://autobuild.buildroot.net/results/2bf/2bf26b4848796ab031ab0767b97aba63a35f1184/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index a3d62e072f..4add96aee3 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  3b374c3618ff055d279ddd2fcf4393feb88b4b03284b8b6f69f1e0dedd20662c  bpftrace-0.23.3.tar.gz
+sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7ff0508486..4d7033eb9a 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.23.3
+BPFTRACE_VERSION = 0.24.2
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
