Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD70CCFC526
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 11:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CE741169;
	Sat, 22 Nov 2025 11:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwiwBPR0hKWr; Sat, 22 Nov 2025 11:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E601410ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E601410ED;
	Sat, 22 Nov 2025 11:55:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52FE5122
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D487410E7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NFU7WjZ-DP0 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 11:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4665B410D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4665B410D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4665B410D6
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 11:55:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18EBDA4C6E23;
 Sat, 22 Nov 2025 12:55:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34714)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMmCi-000000006WR-2IaH;
 Sat, 22 Nov 2025 11:55:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 12:55:00 +0100
Message-ID: <20251122115500.3779137-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763812501;
 bh=M/3j5c30dr9c7Rztjq9gwX2bbHrx2LHNaSf9Rgz8HPE=;
 h=From:To:Cc:Subject:Date:From;
 b=Dj9D5t15tQ6j1GZ+uj9500U7VxPtEB+zzzLciv7LBWmCZa9WEaD06P6RlijPH8FRS
 kmcUovzSaE6b9xbI0N5gAzrSXFv4pNEzmIKDc6D5gOoy+w20rRg5IBJOChqpbF2znN
 ecqPmWOqUuEULPgfYEyLt/js1pDmiS+OOMEgxxr1JDuke26Bigc/dtnuaawNEzg3cG
 pCTLGERi4KRxMYBLtsfbhpFE1HHKggGUsjtdCBL4LwKxrkt2Ro2ivc/GT8PrO5vHVl
 AM9imxPubc33FlwryQFUjqL24EcnPz3RC17YcMwZjc3hPr80TGOZOoR4bFzwM/85qs
 wXyuO8unqLLXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Dj9D5t15
Subject: [Buildroot] [PATCH 1/1] python-flask-restx: re-add dependency to
 BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 2ecb2d2847701795d384ee9e4eaeb0669dcc2bef removed the
dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS while still
selecting packages which depend on it:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_JSONSCHEMA
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_REFERENCING
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

Seen with defconfig:
https://autobuild.buildroot.org/results/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-restx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index c98dd74d5b..efae7a0aeb 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema, python-referencing -> python-rpds-py
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
