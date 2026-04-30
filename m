Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CAFF886F
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD45D849F5;
	Thu, 30 Apr 2026 04:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apCSfgXaWZ3L; Thu, 30 Apr 2026 04:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A6D849EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524109;
	bh=p/VSf4POIPI245RInZI4SJE8AFAq5an1KrbegXEdirA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rsMYgElMmGBSURvD0LcZNY/65peIyMXJI9PW+4zX+0TCuwFaDfO0A+Nf8F/1LhKHB
	 Z09y9XgKv/FYd6yRbVHfa9mROTPdJ59k5NQ3hSUOmlvJ0QFn974MOP4D15517gEmLK
	 m09vaR2M3OxparT+A5bejJPuRZBkuzKYu2v7+LJeh39OqWmBfbIE+VZeXDBktq13xr
	 R2+XrFH8SacBSlg42rYOqe1h7bMI7JPDbmqp699hgkapLwIsi0z7wCqKqo4osUJz3P
	 knvwslcZUHDRKAuVjTB988g7svferHp4NH+qyzAhv4H/Etw749cWxAQjWJSOmD4PGu
	 el++kM+cFiFng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A6D849EF;
	Thu, 30 Apr 2026 04:41:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9377B18E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796B3428A9
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ-ZUSaV3YzV for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65ED5428A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65ED5428A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65ED5428A4
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67813A4C1429;
 Thu, 30 Apr 2026 06:41:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33632)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJDb-00000000745-2lF7;
 Thu, 30 Apr 2026 04:41:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 30 Apr 2026 06:41:44 +0200
Message-ID: <20260430044144.7757-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524104;
 bh=sthvk9szO0vAnXxPT8xBr+webBvwB+Fl3EGDkPToLBQ=;
 h=From:To:Cc:Subject:Date:From;
 b=iVWyJqG34tzIELTszgKHhUM3e/0lxa6fVGgrvzuCL6bQDbNmAGqO0gpoqLUvAHnIH
 oOdOOSiQduxteTpgwfh9bz2mrBbqIXxRCZDmwHYQ+BEMHhfLUiWWTWDmpQDL/anqoB
 W/AkAYaCnQovzRfEbQhEXjREUHVx3riG+JhE5WquQ+tu7flbMylzAClmoVXswbQ0Gx
 ZX/bNjHiQaRNYKwsQ9QIN/9aRcb7wERwJeUq5lIHyni2QMNi5+obxrKKHyJ5MFb+Vs
 +TTZjh01o60n1Lpxv4c1qH/XCilZXT7aoNG97u2xKOXtZe0E5V8tHM5TBIx4vSfmLU
 0Ndqc7dKsf52A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iVWyJqG3
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.2
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

https://lists.exim.org/lurker/message/20260429.121733.f58d9686.en.html

Fixes CVEs:

CVE-2026-40684     Possible crash with malicious DNS data when using musl libc

   On systems using musl libc (not glibc) due to an oddity in octal printing
   it is possible to crash the connection instance when malformed DNS data
   is present in PTR records.

CVE-2026-40685     Possible OOB read/write on corrupt JSON in header

   configurations using json operators on invalid externally-provided input
   could trigger heap corruption.

CVE-2026-40686     Possible OOB read with large UTF8 trailing characters

   configurations using utf8 operators on malformed utf8 in headers could
   trigger OOB reads and might trigger some data leak if error
   messages are required for subsequent emails in the current connection
   and similar malformed headers are present.

CVE-2026-40687     Possible OOB read/write with SPA authenticator

   in configurations using the SPA authentication driver to a hostile/compromised
   external SPA/NTLM connnection it is possible to trigger an OOB read/write
   and crash the connection instance or possibly leak heap data to the instance.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index f9a62e0188..745b9f0977 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
+sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
+sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 47fe17b372..7129e2ebf6 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.1
+EXIM_VERSION = 4.99.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
