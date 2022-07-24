Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92189C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3F341836;
	Sun, 24 Jul 2022 13:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B3F341836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNza2IiBTtBX; Sun, 24 Jul 2022 13:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39F44171C;
	Sun, 24 Jul 2022 13:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C39F44171C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CFCA1BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36E3340C4A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E3340C4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXXpyctySIN9 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:18:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0780140C2A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0780140C2A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:18:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b26so12443805wrc.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2XmOamoxYV2EGNTX1mglv4BNWJWDSxCageEju9PgrQM=;
 b=quxJ/SoNefSPERucCFoFcCjAIm1EOqEo0nar4NAFuelas2FzTKa9iv1Zs6kmwKhlBX
 wO8dtnW5kaXkbST8rWe0nzuHPOZFYPti/tTbecheJ05S91bDgLdOnVnkYs18UiBVAdzQ
 baqmlo4RXEtC3KOW0SreUjuKigSPLbp4lNJOB+0EyuDpmqVw0hiM6EGAIP3ffoPgl77w
 mn2n3un4Qt9MGRbII8w6bjzIDZmzPD/e4WH9+FPFFG5mpf/AyrDiw1vxasuZwwIRbULZ
 w654VOi7Knvm5aReBae9gSx50dlwOK/A3Hb/1TWtMPOkqJvKiEPPeb0coB4vozn/Kjmn
 J1kA==
X-Gm-Message-State: AJIora8xpdfDBUWQyjz182hyOAkmtU2SRzSZzSQVj/l4a0DRo+HymPHr
 T8bFnRIOdz1tme5y9v2lmxPE9mPPkHg=
X-Google-Smtp-Source: AGRyM1s7VrAP62eFwYiKWhL0evU8yT2/0DnX8SqZYSKK7fPY2mZVgI4DNDefG5GYw7hJ/w+6EXW4ag==
X-Received: by 2002:a05:6000:1091:b0:21e:3d13:283d with SMTP id
 y17-20020a056000109100b0021e3d13283dmr5507884wrw.376.1658668723755; 
 Sun, 24 Jul 2022 06:18:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:283:d2f0:f8df:54e6:5f1e:2381])
 by smtp.googlemail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a2fde6ef62sm11213334wmq.7.2022.07.24.06.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 06:18:43 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 15:18:39 +0200
Message-Id: <20220724131839.20548-1-dgouarin@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=2XmOamoxYV2EGNTX1mglv4BNWJWDSxCageEju9PgrQM=;
 b=oUlpySdrypS818gyjj0/j7ysBRHhQv3m9ajQYFlEKafqHplF0Zh05AeuoxpxRz2Ol4
 ZnBpCz9QcWPoHghxgASfX3/ocUxsi6VWb0ygTty+YfUMJp5zTdgDDxVpB2AWx2q3PXTU
 ScsgNFNWgMEffCBeuMnG4NVfFpklhq8nWy4xKL4E+LYUV2gUMw31W76CJlxyoLipo0Kl
 AaQ+feF43Epwbycemgr+9Ro1elh7NU7ZnJEYBMlYAThljHQEcEeoTedEsVxtVDy7tQQp
 yKSyvX8PZpf2LkZrGp3fA/JJaLgE+pN4GlvxfjugmKR+SA4BvKPRWdLggSNXbb35bOXt
 99iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oUlpySdr
Subject: [Buildroot] [PATCH V2] Version 2.3.4 of libtalloc needs to define
 PYTHONHASHSEED, as a check has been added to the configure script,
 and build will fail if it is not defined.
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
Cc: romain.naour@smile.fr, David GOUARIN <david.gouarin@thalesgroup.com>,
 yann.morin.1998@free.fr
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: David GOUARIN <david.gouarin@thalesgroup.com>

This is originately a workaround by samba developpers meant to avoid rebuilding talloc
with each call to make. Defining PYTHONHASHSEED would not be required in the context
of builroot, if not for the check in the configure script.

This change required an upgrade to pkg_waf.mk.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>

---
Changes v1 -> v2:
  - edit commit message (suggested by Yann E. MORIN)
Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
 package/libtalloc/libtalloc.hash | 2 +-
 package/libtalloc/libtalloc.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index cbfd11e63b..0bc8edb695 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
+sha256  179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505  talloc-2.3.4.tar.gz
 sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 8cba699ea1..d12f4fcfff 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.3
+LIBTALLOC_VERSION = 2.3.4
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+
@@ -40,6 +40,9 @@ else
 LIBTALLOC_CONF_OPTS += --disable-python
 endif
 
+#LIBTALLOC_CONF_ENV += PYTHONHASHSEED=1
+#LIBTALLOC_MAKE_ENV += PYTHONHASHSEED=1
+
 LIBTALLOC_WAF = ./buildtools/bin/waf
 
 # like samba4, libtalloc uses the waf build system which requires a
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
