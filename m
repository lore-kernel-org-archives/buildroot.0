Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C85DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0401B61056
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 10:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0401B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EEE828B5;
	Sun, 10 Oct 2021 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqKFu_jiibaD; Sun, 10 Oct 2021 10:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40161824CB;
	Sun, 10 Oct 2021 10:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94E3F1BF473
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8170440190
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 10:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4FinJqE13PO for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 10:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FC76400FD
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:15:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k7so45183380wrd.13
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k1m+fkuyxdtRXXM38CwyfMXN+VShs6+0QPtwMleJLoE=;
 b=DPLfwKuQ3azYF/j5Gjp0o1lOxWfEUntaZG6N4FHmZne1swNtVztW1/YzzYU4YmrWqh
 pM5RLjBv5VdgAVoR6A1iYfhrmH3CT7BLY7ySlkyp/zmqxEA7k65e2Z+ws2PizWbCf3zl
 un2wDZtiyBcfTWwZPWfXAGGs6ilyTcm8wmbmL3qUS4K1LbNiqqjJPmukh2EuH3Wwlh0p
 BOEJsQRki//QHLZoPy8tfGfMdzSoTNy/v2HaiGp++AYxj5A0ccsEdqRhM6OjEZcrUS7U
 1I8lx7m1W6bzZ3lxExaoCoiawRJeFYcA3RrNdjorJYjhQ5XXooDV+EprqC/fAq+SvdxE
 OJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k1m+fkuyxdtRXXM38CwyfMXN+VShs6+0QPtwMleJLoE=;
 b=GvHutl9UY9Aal4gBy90jmGXwIIvdTd+XS2+uNCShsw95kg3ixfvu5roZw2/rzRgj87
 x5osQVA0fNg4qn3pByq5sRuMGyQeDQojOBU7950D6dBmk2HO8laPHJogSlDTmIVXn67Q
 gGEpqhrXH7WM54Y1hFsyY1Qv9uYupKiLwR35ZEHiMal9kPnufnxYolyObQR55woFrwut
 3kgFbHJKdyxhiAAd/TT48sVz33UDNahQTJ809y8Usnqat+gd++sb9zK2zH5iWZsoCduM
 KlZm+qauNPaTW73AK+fVI1PtAOel4GWuXs73YD2XvPrR5EpLmOEJcRpAbr47yMDlIzMt
 +tMg==
X-Gm-Message-State: AOAM531ixN2eyFoO2P5QlWWkMUStM49eFOW53N2AQFnnvm8sjyyuXx1i
 Cd9tXykHL798TNeXuJV4m2lz0hSA+hw=
X-Google-Smtp-Source: ABdhPJzyB9k04megtY2JEFHLsknAUc+bspk2bdDkecaIlUcVEux8PQHmd0CxYpKuBBRVEmcunSlrZA==
X-Received: by 2002:adf:f949:: with SMTP id q9mr16576847wrr.331.1633860920170; 
 Sun, 10 Oct 2021 03:15:20 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id y11sm4983212wrg.18.2021.10.10.03.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 03:15:19 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 12:15:10 +0200
Message-Id: <20211010101510.128202-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ncdu: bump to version 1.16
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ncdu/ncdu.hash | 4 ++--
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index be2b6e0788..c2d367f15a 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  b02ddc4dbf1db139cc6fbbe2f54a282770380f0ca5c17089855eab52a9ea3fb0  ncdu-1.15.1.tar.gz
+sha256  2b915752a183fae014b5e5b1f0a135b4b408de7488c716e325217c2513980fd4  ncdu-1.16.tar.gz
 
 # computed locally
-sha256  978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05  COPYING
+sha256  e9ed7095eee84ad6804450495738277b539da0c0b2006f50faf8e6e67a0a15aa  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 532f145b20..59fa8deb25 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.15.1
+NCDU_VERSION = 1.16
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
