Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06010C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 23:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 564CE40164;
	Fri,  7 Oct 2022 23:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564CE40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7W946P-kMJRB; Fri,  7 Oct 2022 23:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9182A404DB;
	Fri,  7 Oct 2022 23:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9182A404DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6A9A1BF2C6
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 23:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1E1404DB
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 23:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B1E1404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7J2jZf-RAQY for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 23:57:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E180B40164
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E180B40164
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 23:57:22 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 1EE7B24553;
 Fri,  7 Oct 2022 18:50:15 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 18:50:02 -0500
Message-Id: <20221007235002.79221-2-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221007235002.79221-1-vfazio@xes-inc.com>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1665186615; bh=K3TmpD9WDyN1syWtKhd24sCDMizVtk4kSXmUxApOW1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xX1FhElNaXxR8hlSCIFB9GSlMnsnh9zSObaBdbzM9hV61RWPEN13R2TUZDYgq2NI5
 upmawRj8DgUxl4xBLbw5V8/xKpcSURfg9+Shd6C5m2MrRr2DJBnMEvqEKfwATyvSZI
 SjYJpDQVV21UuL4zwnzqL/trepfWhgqneTnnJ87U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=xX1FhElN
Subject: [Buildroot] [PATCH 2/2] package/busybox: redirect errors to
 /dev/null
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When busybox.mk gets read, pkg-conf gets executed to determine the
location of relevant libraries.

When Busybox is built with per-package directories enabled, a number of
errors related to executing pkg-conf occur because directories have not
been synced to provide pkg-confg at the point when it executes.

These errors occur in stages prior configuring the package and are of
little consequence so redirect the errors to /dev/null.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/busybox/busybox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ef628e90e9..0dec8d6d60 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -79,10 +79,10 @@ BUSYBOX_DEPENDENCIES = \
 # support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 BUSYBOX_DEPENDENCIES += libtirpc host-pkgconf
-BUSYBOX_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
+BUSYBOX_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc 2>/dev/null`"
 # Don't use LDFLAGS for -ltirpc, because LDFLAGS is used for
 # the non-final link of modules as well.
-BUSYBOX_CFLAGS_busybox += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+BUSYBOX_CFLAGS_busybox += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc 2>/dev/null`"
 endif
 
 # Allows the build system to tweak CFLAGS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
