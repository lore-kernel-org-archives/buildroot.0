Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABF2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 13:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B22EF830E6;
	Fri,  7 Oct 2022 13:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B22EF830E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPPq56u86UhN; Fri,  7 Oct 2022 13:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FB3832D8;
	Fri,  7 Oct 2022 13:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FB3832D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 777C91BF30C
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 13:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5036E40880
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 13:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5036E40880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9UE5AeEwdXH for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 13:39:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B2A400C6
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1B2A400C6
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 13:39:18 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h19so3658462iof.0
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 06:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DT9HUOC2DBCtqq+Chmvy695jHQyn0vEF8pun+g342zs=;
 b=XP1h0Gqnm/BBZJqf8EA1Z5LJBOHdeZhA7DihOI2DkA+ur0i4kdcDSG/76NXlHMC7KK
 gI6FAsbqqzvKz/mqEHu0H+PfbvFEP/76YteT0sC48H++NaTBKRNhSV513RgiLQg7sVje
 92QYXCDJYKnMacTx2tfDoDM9EOWTNz2tY9aCoDn5K0WOps1A4GrpRaHsF6MjGPHBk3Yd
 BjruJMWEiAtevZKpcHolt856yix4b4588+KH29i/4wAW4YxSk2T5b/6B+EQ+RjdKefWe
 qUka0NYQSW/POGDHaC+0FxK8W8jpw0ykABHzA983pV7Wj5iyoQsAQDIKyIXUhJKjGuZX
 Ar0Q==
X-Gm-Message-State: ACrzQf3XYFHyKs8wqGYnKNtvHRUZnOs9wyB5Z2OC0RD2RIAAIEiduHc6
 e+QLX1YGW05OZ+fupE9Cs+6e6q/pssgCCw==
X-Google-Smtp-Source: AMsMyM5GtBf3JLav0IPd8At4qwAuKxUHrLZ0cMgV5j5pE02+ue/dG4SZBesxpvWLxRM4NQ3/wcvBkw==
X-Received: by 2002:a05:6638:2642:b0:363:81c0:2c3f with SMTP id
 n2-20020a056638264200b0036381c02c3fmr1834729jat.205.1665149957595; 
 Fri, 07 Oct 2022 06:39:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x3-20020a92b003000000b002f6365aae11sm875861ilh.87.2022.10.07.06.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:39:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 07:39:12 -0600
Message-Id: <20221007133912.2869000-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007133912.2869000-1-james.hilliard1@gmail.com>
References: <20221007133912.2869000-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DT9HUOC2DBCtqq+Chmvy695jHQyn0vEF8pun+g342zs=;
 b=Gr8LjbztHXonAdy4s6nU9U0QaZOQN1uIJJ8cUam7Va1rqC+2I6EC1W5f5Rv/3NiHlR
 PWR6NRsN+N3ImUUj9AK7XhYPsU5X2dts6gFDgF0HdgzWYIrCuKFFI4yKJhjh5AxiXfKX
 A0f2+QSdZV2CmmXwRVA2mZmVP90Je6p0PMM/1tNDRWihkFe2BGHWvelTkLwmBQx41Gqu
 F6n3KJboFOG2GwRR5plwYo7af9PncPHPb3zv8nJaUItYagEbIiqFk011IL+erBDQ13pi
 PTkA4rhVe/xPAeTPRG9sD6sy+6FgqYuNvY867Ciczftcekcd9xStEgBAJJ9jvNZhRmjQ
 sLEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gr8Ljbzt
Subject: [Buildroot] [PATCH 2/2] package/gobject-introspection: bump to
 version 1.74.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gobject-introspection/gobject-introspection.hash | 4 ++--
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 8f9d323d9a..c1a1363ddb 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.72.0.sha256sum
-sha256  02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc  gobject-introspection-1.72.0.tar.xz
+#From https://download.gnome.org/sources/gobject-introspection/1.74/gobject-introspection-1.74.0.sha256sum
+sha256  347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653  gobject-introspection-1.74.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index c8ad9b3c72..436c12aa48 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.72
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.74
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
