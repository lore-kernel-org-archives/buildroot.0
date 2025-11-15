Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CDACEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 16:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7590760905;
	Sat, 15 Nov 2025 16:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwiXUj_DLvJg; Sat, 15 Nov 2025 16:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE986608C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE986608C1;
	Sat, 15 Nov 2025 16:48:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 744D41A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB90608C1
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU0ufkYT3l2P for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 16:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A34FC6080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34FC6080E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A34FC6080E
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:48:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11DDEA4C6C73;
 Sat, 15 Nov 2025 17:48:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJRs-000000002XJ-30x8;
 Sat, 15 Nov 2025 16:48:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 15 Nov 2025 17:48:24 +0100
Message-ID: <20251115164828.1519438-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763225309;
 bh=V85peQP5IGW5s6vsAyeF6LssnKfY9C2KP/HmlF2/Ia8=;
 h=From:To:Cc:Subject:Date:From;
 b=Ax2PYv1kp1heN/LbXnuXd56qk51cKOT0mQ4jg82U8YZxdYpex1YzL2OkUrv5Tnyhr
 5tAtpXQKzDmHxkMODHZkUX+yYFkuawXdyyioT9yTHZcoANeF9uiFfJLD3E1r5RJnDJ
 DjNFCjXSg2zljoCIEz1nJbl3zTu7PJFpYQKX9sIE7ntXAHqO/JmoSUxk0nOF6gU/lM
 aspwWuLGkP1Tt8aG8EN8djVKQUgR9P5ZoptTnvCYOpiBUHSnhuzYEOmbN5/yq28g0H
 OYWt1fEeIJB+9W6McPTnwGpuxciYIyaA3AveQPWIrNTa2zHWZREo25kZCibU7aHvlr
 NWj7mFByMwK1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Ax2PYv1k
Subject: [Buildroot] [PATCH 1/4] package/liburcu: bump version to 0.15.5
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

Changelog:
https://git.lttng.org/?p=userspace-rcu.git;a=blob;f=ChangeLog;h=4833f6a67efb4cf0c4e56c9e4153b3ded6d89d34;hb=refs/heads/stable-0.15

Added MIT license and updated other license files and hashes due to
upstream commits:
https://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=29b2b11ef53eee2848dd06fba8c49003e17c539f
https://git.lttng.org/?p=userspace-rcu.git;a=commit;h=d001c88633f6a58e94eb73f4814976d13f61bd77

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/liburcu/liburcu.hash | 12 ++++++------
 package/liburcu/liburcu.mk   |  8 ++++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index a78b196ef6..5b5947f6b8 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,8 +1,8 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.14.0.tar.bz2.sha256
-sha256  ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f  userspace-rcu-0.14.0.tar.bz2
+# From https://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2.sha256
+sha256  b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1  userspace-rcu-0.15.5.tar.bz2
 
 # Hash for license files
-sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
-sha256  8ef8121eddd2fc0779d94331a1d0f1ead9c796343d845e564cd8c8c4ae3d6f6e  lgpl-relicensing.txt
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256  e8c070cb093be4b2eaf938a5f1c11621163b2d9cfa2790460cf925d81e442fa7  LICENSE
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  5f968522edc611ac568371336609170b00dca5159211a87d2e136b837222826b  LICENSE.md
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index bb5e2c0ec7..656dfb2408 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.14.0
+LIBURCU_VERSION = 0.15.5
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
+LIBURCU_LICENSE_FILES = \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	LICENSE.md
 
 LIBURCU_INSTALL_STAGING = YES
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
