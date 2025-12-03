Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD05DD1BDC7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 18:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA83D841EE;
	Wed,  3 Dec 2025 18:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqw2nzqp0xVb; Wed,  3 Dec 2025 18:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14A8841CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764785027;
	bh=oJM1rkdIz6HmWApoyH+AnnRt1ZVcjcAyN5lUrUlhy8k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TpJAwzD/NrsxUTb9sUJDdMHay969Zio52maAk95WWK9bV0RmqJTjd60yNjCam5uv3
	 Sktqcl1zRO5YhfPxFhD8aFp+PM/yG4XKWbDDJfAK4vWJ6S+/6f6kOR69v7TIMrjD0H
	 Sy5j0dU4jYjkQrITF+BGle3RJLo2YAJxKZ3doL68Sd3+zgP8R0zE6G+q3Oc08tK15V
	 6Y5yPqi7T4KZoyAwaFhV/CuAO6SdGhq0SHeyYctsRzW/8mjtk43mZrWwftcEQXsaQ+
	 7WfTER2dGTilBLPyRm5kUqhftv5noqlzKUQ6LEQaYS51Z9HhNICzg1QrwyTcydi7/x
	 WrU2aPp9Ok7Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E14A8841CA;
	Wed,  3 Dec 2025 18:03:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29539E4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A9D8615C5
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOYsJIawDCl7 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 18:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38EBD6142C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EBD6142C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38EBD6142C
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:03:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76DCEA4C7887;
 Wed,  3 Dec 2025 19:03:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58526)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQrCP-000000002Fc-33CW;
 Wed, 03 Dec 2025 18:03:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 19:03:34 +0100
Message-ID: <20251203180334.2117343-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764785014;
 bh=PFYNYhTcRV+6J8cjFtS25R3hc33ZbM/zklbQKTQoKLw=;
 h=From:To:Cc:Subject:Date:From;
 b=nMhxJIyB1BXwWkqaEC3MujB2Py35gfYGrrnlOZtfI7YTuSZa+AxLg2HraaiGw4RvD
 S18B3C9QMUnicWeq20GzuZ9mYFo/3tNGuvAbJKnVt6GEpqb4z0oaRf2FKHs/j9BhEJ
 ftLHu+OhXT/GJriAO8CE8MJ3HQvfTUssxu/FKtRGgml4Et1wLWRKQwi5MU8AfQrCN7
 InFePKWIr/bLsDMPwnrhrBE8sadK7PvuXqd9HkBGLXUQGh6O5g7JEvkizWafNhN88E
 9pWYzq60yvB9L6TVDgCSNEbIc7UWetqLvnEC44cTMnrlXeRL2Mors1rMMkC7aoTfrK
 9arOHNXa/GgNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nMhxJIyB
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.10
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes of this bugfix release:
https://www.python.org/downloads/release/python-31310/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index d1a8f3780f..778dca3b69 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3139/
-md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
+# From https://www.python.org/downloads/release/python-31310/
+md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
 # Locally computed
-sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
+sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7aad14a8ca..6200b8af4e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
