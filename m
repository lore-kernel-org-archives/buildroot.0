Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0965C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634F840755;
	Fri,  7 Mar 2025 19:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTNBfnXmYlev; Fri,  7 Mar 2025 19:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4814440749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4814440749;
	Fri,  7 Mar 2025 19:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D1B1E21
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F16988120C
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZlxQQSQ4Fgt for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EED168120E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED168120E
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EED168120E
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z8bDh02wQz2Zb;
 Fri,  7 Mar 2025 19:59:16 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Z8bDg4pwzzKL8; Fri,  7 Mar 2025 19:59:15 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 07 Mar 2025 19:58:45 +0100
MIME-Version: 1.0
Message-Id: <20250307-setserial-fix-v1-3-c37c1e7e8234@cherry.de>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 3/4] package/setserial: update to 2.17-57 for
 compatibility with newer toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Quentin Schulz <quentin.schulz@cherry.de>

Debian has a newer setserial which compiles on newer toolchains, so
let's update to it.

Noteworthy is the change from a big diff to a tarball containing the
whole debian directory. The series file which contains all patches to
apply is named properly so no need to rename 00list anymore. The patches
file extension is now .patch instead of .dpatch.

This fixes the build with BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64 external
toolchain (14.2.rel1).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/setserial/setserial.hash |  4 ++--
 package/setserial/setserial.mk   | 21 +++++++--------------
 2 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/setserial/setserial.hash b/package/setserial/setserial.hash
index 991d2860a9509642950981204d9700fda2d899c8..3c1ade56ff21dfa1b038a906f71226bc2c66427c 100644
--- a/package/setserial/setserial.hash
+++ b/package/setserial/setserial.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial/setserial_2.17-45.3.dsc
+# From https://snapshot.debian.org/file/98a1ce8758c5313a8b8a266d493605e578bcc4f6/setserial_2.17-57.dsc
 sha256  7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a  setserial_2.17.orig.tar.gz
-sha256  33db87e8a86cf12b7c97efca9e056865e71358e8cfeb3931118b2647ce1eecc6  setserial_2.17-45.3.diff.gz
+sha256  e96ef61d3e5fc5a77d6e54c4c48a2caee31931732a18ee49e4c67d128ad181c9  setserial_2.17-57.debian.tar.xz
 # Locally computed
 sha256  1d7e810ed28daf370def626dfd4c502f2f77d2b678f1ac72e2ba675dd6f9af0d  debian/copyright
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 6567738e762b7d628c63d10f8ab87a898ef9e236..9b27e4e867e65231eb7c27c11685befcfcb6b75f 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -6,8 +6,8 @@
 
 SETSERIAL_VERSION = 2.17
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial
-SETSERIAL_EXTRA_DOWNLOADS = setserial_2.17-45.3.diff.gz
+SETSERIAL_SITE = https://snapshot.debian.org/archive/debian/20250307T084701Z/pool/main/s/setserial/
+SETSERIAL_EXTRA_DOWNLOADS = setserial_$(SETSERIAL_VERSION)-57.debian.tar.xz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
@@ -18,26 +18,19 @@ SETSERIAL_AUTORECONF = YES
 # Extract the Debian tarball inside the sources
 define SETSERIAL_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(SETSERIAL_EXTRA_DOWNLOADS))) \
-		$(SETSERIAL_DL_DIR)/$(notdir $(SETSERIAL_EXTRA_DOWNLOADS)) > $(@D)/setserial_2.17-45.3.diff
+		$(SETSERIAL_DL_DIR)/$(notdir $(SETSERIAL_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
 endef
 
 SETSERIAL_POST_EXTRACT_HOOKS += SETSERIAL_DEBIAN_EXTRACT
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
-	# - Applying diff gotten from SETSERIAL_EXTRA_DOWNLOADS
 	# - Touching gorhack.h is needed for the Debian patch 18 to work
-	# - Rename 00list which contains the list of patches to "series" so
-	#   Buildroot knows in which order the patches need to be applied. This
-	#   is necessary because their file extension is dpatch, which isn't
-	#   supported by the APPLY_PATCHES script outside of the series
-	#   mechanism.
-	$(APPLY_PATCHES) $(@D) $(@D) setserial_2.17-45.3.diff
-
+	# - Apply patches in the order listed in debian/patches/series
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
-		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		mv $(@D)/debian/patches/00list $(@D)/debian/patches/series; \
-		sed -i '/01_makefile.dpatch/d' $(@D)/debian/patches/series; \
+		rm $(@D)/debian/patches/01_makefile.patch; \
+		sed -i '/01_makefile.patch/d' $(@D)/debian/patches/series; \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches series; \
 	fi
 endef

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
