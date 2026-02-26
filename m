Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B34BFD9E07
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66F140180;
	Thu, 26 Feb 2026 20:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75Z3ikPw3jZf; Thu, 26 Feb 2026 20:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D357940186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772137003;
	bh=mAj7/Z8qnXH8KqgKA+JEnJitfIQwc77BKr+lY2fKpvk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DGHHjJiloXDuIJWUcTtmfAZGt2iLs7v+C6kyflGK/eOchrdBAXm6v55Lf4dO/NEu9
	 sGqFHZWpZMkvanZF3OE6JOCMiSOjQGh/C7HpfjTaeUuuXh/GEXMy8No4CacQyQnert
	 HORKORKR9r9KPNNPyQn+R0vtfYcRto9C770U7e8b7i5OF/cYGce1d/CxUKD/PHt/AP
	 aACHnvnV1zVlvDC3ejvvGOPxS+KaEt/iyLpEC0AH345DZbDjjrP2ywZsYYdJDwg7GJ
	 SeXIyoCHEsbYDAoFF3JNRDinxvHPfnv+w0ihDdOzT7ZVuYX3tFHQSyw9Ks/iPPMe+7
	 O677GPi5+MVww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D357940186;
	Thu, 26 Feb 2026 20:16:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CC31F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07847806DA
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNngfei5x7ka for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:16:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED8B5806D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED8B5806D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED8B5806D8
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:16:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED4E3A4C2E88;
 Thu, 26 Feb 2026 21:16:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47348)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvhmp-000000004Kt-3exG;
 Thu, 26 Feb 2026 20:16:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 26 Feb 2026 21:16:39 +0100
Message-ID: <20260226201639.1240017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772137000;
 bh=i6dG+VYgrODEctEdNbVKsJ032ia/prTvkg9MXWpD/2Q=;
 h=From:To:Cc:Subject:Date:From;
 b=pRDUPdzwg1ybZaQtLqOD8l/AisffARxKSmalSMXAr1PduGL4mHdgcS9YUAgfIzI0l
 Ehh6dN1wuIWF+EW/bB7exeY6uBJCqD2RrKSHNM9wJ9W0sPQDuHpKeS6dAGCC5rzC9n
 c036zMwvWtMX/n8smZkXX6yZ5MGxSCaxGi0YOgpSRqX5QT9OvMKYMncVOqw+X+P6XQ
 iCn1tmjNrhl23U8RlDnLPt5d671EH0CTy9+ZHCdD9OkfyZOfzUtMC4juX9DklinsLr
 4e3W+46+rqnHgCRr8bji2URP4SnXQhREKvtRGWzTjwlLFTQsebU+GEBAMCaD32UvFW
 tWzKge6wVi6Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pRDUPdzw
Subject: [Buildroot] [PATCH/next 1/1] package/piglit: bump version to git
 3051e13ae1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index a778401253..8158177e4f 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0553524e1bfce646771560805cbe523204c59dcee20dc58bb9baa87134a50ea1  piglit-62d499d63d2b8b29a67efd9d93ed9b6a94d4950e-git4.tar.gz
+sha256  060d45db7304446ef280afd60fad3a728bcd9fdfe4c204b8a236e6a4a46ce592  piglit-3051e13ae12e1c927c7baace3138a8bebec7018a-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 619f29204f..e61c3c9e61 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
+PIGLIT_VERSION = 3051e13ae12e1c927c7baace3138a8bebec7018a
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
