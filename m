Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA517C433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 15:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4293940486;
	Wed, 24 Nov 2021 15:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsQ-MGNFD1cr; Wed, 24 Nov 2021 15:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA564048D;
	Wed, 24 Nov 2021 15:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DEBD1BF41A
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 15:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A4976069B
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 15:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQXRc2ZjhYI7 for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 15:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71C216063E
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 15:18:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so5732169wmj.5
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=+sO9Qq3HxBEzb1n/UZAIXsuT2H+01+C7JUjVWQTimew=;
 b=KxNSyvX059RDfr7PJtrxneZcCsASfRIHp8k9oCpvOgznDqv2fpKJ0cy83PDJ5Nd1np
 +7U8axbLpb7EkXNGtMi9nq+cmBeyr8k3WPqj0vxYOtrXLeCwxEZ+BWVy7SdyzhioapDD
 kvth6a8Mwp3vxyjaN38cu64vRi2phc4xQthrrHGyiikzslbMdYsvqkcDnHfxiedxa63O
 wi7LncC6gLSMsf7hNzsaoRfSRX67cA5VfIsUJ879rPWi0dUjipwgjT9q4Pv5J9Q1c8T4
 DHlcX5/D8GFVn4JAzjOpvuYez2JNIE9CTMlmqwx+PLyBV7tZ4XCYa/aPP0jOKXuEzT1S
 OB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=+sO9Qq3HxBEzb1n/UZAIXsuT2H+01+C7JUjVWQTimew=;
 b=ehUcdOgA0JZ3yPv6ZvX8yD0gzpk6+BpuRLxxH3V2MdFQH9w8eDKAK7KAd7n4o9+/lB
 QNZ4dadsqdhzapvtvgXXiJ3oANvOiGoVNXJSMsKd0eWkyUWsnBoOG+is2VmiFqNbCdyF
 91QX1T6htgk/2dO+9NHPfIxrcQe+EDd5z1vAaeVz/xowcwHk0zX6Bsal4nTeRyWskj9r
 bBHR0TUOG5nXSHD11E8Dcr9AHAbwDp8Nl8L+8SfnC1LHyhyMRdF1lQqNlkp1C0FwxOC7
 vc3zQ4+ylChbrqS1GH3JhWRMdBBXbd8FFvXN0oOYtH2JNbBj9CQ+5Z/dIWRfoVyTsHyY
 USdQ==
X-Gm-Message-State: AOAM5325wfzuuJqD282oX/flMBar0GZSMGyOVBZGwy2l1PhQs0uT16PT
 UzRf8kxUQYcELWoN8gw94huNIGA0ZtgvTA==
X-Google-Smtp-Source: ABdhPJzjSJsvGtpjlQzT9g7Y0CoQ/QQ9RANuS9fyrOSxSQsQgI3prUpNvgfV0v4FTZ3tCG6GRFdx1Q==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr15588133wmq.109.1637767123439; 
 Wed, 24 Nov 2021 07:18:43 -0800 (PST)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id r8sm173690wrz.43.2021.11.24.07.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 07:18:43 -0800 (PST)
Date: Wed, 24 Nov 2021 15:18:27 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20211124151827.1107e808@camb691.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] Handle _LICENSE_FILES with full path
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

legal-info currently assumes that a packages _LICENSE_FILES will be a
path or a filename relative to the source of the package.

There is nothing preventing _LICENSE_FILES from containing a full path,
probably using _PKGDIR within the package .mk file. When this happens,
the legal-info process simply adds the build directory on the front of
the _LICENSE_FILES resulting in a failed cp of the file.

This patch simply performs a check to see if the _LICENSE_FILES path
with the build directory prepended exists (as is the case for all
packages currently) and uses that. Otherwise it will assume that
the _LICENSE_FILES file is a fullpath and attempt to use that.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
This might well be one of those "don't do that" cases and just force
these unique packages to just have some kind of post extract hook to
put the file in the build directory.

Having said that, I don't think the fix is particularly invasive.

 package/pkg-generic.mk | 2 +-
 package/pkg-utils.mk   | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ded5176428..e6d9f457e4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1139,7 +1139,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$(call prefix-if-needed,$$($(2)_DIR),$$(F)),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..0c287a0f50 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -207,6 +207,10 @@ endif
 #
 LEGAL_INFO_SEPARATOR = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
 
+define prefix-if-needed # builddir, filename
+	$(if $(wildcard $(1)/$(2)),$(1)/$(2),$(2))
+endef
+
 define legal-warning # text
 	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
 endef
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
