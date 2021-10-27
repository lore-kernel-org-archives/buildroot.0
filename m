Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D807C433FE
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB78760231
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 21:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB78760231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EE940597;
	Wed, 27 Oct 2021 21:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wU3p6ZJ4lVi4; Wed, 27 Oct 2021 21:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FB140585;
	Wed, 27 Oct 2021 21:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 648331BF34A
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54BF740584
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 21:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx34qGdZ2IhW for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 21:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0639040595
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 21:22:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g7so5333394wrb.2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 14:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlAEJgM+KZ2Xn9WFfSlE0cI/HpBtW8c6hsA2GxCzzBc=;
 b=D/8E7MCqcgy7shVK0OS/SUCxg07/aOvZN/hV/ad/oxdgTfBL6kdU92DmpmYpu80Nju
 axXmUAbhngHnl4MrJKgEaHAEplq4q/+ulZy7Xipnvrboatp2HlPtmgXOSHQJ48p1ULJe
 TWBVxEQNCbQJ8hbAbmb8bAc2d9/9W/l6XO32sIaM0rpi30A2dVWyTO/JtlVLq9GjWWwM
 St3q3OGeRJNhZ5ZEpzRR4oUq9YlBTijiVET8hduK3p92Pf+19nCGvbWqE2Tiu2IwGnQT
 W9ChlAbXCmCElJrZoiIttYpBbBQz2Wr9mxneW55KwBukFpHWWBZsBBZNaZIPe1BtHF2r
 xWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlAEJgM+KZ2Xn9WFfSlE0cI/HpBtW8c6hsA2GxCzzBc=;
 b=Es/6hR+O5G78tLoAH/X/MO1H4ynGa3vbVvkbC47fLLx2vUAo1bs/Lcs+twYL5S29I7
 mvn+33Wf+MlBphxdsUfXSa2+tXb1n1/8PWvfSyAFFF4ahRlzENGncxa+bJybx92SBF80
 aIBSiq5s1rOw1x/4vtkGbEmWuXNbTkym9koj2tZdm3gYOYWLgY09DlSqhj57n5luss1E
 KGtbp/sRry7BZGZq3hqyNE3MVZSfWum+nYfktHJzSJ0fRr63FwsnES+fk9YbrxKp1+ED
 7mfa2233J/aQvrDr6qI/1beN8ncRGumqUdoYEf+rUQhRq4XsQHJj8bYmvi7BZa4yZRgt
 EnbA==
X-Gm-Message-State: AOAM531BiNwj6XsGfuDAYvg2A/In1/dSsBk01t1976Lff4W3l4qxDdwU
 +6oBlvFQgNf+Q05BuF+sGvS4DuCBjz4=
X-Google-Smtp-Source: ABdhPJwn2AbB8SLEEw1ZinMpCqLpb0kbuF9ekqPb4CO4j8uiPkhe8E4mtSNArMc4QNwbvFuB95CAnw==
X-Received: by 2002:a5d:5711:: with SMTP id a17mr169663wrv.356.1635369725121; 
 Wed, 27 Oct 2021 14:22:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id m35sm6194712wms.2.2021.10.27.14.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:22:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 23:20:31 +0200
Message-Id: <20211027212031.531677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exiv2: security bump to version
 0.27.5
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

Fix CVE-2021-32815, CVE-2021-34334, CVE-2021-34335, CVE-2021-37615,
CVE-2021-37616, CVE-2021-37618, CVE-2021-37619, CVE-2021-37620,
CVE-2021-37621, CVE-2021-37622 and CVE-2021-37623

https://github.com/Exiv2/exiv2/releases/tag/v0.27.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index c9af674a51..a405d2611b 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84366dba7c162af9a7603bcd6c16f40fe0e9af294ba2fd2f66ffffb9fbec904e  exiv2-0.27.4-Source.tar.gz
+sha256  35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2  exiv2-0.27.5-Source.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 33222e6381..2a91c71c8f 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.4
+EXIV2_VERSION = 0.27.5
 EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
 EXIV2_SITE = https://exiv2.org/builds
 EXIV2_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
