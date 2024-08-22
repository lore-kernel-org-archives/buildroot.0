Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B803EC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 858D18057E;
	Thu, 22 Aug 2024 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAiSd8QQd7WV; Thu, 22 Aug 2024 18:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D83080521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D83080521;
	Thu, 22 Aug 2024 18:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6111D1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B34C400D2
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6hA8aRzFUks for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48A8E401B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A8E401B0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48A8E401B0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:19:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1481BA4C26CF
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:18:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCOE-000000005cF-29Gw
 for buildroot@buildroot.org; Thu, 22 Aug 2024 18:18:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:18:28 +0200
Message-Id: <20240822181830.65052-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181830.65052-1-bernd@kuhls.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350711;
 bh=Y9QxyW7fwXA/jIrAuCZ0pqU9WffQjOxeqdkvia3Z6tA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kI8EZTbrbV1aJG7w6HH3Jz7hwN+BZszTmGBuX9ET1SD7z/ITrQ+ouSAKzUIkxd+V/
 iDDYesgRugEOavcpYSQlorlIZKCwHTVYFi5z0eGaSkAqlXJ7XkoGaZdqSK1KVjvcX/
 JVMYREgUi59CAH7dgBBdH1JvauWk7erIRa4AGQ4sSi8uiwgE67lb+i1QpZV+wJFEUX
 YZ2bTbe3wvMczk1LmqnukP6wLjqooFCITJ3IGCqbcCtXNktgFj+HmyfjwIR7XLxcUW
 dRdeDKJofY2q4FYh4anrRdFPOS7Yvj3jnFFzipeZpCQYS1RryJFJuXeEL3bMV1apaX
 cx6pEQTeGSxWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=kI8EZTbr
Subject: [Buildroot] [PATCH/next 5/7] package/kodi-skin-confluence: bump
 version
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
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index ed53dd5015..487aa7e5f1 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  85550f949598d3904bcb77e3d2e6b7fa2d0d9334a7939b964a94d98ffe0e36ea  kodi-skin-confluence-b2f2fe26ab47ca3c317d5d7927687e41584e46ed.tar.gz
+sha256  816010973378faf7ad45e8b7fb97e190500fd5f8a6adaaea032f8c877424113c  kodi-skin-confluence-ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 2898c04539..59e5f10875 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b2f2fe26ab47ca3c317d5d7927687e41584e46ed
+KODI_SKIN_CONFLUENCE_VERSION = ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
