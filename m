Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8909AEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 16:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B821240857;
	Wed, 21 Jun 2023 16:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B821240857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZImAp1JaMlLC; Wed, 21 Jun 2023 16:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8175E401F3;
	Wed, 21 Jun 2023 16:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8175E401F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C0DE1BF3B5
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03935401B3
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03935401B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvksncXv8j4g for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 16:18:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB95440188
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB95440188
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 16:18:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE3C3A4C02CC
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 18:18:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59968)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qC0X1-0007VY-1N
 for buildroot@buildroot.org; Wed, 21 Jun 2023 18:18:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jun 2023 18:18:07 +0200
Message-Id: <20230621161807.634101-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621161807.634101-1-bernd@kuhls.net>
References: <20230621161807.634101-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687364287;
 bh=mNmel/73JnFL9Ioqr/SWdCOXYjgbxSHJfO7bJRP75DE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cb3uT2zKOH0894nH94n0VRTWIo5fzIJphToWLixEdosdqCPWPhYiyeR4hQzcBtQfM
 6Zvtd71KyYHFalU3JsJ5UvyOIgtJ13CUafQe7XOleMSert/g1ce/j9mfpB+1RKP0kH
 wvMkOaOAwUoYQvjB4wGu0bo52xKCzvvkHMAQMD2DIIYw0Q1xcv+GnyejYNJT1Xa07m
 iYeuaQ0m6MLbYGimB486XjLQ1SIP5gLoYRF57qVh/SEHuj2xa9Oq3r6DFiV0zb4ovA
 qOQ9GxliEI3oDA0xu5yU42X6QhdXA+WRLK6kUBdwxmZNdRtP2laOSpzpz2FCTphhZu
 nbdcr+9fPJxHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Cb3uT2zK
Subject: [Buildroot] [PATCH 2/2] package/raptor: fix build with newer
 versions of libxml2
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

Fixes:
http://autobuild.buildroot.net/results/6a5/6a5139fe86b8370477dc6cb044bf29180bd145df/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...s-to-entities-checked-private-symbol.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch

diff --git a/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
new file mode 100644
index 0000000000..cd9542a9a9
--- /dev/null
+++ b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
@@ -0,0 +1,35 @@
+From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
+From: David Anes <david.anes@suse.com>
+Date: Thu, 4 May 2023 11:54:02 +0200
+Subject: [PATCH] Remove the access to entities 'checked' private symbol for
+ libxml2 2.11.0
+
+Since version 2.11.0, some private symbols that were never intended
+as public API/ABI have been removed from libxml2, therefore the field
+'checked' is no longer present and raptor fails to build in this
+scenario.
+
+Upstream: https://github.com/dajobe/raptor/commit/4dbc4c1da2a033c497d84a1291c46f416a9cac51
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/raptor_libxml.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/raptor_libxml.c b/src/raptor_libxml.c
+index 538c2c8e..8bcee139 100644
+--- a/src/raptor_libxml.c
++++ b/src/raptor_libxml.c
+@@ -246,10 +246,11 @@ raptor_libxml_getEntity(void* user_data, const xmlChar *name)
+     
+     ret->owner = 1;
+ 
+-#if LIBXML_VERSION >= 20627
++#if LIBXML_VERSION >= 20627 && LIBXML_VERSION < 21100
+     /* Checked field was released in 2.6.27 on 2006-10-25
+      * http://git.gnome.org/browse/libxml2/commit/?id=a37a6ad91a61d168ecc4b29263def3363fff4da6
+      *
++     * and was later removed in version 2.11.0
+      */
+ 
+     /* Mark this entity as having been checked - never do this again */
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
