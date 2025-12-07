Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C752D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A01F82144;
	Sun,  7 Dec 2025 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjocaXF9ExxA; Sun,  7 Dec 2025 14:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EF67821BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118604;
	bh=Hncq/O1z9SfurRkwkoF+lcUsQlo7yJSvtIGKu6bcQdQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SBFM8igZzWyVTdEP8qMXcZYNSjxPDpyrrlPF40SRt0vIvE4KWK776EcZ28uvKsg4m
	 /hu9ml/+o4UyGP3ei4qHKH6NCUMBxuerEnElE73mhUyXMeZes1oT0R0cVxAEeYV6Kf
	 8U8a+cN5W7pCNFHR1CacDYM8zfZlv8Dftc3slln3hMNmfFF+sqkdUykR7xuWayc1lm
	 ixeC+uujI5qfY64ehiU5EB+pDXbupkN4yRZNlJUZxxFYfZsIdixeQ9y7mYoRGDm0Gt
	 CY/incpU+08jeVR500RX4g8bayWiTTYRqxxFcVPxVL1+VsPH0rdSz/MOxdFV1uSKKG
	 +2w390jjmo25g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF67821BF;
	Sun,  7 Dec 2025 14:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB19A2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9901A608F6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4izeyCXYyb8D for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B42F608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B42F608AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B42F608AE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 149A2A4C090B;
 Sun,  7 Dec 2025 15:42:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-2B98;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:21 +0100
Message-ID: <20251207144243.3696572-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118573;
 bh=V9H3zjerbtmy+2kiqfqtDit+SoSWVt4JJrFaHzSLQGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dlaJJJgJiJ+gIcgtjQtDLZTbePOvLIn6b+52vdF9UgoRU9WW+QsUvtQbdREc03OiC
 UrAmdL4xLYO1PSKu9a/FJy7lCHJh0suewZ5UmLqQSwAdXxzn8xnel197z4arEKQ4Ew
 4NGwjVE1sO+zE2UWDBRGokUNkRK2LEddcIcaPD8hKnnPYb2EfkQrj3Ymw1jFuWtKET
 gefe8/KNXyqiA4RTKz7+TA0mfvTq1Q0vRdzjpNDvc5TJjsWpwdYEuVUTacdXnyOBdT
 c6/0o3z0NfXmSNctfl2A/TxuXcmcg4ZXv1K7BZxOH4kyrQQodYXyJQzgKKHwMnVS2/
 tfSPpamoXc1BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dlaJJJgJ
Subject: [Buildroot] [PATCH/next 12/33] package/pinentry: bump version to
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=8bf192539fed9104a1ff431c6dcc3add7fb6771c;hb=d7660807593067d5cd7150b7d4d987d60957b5cb

Updated qt5 configure options due to upstream commit:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=9fbecc223cf1755ac12f1a8a0cbbff54aa22a325;hp=da3144a702acab04cc5cc6812dcdfbfc78e1383c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 3f02eec737..4a24631ae8 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  fb0bbb88211558c8f7e652b4b6a675b1972fba04  pinentry-1.3.1.tar.bz2
-sha256  bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04  pinentry-1.3.1.tar.bz2
+sha1  ca7c502f347f248377842f7e68df5e971059e4db  pinentry-1.3.1.tar.bz2
+sha256  8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e  pinentry-1.3.2.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index ef17df7657..88a20ec3de 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.3.1
+PINENTRY_VERSION = 1.3.2
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
@@ -62,10 +62,10 @@ endif
 
 # pinentry-qt5 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
-PINENTRY_CONF_OPTS += --enable-pinentry-qt
+PINENTRY_CONF_OPTS += --enable-pinentry-qt5
 PINENTRY_DEPENDENCIES += qt5base
 else
-PINENTRY_CONF_OPTS += --disable-pinentry-qt
+PINENTRY_CONF_OPTS += --disable-pinentry-qt5
 endif
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
