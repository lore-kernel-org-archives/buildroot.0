Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF16C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B606081778;
	Sun, 28 Jul 2024 07:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnfA5t4gvGNT; Sun, 28 Jul 2024 07:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DB381799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1DB381799;
	Sun, 28 Jul 2024 07:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2160C1BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ED004016F
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7jEDaZE3jUK for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5D9E400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D9E400E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5D9E400E0
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:53:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cca8.dip0.t-ipconnect.de [79.214.204.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E9FAA4C31D5
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 09:53:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43148)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXyiO-0000000068h-0IRJ
 for buildroot@buildroot.org; Sun, 28 Jul 2024 07:53:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 09:53:11 +0200
Message-Id: <20240728075311.4745-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722153192;
 bh=Lmhk60tW5d+6hJ3VGN5klCgDeww2kTRZ34ejEMQOG0E=;
 h=From:To:Subject:Date:From;
 b=DiD2VOx+98848Xb0wxV+KhWAR6kyuBg4VMFOVuJmawXSe2MypdQRWrNIPBso09+XD
 fNEgAO34fGiBHkgnr8Yfs0wMIURlLjqrFGUe/V+ZKfptCEYvqFSRzp9wWHyOUXOr66
 bcpkzhPFJkKIiCL7zM/btzA6MnJK+spnUNzxKqsk/gExB5yaTWLU9K7c7Omwns5dZJ
 wFJfES9LwqoqqcJMluvnsQ5CVNZT96Aml4W2gw8kzAoAMeyAsWdZRdfSb5kn2uZ2du
 orAenplhaZbX9uRn9q7lKzlGQfe4ZJKcCtETA9h81t+s2AJgX6K1IzJzY95ZVm0UR8
 tgpNPtUtunIug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=DiD2VOx+
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: bump version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/leafnode2.hash | 2 +-
 package/leafnode2/leafnode2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 8ab57c93c7..9c86173ae1 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2a72a405599cd9f01cd44b6655c8986bf589b1f766c32957a70c147e39177a30  leafnode2-c514997a8c50bd28a34893d0436b0330f5719238.tar.gz
+sha256  42f2185f29a74f683a962e9cf6e38bc5f8a342d0dde8b6a03457a165365e3445  leafnode2-9543ffaf82406f943d449d522d88baa554515e0f.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 71b27f180c..566aaf3d55 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = c514997a8c50bd28a34893d0436b0330f5719238
+LEAFNODE2_VERSION = 9543ffaf82406f943d449d522d88baa554515e0f
 LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
