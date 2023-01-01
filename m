Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49509C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58F4410C9;
	Sun,  1 Jan 2023 23:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D58F4410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xd6Np2jQhQZC; Sun,  1 Jan 2023 23:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EDE410AF;
	Sun,  1 Jan 2023 23:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0EDE410AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 266301BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DE45410D3
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE45410D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wokSiX12lL3k for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384E4410D0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 384E4410D0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:45 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d127so22460139oif.12
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjBHtOY0ca1jB9CCGRHTQWvygZxZ3zefgaWxrhMlqeM=;
 b=Gh3EDD4yazpt+hRapDI2HEW2FG6p5jeOya9HhB1CYylVH4J1cYdmcbnvwxtwUBx9Ky
 o9Qb8tm2Vw8CJbHfKJyCMgUu2eSMNQMcBhLlIbNg4ODV9KIBx5nPE84BrKB8hm6oCxBC
 lSG0PyM+zWlhrndNjdDlSYqRX0QjFcqAET5R73IAE+m/cnY6xIYNiQgEbH+3F8MzEzuY
 OQtikpFUhyvloVkt8T8Wc92pKcYb7/EugCSRxl4UrnBXe1B45UdvqUTMHFrLmpoxcC9a
 4G1czBIC1TB/xNWHoUevaMJ4inftNhjnaUKURIXXtpnWI1u6ImI1+uw4j3QKG39BqzwU
 kbPQ==
X-Gm-Message-State: AFqh2kq3dIccHoH45Ik4qSXCZCBui1nieUYIT1anhnaTy++vPytFBk4q
 4VOcFrBgfv6QGJg6c23twOaq3m/xqLQ=
X-Google-Smtp-Source: AMrXdXvR1er4fLg75OAjSkfw54sBVP7LX8lgTI8luSqrxga3SJ3opsqZ4fVvb8aP/aQ3VpRVxyI/bg==
X-Received: by 2002:a05:6808:2082:b0:35e:93bf:a9bb with SMTP id
 s2-20020a056808208200b0035e93bfa9bbmr31335698oiw.13.1672616384233; 
 Sun, 01 Jan 2023 15:39:44 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:43 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:40 -0300
Message-Id: <20230101233653.487175-17-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjBHtOY0ca1jB9CCGRHTQWvygZxZ3zefgaWxrhMlqeM=;
 b=BzSrOLaPwH2aQQ+vJsKKk8mDr2jve9H0hyKjI2CPoJGETKoeN9UpxDJX8ACqX3YSOr
 326tN3P1DrB5AP638l62I4H6V48WvN+qPyED/iLDxEqd+J/U3SEWeJHKsD4ioqucnStC
 Ehpbhn9OBAMGp1ibl4X3lComf+BKzDsaUR9ed2KU0rzCn/wTSpVN8NQ6gkTffPDilAn+
 T09xDB2Fctd8Mja8PxkQcbCpHoIrTr6f980XC6nXkTjFBbnuqw7mgdSV33YfQExBB0MU
 7uYkRTtecOpCj6JYxGIKtUbKXF01V/GsIlm6pSU0LdHFQu/SENRlLCmlHnnlaLq9D4Tz
 RRuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BzSrOLaP
Subject: [Buildroot] [PATCH 16/29] package/glib-networking: drop dangling
 GLIB_NETWORKING_INSTALL_TARGET_OPTS
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 2015, commit "3fe434bf35 glib-networking: specify GIO_MODULE_DIR for
target" correctly used <pkg>_INSTALL_TARGET_OPTS with an autotools
package.

But later on, in 2018, commit "928a72c49f package/glib-networking: bump
version to 2.56.1" changed the package to use the meson infra, that does
not support <pkg>_INSTALL_TARGET_OPTS.

So this symbol is bogus since 2018. Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Before this patch, 'GIO_MODULE_DIR' cannot be seen in the output of:
make V=1 glib-networking-install-target
---
 package/glib-networking/glib-networking.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index e8905dfff4..4adc13d39f 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -21,8 +21,6 @@ GLIB_NETWORKING_CONF_OPTS = \
 GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_CPE_ID_VENDOR = gnome
-GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
-	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
