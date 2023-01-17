Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAABC63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 11:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 935B8405AE;
	Tue, 17 Jan 2023 11:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 935B8405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gmQqPnSq1ao; Tue, 17 Jan 2023 11:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870D4406E0;
	Tue, 17 Jan 2023 11:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 870D4406E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C33071BF375
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E4246068F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 11:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4246068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZHglzvcnDwP for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 11:05:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F52D605EA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F52D605EA
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 11:05:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r9so7385076wrw.4
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 03:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PMDV0ETqPAM71wvhvmydCd5XSUjiZQMmffjg4f4/HKw=;
 b=rIdneg9mobNVf5xi+7M8pzb/txDmXWqjPMzTDHrBlQ/ACPKD3LImcWcZhDu4NKWei9
 gmZ/XJ2KCb8L4P0TUiFRy1Z1k2C6WmgteBqGXGenuvE//Zv74kpEdaVRzDpRuBYgdJOW
 zwyTlY1uDHPdisXlbOeF4b3+KjWM6I+x+JDhiTuVGBLij7q9EwJfchBy/RAzBcKTZ4Ys
 a0VnW7Bzw+ErCePC8pu11RVq81JPBui9KQjS/A3rnGJDwecVnBf8A8qKDlfvUTONtxjj
 eUxFTslbatxZEdvQ06wOu46AOfuZMcu3bpPiBCJkwA6+6CJNjDBLGiGy6t7OYzh7tEcM
 oKoQ==
X-Gm-Message-State: AFqh2kpK9iARHzVFrlgMAja47HJq6nv/9iQCX1RtW6Kmfsw6CHSwwKjA
 pvdFXxfZ2hopUftQw3YhJ+Ir7k5N9Oc=
X-Google-Smtp-Source: AMrXdXvr13i9Jx4m19vY+zy+SF8HT71DDtqr8bbR8AbOja0YDIFxbmPifPCopLPFoT6iSIaCwumdCQ==
X-Received: by 2002:adf:e109:0:b0:2bd:e547:943a with SMTP id
 t9-20020adfe109000000b002bde547943amr2493545wrz.14.1673953507433; 
 Tue, 17 Jan 2023 03:05:07 -0800 (PST)
Received: from ncarrier.spectracom.local
 (2a02-8428-7321-aa01-1304-3364-4203-42ea.rev.sfr.net.
 [2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfb352000000b00241fab5a296sm29200257wrd.40.2023.01.17.03.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:05:06 -0800 (PST)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 12:04:40 +0100
Message-Id: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PMDV0ETqPAM71wvhvmydCd5XSUjiZQMmffjg4f4/HKw=;
 b=F82a/RomaPMZoHcCWgaXU200zh7TSRiX9n+trJatOQ9upf2zGHDHeVaPvQZwlGbqhJ
 G74MA3CmIru2NJtTFXinDn3Mlg4idzhXmvfsmSd8x72jpuUfbORZdaKfOv0qybrl5IBI
 I0MrxuZQ06rg7ngImEFsFAZ3Y01PZ9lg1crkycCHYSoaszwiMiO8fI6ntTbNfTvHoMR1
 xgRNZVkPMf+12eh407PlgjaBKW3MGaKV8D3S9seVRxhTD8crZz0/+jgXs4GV5OVhP0Fj
 TLcB22DNiaDoSdjp5DbrM53Te3vbjwZ1jsfYuykblpTEFK7PADfpWJ6zCR+3s7KijOzg
 9l8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F82a/Rom
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: local and override
 support in legal-info
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <carrier.nicolas0@gmail.com>

Sources of packages which are using the 'local' _METHOD_SITE or
which declare an _OVERRIDE_SRC_DIR are not archived when generating
the legal-info target.
This is problematic since those packages are the most likely to
require being published, because it's highly probable that their
sources have been modified.

This patch generates a tar.gz archive on the fly, containing the
result of the rsync of the package's source directory, using the
same arguments as during the preparation of a build.
Note that is not possible to archive the builddir, since it may
contain artifacts of previous compilations.

It is not possible to consider rsync as a "normal" download method
either (which would have solved the initial problem), because if we
do that:
 * the DL dir's content would be altered improperly
 * the rsync + tar gz overhead would be paid on compilation and is
   significant, for example, for a linux kernel
 * a hash file would be necessary, which would be a burden to
   maintain, for sources frequently modified

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
---
 package/pkg-generic.mk | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2f8ba39edf..a8760f40d4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -660,6 +660,12 @@ $$(error $(1) has local site method, but `$(2)_SITE` is not defined)
 endif
 endif
 
+# for legal-info sources archival
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_OVERRIDE_RSYNC_DIR = $$($(2)_BUILDDIR)/$$($(2)_BASENAME_RAW)
+$(2)_OVERRIDE_RSYNC_ARCHIVE = $$($(2)_OVERRIDE_RSYNC_DIR).tar.gz
+endif
+
 ifndef $(2)_LICENSE
  ifdef $(3)_LICENSE
   $(2)_LICENSE = $$($(3)_LICENSE)
@@ -1146,13 +1152,16 @@ else
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifeq ($$($(2)_SITE_METHOD),local)
-# Packages without a tarball: don't save and warn
-	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
-
-else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
-
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+# Packages without a tarball: create one on the fly
+	@echo "Package is of type local or override, archive sources"
+	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR) $$($(2)_OVERRIDE_RSYNC_ARCHIVE)
+	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ $$($(2)_OVERRIDE_RSYNC_DIR)/
+	$$(Q)tar -zcf $$($(2)_OVERRIDE_RSYNC_ARCHIVE) -C $$($(2)_OVERRIDE_RSYNC_DIR) $$$$(ls -A $$($(2)_OVERRIDE_RSYNC_DIR)/)
+	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR)
+	$$(Q)support/scripts/hardlink-or-copy \
+			$$($(2)_OVERRIDE_RSYNC_ARCHIVE) \
+			$$($(2)_REDIST_SOURCES_DIR)$$(sep)
 else
 # Other packages
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
