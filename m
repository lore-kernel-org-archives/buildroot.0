Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F9CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B74383DEC;
	Tue, 14 Oct 2025 18:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgvmOKwm6jWW; Tue, 14 Oct 2025 18:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A7D683E00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7D683E00;
	Tue, 14 Oct 2025 18:52:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 262B2116F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A9383E00
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbc7xn-P2Lup for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C451783DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C451783DEC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C451783DEC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:52:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70D83A4C6C37;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-0QTa;
 Tue, 14 Oct 2025 18:51:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:02 +0200
Message-ID: <20251014185113.3583315-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=BzWTk70OE9Wp7B8F/iRu8jUhXzF9CRPMFomxk6VZwA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=0EDHhyqWrJ9Yy57fge+R5RKeIx2JaMG73dMvwBsEPvKIIXOrPMYpdlU+U7ZReyqgV
 Sb0dTtO1r4wrLUqXvjZrM1UR89lXGAbNUdw3EKhnQchPvTpUne7qNEouPIB+0Pe9yI
 KqJkg7x5j7xKipNoRzqOuvd3FFy2el0ZiVyNg6cIIYQoeil8Odxj2quJJYGVoQ32Jb
 4dRfL6nDwQC2IEW6rWlJAaCb5Lwpoq9bHV/zBvCNOoXc9FQseZECX6s26MTIAwvuYD
 IUuxKuw9/mHe+PLfOfMiowa1wK8sF7SfVSY5loVuiDInOunh8ckPfJ857qqejS7cOd
 yZIBzswVmJsDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=0EDHhyqW
Subject: [Buildroot] [PATCH 03/14] package/python-urwid: bump version to
 3.0.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 871cafccd4..1612070c3f 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  214f9cea321ccae131cecfaef2a4aa9a  urwid-2.6.16.tar.gz
-sha256  93ad239939e44c385e64aa00027878b9e5c486d59e855ec8ab5b1e1adcdb32a2  urwid-2.6.16.tar.gz
+md5  0ed7f3cf33545912b9ad0d8f2200863b  urwid-3.0.3.tar.gz
+sha256  300804dd568cda5aa1c5b204227bd0cfe7a62cef2d00987c5eb2e4e64294ed9b  urwid-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 411727660f..0ca1b79c55 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.6.16
+PYTHON_URWID_VERSION = 3.0.3
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/98/21/ad23c9e961b2d36d57c63686a6f86768dd945d406323fb58c84f09478530
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/bb/d3/09683323e2290732a39dc92ca5031d5e5ddda56f8d236f885a400535b29a
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
