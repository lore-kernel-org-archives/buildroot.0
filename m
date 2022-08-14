Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF77C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5843660BB5;
	Sun, 14 Aug 2022 12:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5843660BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxNHKK15jOlT; Sun, 14 Aug 2022 12:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8061D60BC8;
	Sun, 14 Aug 2022 12:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8061D60BC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 391021BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 147D681ABA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 147D681ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_qtRjDQ0kuE for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE55381A4E
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE55381A4E
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:56:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id uj29so9480261ejc.0
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ACaXOHbNSG1UjI1CyurwOJ1roJ+7o9Gld9U9eP8lco8=;
 b=ubdtxNQDKAgJf5YkJ9vUkUu45VNmzDm1/QXC/TxeePFuLltlMXNPdOqI6JdFh1ClS0
 FcSX518jY+Rcq/yUXeRWwB3soUqHcfGR+KEe6Fb8ftF1CLEBk7ahG18Ri2+8PJ2jwcky
 vwMjRrkLOerI733nDt5/QKs7cyHlv768rIo4iUEU4MckUpKoWvFx9E5CPDKfTE4A/8f9
 gG4Jh/gn6wvIuIL/YqZR/DoZWNLY9P/z8hCoBBmxuxr6w/nXrwCfd5vp6/dUqtfEgJnt
 vR9qE9boB7W02he6hy31XcyKqPjZN5aZ6Nm1Nn6meV53r6Uf/C2xvs3eH3BFag6Y4eGb
 79Yw==
X-Gm-Message-State: ACgBeo2nmQh/OavepR1UaCl3h3L8aiJRrisx8Imev+rzWaMkH3BZZv7e
 oZnK+gLfto8JPOmhTveP1/2JwqSJUwg=
X-Google-Smtp-Source: AA6agR4yj/i+fXv6bnjlspmZod0JeXTTGMSxePEQF/b9n4ZU4yCBQRG7A7ouROynvqXmVjHk3sj2Ow==
X-Received: by 2002:a17:907:763a:b0:730:9524:a2d6 with SMTP id
 jy26-20020a170907763a00b007309524a2d6mr7587418ejc.59.1660481786189; 
 Sun, 14 Aug 2022 05:56:26 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 b25-20020aa7dc19000000b0043d668dec21sm4713765edu.38.2022.08.14.05.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:56:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:56:21 +0200
Message-Id: <20220814125621.1227931-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ACaXOHbNSG1UjI1CyurwOJ1roJ+7o9Gld9U9eP8lco8=;
 b=LKicx6+gtG8JhsqSMDMQb3EAZcwjFox/TOx36kBOURxA10UsJMo7qGjwPG4J7FWHW/
 qD5lKUzhcmbienyNbA+TELIFXur/NigWH2aVltNMHUoWL+yc4q5TBOyUt1KJyPOo6Uu5
 3WKG0Z5LAyznn5UHX+F2Fy+/lceukJWbavQ4FpSpLdo+oo8Sdmobx6DC3JPc80xjB8vF
 9rDBf2YKLQxK+13gcbD8aNV7s6lIn9qIM7K/6e1EcgfAQzF8Pv3lhDLi2m6iaDuvsbU7
 Qynzsr527QS/xGuc6CAQkho42//+iSCkXbLyce9lgjAyM336fwqZ1S+RB1C/0n799zmm
 VB9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LKicx6+g
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.9
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 9a73001c9..48d7f4d5a 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.8.sha256sum
-sha256  cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa  pango-1.50.8.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.9.sha256sum
+sha256  1b636aabf905130d806372136f5e137b6a27f26d47defd9240bf444f6a4fe610  pango-1.50.9.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 30b1de9d2..348759092 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).8
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).9
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
