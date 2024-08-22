Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2F0C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5D7600B9;
	Thu, 22 Aug 2024 18:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fu6tCtzx4VKa; Thu, 22 Aug 2024 18:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EA9760E50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EA9760E50;
	Thu, 22 Aug 2024 18:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2293B1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E48B80834
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUQNbzE58IH0 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2DF280521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DF280521
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2DF280521
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:23:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0D98A4C272A;
 Thu, 22 Aug 2024 20:20:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQV-0000000060E-0PQY;
 Thu, 22 Aug 2024 18:20:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:50 +0200
Message-Id: <20240822182050.65230-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350851;
 bh=Jgej+55jvLN1JMJPc4O2+2rWMgGnQ33BE7M5ipN1CsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j3D8ljlzGwvDUlxFjF0cYnNfZ6bzl74w2v0adrKHv4znVkJGf9ogwMl9iSby16Q0G
 EOFV8L/XxQOMR16WLM7wITx0dZ6MEaAw8fBZUc17/C4U3lXZaIBXwt96CV8YzS+7Ar
 8SG6CdvsuA6VQoRA9I8lygviEB47RzMMhT/LT6ErXt4C3F9kr8phTpToRdTkgShlFK
 zoKvskxcbLjacxZGggPUm0TtOcXpjPOnLcV3EYIl57KXtCApUSvVOxCZ/MdK1swPrR
 EQRk3JIIX+m/pkfCTVfmBRF6oG8fR1LcThvdxvN8Wrpz61XUOyER43j5lwNUOs8ffG
 L/KpdTIgMOGsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=j3D8ljlz
Subject: [Buildroot] [PATCH/next 13/13] package/python3: bump version to
 3.12.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 598164dca6..d680a96810 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3123/
-md5  d68f25193eec491eb54bc2ea664a05bd  Python-3.12.4.tar.xz
+# From https://www.python.org/downloads/release/python-3125/
+md5  02c7d269e077f4034963bba6befdc715  Python-3.12.5.tar.xz
 # Locally computed
-sha256  f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554  Python-3.12.4.tar.xz
+sha256  fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397  Python-3.12.5.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7d6c9fe93f..b31e6df141 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
