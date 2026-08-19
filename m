Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF914C5DF81
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B75FC6072B;
	Wed, 19 Aug 2026 14:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwfzJ8ZPjDer; Wed, 19 Aug 2026 14:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787149960;
	bh=tJsyuPptgMyvZ/YvX92wm0N2OhPTpO1eQtPlvUNjK4Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shhn+FQQvoIveQeylPmLJDkWJ9V6ellbArOhYTilnUqe7ocMLPSiol3c0u+ESiiJ7
	 8I3Y+b5pR52IVPZXdNTTlA0nZ7eI5E/ccVs70Fsj6ZxMVVuJLzcp+IdLQmwkApkltx
	 /+xs78I26evx7mTozweenUMn7HPmYjVGgg161uslGSJMETzoCjgzBZyYY39AQ/8D6l
	 UiweaygKWc36x8i3Ub5z3PSsRHDIDi2T5TF3a4VHbaujx4d6OKXfl3KhbV10PTREYa
	 Hg6qiHzL7FVH7T+xjCopFVKpeAm3198Zk2Ja0zVHxw81okOz+yuNeKaBfmMoeEtOxR
	 sfh/oFsTILPnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B519E60736;
	Wed, 19 Aug 2026 14:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D37952FD
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B2880D18
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9O6MH8UazDBJ for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 14:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=philippemontcho@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AsjAw/fQ
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 882DD80C86
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 14:32:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4956869750eso6990295e9.2
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787149955; x=1787754755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aqUgRHBgxZiXrgWHew+f2i3XbK1vGCb5IteBPCZpIj4=;
 b=AsjAw/fQxWAQwRuhC3Hcd8IR70hj1X022JnJJLu+sux80OICz25xv/skeLTcjO+xBW
 tSxxscqbf/afGkYIO08YrVOZyZIdse09ZgL7jq95RbufunfLCY7DsRHqoBITpaVRXw5g
 3OjWlBsj/++zU0CmOvgY4npp6338ORam/38kf8f227MoVfybWNPvIqzQ5gggs3Cm2u1p
 B5uCb0Ze3jaJVXBCZLqLGblTuYh3tapyiLPb3w20gQlvqzYn7rdJEA45D7a+qU2oPsla
 O98UqFLMfqd4lEB4TYfEBjxObs4MPLPVyWSGATd+nQEHHfDm5tKEdiQJ4y3zRZUpTLzF
 P8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787149955; x=1787754755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aqUgRHBgxZiXrgWHew+f2i3XbK1vGCb5IteBPCZpIj4=;
 b=B8oIhEQUoDysyOEW0AUoaSeCnj+I2l+zsvm8ZQfiUTUC/O7ldwVP9M2xQtL4qlzSCX
 rIEtxlMBK7KBP82O3ALbt0wsHnlLAhxSRlBsgomEPsMUbyxuO3G2Fc/zYcuAUhUOLc4L
 lu/5KfFmha6jMwYxu/sVzTG4r+/dK3n9ZYnEhFGCgqdGWGICD8h5VAvGdty2AGTJQFke
 oqtR03X6I471nOp5ffaDR0ZE376k9HLzh4GDipAbTbaFrRmVVKG0vnGcbeQWECzZGgar
 uUsTcXIKJRUIR3d6cEtoryTG7E7TnmkgvtGaujHjCXQXWiqp404woxtZAe8kYDFHdV5b
 6K9A==
X-Gm-Message-State: AOJu0YxegA/OhZVRBpLj4ZTWUa70Al8xnS5ODl1XoY6SxqxNolyEfL3e
 JAV8vQn6ZqLroRBY+UQCq/Z5RxHdQJ/sgRAF5Oj55SOZA0lRr4Ks92FiLDhbIQ==
X-Gm-Gg: AR+sD10A5hhC5AA15XzqAt2p4/9zqSrNzzARqiZ0db+ehKXvlsFbBks29zkmB2yGFGy
 5PCBRkPkSWIV5xOwhRLzlgfhMOqBBjJmvIyxC+687VBaNi80P7X215+1SgUHYkre8gCVi6TIhoA
 ks28tb8DzF3y19Oo94gALMw9PN5hSBvL1s70PLMDcFpnckPY8yMuxol737yPCtEjphGF5b+TZtP
 coRPGFe7x/FhureY5kpLSJ0QsvLbjWOHcvOlAHABFl+9DDUFRFr3pKJSRSOpampt0AjYx7dp1fa
 iaMOYU17Mb837FBFZrdSb8vqQ4ToZ+qC879JvZYVJPdWFfTxaeAeGGn3KcbCLE4a5rUR8jvYSPJ
 a9tywBC+Hu66AoA4ACPoKPHBTsatNAJPQqN27feYcmpO9dM0mB7Aqcorv1kCbef+8kY7CqNplbZ
 wx0k3rnaQVl37sudR4jlotEhMns+nfuYvBWQHUpytnihvUuxEiBD8OsorP4TipvGfaHZXA27zV+
 H1UF4MKhIjZ79u92YzdErgBkKUrV+mjqcP0W1KmSRWTUluqLYKpp9/XnKG1imNkkI+a3PPv+mIT
 6/UXYc4b+sRXApCkdMuGbjMMCcb1MRUkyYkDQqcD7whq
X-Received: by 2002:a05:600c:a05:b0:499:93b3:91ea with SMTP id
 5b1f17b1804b1-499aa1f85demr81012095e9.15.1787149955036; 
 Wed, 19 Aug 2026 07:32:35 -0700 (PDT)
Received: from Phil-Pictz.home
 (2a01cb0000b3fe0090609422362943bc.ipv6.abo.wanadoo.fr.
 [2a01:cb00:b3:fe00:9060:9422:3629:43bc])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e805a4sm71490175e9.4.2026.08.19.07.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 07:32:34 -0700 (PDT)
From: Philippe MONTCHO <philippemontcho@gmail.com>
To: buildroot@buildroot.org
Cc: Philippe MONTCHO <philippemontcho@gmail.com>
Date: Wed, 19 Aug 2026 16:32:15 +0200
Message-ID: <20260819143215.905349-1-philippemontcho@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.49
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

Release note:
https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 44f0803b0f..13f34ce044 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7d57f14a2482dc4658e4b386180793ef50f0de89ee3a9a28f0a371630baac7c4  mtools-4.0.48.tar.lz
+sha256  76dfea98d923dfc9806ce34bd1786aa9b5a39d70f56f26c0670a348c664f1d2a  mtools-4.0.49.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 8c7a348fea..d4923a46e5 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.48
+MTOOLS_VERSION = 4.0.49
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
