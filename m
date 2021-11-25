Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848DDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C6281D70;
	Thu, 25 Nov 2021 12:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77KnmD5z5bfM; Thu, 25 Nov 2021 12:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A7B481C71;
	Thu, 25 Nov 2021 12:49:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEF41BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8B3402EC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyVyLFDHBeTn for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:49:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C826400DE
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:49:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p18so5468272wmq.5
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=UiRDxdiIB20tASmpSoLIO+TKckYPjyRGRWLVDPR7fJg=;
 b=qNcCGjztz/i/2A8u72kdDku18fdGTf6I0t+Wy0bgUxNuVZLmgx5QZ3J4V6jpYqmgAB
 +uikRtn15yDQSYyowyCXbxwyuxHQlT3KZkKDJ/35qG6TASr25sX7YauFyzpxG8g9XdUt
 2vnnvJsLZOGZ5a6vK3jq1LfAFldqW0GwXhjqXNWzL3s3cy8wgPEFTuFN9B5gMplfUVnl
 RK/LjGgGOYT7zxuBjErwu1e4VsOYcQ2tSrZqI7irMmPsWnpCGFg7H4FtcR4RZdQOrNjG
 omvkF8biuX4s1r01Q+HbsYCwkddIqXCc+bli4hWCoWuKj5CrHogFHN+pOCKzFoGLCs5I
 /83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=UiRDxdiIB20tASmpSoLIO+TKckYPjyRGRWLVDPR7fJg=;
 b=Xs52SG89rvH5aMRgJJ3fRl3UIlZCk8LKUFPKreNY5izGQ9ARTqFxLRsNuHyb2Xye4E
 MdWL+WjnMYIIOBUDQIfqErRuGQMeD1yPsxeYNJZH2TmcvyMDTuNbxSBd83vQCvwHyo3n
 1WFpuOvLEBaxnvNLtA07tTlrq0n7f1z3G6kUQyFJr593JCMduRemEHN25iGO+hHZGyJY
 cZlk+vhDUoRE0NVMYZVmXx7+HhNbwOXKogWXkZVmJ8X4eBUpCBByjysLELsEoARKbPCH
 UzbhGp6BpCb1CVFNGTpFKuwIqp/EpPfjR2b6pOXYdzmG7PFiUTsvK+776eOYo74zCGwO
 9b1w==
X-Gm-Message-State: AOAM533unz3ezH5f99sH5/FhQeCa1OfenM2kUdHmuPBskRFGKIhq4TUP
 +RtIZyd1fYQIqaeSyqetphfLs1FIJT5TNQ==
X-Google-Smtp-Source: ABdhPJysFA6IocMtLLqg2f+XoZCCgWo7HLhkWyH/6+rlkU1bQyNmBDqElTm1HDPsvLq8eM0oYJUG3Q==
X-Received: by 2002:a05:600c:3c85:: with SMTP id
 bg5mr6812599wmb.58.1637844538519; 
 Thu, 25 Nov 2021 04:48:58 -0800 (PST)
Received: from camb691.localdomain (bilbo.ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id w2sm2622986wrn.67.2021.11.25.04.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:48:58 -0800 (PST)
Date: Thu, 25 Nov 2021 12:48:44 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20211125124844.75d8dd2c@camb691.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v2] Handle _LICENSE_FILES with full path
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

There is nothing preventing _LICENSE_FILES from containing a full path.
When this happens, the legal-info process adds the build directory on
the front of the _LICENSE_FILES value resulting in a failed cp of the
file.

This patch adds a check to see if the _LICENSE_FILES path with the build
directory prepended exists (as is the case for all packages currently)
and uses that. Otherwise it will assume that the _LICENSE_FILES file is
a full path.

An 'offending' package .mk file could look something like this:
LIBFOO_VERSION = 1.0
LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
LIBFOO_SITE = http://www.foosoftware.org/download
LIBFOO_LICENSE = GPL-3.0+
LIBFOO_LICENSE_FILES = $(LIBFOO_PKGDIR)/COPYING

[...]

$(eval $(generic-package))

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
Adding a licence file to buildroot is probably odd and a strange thing
to do, we're doing this internally (and I do hope I can push the package
soon) with https://github.com/BrianGladman/modes

V1->V2 Reworked commit message and added example as requested by Thomas
       Petazzoni
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
