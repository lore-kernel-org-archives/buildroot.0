Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C6C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CB66416DD;
	Wed, 22 Feb 2023 16:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CB66416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZd7Kpb-XVaK; Wed, 22 Feb 2023 16:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBAB6416CF;
	Wed, 22 Feb 2023 16:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBAB6416CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8111BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0F840108
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0F840108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vxzGfCai8NC for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:05:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCFB415B7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBCFB415B7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:05:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso6800194wmb.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 08:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrvPAXUVg/qe+pM++PPQ0xkpj3IJrW2yo/+uc1xCPj8=;
 b=GVTJBvqpt1guiZmdoKA+b6AxPYt7WJcbJrRIQQMaWvDWegnf08lpqOa//a/WQReKKU
 +S8qT740zd40HvFfXDr+MLxBfFaTCoUOjrBSb/9Dc8iL7eGfATF5xsqNMKVmoRWpJgfQ
 ZxON3G+rKdbLYmKum1zQ+GyYNSiMm98L5ZCrFQEvWRLt3INB2uVRQ1FLm5O4+l/iMUJP
 +wgflHtP9Wkxfu3F01Ve7DWbTErT84VG6xQbGV2mM/JdJtw7c0fHCo1IBFRe2/7rSiLl
 19P+FjcZjx3rpxQb6apq2t2WjulI3YLUZ0djEUGSLUU2NnBlLjKO8gmyTiXkyeICqt9K
 oKXg==
X-Gm-Message-State: AO0yUKXQiYJzHv8YhGqTgR9gcYYwQG++vRGsupejnZfjXHFBrnC0ZfNs
 aaq815VGsS55zpBrMWjgH+sUaeSel2U=
X-Google-Smtp-Source: AK7set+BpMHR7WHuqw1C6ZYJ77/4XpJCPMArw697DCuuTKhbjE0sfmdvcv3R2ypRii4t0T+l26tkQA==
X-Received: by 2002:a05:600c:2ac8:b0:3df:eedf:f378 with SMTP id
 t8-20020a05600c2ac800b003dfeedff378mr6187144wme.24.1677081924974; 
 Wed, 22 Feb 2023 08:05:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm6490531wmc.29.2023.02.22.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:05:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:05:12 +0100
Message-Id: <20230222160514.2069544-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrvPAXUVg/qe+pM++PPQ0xkpj3IJrW2yo/+uc1xCPj8=;
 b=l5WgE3/o1gd371QGpRp/eDqBxd/NswvujA/ZquGnhVXGR9EJC0XtOzwBtXZl+ji3gJ
 GrVylAOGdzlNezVGgfuA7U7sZJSj66ZAztUlDD+leN6i+fYiEfCmv0XLKtJAGqi11qWE
 InROF3INqmsON58zosVT871eO6Rv2reVFSV23SmKN1y5n+tlUp5bsrO5lvq/WtDDKGDG
 EI2/Sz07DM/yQzAtVucY3ZLAdyyXZa8QyzTKM28shjrm13v7S6LL6A7LhOx/Mqy5Fb2y
 wq0e1vseFv9FLghbTeSb7CbFsYEeOF6z5iqQeG3yqhF32l/hqjIdrGMoTdETRu1T2m3A
 eCCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l5WgE3/o
Subject: [Buildroot] [PATCH 3/5] package/gnuradio: add libsndfile optional
 dependency
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsndfile is an optional dependency since version 3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/18f64ba685cfc2533e2d7726aa43c524b007d97b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index c2e5ec5cad..59fb23d89d 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -55,6 +55,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+GNURADIO_DEPENDENCIES += libsndfile
+endif
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
 endif
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
