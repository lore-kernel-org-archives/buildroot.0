Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE8DC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C33560FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C33560FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31802402F6;
	Sat, 31 Jul 2021 20:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbJjEzf3BSXO; Sat, 31 Jul 2021 20:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4CF402D1;
	Sat, 31 Jul 2021 20:40:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7ABC21BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C48605F1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkUEbdw6QSil for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:39:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D32BD605E5
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5C351827C4; Sat, 31 Jul 2021 22:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1627763977; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=azoBrqbWe2XH27V0+xPivHrGUCpKfXODliuYP2eadvQ=;
 b=fMwjan3Moc6KQo5TJ3byHF2a1HBhJZMHKAEdBI4cpg4P7TfSY3tfZ2RRifjH9hvVtIcI3+
 /oqorcuy4zlrbpWTypX+QKcmRhFPrlsNkwebhCM0H9U4I7hS24EvjiPilOwL7Xjb31vk2m
 AgmFvaWf2h0LJGKGHQuhT/31GzYTfPs=
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:38:05 +0200
Message-Id: <20210731203814.68125-4-buildroot@heine.tech>
In-Reply-To: <20210731203814.68125-1-buildroot@heine.tech>
References: <20210731203814.68125-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH 03/10] package/cwiid: select BlueZ HID plugin
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@busybox.net>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

the HID plugin now needs to be explictly enabled.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/cwiid/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 374a91ffd6..e03248c722 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
