Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A58EC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0635D41198;
	Tue, 26 Jul 2022 16:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0635D41198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIvZUTxDeRuF; Tue, 26 Jul 2022 16:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33C1B411A8;
	Tue, 26 Jul 2022 16:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C1B411A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 755561BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26F574016A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F574016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMsOYLgu1_sf for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D71A74014B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D71A74014B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:31:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D9F26240005;
 Tue, 26 Jul 2022 16:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:30:59 +0200
Message-Id: <20220726163102.2107923-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726163102.2107923-1-thomas.petazzoni@bootlin.com>
References: <20220726163102.2107923-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLWmkQBapBUr5Pa80/5poNU1mXhAfXE1KoHWBhtG5cE=;
 b=gFRlHDwJQ0JTO0Hb/mUpDkyVLlI0VaoH8d97ScKryH/lXuT8tWMOOfylJqa/XgeeIEjPlz
 hwYnec7whUxxMiE19fveCi0Gh+dx4WMuzDxDQ/E1lQQiYbdcNytDy0iZYF8bWpn4/jwnXe
 De4e63lrFATjkJJ+DurUfUTtHAerTmvU8SG7BnbSMeuFEO1wCBCw2VVmNgfy9f7fVtWur7
 l0Kz9HoaxHaJtqsUEtBLUm1RjQsuiwt3Huui5spUkyle8MitM4WlpjjLyB/rKLsKwbINkR
 O3QSerAQY6hsRzEpvNzIo5y3E3/hxiW4bhhkujP9nMJ8hn0c8G5wdoEctswaVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFRlHDwJ
Subject: [Buildroot] [PATCH 2/4] package/Makefile.in: add detection for the
 lack of C library
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We recently had several cases of architecture configurations for which
no C library was available, leading to a build failure during the gcc
build. In order to more easily detect those bogus configurations,
let's bail out very early by detecting the lack of C library
selection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..f8920c87a4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -47,6 +47,12 @@ else
 TARGET_OS = linux
 endif
 
+# This happens if there is a bug in Buildroot that allows an
+# architecture configuration that isn't supported by any library.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),)
+$(error No C library enabled, this is not possible.)
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
