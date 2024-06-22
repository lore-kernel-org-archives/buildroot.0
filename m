Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115AC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 10:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA059408A6;
	Sat, 22 Jun 2024 10:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fU7mj0rWoiX; Sat, 22 Jun 2024 10:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D94408C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D94408C3;
	Sat, 22 Jun 2024 10:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63BE01BF5E9
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 10:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F2884015E
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 10:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpmReg07zFhs for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 10:25:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16D4C40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D4C40108
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16D4C40108
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 10:25:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb81.dip0.t-ipconnect.de [84.161.187.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBC12A4C0403
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 12:25:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46950)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKxvs-000000001LM-2YzB
 for buildroot@buildroot.org; Sat, 22 Jun 2024 10:25:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 12:25:20 +0200
Message-Id: <20240622102520.2217175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719051921;
 bh=QirNhbTAqXjob7lq3UAsD2w3SwJ+0sWa72YDpVrxCQE=;
 h=From:To:Subject:Date:From;
 b=EqjSxvKta3PN3vqyHvHOLo3q2HN49WPihxhnWFpyT9+55IHvGkxYdSfW8mbmjc2x+
 y2rO/T97DXGh1tUHRVXEzLOg7Ktsn7oDlnifnEYl8HDrG8mVm8es0WjeKP4Lv098MB
 cOS8qMUZ2R6ZKr5gI60pK4nZ4yq43OVj5TkLzSSddckuUP2w0TU4WqbkrU6vFC4lG8
 XT1V6MiSm7bd7jUQt1MfGsWdsuHjpRTO2CtYJUIiNuTJs9gHhWIuNHGkZqJSwUAVwZ
 pHTnziicJDRQcKYBGz7O9Wk3YmVzh1MSGcL//J1DSdmrMsd5SiMFnIkIvcDDGDtCUV
 JR03Izjrd526A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=EqjSxvKt
Subject: [Buildroot] [PATCH 1/1] package/transmission: bump version to 4.0.6
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

Release notes:
https://github.com/transmission/transmission/releases/tag/4.0.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index ed600c7699..3e470a002e 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  fd68ff114a479200043c30c7e69dba4c1932f7af36ca4c5b5d2edcb5866e6357  transmission-4.0.5.tar.xz
+sha256  2a38fe6d8a23991680b691c277a335f8875bdeca2b97c6b26b598bc9c7b0c45f  transmission-4.0.6.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f1130aeadd..1eab839fd3 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.5
+TRANSMISSION_VERSION = 4.0.6
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
