Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD996C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624A3408A8;
	Mon, 15 Aug 2022 20:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624A3408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 164sDT-sHlY7; Mon, 15 Aug 2022 20:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4128B4089D;
	Mon, 15 Aug 2022 20:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4128B4089D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1748C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E67678130D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E67678130D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8-Oe3h7ugoD for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:43:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4900E81310
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4900E81310
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 20:43:49 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id z8so4413003ile.0
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 13:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=mrZBSYCFfljCWXjy1r08JoTzw+w5wC1yS2khCdrBM+E=;
 b=znZ84m+NpPRoMd12qm1zY+ak3CFGTG0jHek41qwPX37pAhShz7D2oVD4f4ZDXwI+wx
 cxdkFjoVi3LAs+QIwfiXZnZCJP/FfQFInkwqV/pCzAdOoCyTsmMuRClPuQ74HI82Bt/x
 zdA1p6QnGoMHSJGwW9VqOuOGLR4Gym6XX4k5KDfGWY2hVzNkfwlQNKq4gF0eV9rFjiSa
 vSf8B7wqzdI6Qb4ecvVtntM10nU9HbwAMLi/7wXWkcxV6zeXFOfwFelgQBSLqsnkoQ/4
 m1KsXM104NRQEllq0Xf7hF6iv7m0AlMO2xj2As1hMGIwEEHJKUoUa4WmT5QhbeW1AwAP
 idow==
X-Gm-Message-State: ACgBeo3faDa095WS//BKbwJVyNqP9BoGo8HUi2SEsZTVxigmDA0QI4Z+
 rF048wvgn57Uh/THAfHtKyi7AWto8Eg=
X-Google-Smtp-Source: AA6agR46VgHhqxfMeKAERHnVzum0FMC1MQYrKmpqPkeZmz1J50PjZgHbPpq6naORLZ00Hg7GUtQNmg==
X-Received: by 2002:a05:6e02:b4d:b0:2de:d8bf:3770 with SMTP id
 f13-20020a056e020b4d00b002ded8bf3770mr7669756ilu.48.1660596228382; 
 Mon, 15 Aug 2022 13:43:48 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05660203c800b006881f702ef9sm2718894iov.14.2022.08.15.13.43.47
 for <buildroot@busybox.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 13:43:47 -0700 (PDT)
Date: Mon, 15 Aug 2022 22:43:44 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@busybox.net
Message-ID: <YvqwAHIBtqUM4M7/@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc;
 bh=mrZBSYCFfljCWXjy1r08JoTzw+w5wC1yS2khCdrBM+E=;
 b=hsN+/RE3Q0D/PDTe/n0TspM56/U5zZC+b9nPF9z6/DDoAMtOc0Qft7Y4P1dKaPUDsu
 dN/gHYmCmFEe8vyBgxRj7eDRtIJuT1lZyk3gORK/GRkUIYOlJTcc7nKXwjFHti7womuI
 sN9BYr/BH054fltHjZnQ2VJKItEfhqrKMTQhqomF/ys2SSztVbEWC9eKdC8JQRQZsu1O
 6/bzcTs14uzg28jmcPMxNeHAXN3mfB5uo6EJFf5jNddh4YpoMlpvuy7+9PbZ57m7lNBz
 fagQhcgg5j8I+zWGahUQtR7p33EuoakPyQ5r+TyZ0m2yi0Rus0rA1jGeOWIhxRzZAMy4
 vOVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hsN+/RE3
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.2
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

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 4ae85c1c..f6246302 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  36027a587256cbaa86650cec2a5b3eb000480e1150bd83941565661b392625ac  uacme-1.7.1.tar.gz
+sha256  e7598e794f5ec414d993c4f2f7df39e7c72f26e41302b875ddaf040d8103ec5f  uacme-1.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 84e01057..24822594 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.1
+UACME_VERSION = 1.7.2
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
