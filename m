Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82717D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BB06105E;
	Tue, 16 Dec 2025 19:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Jf8uyjGTF2k; Tue, 16 Dec 2025 19:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF88261037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914110;
	bh=Qsbs2to9+UvCTwwuH5hQsiji9eWkyVBBawpOFl0M5LY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Jzj34TIMowW/GuLCcvklOElAgp1ruTpQrkgDT5Atmwzl4Aod8TVxc+fNUaFbAym4o
	 4cEEA9Zf6zpxcZ0K/OhubSh0/u2VhN/k+Y4TuJO6scm94z3dzZLHG1MdFNJMjDJChK
	 vT7hjPS5TXGk+FNF6EMvaa945OE2+1jE9cvrvKTuSv3Zzcfo1G1EiJKqzoBb1MgxG5
	 O/lcXmDibv5/vBDYY1fxP2J5ZdvGD6yfMhL12LCxguuopmujjbroJbN+vwkgPvI8GJ
	 Xiuiet0QAJoDafn+Ng7s7AUkhnj9e5Lo8oT+dUHULEYFXJsFvmxvG6o6BfZtW6PUwP
	 204VSpbNrWe+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF88261037;
	Tue, 16 Dec 2025 19:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A077B364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9367E4049E
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b50DSfXMP7b for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47DC240499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47DC240499
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47DC240499
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB747A4C4585;
 Tue, 16 Dec 2025 20:41:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-0UFX;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:56 +0100
Message-ID: <20251216194119.3020421-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914079;
 bh=Qj4fiMFy3K0Ro7jdEiSGB8IVPvgZBEjC/j0BXF8txcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EXIRnnqDq7lbd1f3SvRvLaH9ePOsQvHGponKNfiCfN39ITGeMrdZyNzPHS96eAvOv
 5PvnLPSh/H2QAdcg0Gh3wFjmxM/eEZsIt89liBCetnaVy1IDvVigAlyHJZGOiuUSh+
 8L3sjRm39myXIPMLCWaxzCEZW5Dl8GKoZKCqcV7RwscO8b7APHFHHEiv+ifakjTsBO
 o0nWg9nAqz1QBWVRcneHcpIumscofZ+mZpFNR+49vOcjUD4htdV0GHI+R67XEA62l1
 cCNvInwpR0gCUzB0DW1FWmhdymjGhBux7/lCJW1M8Di6A24MsZa4gBD+pZC3F0k7tj
 G1/hrYL8ZrSbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=EXIRnnqD
Subject: [Buildroot] [PATCH 03/26] package/python-sh: bump version to 2.2.2
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/amoffat/sh/blob/2.2.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 4ed2464260..43da0bc0ee 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  d1bc1f56e6a99109fb0f589aba574cf2  sh-2.2.1.tar.gz
-sha256  287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00  sh-2.2.1.tar.gz
+md5  961d38de16f88556bd70381eddd7f415  sh-2.2.2.tar.gz
+sha256  653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b  sh-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 84ad1aec63..6bbd621af1 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.2.1
+PYTHON_SH_VERSION = 2.2.2
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/bd/30/abf254f7b56ba7bcae938767e3ee0f54d220d931a35a8721de350b76dec5
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/59/52/f43920223c93e31874677c681b8603d36a40d3d8502d3a37f80d3995d43e
 PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
