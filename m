Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FBBD5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5D7408EF;
	Mon, 15 Dec 2025 19:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePbEzl5YUxjg; Mon, 15 Dec 2025 19:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF27840A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826064;
	bh=dRA+AByBfHwNBDy4tfugypn6IL4cyu3QxCRiw6EAVGI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mP78vDKdz8da5ryaHw4KdVwxAmDI463ov3i3N+v4CNW3ROUJ3l9r6p+yfVot4mrko
	 lLZ3k+T9wClIQWTk7qLo2GuaM/4Nnm9Ug5THLLnRdy/EZ92Xth5qYbtok0tgjiaDoL
	 0sBa6V0cChBZRb12Er3r77tjh9g/cc1g6+EX12zPn44CGMKyfVRo10WdGSw7ZJ8Sms
	 kBeqVGR24I9cAee6sAtGxFC1e07FWTmT3hJBU0TJL0YZ1CrbGNBR7AB9VbsmuENqwm
	 TG3tz31N4lTi/whZVd9/iIezwc0fc7x+WPrnHqYgq3d2MzUs0vnlq/zFiO0mjqxNKT
	 vmdganC4WyCAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF27840A24;
	Mon, 15 Dec 2025 19:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E240255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43BE460DE5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLkAQZ9AH5h4 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D43F60DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D43F60DE7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D43F60DE7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09BB6A4C4154;
 Mon, 15 Dec 2025 20:14:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-1KrB;
 Mon, 15 Dec 2025 19:14:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:50 +0100
Message-ID: <20251215191416.421755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826057;
 bh=mvnz/iqhjJRdgfM16RZQxR3UT6c2fMRIQH6DNWx8gXk=;
 h=From:To:Cc:Subject:Date:From;
 b=VHihFr2+5E9tuoj3loUgA+iimlR7FhNnKheOGcLDCarWMuC4u2DiuMBE0i8Pqn0sF
 KYqLWr4qrBiD6Sejz1WffDPvd5poJK3g1DAtXZJKqRdNTVeOD/vm9aD8kON49f5M/t
 0gZbf+bhWfJ4BTaeF49U4fEGo2qp1snImJVJicmjJ/FKGNcunErbwDxf+5YGesvMMX
 18n3bmcOXk3Us9E56IetzGvedbil2Q6Hz+MOgVVkoj4ZWiQ/inkHwdJc9+GhsC0i6v
 xmu6ID12Iu37LJ3zlHpm/NuZmuBVR1rAOlt5AqlKZHbHKm2cR+vFPk2GYdnNEGaHI1
 OdZ6cIXvDpWgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VHihFr2+
Subject: [Buildroot] [PATCH 01/27] package/python-posix-ipc: bump version to
 1.3.2
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/osvenskan/posix_ipc/blob/rel1.3.2/history.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-posix-ipc/python-posix-ipc.hash | 4 ++--
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 1f1d98bcb4..d70fd516d4 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  2488e63c881311f2bb697a0344ba9070  posix_ipc-1.3.0.tar.gz
-sha256  6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876910896f47d353448  posix_ipc-1.3.0.tar.gz
+md5  fbfbd3526830f1ca3cd87003be0b490a  posix_ipc-1.3.2.tar.gz
+sha256  6923232111329954a8349f7d99f212b6e96b5206e77fbd39aaf1b3cb4a5e9260  posix_ipc-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3f65e6e3d932adabcc6176dad775c6e538711483ef8de45a3ec47a12525f56b3  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index 48d6588310..46bbc7754a 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.3.0
+PYTHON_POSIX_IPC_VERSION = 1.3.2
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/2b/a1/16d4b5a7dfc3dbb5965debe0415b6dc4866d4c94a1229f5b12cde7b78de8
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/40/59/56be08bcd98bcb8bd2ec3de7dea4a8da3bde63b17974896ed2b91c9a4fb7
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
