Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A446CFF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 09:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95FEC61ABA;
	Sun, 26 Apr 2026 09:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FomUGbE3GorU; Sun, 26 Apr 2026 09:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B683617BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777195616;
	bh=sFiv1BJtW4fbaKtFREXV48tjxLDUxayoDj55ffP2cMk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aied/AApriBCgv8r9UWb6qm1Rxf1rXYzsTY/aDcj9BkCpkHTFZMT54tvLBNcEuHUD
	 55nogGjJUtDpscsUqmtf62JmiDo4fUB9xb+hw4qO8aAV9KR0kbcsLUkl11rG7FEcOy
	 sIM2I7J21a1DSgaO4ZkOqlxajMo+YxJ8hScZSS0EIq9hSPzs/sfMnOisRCNNS9aMQE
	 WYTXFIzbgSvXSX9lvl57b2kWG+gUJDnGCOflwKX8tF91HHmM3o9/Y7l/xC1x5JLO6c
	 nvY9PBxvs3O2N25hjY0vPsDPL/pVPQDtIzBiLQXoSKkfpIYI121h9Qbw6NFZAi2ZYn
	 ZREyHKBhDUhHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B683617BB;
	Sun, 26 Apr 2026 09:26:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB3F231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD5694283B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOOHy0jgemcU for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 09:26:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C480842839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C480842839
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C480842839
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03728A4C0CF3;
 Sun, 26 Apr 2026 11:26:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGvl8-000000002lk-11UR;
 Sun, 26 Apr 2026 09:26:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Apr 2026 11:26:36 +0200
Message-ID: <20260426092637.2320150-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426092637.2320150-1-bernd@kuhls.net>
References: <20260426092637.2320150-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777195599;
 bh=5AEW3QT621l4ZlCdrMsTyflbb77O89NaFz8ggBMZKnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PT9Cla7f6+YMxU6B2Z/Os2mue+79AVc+av6xHz8Tiy0/2PStO1rOAOKtYyZhNkip2
 yzyLKBwC0KbEK5a0dTp4I8lEFudKl0+nTV9hyWD+Md5ORTezctQz4mfXQ3ITxTiO66
 dSI/NkPmKUdvt9TlPEgpc/TXPLM/DC/Duvg4/z4/7UJf3CK/v/bp1S5b26xMa5DNfD
 bENfHD+b8LrvTgXllrYhtRlIn7iodc+3SrcwzEjw0PvCofC7QzntVISrr8k6aJUt5H
 oAI/Ax0Qe7AIxZFcuz0PxsXoqZUvMUCjmgqbZc5RH78zfYfJ3pYr2ruEoOy9EITf4S
 qHQ1QJuVe/WZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PT9Cla7f
Subject: [Buildroot] [PATCH 3/4] package/libksba: bump to version 1.6.8
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

https://dev.gnupg.org/T7174
https://github.com/gpg/libksba/blob/libksba-1.6.8/NEWS

Updated license hash due to upstream commit
https://github.com/gpg/libksba/commit/39aa8435819df6a97fc751f5e5e45178f033c2ef

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libksba/libksba.hash | 6 +++---
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index aca159d972..b7e1e2f9f5 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,9 +1,9 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  781acfb012cbb5328f41efcf82f723524e8d0128  libksba-1.6.7.tar.bz2
-sha256  cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763  libksba-1.6.7.tar.bz2
+sha1  ff1705f512ab18323571e009d8ead407f7d0279f  libksba-1.6.8.tar.bz2
+sha256  0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5  libksba-1.6.8.tar.bz2
 
 # Hash for license files:
-sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
+sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
 sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index dc22d60113..f43693872e 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.7
+LIBKSBA_VERSION = 1.6.8
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
