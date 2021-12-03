Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3469BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 22:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC5383A47;
	Fri,  3 Dec 2021 22:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npjW-QOBLrNl; Fri,  3 Dec 2021 22:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 371F5833CE;
	Fri,  3 Dec 2021 22:56:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4C81BF9D1
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F4640292
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 22:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqU8n77q0JzU for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 22:56:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 420FE4010E
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 22:56:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d9so8754196wrw.4
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 14:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1vW7mCLK8jZVpW0YsMD6+No89wWiTBczmgUje/02pY=;
 b=lfOPa150nkVR70I+JpSK5OKtrhcSbQZyFGQu5kq66iuepHjTLLYaYCn6Q779VpkZj8
 S1/gnaHxFeLlZlEMP47MF9GbB20rI6EAo/kPadsIBenu2/Ik0mxTFV0H5qbH+YZkqSAB
 hoLNaWOQtdIDAGqPab/RWxofZM7TjMd2+wdG+Ce7RAYLx+wSNd7PIqp5BU2KCh7nYtDp
 sWy/dzX7x9/FktOGVzIIGdUjP94MqD30pfz9e4H+5XxfVvJww8/RXGYCFjBrP1G8DgFa
 WzXuvzHQDNd6ReYYpiCjoAL6qmKWdFy18wacw/TGQx7KlhY+pelF7DIVIlhxHKWjm2p1
 aOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1vW7mCLK8jZVpW0YsMD6+No89wWiTBczmgUje/02pY=;
 b=FiadLCkABPRcIn9AoThqzDY0ggAVNbtBAhMyBWy0op0FrKQDnH4KAphucH3/AWSBsp
 kvzRo/mWfBZucXWBOm0/4FZQMj0jhEDWj0b+myQg701bowf/aLq/ep771lD2M3aNQnam
 cVcNaT/zi1LUC2jpwnmquv3F96Ir2smf4KPVIdz5IRYvm+H5v6TMNY37xyzrlPLxHgaV
 pgb5cloYmZyKr8cbDeXilq6bchdJAufhINLUej7BAekmioNpBKXjIHvXIqUdrd2/K8rp
 pIZ2OkMEA6EkcY0MBmyM1n3qIqMVDDd13G0uxkjr+4yAcptiMBzly5nIoRI4DnPITKtO
 nOog==
X-Gm-Message-State: AOAM533DVxuJN6Tk+vNJJu/+X7hi7uND+ihF3qJ4WgFetVUlM6OpesZw
 vIWD5/g3STklGR09m8rj4K9p13COZLX2yQ==
X-Google-Smtp-Source: ABdhPJzcYyjIgFWTMD4HGns+17/POI0UqL319JhJwDh3r9JlSeRGdo+Qb/jhD8jeb61DSacAPunnTA==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr24359033wrr.152.1638572196313; 
 Fri, 03 Dec 2021 14:56:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m21sm3826010wrb.2.2021.12.03.14.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 14:56:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 23:56:45 +0100
Message-Id: <20211203225645.1928147-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/guile: add GUILE_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gnu:guile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aguile

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/guile/guile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 44f4d1c85e..b62d06e704 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -13,6 +13,7 @@ GUILE_INSTALL_STAGING = YES
 GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
+GUILE_CPE_ID_VENDOR = gnu
 
 # libtool dependency is needed because guile uses libltdl
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
