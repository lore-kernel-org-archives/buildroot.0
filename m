Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B29CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 012B06062B;
	Sun, 12 Oct 2025 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYIes2B5g6EB; Sun, 12 Oct 2025 20:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 327CB607B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327CB607B3;
	Sun, 12 Oct 2025 20:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A76CC12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CE64607B3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdpr-gRWl0Sq for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9236E6062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9236E6062B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9236E6062B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D9F7A4C6712;
 Sun, 12 Oct 2025 22:20:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xy-000000004zD-3l4K;
 Sun, 12 Oct 2025 20:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:41 +0200
Message-ID: <20251012202002.178080-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300403;
 bh=A8cc3BIHbCoZF/xd0OQ8uzb7KTS1ZOe6v27pv5oe9j8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=a/0GcVE/SPW101pE5DZr7VAldCtSznOdjBHj+OQS90YWz3zyiT9kPrFouki4YzlRA
 OQ//eUj/+/R5sUiY82+y3WTcNZL+RdCiwdjLzuOZgXSKlVxnFO5S8XgkdwN6i/7bjn
 KzChDGn6g6GeT94AMYk6hyxsPx/DgrkAu25cRNJiWYCoEuCrRdgbnm7eY9Wn2pD6GO
 ANxoBRLZYF3qhL0Ej7l9AD8JrdMGHAoq0/vQrwrycenwi5WpjUpZYpkpUA7jJKXmEH
 utqI9K7nhBJ2yb5YUN8BzwMfz+Z74himekVcCrKUdA0MKipOsmbcGsvJQH+oE3OPWV
 c4BqRN3H62pxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=a/0GcVE/
Subject: [Buildroot] [PATCH 02/23] package/python-executing: bump version to
 2.2.1
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
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index ecb64696e9..d9220c224d 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  6d79de70b73814ee0ac523140c47714f  executing-2.2.0.tar.gz
-sha256  5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755  executing-2.2.0.tar.gz
+md5  02588d10820c930874def80b2fb60c4e  executing-2.2.1.tar.gz
+sha256  3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4  executing-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index adb8309bac..0545941d5e 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.2.0
+PYTHON_EXECUTING_VERSION = 2.2.1
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/91/50/a9d80c47ff289c611ff12e63f7c5d13942c65d68125160cefd768c73e6e4
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
