Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DAFCD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 18:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63666F4AF;
	Thu, 30 Apr 2026 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQdoTvW7nhLH; Thu, 30 Apr 2026 18:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68426F4A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777573076;
	bh=vQ2kp9hfhjdSzK/DLJR8PLDZ/6jnwRe4rNO1mpxlHTs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AIXr9Zl8CKmQzEYJKlwOzw0gQQ+IVd4GOjOMwNZHiZ+z+aFYdJJnLLO0ctY3N687m
	 30LAshDAplfntPCLWXTUAUpimbTBpJ3YFpYl4ezzRGCHlyuFnJrHdPPHqfoMnjuBV/
	 iXZqIdBjYumTiFk7Y28ci0pVyumxrg7a6iitQNrBhUFSErHVhCZnYyga1lBNFbZgaq
	 s0tc0Yq+DkAhsIoWX1KUdfrUNqNY2gyukqxe/u1Khhl/98hYIPtK5rl8JYPmTgLNXW
	 Fst0wKMZVeoku78GYYSPy9WfDFxFW8S6uGkgknoz+vCzpzxWk19SlXvUEuUPg7VHe5
	 htERJpC5JWYiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68426F4A6;
	Thu, 30 Apr 2026 18:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08801127
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D96D06F4A6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pKX8D-Tzazo for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 18:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDEE76F4A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDEE76F4A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDEE76F4A5
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:17:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11484A4C11CD
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 20:17:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIVxP-000000008Qc-3klQ
 for buildroot@buildroot.org; Thu, 30 Apr 2026 18:17:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 20:17:51 +0200
Message-ID: <20260430181751.2088520-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777573072;
 bh=qSuS/4zB47mY9cedkK1Hbh3wDERaSr+ANFhuLjQSCrs=;
 h=From:To:Subject:Date:From;
 b=lhTDRJOsCTFJuaTLTp+FDZLdYoBG01CMKyW6kwCogPFxEhISyXk7XxIpwbRzg1Y+t
 1LDCOJ0mTCnZtoA4bspoYmDXMAVHPDF9JOUH13xcCxxcV/nPHfIIfoe6Is4/2Et1gb
 Ca48obBqGOMRfbnfRHlSubx7N7BiHYJwQCuAbuNp75fLftelbFv4RM2VFCEA4tEeDg
 evAbGgBX+97lFNX5bEDfNnl5kiGhK1FAayTJtbIq85+ZzEUMYijdvaiCpx6X7HrWhq
 K03MSl78OWQ1KHGS6jkywSBQLmBLRTuyFLCZ5LVqoKIrxs5sBDar8aJXnC0MIFQnkr
 ikjaab+FXxVng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lhTDRJOs
Subject: [Buildroot] [PATCH 1/1] package/proftpd: security bump version to
 1.3.9a
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

https://github.com/proftpd/proftpd/blob/1.3.9/NEWS

Fixes CVE-2026-42167.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 482534fb1c..9ec632884c 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a5f13b666226813b4da0ade34535d325e204ab16cf8008c7353b1b5a972f74b  proftpd-1.3.9.tar.gz
+sha256  bc3c7c47033ecff29f010efc18315d5906eb942d2e673ebce0138a96f11af0b4  proftpd-1.3.9a.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a30c46ee27..ba026f5dd1 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.9
+PROFTPD_VERSION = 1.3.9a
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
