Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD396FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 19:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB80846ED;
	Mon,  4 May 2026 19:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rng5472Tsic3; Mon,  4 May 2026 19:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B3DC846E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777922637;
	bh=iIs+gjkFoLOQK3lmyAb80tZ6osjJf+2yEFsWBbhqSj4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YU9U2brpd6orfxKNrgIt45U+S3VHO2d2nWk5kOSjThCo2VS1V/I+8giqGS2U0Mi9j
	 eV+lAV/DA7BJdgWh9r4VqpLrc6WTWNJc5nl0yf+IB6XnEhuacIhUm7ZMlXwHRbXkS2
	 2sp38od2Krqsv5douztxtBcntEeVzaeQZL1pS28XlPnnfKnm6S6pzQfn9o0Pb44dPM
	 7PvlOOibrmCLxcmQwLuZ8yZotiyQCNlnIlBe+2MJ9JKEJ5gnTecrS06K8mISyr8/26
	 lfyfCCEUE0fygJfiVdq70cAytyLM5U1V9v2JLM5uFtWqIQYgVAU+NnlhMYlsRJYJ1G
	 WlyKlgXUYOzyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3DC846E0;
	Mon,  4 May 2026 19:23:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEFC925D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A10F241BCD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzzzezHKLj7z for <buildroot@buildroot.org>;
 Mon,  4 May 2026 19:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 130EA41BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130EA41BCA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 130EA41BCA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D130EA4C0979
 for <buildroot@buildroot.org>; Mon,  4 May 2026 21:23:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53154)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJytT-000000001Vo-4696
 for buildroot@buildroot.org; Mon, 04 May 2026 19:23:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 May 2026 21:23:51 +0200
Message-ID: <20260504192351.3971764-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777922631;
 bh=T7T/8OYfnwDNvs+kzsfxXF/YJ9Rv7tLC+zEtOFtU/IE=;
 h=From:To:Subject:Date:From;
 b=gnDbFpux9NzVcY0fWgJRHk24lcK40fSZNQjwmVv2YMzrtLhRdSDs6QT39WOpeXKg4
 PE+PA6VBYoTQqhxoNTsdRQ6qilvQ42IBiGdsRzU6ligIyutvaFjGZsFNJcgoA0NziQ
 xFdGkZv7vgpYrpud+1buuOzTWrpEQSlPS2Ce6WDPZCUTFZ7FaWXNsAQVc4UkkmfW3s
 UmJu9CT6XsWSHdFfDYEiJwoqE7E9xsVO9+l2n+0ARmbHkV+tFKFRPYQFhsh/gBNOyj
 saxgorzzFqpAtUxHFyWn5ChjvBf7af1o9SQHmNiFtKjXwqeKosD5nA4HSnBAzuZFm0
 ha/vmJ9nEg9Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gnDbFpux
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.67
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

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.67

Fixes CVE-2026-23918, CVE-2026-24072, CVE-2026-28780, CVE-2026-29168,
CVE-2026-29169, CVE-2026-33006, CVE-2026-33007, CVE-2026-33523,
CVE-2026-33857, CVE-2026-34032 & CVE-2026-34059.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 53fb05a5c8..44e2ac24b4 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
-sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
-sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.67.tar.bz2.{sha256,sha512}
+sha256  66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4  httpd-2.4.67.tar.bz2
+sha512  5ae29fc8edb253453271613cb18754de0d943d1f82361059c81f8ebe1f057b894675506550bd1341bfa9416226b569a7bac08f497c53e8bb6dede87f4f41eae4  httpd-2.4.67.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3b1574cb78..e113088372 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.66
+APACHE_VERSION = 2.4.67
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
