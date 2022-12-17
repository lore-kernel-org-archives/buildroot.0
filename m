Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 15:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 094274055D;
	Sat, 17 Dec 2022 15:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094274055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5jKz9Md_XRa; Sat, 17 Dec 2022 15:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6C24055A;
	Sat, 17 Dec 2022 15:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6C24055A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1EF1BF2FC
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EF360DB2
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EF360DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8z2eIPtafO6 for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 15:37:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D3960D95
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D3960D95
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:37:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso2721574wmb.1
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 07:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEAe1KnEKjo3LjUlL5wpj5uXhXmZ4tpV9SloXZhyZ5A=;
 b=Qq+DH7bGIl3Ow+C3766xBvR76Sd2013d5KBqMl3nbuQrkE9pyDcWnRUNbX2/v+WRWj
 bgERfuOOMaMUILATKleRX4IRCfS0j6B/qw0C41y8a3SQJDlhvhyU3+IuD+J7ll47xxsT
 QHSwYvSEUYJbyx4HMq6NpbB3jT/wbk/A28/A64vPg9uCOdKbaSn7rqWLf5I7vUlqNrDv
 t7kgTgs8OAWyi2a7Gn5GcitdiXT/KqcoJLd5L36S/tNNCu9MZE4m/CV/cLkgZR7pYH6l
 fPdivViVmsghNGtdxdXABIWu223twV0+TvQe8jAKUkohiP4hcMqtm/tGGwI1efwu9xDm
 5umg==
X-Gm-Message-State: AFqh2kpoY8jNiRI0Zl2gQbgf94jgJVvwFQWUdKUmikcsOHUJjxkXRPam
 uEXDVwIkFfQd1JrqEkbHuOfhiLAX5hk=
X-Google-Smtp-Source: AMrXdXt4cSzs+EHH2hwJyVXkWFbMcPJS8E8enIQebWqKRT4GiAabQA6HoE/fFQz5vK8Xpx0+8inEPg==
X-Received: by 2002:a05:600c:a13:b0:3d3:4ead:bb07 with SMTP id
 z19-20020a05600c0a1300b003d34eadbb07mr1243501wmp.5.1671291455218; 
 Sat, 17 Dec 2022 07:37:35 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c228100b003d23928b654sm12933957wmf.11.2022.12.17.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 07:37:34 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 16:37:27 +0100
Message-Id: <20221217153729.545952-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217153729.545952-1-romain.naour@gmail.com>
References: <20221217153729.545952-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEAe1KnEKjo3LjUlL5wpj5uXhXmZ4tpV9SloXZhyZ5A=;
 b=ehZY1sbaKDo1m+beW3R/TpY+SAw7LXl8tCatGFacaAf5J11iS1RVL7umTqTh1kZalI
 rKAavS7ov6k4OlIAwSGE9itRAkDm+Dob2lmyGUzJYEl72IlXaXcWvxSIxGTpRmdV/eoj
 u+JQPH8piLG7NRcWdXOTdpXMekqmLkFIhfZHLtcJAjZ2wZK4DieOo/lHTeLyRoPTZRAg
 q1z0M/8JvBFTnkZPIvlclWomyaaLQGedKrrLSze5m2qmMDbbw1/ZpD/mx8F+Yxv3b8Er
 OcoeRFERi/l2SRelJ/dUmEkCXcTk1hEBlObCrPgXGF/pR4QAiQRwwstRasHVfu9fD+cq
 /fDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ehZY1sba
Subject: [Buildroot] [PATCH 2/4] package/qemu: split long lines
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Split the list of dependencies to ease further addition.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/qemu.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a991d49993..e800f31e7e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -20,7 +20,12 @@ QEMU_CPE_ID_VENDOR = qemu
 # However, building is still done with configure and make as in previous versions of QEMU.
 
 # Target-qemu
-QEMU_DEPENDENCIES = host-meson host-pkgconf libglib2 zlib pixman host-python3
+QEMU_DEPENDENCIES = host-meson \
+	host-pkgconf \
+	libglib2 \
+	zlib \
+	pixman \
+	host-python3
 
 # Need the LIBS variable because librt and libm are
 # not automatically pulled. :-(
@@ -246,7 +251,12 @@ $(eval $(generic-package))
 #-------------------------------------------------------------
 # Host-qemu
 
-HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pixman host-python3
+HOST_QEMU_DEPENDENCIES = host-meson \
+	host-pkgconf \
+	host-zlib \
+	host-libglib2 \
+	host-pixman \
+	host-python3
 
 #       BR ARCH         qemu
 #       -------         ----
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
