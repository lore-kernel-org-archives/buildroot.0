Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2924CD5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C1B60765;
	Sat, 13 Dec 2025 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5pO5y3kKBM8; Sat, 13 Dec 2025 14:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025426077E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634743;
	bh=2oaJpP9d7ktazSP15Bqx62R/zQUgFki/51wIb5eSMSc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cCn0okh2VkQAcUZUlyudhIjWj4X//gR4rjstafykufrK4rPUKKoECpwdGQi/7zDzH
	 vEhwU6ehBOP4fqAyv5UxvRa51LlEpxgC8ICs/dJnD4NjHkz/Nqmtv5w0VHWiCCfab6
	 VVnw3V/AEoF2CIDNoweO0tzXPXl3jQnp++/uxbziugRGx3jVxUzdppBQ1aR1Vnx76V
	 cM4MKmOPDRAGZJjcnb/8RzihrnrUyGC6uJE+3W0KD4gqLKIF3klJ/c+fZa32O4p+pR
	 U3qvNug15/3aBOBcduwr7/xsuMLKB37/FsmtjVTo8m1jZ8BMsaN25rqgBNaX4YpyQL
	 NJ+ThMEb0Wy0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025426077E;
	Sat, 13 Dec 2025 14:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79AA22C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2596077E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tswyv0PaVUgA for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35D9A60765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D9A60765
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35D9A60765
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:05:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D51AAA4C3B6F;
 Sat, 13 Dec 2025 15:05:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-1eBC;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:09 +0100
Message-ID: <20251213140522.1322763-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634722;
 bh=bAGQs/w/+IAqccBGzKT/J6r+QM5jlnYooDZ21WKY75Y=;
 h=From:To:Cc:Subject:Date:From;
 b=n5UN530ImdFe+BXapiYIw4sMQbTqjGF/ETM8HsbiQbuYNhX4mczfoyFZYhFGD7KkY
 HjZADvi1Gv2ScA2QAP/rti3DUvRSmsnQXJh+9LHeWLTsGtS9PF2O7SWZeqCsAhTsYF
 6pm2lhUVgZGxg6ZCgJesvOwTSKmA96w3Gw2nlRFWyF99OzY9rHZRgCX+FCoiJkDoLU
 xGLizHaMmmjhM4pzRE+ELzJTCc/ii2xr3azw4vfbmqAEh36L/EmGyqaeBibswndYMS
 9spxELQhWPBwUSw7JQzYly/1mDeVNnpNrQNoZloo9Ez+vYgoifyk2ay8UZGBH1jTfe
 KtmKLhaXIB29A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=n5UN530I
Subject: [Buildroot] [PATCH 01/14] package/python-jsonschema-specifications:
 bump version to 2025.9.1
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-jsonschema/jsonschema-specifications/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-jsonschema-specifications.hash                     | 4 ++--
 .../python-jsonschema-specifications.mk                       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
index f68e57cd5a..b4725068f7 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
-md5  e8f726a5b9647031d9ee8b922cf9b56f  jsonschema_specifications-2024.10.1.tar.gz
-sha256  0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272  jsonschema_specifications-2024.10.1.tar.gz
+md5  ef8e5a762c7ef39dcfb775c81336a690  jsonschema_specifications-2025.9.1.tar.gz
+sha256  b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d  jsonschema_specifications-2025.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 4637c14f04..eaeb06c3d8 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2024.10.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2025.9.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/10/db/58f950c996c793472e336ff3655b13fbcf1e3b359dcf52dcf3ed3b52c352
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
