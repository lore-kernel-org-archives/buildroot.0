Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB0D0E3F3
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DF040311;
	Thu, 24 Oct 2024 20:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjjBTh8OnYM4; Thu, 24 Oct 2024 20:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F824033B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F824033B;
	Thu, 24 Oct 2024 20:17:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F0AB4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CC8860866
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AA7lIOlpr5eB for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:17:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C91C60828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C91C60828
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C91C60828
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:17:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf36.dip0.t-ipconnect.de [79.214.207.54])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A4C7A4C0160;
 Thu, 24 Oct 2024 22:17:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44428)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t44H2-000000004P7-27Tp;
 Thu, 24 Oct 2024 20:17:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:17:35 +0200
Message-Id: <20241024201735.2627641-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729801056;
 bh=+eHIXAJatQgBIOohnfxSdNxzaT4wba550Lbp5ZM+6do=;
 h=From:To:Cc:Subject:Date:From;
 b=ieD82kkQQFuzFWvx1DMjrsjWfZiDhLJaqGHaddCIMJuU0on+dDgokl0weUAVMarZF
 Ct9vEBoubQgDLa3DCGypDT//bU7MuqLiSIcOfI0bS+Tkw2QdMxd5vSfKVEPY8631Hz
 arB8BOxL/9JZy6dDJehzlL2FO+OKjBlhww0SNBimI+8a0+vsK61QHOh6CqjggjWKkY
 OT0eoClylYHfnkFh5PuPar80YuPsiGIB/Djz58ErOnFSIFl/ULrq8u8kBGAuiN0G1J
 Qupr/FSXRaGHA+JMLLDQcf8BFodRsCZFIDXVm2Lz/7Oij+tcNXUqIlyJwACMb9vr2i
 6cI58LlPibFgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ieD82kkQ
Subject: [Buildroot] [PATCH] package/python3: bump version to 3.12.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://blog.python.org/2024/10/python-3127-released.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 0cd852c325..ad73a85a7f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3126/
-md5  cb669514937d3e894e74081627722aa5  Python-3.12.6.tar.xz
+# From https://www.python.org/downloads/release/python-3127/
+md5  c6c933c1a0db52597cb45a7910490f93  Python-3.12.7.tar.xz
 # Locally computed
-sha256  1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c  Python-3.12.6.tar.xz
+sha256  24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550  Python-3.12.7.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4b328f70fb..d029d3dbbc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
