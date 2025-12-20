Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32469E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CA960E47;
	Sat, 20 Dec 2025 21:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9IWihYo--Xm; Sat, 20 Dec 2025 21:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953BC60E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266976;
	bh=XqAQt2RdJi9rvgn5zFQsZhtO4vK6FhxW6zM8Btp6FEc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Lo87SycWdtSVtQXB13Evs/dNVBSoJG/DoIizu8HfNPhIw4qZ+Q1aRQ3pTe2mzpJzY
	 dbqo1ttKad+dUbOvGWeYmrC8ImrMSik7EOfULZLb5kOcxiC9WbaR/ITpUk2JBAf/A0
	 p33YI4lBhwZIkef6s31nnZMe+BNC2YXPZQlZjs5P6IcNSCfi0drKvdejT8HD0mr8nd
	 OhvBqcEOOJg51+/WU4SuUPG9waW8ACwiU5x+5IOnlognFD6amigGgcrmVbUElILJnz
	 uES3VyBE1WgaBvNOtU2GtObTbvOZPZOUYGofvHd8yQ3995AHRLhio5SKQAKghU6Eve
	 XeClibV0CT3BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953BC60E15;
	Sat, 20 Dec 2025 21:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AA3423D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40FCC81DBF
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMbH-1TXtWiD for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B25881AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B25881AA7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B25881AA7
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EE390A4C48E0;
 Sat, 20 Dec 2025 22:42:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iE-000000002DO-3TIi;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:49 +0100
Message-ID: <20251220214206.1089100-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266927;
 bh=Z2bDP2igmE+fdTgeIoyALmtldrCh/FBVLKTIfdWJxcM=;
 h=From:To:Cc:Subject:Date:From;
 b=Fb98PDx2LrGz1jmmZGc/W3Gfl6J8TzvEHoCpAk4M0jjR+xdN4WHMdLBw0txYVJoqA
 J1Yk2FAQllnO1eJ8xJYOid1feBL7kLLT1hf7ypmahkC+I2CBfFgKEVCagwl6dOT+5F
 n1TV0oXjV6PN8zays0eB4GuNmXc241I1Eh8te/sRh9xequYvkFWHZWIPlbhvEK/w5U
 1NWoT6nndb8bUmOWDaODMv2U/JOjKp9ZwAP2g1v98nx6QekDzYeWCLgIZ0oXFBqp3M
 CtFl0I536kUel+aPdKbrrk7zDQ7OgTMxwvsNLjwBZdtLbR7m5Byqnw+1PgdnEs7Jh+
 1yzRGXtgaG0WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Fb98PDx2
Subject: [Buildroot] [PATCH 01/18] package/python-colorlog: bump version to
 6.10.1
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/borntyping/python-colorlog/releases/tag/v6.10.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 464ec55321..9dd7dd9354 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  eded3e4cf270c1d1fabc170826f4d735  colorlog-6.9.0.tar.gz
-sha256  bfba54a1b93b94f54e1f4fe48395725a3d92fd2a4af702f6bd70946bdc0c6ac2  colorlog-6.9.0.tar.gz
+md5  177e72715015e36226abdcac193dc82a  colorlog-6.10.1.tar.gz
+sha256  eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321  colorlog-6.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index c23e1c720f..1b03c3eb19 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.9.0
+PYTHON_COLORLOG_VERSION = 6.10.1
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d3/7a/359f4d5df2353f26172b3cc39ea32daa39af8de522205f512f458923e677
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a2/61/f083b5ac52e505dfc1c624eafbf8c7589a0d7f32daa398d2e7590efa5fda
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
