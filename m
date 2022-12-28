Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CBE8146A;
	Wed, 28 Dec 2022 22:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3CBE8146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJtTccyBnPVK; Wed, 28 Dec 2022 22:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2B38143E;
	Wed, 28 Dec 2022 22:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2B38143E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 052F91BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E23A240182
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E23A240182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQwgnFd98phZ for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:17:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D2A40179
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96D2A40179
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:17:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso12079878wmp.3
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2aN3y0sGdASi9IsKBT7UN4YTmYgfZyqyu/ySppTwlKQ=;
 b=pR7Sum7tDb4dj3CSioQAjWv6buIeCbmVtDG4Rn7UEDtwMvZoigZaHguM9W9KEg5zk7
 T1hnaXnVlHA5SZAkJW8KhrWywhEs8EslEJZfdbhXI3y11TYwVcbHavXd5uZMKjesI33I
 AZTy7c5smY2sFkTUJJV+pcAbNAxQ0mY+hebRT/3GKTO0q1g7/qO2tqkNl3ejNSlO/Www
 ylDrsiJkq9P6r7ZmGEYcwEO/HnQtLi+o53OStOELYa4hJ3uLpRKQrdZUevHvaTpVtTL/
 3P/Z5jpF7Xssd3/pUjMalLpT18YQdR9hQv22RnzVmHEfjDexEvwp7EinQDAM8TiiNEPr
 FqXw==
X-Gm-Message-State: AFqh2kp1JLVwQySAkegZQ/NMWEcS/IR9HTQsGE84VQSNPj8usXnhHYAg
 BhD9QnNh+bmeq1CQ8PRNTY7bZxc9Y20=
X-Google-Smtp-Source: AMrXdXtkQSvoqWRCmi3UkW20qMj7SfqJYOwvAksNYVT+8K/sK+h/8jouzWlZ1pHiO1Y1o4L9DHFizg==
X-Received: by 2002:a05:600c:4e51:b0:3cf:7b8b:6521 with SMTP id
 e17-20020a05600c4e5100b003cf7b8b6521mr18336696wmq.32.1672265832559; 
 Wed, 28 Dec 2022 14:17:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003d1f2c3e571sm29977689wmq.33.2022.12.28.14.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:17:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:17:10 +0100
Message-Id: <20221228221710.281781-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2aN3y0sGdASi9IsKBT7UN4YTmYgfZyqyu/ySppTwlKQ=;
 b=mpeVJAtwwkO9YhwuM3sEXfAdShnlb/52UHDUdPEImcBPUpKUb4ST04p6+1FZP5zLjK
 pbbpqwdBp6yz66yvIHSIkDvUE2dRwNO+PGEDbwW41pFlfcFrocYT/lHuR3a8XaN4Gf+i
 CGwB1PO3MH7oT2ZEIlkWRXhmGQnXZMBMBnkwf5klSN3k7S1PwAgjFmxToEiBe+cOVDKn
 n9C0ARl96eAq/IJ+nypl8l/zBaQI54vAFnMBGdZgvLE/oy+mK3lOM4P7mLhHC/hqQRZf
 ngre2efX5EOUrsHVbIIF6kMdx+CmoYCrSE9O1iCJDA8d2zD1nKOoo8gUna05bkqmnj7c
 aWPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mpeVJAtw
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.14
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

https://littlecms.com/blog/2022/11/02/lcms2-2.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index d20cf601fb..700b9746f1 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.13
-sha1  72d0a0b7fbaeca12eb0186ab5728eb0f26806b22  lcms2-2.13.1.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.14
+sha1  94350a2638fe58da736e8726048c859b46a69e6f  lcms2-2.14.tar.gz
 # Locally computed:
-sha256  d473e796e7b27c5af01bd6d1552d42b45b43457e7182ce9903f38bb748203b88  lcms2-2.13.1.tar.gz
+sha256  28474ea6f6591c4d4cee972123587001a4e6e353412a41b3e9e82219818d5740  lcms2-2.14.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 63750c43f2..743b0ec858 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LCMS2_VERSION_MAJOR = 2.13
-LCMS2_VERSION = $(LCMS2_VERSION_MAJOR).1
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION_MAJOR)
+LCMS2_VERSION = 2.14
+LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 LCMS2_CPE_ID_VENDOR = littlecms
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
