Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6B6CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 961E2411EC;
	Thu,  7 May 2026 17:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5Pb-I-Kli9N; Thu,  7 May 2026 17:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A18411E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778173483;
	bh=HljJDj67Io3/m75lQ/TCRbGTNQeDOO2cj0OBLT5xhS0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LvwPQzsShleIePyuI6BW6XlVrLCrehVCEAThraAx5i2P77kYippMzQMRledpqcUaA
	 uKganCdFvJUAAcEmVL/DiBD8GwNChvTSgQlBT5HE5jIWPL29SNpYvDp34mssur3v/L
	 bGNJZgK9KCHQgufgVUPy8WTC8PQI8x+D3zEk1zX32AF7rkbTRUrd5qGVziFV+b/bAw
	 w9UlVZ6j7WwbdNGqlXCv5F3uorM28lkYFZcXNsy5/jcS9z07kvD6riqTtkJi076nJx
	 rIrHZKdfewkcxT5Iu56Pw2TrpVY9eW0WivW0ktpNEzV0whk8TpBH07MmT6/jegmXIw
	 +1TkXlMDHjLmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A18411E3;
	Thu,  7 May 2026 17:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBB75280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD91F6108E
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCS3jsMR-pSI for <buildroot@buildroot.org>;
 Thu,  7 May 2026 17:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 406A26108B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 406A26108B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 406A26108B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:04:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c188.dip0.t-ipconnect.de [79.214.193.136])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD04FA4C06FC
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:04:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43856)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wL29K-000000007xv-2ESg
 for buildroot@buildroot.org; Thu, 07 May 2026 17:04:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 19:04:34 +0200
Message-ID: <20260507170434.3967455-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778173474;
 bh=C1aDbn1hodfy49w9cODNftPFpoJz5eyIYKPRmX3nl+0=;
 h=From:To:Subject:Date:From;
 b=oYp77DW9alp0CU3l62SlUNihuEpUl+/ORLf0wftlFmSZaHKtYfjO1Yvo+58FhZ3DX
 uEOTtC0sRAZ4roFhRAxUG982fTQvo6LMXAcN/4vr4/HNiFvjOJBTtsfFrTiGvJxSQ9
 N8ZIT1+ZOPYHWrnZkqWvFOk4Z75b4z/lyrmXU/WNoS8fshktnSLzbNLvqXC69u2ED6
 xX0pfnV/lOPX7MZo2F1iItyStcjUBjADVckrfRjGDnlHaLmV2uJI6l1pSQU8zpddKB
 YReLtgHhNjbolIFkzGs+xpzLtHXrEu+LecFjskspKk3snTNM2SzsmfYOSvF0miPn8D
 RK5SuEWl31UCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=oYp77DW9
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: bump version to 1.0.54
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

https://github.com/jedisct1/pure-ftpd/blob/1.0.54/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pure-ftpd/pure-ftpd.hash | 2 +-
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index b31afb2956..dfda62f0c1 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  c2bef41f9635c3a87efd65f089c16ca5df9fd02db199d9fdcf12b206b93d41a6  pure-ftpd-1.0.54.tar.bz2
 sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index bf2599ecaf..daf8e6eda8 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.53
+PURE_FTPD_VERSION = 1.0.54
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
