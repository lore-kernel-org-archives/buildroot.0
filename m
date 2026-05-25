Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59301CD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 15:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0912F606DE;
	Mon, 25 May 2026 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQMdfL4LTrT4; Mon, 25 May 2026 15:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7D0606DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779723992;
	bh=Yll4t96jwey8R8SxwB+K3HXmBeldxCOkcR7FJlJs3Vo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMVuKTaQpA3g8X37YOogsxv5YVXPCUxVpI+7GLhmjk9t3TwgDmyi3W4f3He+IgSny
	 Q8OFy9g8PdqfbylxLGrusvj1FaZHGG4/mIonFQbTzfQ3UsmE96dMYxWSDqZNPzwpic
	 xQ+HaxgXxXYLk2keWjqIsl8jz+jgkkzGZjn5xMdT7S2kx8t6KsfQx5Ofv8zHqG62Wl
	 osoPeLCj1u9uO/iwEsmLmDBFOWv83IUeqTj8j0wkREzjs1sWXsJVXKC3oG50qSOOeP
	 +j/Q9a2pecQyJIiITwuiotjcSwI7p5hB7d4Tblhoquc13Xe36vPMrVv+Yh2xFcgZ+h
	 crwJ9oG9mgrZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7D0606DA;
	Mon, 25 May 2026 15:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E0C297
 for <buildroot@buildroot.org>; Mon, 25 May 2026 15:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6051881204
 for <buildroot@buildroot.org>; Mon, 25 May 2026 15:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F20MDJvKU0B for <buildroot@buildroot.org>;
 Mon, 25 May 2026 15:46:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0799F81209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0799F81209
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0799F81209
 for <buildroot@buildroot.org>; Mon, 25 May 2026 15:46:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E44BA4C1453;
 Mon, 25 May 2026 17:46:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33502)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRXVY-000000003vQ-1wKb;
 Mon, 25 May 2026 15:46:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 25 May 2026 17:46:24 +0200
Message-ID: <20260525154624.188492-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779723985;
 bh=LLoo8xGPP9XdtY2HGdyGbSfE287OBqK0helrrKGVdIU=;
 h=From:To:Cc:Subject:Date:From;
 b=Nq6B2V3h/EQHgWr2Zake/T3n+g4gDVsrP+O0UDKgdC+Oer9xnhIZpg1+gLX3t4Vvs
 NOVO5RfnfDc8QKrDoiu0HoBa57sAb3ARamIMoG1J9xMHdOkaJ7MzkNN2f27/MfFaNE
 La2sC13ZcF1AfZwM4AkhVTCt4cEOZYyYLDgqPgsKYoUzZu3YYfrFinuEsJljA0lV79
 mnQ0mIX7td4gA/RZYF/KmOtO1tVN4MEeo33CvxAMGHk/pO8vmTml8z7ju1uuolmNYa
 TWNQbg6YFicnhUzSJDvlBVRPpM8g85JGq7mZ+pgtu5wDdmH2/0ZXTdvnQm4/hzqiM1
 Mdfd+35MlRfxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Nq6B2V3h
Subject: [Buildroot] [PATCH/next 1/1] package/timescaledb: bump version to
 2.27.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/timescale/timescaledb/blob/2.27.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 888b6c2cfa..fe733f323b 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  06a5d38c52bebb364104541002ccfb9ea739f93183c339895f0d1ed90b005e17  timescaledb-2.24.0.tar.gz
+sha256  f0a940720bb5b0b635dae4d8aeceb13e83b196b8aab8717876af0f45efa47ab6  timescaledb-2.27.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 3ad8bb41fa..bc38eb9279 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.24.0
+TIMESCALEDB_VERSION = 2.27.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
