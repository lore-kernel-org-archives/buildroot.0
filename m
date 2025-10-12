Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E277CCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6DA96062B;
	Sun, 12 Oct 2025 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_ZKR-0Uud5z; Sun, 12 Oct 2025 20:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3ED3607B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3ED3607B3;
	Sun, 12 Oct 2025 20:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C5E3BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 330E440130
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbkJX9rOgCoW for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:20:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B74DC400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B74DC400B7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B74DC400B7
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB97CA4C6716;
 Sun, 12 Oct 2025 22:20:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xz-000000004zD-0RIr;
 Sun, 12 Oct 2025 20:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:44 +0200
Message-ID: <20251012202002.178080-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300403;
 bh=kd0+4tZv0BhGq35xJ5Ci9RGPxkMTTh454RVPtGdYijk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fH4I1HeBoYLuFCOjX87o6K9ie6ytFkcgwoddtJOK7dZznHT3snJbZ0XVYKvb8bIgI
 vrPhmsbLaZXxBxqjqwaojg2/P360rRqbKaClKdgVDUoPn5ik/kXanKvK+Jnx6tKGsb
 ZR1JNS+h1WAR04HtZtWHAZQnzy5Hj9J9uRm0Ku+62HDdgZ+BvbTNsvkFoBIuRfmdf7
 MZxXa6RxnCghEU7wh8ULLXIUWEq/ijMt4a45/e9UdC8R4VuTWhIWu8bSB+8k26mTjH
 RFGj7RDKC5edu2puOyx8tfHl/Vf93ugEwMWq1rnWbhUm525KF/Kk5TduJSpvuyeXyV
 1MJSraa3toeEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=fH4I1HeB
Subject: [Buildroot] [PATCH 05/23] package/python-flatbuffers: bump version
 to 25.9.23
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flatbuffers/python-flatbuffers.hash | 4 ++--
 package/python-flatbuffers/python-flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
index ccc754f9be..1d046fb3f4 100644
--- a/package/python-flatbuffers/python-flatbuffers.hash
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flatbuffers/json
-md5  3391732d344155cc070892fae5f7166c  flatbuffers-2.0.7.tar.gz
-sha256  0ae7d69c5b82bf41962ca5fde9cc43033bc9501311d975fd5a25e8a7d29c1245  flatbuffers-2.0.7.tar.gz
+md5  a0f1d5a1ae9f0a99b38c15041f2e1739  flatbuffers-25.9.23.tar.gz
+sha256  676f9fa62750bb50cf531b42a0a2a118ad8f7f797a511eda12881c016f093b12  flatbuffers-25.9.23.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index 65f3d0955c..8b9c06df52 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLATBUFFERS_VERSION = 2.0.7
+PYTHON_FLATBUFFERS_VERSION = 25.9.23
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/d1/90/0532e737a11e1dc50e9e352c3ccc97338cb75991f83279c2edbc9234e022
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/9d/1f/3ee70b0a55137442038f2a33469cc5fddd7e0ad2abf83d7497c18a2b6923
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
