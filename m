Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F85BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAC241C45;
	Mon,  6 Dec 2021 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhIX0Rh89WhP; Mon,  6 Dec 2021 22:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D09E41C42;
	Mon,  6 Dec 2021 22:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDD261BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF5E60DA0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiDWR9d6Ij3U for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:43:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D38C860D9D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:43:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c4so25443144wrd.9
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 14:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=av0QmulL3B6M3pSBFFkDzXodIOkrzEIEP/3fpOE5vfI=;
 b=DGWfnTgr7Fyw3sf/I1ZV//L8mwjiA7yd4e+9nPDxD+wrr4AOSK0i19u6kQtZkUfaGU
 f/DOu47xY9b2Q6zskVs18S4qKw5aHZPyFyowfZWX+XlYpQYyo3tHU2hDK/eGSJ2JnQiy
 LvxVV1QZKcdzXDu0nVkacMcqDtwj4e8/lCkZigt03kM0c3rIFnqnli3c6NZbS0amn8dH
 LazFn5+aVNTQtSRS740x8WggTfOL73RrtFQ+okPh+0Br/2EsXc8aknY3gsRKARwWM7/i
 LphD70xl+oLkRQBgJ/27beAeJ0mllLZnzzM5FpT0y+YrgMnRRaxYHO6X9z7wC6YrF3XA
 phKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=av0QmulL3B6M3pSBFFkDzXodIOkrzEIEP/3fpOE5vfI=;
 b=AXU8qOX2XT7er4wkiUH2/5kZjjtU4lPYQmUbgivsgPWj/orFlZCx3ISEjakhnCYGg8
 2TA0RMVMvgFtcRxhMLodK4Xp3G7oKQT+SEbZr483o3HSwFrA6+erK8EfQm3Ztpr5AK7E
 1+2QKhVBY8D5jGxCZjZ4rfguKGwQc2cpuUP1NV1v75IxYriV4khCRNyRvTrMlByCdKLV
 h9nP24N1LeVM6d5l4OEu6rVmq9YiHUx/0MaNMjCK2aKviXHo1fZ2JU8zS0OZTP+xvJYk
 3FTo6baSPFqvQHDmYkD82dmeCUzY2i6AEktbAmVXfuLSkzuAP6G8Co43DnzqdFtKG3EC
 a69A==
X-Gm-Message-State: AOAM532Q+j9l9BJ0V/pxPCMFfnbMdUzNevGqc6geOLz2x/B0KNmvCsy+
 mYQoyZxuh60dQLkt8z616URnl67tVnoYcg==
X-Google-Smtp-Source: ABdhPJw8wgnNu+LZ2ZXkJANkYxfupvx93K5te6RMsxKhKBsP+KNPRxRYLxWJtxnf8jl3ZoBOAsr1vA==
X-Received: by 2002:adf:dc44:: with SMTP id m4mr46963809wrj.550.1638830616875; 
 Mon, 06 Dec 2021 14:43:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o63sm685482wme.2.2021.12.06.14.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:43:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 23:43:33 +0100
Message-Id: <20211206224333.2232316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/midori: use official tarball
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/midori/midori.hash | 2 +-
 package/midori/midori.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/midori/midori.hash b/package/midori/midori.hash
index d0be396a5a..f14ec6d929 100644
--- a/package/midori/midori.hash
+++ b/package/midori/midori.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  913a7cba95ddcc3dc5f6b12d861e765d6fa990fe7d4efc3768d3a3567ea460db  midori-9.0.tar.gz
+sha256  5e0a531455c47b0ff7589940aa2b0d9c16f59c99ba933e5fcdcab68114262016  midori-v9.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 693507dbb3..aeafa9bfdc 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MIDORI_VERSION = 9.0
-MIDORI_SITE = $(call github,midori-browser,core,v$(MIDORI_VERSION))
+MIDORI_SOURCE = midori-v$(MIDORI_VERSION).tar.gz
+MIDORI_SITE = https://github.com/midori-browser/core/releases/download/v$(MIDORI_VERSION)
 MIDORI_LICENSE = LGPL-2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_CPE_ID_VENDOR = midori-browser
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
