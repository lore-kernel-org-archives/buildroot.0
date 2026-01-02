Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E8FFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1160F6083C;
	Fri,  2 Jan 2026 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1-zOa8ga2Xz; Fri,  2 Jan 2026 15:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72888605C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367638;
	bh=XuDmzc1iYAvyLVPRCzSZ6W5q/gDiVbNNETLg2XKikHc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JIVUAZUvLIXie6iD/6u4eBbNhKPdKWFdV+1k90MwuXEqygtJdmh7rvi0i3Zq0DcrC
	 9EdwyR/VSWID3oRKNmfdPmXTIA+zny4QkuFIHQQxbJUAruYPRerw22648BMid2oXJF
	 Dq6JYtsXa2YEU4w1JimnYgAfcbV8hiSVRgyS/b6+xQLA4Bvyin2BKvlUFquDDhgLE+
	 TAWLbBUJ6t9Z8+4iwchgy1CrS3iBE6nmHGWGr+jwQcuuU1s2aAloL5JcQFpM+U66G6
	 yWWDeokxarLdc9+wpCJ3fNnvzXUZnTq3md80v4fiEQ2whrJwVoJgS5p/sSDSd+8Mr+
	 AtvQeEhFiv3Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72888605C3;
	Fri,  2 Jan 2026 15:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A76AD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008876084D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6Xfr-BALDeT for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE3CB600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE3CB600C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE3CB600C4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:27:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47439A4C3248;
 Fri,  2 Jan 2026 16:26:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37006)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbh2y-000000004IY-3mDI;
 Fri, 02 Jan 2026 15:26:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:26:32 +0100
Message-ID: <20260102152635.924052-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102152635.924052-1-bernd@kuhls.net>
References: <20260102152635.924052-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767367597;
 bh=kXCHX8y/cpvaCfLYz32WsCFP8gbQ35RjQMdNcKHsaKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uNo77BMafeMMVZ2hFyB+AQ2hWb8dltmVhgUZRNAbx/PC0tRgyEvnEoBNfV/+KvOk2
 7Fo9D014rdg7QjQOsF2OJdk8iSEyTCNCDc/vy9qaFjYxmQdtRQ+gqMrLmOl658GoWm
 vQ1s68z8pekuUnetDUYiQOMCRf2fvrxAG2YeYyD+x0a1jdInblZCt0pXP4STC+hZZ3
 /Zx4eLTd+3RnEsYNe097AxX5yXYnHIyXFxEk3qIurU0FSV/z+5JsQkJciyUMQEGnAO
 DrBd7sMqDXZNO2kLg7dB8EPy6KagIMpRPcDJImjc3sm+DnORHvSECYP20pCxK1l4nt
 BWT0kQE/rAMbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uNo77BMa
Subject: [Buildroot] [PATCH v3 3/6] package/python-web2py: bump version to
 3.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 098f8dc490..b100a1fec8 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..5b473698a6 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION = v3.1.1
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
