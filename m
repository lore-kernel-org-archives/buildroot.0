Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A939D60BC8;
	Sun,  7 Dec 2025 14:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3fCaTryHt2Q; Sun,  7 Dec 2025 14:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19ABA60AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118749;
	bh=ymIfxvmAsij0Ad0dRm9SdjNZBV+VMPlwvEgF3PUYaJA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iybN8jZyJjP7/EpeuwuYrXYpHapOnLB0VKCkAs+b+0hS8kiGCrhc9uknhFmvrzjMm
	 Mi1n98VmwF+88gjN1lUvBTkVjGMyfZES+7j75go4Z2PtxF62quVQdtbzh0bnH+nQij
	 DNInvdov5pYz3kF+ymhqckZTqot3nLIUavD+IAEsM3xPnPLV8d6S/qFjmND+vnfMeL
	 yFltWCL9rJ6Lt86Vu7xtQgAtKhgK7D6b7Stv7h7Wf5MUp7FzbSKNjXvvu8uu+2R8zX
	 EP61u259U7SSNZxB4dM6jK6uTi5TdCLU/2pqQNfx9UTTMjj6Fx1qnpQuOnhqYOgUe5
	 XKxQ0PzmTYmpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19ABA60AC8;
	Sun,  7 Dec 2025 14:45:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7004F151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560FF82234
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwKHGEPW8_mv for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41D148221C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D148221C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D148221C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57378A4C09C6;
 Sun,  7 Dec 2025 15:42:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-3c6X;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:25 +0100
Message-ID: <20251207144243.3696572-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118576;
 bh=ym0oMFzTszCB412t8q4Oepw307HfklXRgwsd+DrbZ6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cunkpJbWAIgi+V5kS5Ry5jWU9I3Bzr7VR/FfFl9bW/RzE/7V1PWD6/cnSjq5a0qZ1
 tw6YGn2LTAyaKwsQDH/UqS3BnI/h+VWLJcF3dZKrn/tjdQno93R42qCbXQtY6AJj3a
 8jNypTfZDTFmWYHedecY3mXnar/PvNTkzJdJrv5MBcVxUGUP5SP8AJQFldPjP2Ac/c
 PS5EmKJTHnkTZQrOVxjlCg9TKR8uVEXXh3I7nmkpTmhlINVJr/ADwXpNU5bcr+RMwm
 Vhewfx3a+CCtvsqlfVdcztTIPBE9s5AJ7HM5TPQQF13Zp2xaTvX1E0EkxSmqP9f2Vg
 6qxuOpZHd1Fvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cunkpJbW
Subject: [Buildroot] [PATCH/next 16/33] package/rtty: bump version to 9.0.4
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

Release notes: https://github.com/zhaojh329/rtty/releases

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rtty/rtty.hash | 4 +++-
 package/rtty/rtty.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index 004314eea1..95b7a6bcfa 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,4 @@
-sha256  522b0fc5e032c3b84ac707abce8ac4ff5609900011f8f300ce4f4246abac0acc  rtty-8.1.2.tar.gz
+# From https://github.com/zhaojh329/rtty/releases/tag/v9.0.4
+sha256  3bfc5db341c40e451544a218b7ef2cc59329ce04c50824b8ce6e5b805504c9bd  rtty-9.0.4.tar.gz
+# Locally computed
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 618971c9a3..4dbebdf12d 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 8.1.2
+RTTY_VERSION = 9.0.4
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
