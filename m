Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2BDFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 09:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C8761ABF;
	Sun, 26 Apr 2026 09:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCqNRwbs74lw; Sun, 26 Apr 2026 09:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E144617BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777195628;
	bh=hCxkK/PE5i8JAX5LowwXZsGUlN9fvUldOXNE7lHYknI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mNJr3dWGxvwBt6d4XZD2a+KAYl3KLdfgXBZgHnJ4di64k904WSAFT5JWr5/AHP06f
	 ZC6MDkYqZr3yWiziqlDMFRBVnAtb46Euzh3+RLdBE6qXgbWen8Eu6CVnxrt0QP1dU+
	 5OllcCpAloE8pZ4dwHZhaaW3Sa5w8paeCVfct+u1LqdIhhfsQTbZh9VxNdw+KS3ZgU
	 UZ93vm98GgVyvAayXrrSnIE4TcemGiHRrypSXDfdDbzFD1O0wfuncFzQKG3C87eM0p
	 +xmFMkDTwOFE6fmvJMX0SP/HRfzewhN6Utm5WAF+Tm+KWgPtXN82YPbi6paPtU+jL8
	 lV+wdEgxrshAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E144617BD;
	Sun, 26 Apr 2026 09:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B922369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219574283B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUOOzagQPzZX for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 09:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D55442839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D55442839
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D55442839
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 14545A4C0CF4;
 Sun, 26 Apr 2026 11:26:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGvl6-000000002lk-33yz;
 Sun, 26 Apr 2026 09:26:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Apr 2026 11:26:34 +0200
Message-ID: <20260426092637.2320150-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777195599;
 bh=kZvqMnRGeozbddlTJPCvAsc/0PyWiQd0C+cXN420oFM=;
 h=From:To:Cc:Subject:Date:From;
 b=MBErtfcnoMGfQF/lfpe9yD8fXGSGOKEy8ItLFnic4oovSZwEF3UXrjnTcxdc2yJ6O
 y/4bl3kKq+dK8zdjESEWsnCZWMqyo+zp1zYJfl3r7UIW10twv6bYkDJ9dNVBaLt2yC
 rwPYexOZsrbwOqc6HZPLCZRmuG02Lf7vC0fIWzTbusX6v1IaCTQ8VkUmsy5AitAa3J
 f8N0tRViF7NEN88mh1OGGKtpYbdkYfYfvYWIx+VEIeCgFAnVuo8k4RfIPi5wUHBTz6
 ov+hdGgfO+dWzOI1qLdQyvdsjc/HLx4iYJDMZiTTg1J14iLIlUPxXYbQ6qohfJNt2E
 IaFnzH9ZTWbxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MBErtfcn
Subject: [Buildroot] [PATCH 1/4] package/gnupg2: bump version to 2.5.19
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

https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000504.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index d607e9bb86..2aab6111b4 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
-sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
+sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
+sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 1f7ff43e07..499532c551 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.18
+GNUPG2_VERSION = 2.5.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
