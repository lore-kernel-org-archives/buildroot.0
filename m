Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54ABC433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F8B843DE;
	Fri, 21 Oct 2022 22:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02F8B843DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D64fk2zdpcQQ; Fri, 21 Oct 2022 22:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8627A843AB;
	Fri, 21 Oct 2022 22:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8627A843AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 090C91BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6CB860E90
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6CB860E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dbgszkk9dYO4 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C2460E55
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C2460E55
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:08:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so6069093wme.5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13SkLrGNXx3X5JjQpNjM8VLCROC/KePFtEgLl95zv9I=;
 b=wXirgC6fvi6A0dwQVhPq/7pvUCBQQAulg1mamf73QvpsewcUPmP7mwNyb5+S1ISPp7
 ax4xTl+6gd6C/ZMYtYMfahzNVGn2ylmycRZ9kmzmfjIJVFNOj9lNuarmvIZ94xiI1+qs
 zBEcHY6dLluHFX4uhbmDH/ZkgTsPQAyR7fBiDykPKydyZeVew3J8zEesP0p+KM14jND4
 SLtIJ8woAFJr4XsNvXz7WP0R4BNW1YMOQsvtXmiugsqKP5RQgQVWAgvGugKE29XVSPyN
 97Ybyj6dBTMzG+MvmP8ierSKtvAKcRxuUKvrVtTUKM/OLDhpmT9WjgvlNuUJcXzcffTj
 P7Sg==
X-Gm-Message-State: ACrzQf0wdOKPG2cfs5K7uQfrv5+lm22taswaree7ZL28WHlFOvu0IDWq
 S0+hdYA5VStKollC6U6VmOKBOD0L1GY=
X-Google-Smtp-Source: AMsMyM7PiTp2FF2i+IEcUBPxsh1uGSdUO4MNkFxIQtphs0mihBqmo892vGLdwye0jQU9OuTk0NfCNw==
X-Received: by 2002:a05:600c:1822:b0:3c7:103:f9be with SMTP id
 n34-20020a05600c182200b003c70103f9bemr13064386wmp.195.1666390084196; 
 Fri, 21 Oct 2022 15:08:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003c6c182bef9sm939943wmq.36.2022.10.21.15.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:08:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:08:00 +0200
Message-Id: <20221021220800.10420-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=13SkLrGNXx3X5JjQpNjM8VLCROC/KePFtEgLl95zv9I=;
 b=dyaC8JALP9CXEic2NNpV6+I4ljLtmRp9oRlwyJwhfU59O/Ln1dCL8cGrWsnVmDG8mt
 0Ruj+7/6UhtYkxVFSq7ZT+RAcsahdA/N2mxQmKDknYt8wECZdokgM3Sr3xvyG4nas8u1
 pw5EpfdSG5XBNGriRAqh6Qz07g+vlijJcLoVZ4hU3qB3bfnng4X1X2hJckwUEfynX6ec
 58II20NeMek6Sux6rP9KPvG4ggkXDfHex0Q2i8UxK+lqIMwHFdnWOZAx4PK2mmWWfo4C
 p2u5W3WkHxWRrLDKYhm1RpueKkOKrEI/SldCq4luFnp1V6GsF71ukh6FGqZ2gZqkDvCh
 MaLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dyaC8JAL
Subject: [Buildroot] [PATCH 1/1] package/empty: bump to version 0.6.22b
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

- Drop EMPTY_STRIP_COMPONENTS (not needed anymore)
- Update hash of COPYRIGHT (update in year with
  https://sourceforge.net/p/empty/code/ci/c308663530aba4f808b76ee6b4a4b144be9f8a84)

10.08.2022 0.6.22b
--------------------------------------------------------------------------------
* Man pages directory parameterization
* Tarball clenup, repacking

https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index c5fbc2b4ac..cc74254a7a 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2fccd0faa1b3deaec1add679cbde3f34250e45872ad5df463badd4bb4edeb797  empty-0.6.21b.tgz
-sha256  f01dbe3c624084900b9df1393d9062518b2bc0487acd6a3300ebd6e71352d112  COPYRIGHT
+sha256  f581d560e1fa857f5304586e3c2107b5838bcf11dedcccec4a7191fa9e261b69  empty-0.6.22b.tgz
+sha256  db6b65f5eaf782a92715887ac107f3477d64016301a66194a92312b13ff89be1  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index a9b8080a8e..91d9476445 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.21b
+EMPTY_VERSION = 0.6.22b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
 EMPTY_LICENSE_FILES = COPYRIGHT
-EMPTY_STRIP_COMPONENTS = 0
 
 define EMPTY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
