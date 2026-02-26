Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3235EFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F152460716;
	Thu, 26 Feb 2026 20:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sVSF5UhGN61; Thu, 26 Feb 2026 20:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E3860703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136882;
	bh=uWG6domX/J7fHHICKHMlDXi88DebLQ6VXIqgV4R42tU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pzO514+ZW7EqIP2k6BLGcuL08nvAXMKQm5SOmNkeEqNNqghSxEUEdl7GFtydSYClL
	 nw6TigavOrcYhqJOJ3iYN8BD9ZretQWhaNDhd2xLnSrpGJeu9XRLJsxVomLgms3ECG
	 YbVQGU/BrqZYG1w3eMYtaNTCh9M0T5hr87VVSzaqHRJJlHA7mRZH8l5TVeRQcE9fUU
	 UW8rTp/rUbsSdsDrVzEZP3Em7IH/Ik3+0QffqENd2GH0+Ljhg8L37saSpWRsbZn5BE
	 JoQpiF78ANqKI4I3Z56eTYF4QpRYreu0IkLWXPaOwo9tRBbKWLlLuyVXjKJK3KZ2ZZ
	 Cdc53sglBSG6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E3860703;
	Thu, 26 Feb 2026 20:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B22623D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70DE080D35
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJMCK7mIUzOi for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 659EA80C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 659EA80C69
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 659EA80C69
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:14:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F3E63A4C2E88;
 Thu, 26 Feb 2026 21:14:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhkr-000000003yP-3rhb;
 Thu, 26 Feb 2026 20:14:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Date: Thu, 26 Feb 2026 21:14:37 +0100
Message-ID: <20260226201437.1118555-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772136878;
 bh=391XbgnD9dixdJPRaHSJYOZonLARdxnHe2g3YzKqREA=;
 h=From:To:Cc:Subject:Date:From;
 b=uobfEvV4nYbejvBiuolpfZyEiijwsw0uFZT4gGF8zv0//yfmOj6tk033dV9XTwTXz
 P5tVS4JhbSksaCXmN2YXU/ocBy2dodQtMJssrECM7+IgQ8TqpoP3tXXdinH+UOP5xc
 HgG5FlF/S5njN/+vOAGwvQRR9Hh8W8PrgfIAVFnb2+TaOxIrOab+JmM4oAz5UaLwsd
 z5xu2FsVLO1DrH7zIzJdxkurE56TPAfraxm3XAd8i7cYZCwL4T72ALjrgZ+VrhU9Ix
 jO3rvm6T/OyfD1pmqdR+x2rB+ITCFG/LwR0Xhu414XB41/6E37Er1/DxclO53qRtka
 Rnv+Kffg3F3wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uobfEvV4
Subject: [Buildroot] [PATCH/next 1/1] package/libmodbus: bump version to
 3.1.12
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

https://github.com/stephane/libmodbus/blob/v3.1.12/NEWS.md

Added tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmodbus/libmodbus.hash | 3 ++-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 5c081d9710..ddca835f34 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,4 @@
+# From https://github.com/stephane/libmodbus/releases/tag/v3.1.12
+sha256  2f4d4191cd196c1fba131daec03b621db75129d8255c832fc66b259d9fc46e7b  libmodbus-3.1.12.tar.gz
 # Locally computed
-sha256  15b4b2e0f68122c2da9b195de5c330489a9c97d40b4a95d2822378dc14d780e7  libmodbus-3.1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4902d6257f..5d20aef35c 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.11
+LIBMODBUS_VERSION = 3.1.12
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
