Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41541C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E06B484677;
	Fri,  8 Jul 2022 05:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06B484677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8w96Zaq5AGo1; Fri,  8 Jul 2022 05:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A9584663;
	Fri,  8 Jul 2022 05:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A9584663
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD101BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66EC984660
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66EC984660
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30pBjBDN3Gif for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2653C8453C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2653C8453C
 for <buildroot@busybox.net>; Fri,  8 Jul 2022 05:50:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so29096567wrc.2
 for <buildroot@busybox.net>; Thu, 07 Jul 2022 22:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQX0L5QebzDmoSNKcqcaGezNDxWDUb8XewRjpLERClk=;
 b=nU236h9qa74DysWO7O0Xxzj14xoQoOWiSw1amxXNTPcc8yOjS2dIVr5/TEFwQKmwes
 L8ijbRi/D3TYgRgi0JDxbWtDbm/aUdor/rUVsMkJc6ETQ25rFaupP/KGeGdMiUFlwbU9
 pjtGxtzpAlKoOJishzeaY4fpUaXCjVn+EP+sX4uIMZ8QrAGmzVdh6367AwhGcDK1ZQJx
 zGOm9CFcIX4jLM6yuyKhvXpYXArokJO36Pyh7F4SDaiXlbt//i1WypwR5oHHG8Vh6YO5
 cCbFagwtJewlnwC8scaSh7vIWC62jiPAJu+3xCpS+cTEF0Kpx+NndmP+V4MI9xjPPLHk
 4v4g==
X-Gm-Message-State: AJIora8BV56AOswFgzceql+Bbw09eH0hfDrhuns4N9LP3N2yy+8lrSgW
 xJG6waBcsv2AkoNNjUa0+i7Vq7V6pfE=
X-Google-Smtp-Source: AGRyM1vTKxpo/gsSjUF31un3HB9HmI+gYbyvjnM8jEhOx4PxjPOEU0kmupeQCcBnHo8K+0CSZ0xHvg==
X-Received: by 2002:adf:f48e:0:b0:21d:6562:4717 with SMTP id
 l14-20020adff48e000000b0021d65624717mr1449671wro.428.1657259426542; 
 Thu, 07 Jul 2022 22:50:26 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adfeb0a000000b0021d6a520ce9sm13312522wrn.47.2022.07.07.22.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 22:50:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Jul 2022 07:50:23 +0200
Message-Id: <20220708055023.2613158-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQX0L5QebzDmoSNKcqcaGezNDxWDUb8XewRjpLERClk=;
 b=NtQR5ivkMk19nOcbnNMvo/Hj3DAg8EQ6aswiice1629vakzb6V3Z+nQS7iGH2hjjg3
 0/mNFujwG1O4BgsuRaiP6ySpqoSWfkB4dRe8tD9AkOvaebcONJaN0Nc0sqJfJa33GkbV
 FSDE4alg5AggqJ5y8ba+QrWy1oBrrUIAwnGpnfVsbl41js1bm1SYKfUiA9VJxNdME25X
 BrvCIGel9K0H7MkluvrWLQbztREx6TK0LizCpB/gDX0q7oydMTQcdBqcEyVW2qgVFq00
 LbseZVUrUfUICb9hGWhAn1kKGLo8mbFxqongPr6YUM6b+UPRKVo9MPCcuaucTjYHyoMv
 7/ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NtQR5ivk
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.8
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
index 7864df7a2..9a73001c9 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.7.sha256sum
-sha256  0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33  pango-1.50.7.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.8.sha256sum
+sha256  cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa  pango-1.50.8.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index c1c7ceeed..30b1de9d2 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).8
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
