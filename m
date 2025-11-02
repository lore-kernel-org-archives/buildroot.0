Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A08CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78F9084FE8;
	Sun,  2 Nov 2025 11:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7C6jOt5b2SO; Sun,  2 Nov 2025 11:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F879850E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F879850E5;
	Sun,  2 Nov 2025 11:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A76436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF466F556
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb4bQnjVkezz for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82AD0615A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82AD0615A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82AD0615A6
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:37:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94A37A4C488A;
 Sun,  2 Nov 2025 12:37:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45056)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFWOy-000000006NE-2ZUV;
 Sun, 02 Nov 2025 11:37:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 12:37:40 +0100
Message-ID: <20251102113740.1398246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762083460;
 bh=rhsaVY2nYXi4pt04/sAw6aIOpwKRWDJ0xaGcfEcff7g=;
 h=From:To:Cc:Subject:Date:From;
 b=YYOFXAdldXCLDPwqYTN+sKU01ZgfOO7TvYjSsQL5Em+91O2iYp8EKDbp+wlDItdkQ
 5dMt8vSw8Box1leU3/v8Bgmb2z/JqG01Wns25iISQ3v/jJNrtGPFGqIZbvI9lQeLLf
 3RAeIDRcQCIie6nggLI/Tnmi0I+wnUUR0FkXKAOCXK+Lq82Ai9DBZSnLtfRQWBIDmR
 ugSLgHfOzjjgbWS3GEkIUghetJEneJcjIPRI9YVvFhBXCYVzghocKWoLmP8CR+gJMd
 /UJB52jlhIS4XcxHRBR6VSN2s1PkA9DOAJRrgT32k91qifTTHIvMKxESPfEU6eUgt1
 0RT7zVi/EWJ1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=YYOFXAdl
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: remove license
 file
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
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream tarball does not contain a license file anymore since version
5.0.1 [1] which causes errors after buildroot commit
04cd135b26406dcc31cb66af1480d53fffe81e59 which bumped the package
version from 5.0.0 to 6.0.1.

Fixes:
https://autobuild.buildroot.net/results/1eb/1eb9d68616793c9241bcb55bc2ea1929608c68bd/

[1] https://github.com/corydolphin/flask-cors/issues/382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-cors/python-flask-cors.hash | 2 --
 package/python-flask-cors/python-flask-cors.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 7070b5462e..974d4a7a9e 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
 md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
 sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 26198e6fb4..c7bc338867 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -9,7 +9,6 @@ PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
 PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
-PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
 PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
