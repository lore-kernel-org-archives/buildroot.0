Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC42C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:03:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF25361181
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF25361181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 887B8400A4;
	Sun, 22 Aug 2021 19:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82FC9BHG5ryS; Sun, 22 Aug 2021 19:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDE12401C6;
	Sun, 22 Aug 2021 19:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770911BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6525D401C6
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJiSE81Z9g3K for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 19:03:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B232401CC
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 19:03:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q10so22835098wro.2
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOtX7h8IGOwNx9rR6H/MbX9frpzmliwXM/iMKvgNH5A=;
 b=HV2g3ibgeet0xQ5WNWmGs7LxKVpd/C7cstI+Tn6ejdeQlp9tdFOP3WFemiKGtDU9KD
 h6K9BB+sGaCVWwLQu37QJNJvwsC+Np4qdFVGxX461ATBrdlg7qjqnQybUOkbTXz+blhJ
 cTG108vHTnZb5SH288U3MgTkiKdCCmDaUk7i1zPXuBz1RayPlvBcglO/CmVTBrYtb4hO
 ZgoV1CMSOz9HvXvkWoHYJxisMvldypG8MTK5WxYdICxds1SGJFKaoRZDWgdnbtRja4ET
 +7Mh0i4hxjD4XIb3mbjiFA+jZxazWfsvqvuVJn7C9FYf4DEQOS2jvW7OO/dEIMP7t80Z
 /WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOtX7h8IGOwNx9rR6H/MbX9frpzmliwXM/iMKvgNH5A=;
 b=IR0MX0xfJTu8tKIwMj5PjshcURvQaqow5zJyS/pSjo6ImT5apIQ5FIBls5x4phQBQu
 g/kf2Ofrb3tn9MV/U6t5lgaSJWnbOBbMXLEB3eljTTIon+WsJCuXxOujkgNFkk2VA6DJ
 LKheKQle9HbP93gmrdwP4XVeHOK2LwxpXhAOoGHPb4x8VtSyOeOfjsA6Zuw4H5bSwqgz
 XgYbISoYgajKzdKEJ5MMI/Mr2BdRbO9r+lyTybYJpih5o2hJ4wzg8uRkIPoJzOQxi33O
 sKRuQWeeRgK+K7gcU7mNqfLj7kvd+ai47qJtbe2Ypks1A+VPp2iEiGvXDf13pvLlxXGU
 k2cA==
X-Gm-Message-State: AOAM5307roKGHN7rzo2hi61SXbxc0mriKoJ3bJw1hDFH6p626WYeYY8M
 9SOati077gAjp1SRr9Hn0ArLDUXEAaubbRzK
X-Google-Smtp-Source: ABdhPJz/x13d3GbGlxv6/g6D7UaJD1/jhY5xJtdiaIEVlFrClVCXw3wvFXQfbYprzkW0MYuoBK7THQ==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr4182456wrv.221.1629658979785; 
 Sun, 22 Aug 2021 12:02:59 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id p18sm12703760wrt.13.2021.08.22.12.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:02:59 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 21:02:50 +0200
Message-Id: <20210822190251.280313-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/glibc: bump version to
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes v1->v2:
* update to 2.34-9 from 2.34-5.

 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/glibc/{2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f => 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4}/glibc.hash (70%)

diff --git a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
similarity index 70%
rename from package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
rename to package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
index 4b8d8297ec..595de95a58 100644
--- a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
+++ b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
+sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1eff245588..c911c29554 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,7 +11,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
+GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
