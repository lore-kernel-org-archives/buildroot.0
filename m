Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2740CC001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 21:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C6681218;
	Wed,  2 Aug 2023 21:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C6681218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ax7mXzti-j7p; Wed,  2 Aug 2023 21:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96FA6821BB;
	Wed,  2 Aug 2023 21:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96FA6821BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 164131BF42C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 773C741E19
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 21:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773C741E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Haf3ZgY4x8CX for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 21:50:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82BF940263
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 21:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82BF940263
Received: by mail.gandi.net (Postfix) with ESMTPA id 52DA01BF20A;
 Wed,  2 Aug 2023 21:50:00 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed,  2 Aug 2023 23:49:47 +0200
Message-ID: <20230802214950.1817381-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214950.1817381-1-thomas.petazzoni@bootlin.com>
References: <20230802214950.1817381-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691013000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fee20CzzmIBb8lBWylLNO3KZOvYwtN3VBcLynnegXgA=;
 b=cv7CqFyrhw4bAUKphqFiaVDKO0/ayB/aCBa5h96Wu89V+57AjAAEIsO+GMxdF4JryN6wxI
 fYsvtWmAjl6gVwzDT4Zg9azOgkVRWZo3uk3zUiIpmyPGSHUbUkIsFOkFl2y1lV+0OH74ro
 pdj+D9C6b0y0q6j7Li61SYXGu1zAGEDF2/p1CAQY69/5zQUD8xLVmjIjogOYefY+fSY5yU
 R/Dbw1kCBKPKwEoWQYN1WH1QhPLgGnPJ5OtNBHA7xm3Hd6tWMSmi+FSjgFlUFc+8VVt6BF
 1dVVpl6jZif1SPagt1ixibFYuxGyTLLkfTnVCClAe5I5e3S4/v/SO2PSqT8pXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cv7CqFyr
Subject: [Buildroot] [PATCH v2 2/3] package/gdb: make version 12.x the
 default
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can remove the quirk around BR2_or1k: it was there to make sure
that 11.x was the default when no target gdb is selected for all
architectures except or1k, and that 12.x would be used by default on
or1k, as 11.x is not available/broken.

Now that 12.x is the default for everybody, this quirk is no longer
needed. 11.x was already no selectable for or1k, and remains not
selectable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 73aac0857e..14efb10c76 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_11
+	default BR2_GDB_VERSION_12
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -71,7 +71,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "10.2"	   if BR2_GDB_VERSION_10
-	default "11.2"     if BR2_GDB_VERSION_11 || (!BR2_PACKAGE_HOST_GDB && !BR2_or1k)
-	default "12.1"     if BR2_GDB_VERSION_12 || (!BR2_PACKAGE_HOST_GDB && BR2_or1k)
+	default "11.2"     if BR2_GDB_VERSION_11
+	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
 	default "13.2"     if BR2_GDB_VERSION_13
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
