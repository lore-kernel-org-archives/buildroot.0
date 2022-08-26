Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475DAECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B29CC40C2E;
	Fri, 26 Aug 2022 06:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29CC40C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gD5js7O3g4tS; Fri, 26 Aug 2022 06:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A7D400F1;
	Fri, 26 Aug 2022 06:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A7D400F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD501BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 298A24197D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 298A24197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIFsS4AWU_9l for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB72841981
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB72841981
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bj12so1337135ejb.13
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NtXuREkyenAJ638DKiigj8HQg4z5rLwtbuhD2XMu3AY=;
 b=Rs/cIeIhHcKoZ2tc7W8tVgE9HKutIE2t2rMr6QbuWmEmD3eKi/00zoTSHVAXh4+5y+
 3k8SxX32miha5BF+qwE5Q9jSkX4oy5WurQa1KAq4+rwdk7j5ogfWMlggpP7HpIYP9w+H
 +bgvr99k+kTso56rZZfKPJzn1J0Ho6AiYDJc0Ep6STgIPHBZTKG0rxVv38lSL+HT1aaS
 lbhqJX7tLGbjsAWufjeDoUWwp3qLhwOz++t49tqxoCozGAJUOEfjZGyDEqoQJCLXp3H1
 k6jzhXslO+YWUxpD5JrQrKPuzSTvPAgCrwF9xgyrq1GksmWYLt6VjWcwZbgaK+kNACLe
 ExNQ==
X-Gm-Message-State: ACgBeo2xsDJggGTkiwnk9XIMhdd2U69k3xZMXDgJChVc5WPFWaF7TGka
 umqA6QeK57a8ST4e7LSyDYSXIdnD+MxIx30i
X-Google-Smtp-Source: AA6agR7fvbZIlD9wsF1+dTRwlgSaQxfYLJWnACb/GzarqpXeqi8ZsP4rbErGukVOG6GarWFksI5nmw==
X-Received: by 2002:a17:906:cc0e:b0:73d:d898:3900 with SMTP id
 ml14-20020a170906cc0e00b0073dd8983900mr3127025ejb.82.1661496483826; 
 Thu, 25 Aug 2022 23:48:03 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:03 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:31 +0200
Message-Id: <20220826064758.3968647-3-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NtXuREkyenAJ638DKiigj8HQg4z5rLwtbuhD2XMu3AY=;
 b=OPzObIVoZYi2mbs//ZO5Bs1y1ajgLTRaELCdP36T+QNY4p2CzdjGPn0UrF5HBiqpSu
 oF83tHBGBTpEuaPzVGJ407eP5nBMnMb/kqHxDxIYk7zz+UHfY99vCuCxrfYpq/tiZKrr
 iC0Kqz6cjhVaIl8CYIU4S30bLN2zSUM092wwrUr5lGfM6OVnJOoIfERO4Qh2utTOcb35
 /9BnmralMZAOr+jOucrXu/0pDB1ph5PnuwCULylEHTOAbn3nIOymlTUN7Dq8MH9i6DFp
 9ZPjQsmP3yWePeLpy4Al3ShGTfbL07I7BbLkGLt62MOFIHfB35STmenWH0/F27PgRXor
 yTtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OPzObIVo
Subject: [Buildroot] [PATCH v2 02/29] package/qt6/qt6base: Add license
 information
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add license hashes to the hash file and add the information into the makefile
---
 package/qt6/qt6base/qt6base.hash | 6 ++++++
 package/qt6/qt6base/qt6base.mk   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 31ed2494af..5efc5c2815 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,2 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
 sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
+# Hashes for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c67d94e193..7a0838b2bc 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 QT6BASE_DEPENDENCIES = \
 	host-ninja \
 	host-qt6base \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
