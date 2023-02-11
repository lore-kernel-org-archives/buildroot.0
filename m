Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F433C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 09:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A02C4402E6;
	Sat, 11 Feb 2023 09:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A02C4402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qARrvNc-G6s; Sat, 11 Feb 2023 09:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 025AD402D4;
	Sat, 11 Feb 2023 09:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025AD402D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A28D1BF279
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D95B60881
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D95B60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITYbByBzBi4E for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 09:42:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16577607FF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16577607FF
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:42:08 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so7905895wmb.4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 01:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htRgIEhloFnbBPRYfKINT4sNRXzWy1wgAWFGZtgAaYk=;
 b=Ny/k2zR86a/VrKdAFvpHvnfGk3Zcvj77FgtLnZX6W6YGIhA/a7GPhw0+ieIk5tUZuD
 Ik0ZTv//qfdz6SOdENbQPAAVmXgHTGuiXgIGOmGq+OuuuVslmzihdSE/vxkdYdKMexCo
 l+oT6+20grhILJEKxax797KHSpQOMl4YswfeNCELdBMvw/otXOCJzwtCLPmtlF3fxGBE
 Bgrv80ikHuzBcd/BeAZ3+oYrfPOq0UccL/FXK+N9oA4KDwocLjiYm2RbeZirrlDIFqbf
 f0OPCxA3NjSd/Y8FyAWpz/ub0zTZp0MNxRIDIPYMuZMTAqUCXvuhH5WtWnLCawaM3teh
 ocKw==
X-Gm-Message-State: AO0yUKWdOliFGOZlcEV1J/7OMUXxIkImjmgWJPmlePGOjUS5c/zNuDRP
 7vgialbPCuWXrpHxRsL3NhzojyBTzUc=
X-Google-Smtp-Source: AK7set/g3bMkNmmKok4bZk1vweZiyBo6oO3pEkhbAX0loxQ52NE7iuZJJ7kucJfLW1ivaWtNQE+XQA==
X-Received: by 2002:a05:600c:a692:b0:3df:d86d:797a with SMTP id
 ip18-20020a05600ca69200b003dfd86d797amr16651997wmb.25.1676108526195; 
 Sat, 11 Feb 2023 01:42:06 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c439300b003dd7edcc960sm7292480wmn.45.2023.02.11.01.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 01:42:05 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 10:42:02 +0100
Message-Id: <20230211094202.3816592-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=htRgIEhloFnbBPRYfKINT4sNRXzWy1wgAWFGZtgAaYk=;
 b=cqS0xFThuuZgH/6cCzzeyyuWl1SU5DRaAgLRP0lb1M00gChTdcA89rVqbNdpRW7If9
 NgE6DdR9+F8l7NEGbzDrykXCLINHV5wcp7chyxitsD+SSjXXj1qZ8jE1eWB6xYuDqae+
 VSUQ8F+7jiGXqAAKTgiPBCZDxF7WqD5gY3D0iE2sHZvExPNwNezeakLs9ksJ/UsS4On2
 p9PLhtVKBZCuJTJt6JNkYalpE7XSve6u9pRu0JaCDJXty1lTtMTMCG58P+29AQi4N1cn
 OPxrklwMuKBgEeKgKotylQgts5iRh8Ky2P2A+j3DfxMaOtxUP7hDOgyBvLydbn1lpqaT
 7b/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cqS0xFTh
Subject: [Buildroot] [PATCH] package/pkg-waf: add missing $
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We want to have $(@D) expanded at the time the recipe is run, so like
all other variables, we need to $$-expand it.

Fixes:
http://autobuild.buildroot.org/results/b6f/b6fd3a866af182edc7831492aecc8323f377b826

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 0e752072c8..c3e965bdf3 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -42,7 +42,7 @@ define inner-waf-package
 # otherwise waf errors out with:
 # Waf script 'X' and library 'Y' do not match
 define WAF_PACKAGE_REMOVE_WAF_LIB
-	$(RM) -fr $(@D)/waf $(@D)/waflib
+	$(RM) -fr $$(@D)/waf $$(@D)/waflib
 endef
 
 # We need host-python3 to run waf
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
