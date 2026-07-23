Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB39C531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703058114F;
	Thu, 23 Jul 2026 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wOrvCXZUvqm; Thu, 23 Jul 2026 19:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E4281132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784836637;
	bh=hapALCQSVwYVEt0kJPZgL7scBDpWwb5UJjaQicCbzds=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N6U+BeorPoMbEBVyrqaNlEysD2fGzsdbchD6u+D404CvwEdr1QQ1N7ULhIzYHLGmI
	 oADCKhjRfaVtyj4tiNA1IE809Yv5uOplQTeIl1wXQnbBKSQfdbzMQdQFLSOptbYpA1
	 nqR/Rpr7xcViwTQbM8s4BSkIJvcVinCHOIFwVSGQ/gaJMEuUeVaJ885W4gLeozfgAL
	 eZhYBvUY/dyWFzHK3fuQPSSeyvd/mU+ny4SY/ZxYNIKEdggZcjjyYDNjdyPzAjDBJR
	 EyPNAiOzEf9dwbNWlYixD9BjiGtC5w+mgqGUxp5mGqZQ2Mo5pjBJY2Ufn4g0BSnKR6
	 2j0IHgVwJP0fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E4281132;
	Thu, 23 Jul 2026 19:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5A042A
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E96E760AD4
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H17YHwUt2vo4 for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 19:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10FDA60AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FDA60AD2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10FDA60AD2
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:57:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0aa1.dip0.t-ipconnect.de [91.58.10.161])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FE88A4C38EB;
 Thu, 23 Jul 2026 21:57:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50942)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmzXb-000000001U8-15sh;
 Thu, 23 Jul 2026 19:57:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 23 Jul 2026 21:57:10 +0200
Message-ID: <20260723195710.1465177-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784836631;
 bh=uleaM1g6sld22gcfwr5R2VNwFbGl4v+3GqSZJhd8PUA=;
 h=From:To:Cc:Subject:Date:From;
 b=bNQptWWpm5wTd6WN6zd7UFrBsVUAewAXBejyG0dtsm08I2R/4iSna87DPFyfmAXmS
 j4U93y9z/FXEpBXRfirbSDWVZEvNa0L3PojACOL7LNoQQk1mcvFF0QsfLZ8hIYy4r7
 lFuhcJixix2NeNn7Han8Gar7wv1p/lerkYDjnnH16+cDLLnNISe0oxuNNVFs65HkuG
 gLBMtytI88Yu2LmlcYY3WezltmjOQlOQSrDRNtzo/ynskmE/W8PEgVQNGfQEonW5iz
 04Tj9+5lsqyOMyE5DhTMXUhv+JUpaRQDf0NeQAQ6fG69kO9QVxVO+eMcEZyZbrnVkC
 RRp5bQUj0kAQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bNQptWWp
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.26
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

https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html#notes-for-bind-9-20-26
https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/changelog.html
https://seclists.org/oss-sec/2026/q3/208

Fixes

CVE-2026-10723: Incorrect acceptance of NSEC3 records
CVE-2026-10822: Key Record using PRIVATEDNS algorithm may lead to unexpected exit
CVE-2026-11331: Potential wildcard CNAME RPZ policy bypass
CVE-2026-11605: Unnecessary validation of DNSSEC signed records
CVE-2026-11622: Potential memory usage beyond configured limits
CVE-2026-11721: Cache poisoning possible with label count discrepancy, RRSIG, and wildcards
CVE-2026-12617: Record ordering based unexpected exit with CNAME or DNAME
CVE-2026-13204: Unexpected exit in certain situations with NSEC and NSEC3 both present
CVE-2026-13321: DNSSEC Validation Bypass via Out-of-Zone NSEC Next Field

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines
https://gitlab.com/bkuhls/buildroot/-/commits/78563f67d06099122f817ed8e1ea9c0794726c81
show the same 13 broken defconfigs compared to the git tree without this
bump:
https://gitlab.com/bkuhls/buildroot/-/commits/2d23bf7cc9ebc2e86374021b5f07013fa2d85429
No new build errors are introduced by this bump.

 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index a1ff3c6101..eb39e4b057 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
+sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2b8156d0d0..172bbf79b5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.24
+BIND_VERSION = 9.20.26
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
