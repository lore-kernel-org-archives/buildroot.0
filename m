Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA7AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154FB60F57
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 154FB60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C45DF4027C;
	Thu, 12 Aug 2021 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQawoqGMm4Lw; Thu, 12 Aug 2021 21:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39EFB401DA;
	Thu, 12 Aug 2021 21:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFE921BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAB70401DA
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynaVxLc-1s3s for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:43:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9B2401D3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:43:27 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w6so12646047oiv.11
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NETJVc/VOHogk5pa5upETEFb93J1BZTTpu+14GX2zs=;
 b=anrfMdhPZ/Jz7h33Y+UGjy/pts78MU1OQv6RcoJFJAGll6IsXGzQKTwp2JMtnAK8Hf
 Ct7z8++OLreFWwrLe/qDa8h6ZoDEyUiCItSpX/bYo2hFTOziNYzAalHBUqiWsh4bzzRt
 fpq/PVf2M0FWJa6qdLOB/x9f6LHVIrRR3solJB4EgGB4dbXExsyZwm8t0sfHMbDS25Oe
 bI+4jtJD1Ph0HQskmtKMPf2xaWGzPSVPZt8osKh0+cYfbAbbYRCt37AhPE2YzHs9YpEq
 PzyWjRW7p31iRphrgZI1xiKhTgyPeji7Fpwjh13/N8zNdEG1SpouuxLhCdd/zF1BiYIM
 +Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+NETJVc/VOHogk5pa5upETEFb93J1BZTTpu+14GX2zs=;
 b=sRWlLCfrQYFudhOccW/cgtMQZ8aqFDaZ5WWWKHlUL/RJiyRAK+I5/NF+DvPtm2OONJ
 7LxNYRLr3sG/udTev6kXGqfrvP+gBovHgsEse5CfCBkOZFN/YjRPQ4Jkxqnp7xmXeu7/
 gjq+HYIkympLh816JNc4L1PC+4o0+4X7rfzvbh1J1LrZBcDdfnVVxZusXdR8oQ++j1OY
 qVbvag1/+gDQfSEX7JDR4MotU2nfaIDe2IojW92LTmdPgPjuIQnCMxLl4jbkpQNI0LVj
 eNt1/qqQeT3FdnjEU5GH3irKJZ9IQWNzRqzvsV44NFEBaIFIzblWmptvo49tENZPoUP1
 bT+g==
X-Gm-Message-State: AOAM5317sSdiDWp962qcxOEO1hQOPPQF55D1yFaTZ2oaVm8LKVj2OJ96
 HjKFffPBHrlYmnljbFv8fO4ZxuGcls4=
X-Google-Smtp-Source: ABdhPJyW1Z9yL/zwNKuOYl01fH1ncUJ3TAB31EMCxEviyVXcJoWYQ3/E9BITJquYOdzWVFfJw9g7Mg==
X-Received: by 2002:a05:6808:14a:: with SMTP id
 h10mr5110928oie.17.1628804605947; 
 Thu, 12 Aug 2021 14:43:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id d11sm805151ooh.8.2021.08.12.14.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 14:43:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 15:43:20 -0600
Message-Id: <20210812214320.881269-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.59.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Rebase patches on 0.59.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...atic-libs-when-default-library-static.patch |  8 ++++----
 ...ndencies-base.py-add-pkg_config_stati.patch | 18 +++++++++---------
 package/meson/meson.hash                       |  4 ++--
 package/meson/meson.mk                         |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index 4a1325bd6b..9cedcd0942 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -1,4 +1,4 @@
-From cf9ad9b79a924081ce3d1e045bba3544815ea5f8 Mon Sep 17 00:00:00 2001
+From c1359a49b61016031287d62f44a363cb76242c91 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Sat, 26 Oct 2019 09:17:29 -0500
 Subject: [PATCH] Prefer ext static libs when --default-library=static
@@ -29,10 +29,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  1 file changed, 3 insertions(+)
 
 diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/clike.py
-index ad3bfae..4733910 100644
+index 09ad837b1..b7f6b9f22 100644
 --- a/mesonbuild/compilers/mixins/clike.py
 +++ b/mesonbuild/compilers/mixins/clike.py
-@@ -999,6 +999,9 @@ class CLikeCompiler(Compiler):
+@@ -978,6 +978,9 @@ class CLikeCompiler(Compiler):
          elif env.machines[self.for_machine].is_cygwin():
              shlibext = ['dll', 'dll.a']
              prefixes = ['cyg'] + prefixes
@@ -43,5 +43,5 @@ index ad3bfae..4733910 100644
              # Linux/BSDs
              shlibext = ['so']
 -- 
-2.30.1
+2.25.1
 
diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 9dbe22c83f..8e15d3210c 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 885af6ab2e02cca6bd190b8b29a355fdb6516936 Mon Sep 17 00:00:00 2001
+From 3d6a2db2270346236dd6247e0648ea0c949ba468 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -21,23 +21,23 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Rebased on 0.57.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- mesonbuild/dependencies/base.py | 3 ++-
+ mesonbuild/dependencies/pkgconfig.py | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index cd77b4b..08675e6 100644
---- a/mesonbuild/dependencies/base.py
-+++ b/mesonbuild/dependencies/base.py
-@@ -883,7 +883,8 @@ class PkgConfigDependency(ExternalDependency):
+diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
+index 1e8d9132e..d902ba215 100644
+--- a/mesonbuild/dependencies/pkgconfig.py
++++ b/mesonbuild/dependencies/pkgconfig.py
+@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
          env = None
          libcmd = ['--libs']
  
 -        if self.static:
 +        if self.static or \
-+           (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
++            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
              libcmd.append('--static')
  
          libcmd.append(self.name)
 -- 
-2.30.1
+2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 96ca379a25..9bb7ec9f40 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.58.2/meson-0.58.2.tar.gz.asc
-sha256  7634ec32955d3f897d623b88e9d2988451035f43d73c17a29caf767387baedb7  meson-0.58.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.gz.asc
+sha256  e376c298df64b643dfe01eccb2d7b6f1e02e95aa38c19f19d120d129612ce476  meson-0.59.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d093dc9fea..134411625a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.58.2
+MESON_VERSION = 0.59.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
