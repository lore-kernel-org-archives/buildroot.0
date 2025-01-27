Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571ABC0218C
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 09:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C9F60630;
	Mon, 27 Jan 2025 09:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BDMBdRfJlkn; Mon, 27 Jan 2025 09:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E1D060670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E1D060670;
	Mon, 27 Jan 2025 09:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7EAA71F
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88AB060670
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLhiisSl_PfM for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 09:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B029C60630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B029C60630
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B029C60630
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 09:17:25 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 84B163F9E0;
 Mon, 27 Jan 2025 10:17:18 +0100 (CET)
Received: from UDERZO.MYINSIA.INT (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id CAA975F497;
 Mon, 27 Jan 2025 10:17:30 +0100 (CET)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Guillaume, Chaye,
 Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Mon, 27 Jan 2025 10:17:10 +0100
Message-Id: <20250127091711.3877692-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1737969438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0JRnvf8I5/3M9Q6qMdfJIFjSLLv+Mu9kP0lmzxyA4Cs=;
 b=CoExeMof3BKpKG9tWankvR5is+XM+x4OBTZoYs73RBJ+AIrzkLsChtGOq6M9IRldNNJ39x
 WXQ1u2cVj6vjk7Vg4aGy/TbFc5V8qkGVbupT9q1mScJknT9Z+vJeQjrzAhAkL+85gQaY+S
 EkVfWC/NcjCsj4KZdBD0GKhgnuZeW4YEAPdAe+0yNjKSB2QN/8LLsX4NiFLHki1QgxWnwW
 JgD5qZHspiZxFn57d9tB8CkqUBb/r08Q4TmqN0HquptSdkaIwyZf2NnRRFVy6LjI6xikk0
 SFN+2MCbr1W85AbaVDKB3TursG8jZgqT7sGgZMv0bV8aT70ZvABS9tQCwlRxEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=CoExeMof
Subject: [Buildroot] [PATCHv2 1/2] package/avahi: add missing dependency.
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

libavahi-client is not built if dbus is not installed.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 package/avahi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 728bc4fdd1..ae53aaf156 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -39,6 +39,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
 config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 	bool
 	default y if BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	bool "libdns_sd compatibility (Bonjour)"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
