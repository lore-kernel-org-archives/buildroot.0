Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D6CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0FB61050
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C0FB61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2495608CC;
	Sat, 11 Sep 2021 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaBdu2Qv_QVd; Sat, 11 Sep 2021 20:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6BB60814;
	Sat, 11 Sep 2021 20:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 324021BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2066440470
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iODYqAxzNr4h for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291354048E
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 673968918C; Sat, 11 Sep 2021 20:42:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:33:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7e362332436dda6adc65266366ad89c540c4d80
X-Git-Newrev: 4c5e3896ef55d48905074eb15a238e3393341112
X-Patchwork-Hint: ignore
Message-Id: <20210911204216.673968918C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: introduce rpm2archive option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c5e3896ef55d48905074eb15a238e3393341112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust the inclusion of the rpm2archive command as an option, to allow a
developer to opt-out of building/including the command if it is not
desired/needed for the target.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpm/Config.in | 15 +++++++++++++++
 package/rpm/rpm.mk    | 14 +++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 9da8d51df0..2af04b41b4 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -19,3 +19,18 @@ config BR2_PACKAGE_RPM
 	  The RPM Package Manager (RPM).
 
 	  http://www.rpm.org/
+
+if BR2_PACKAGE_RPM
+
+comment "rpm2archive support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_RPM_RPM2ARCHIVE
+	bool "rpm2archive command"
+	default y
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBARCHIVE
+	help
+	  Enable rpm2archive
+
+endif
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index e9d2adf690..5c04d47f10 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -73,13 +73,6 @@ else
 RPM_CONF_OPTS += --without-libintl-prefix
 endif
 
-ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-RPM_DEPENDENCIES += libarchive
-RPM_CONF_OPTS += --with-archive
-else
-RPM_CONF_OPTS += --without-archive
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 RPM_DEPENDENCIES += libselinux
 RPM_CONF_OPTS += --with-selinux
@@ -101,6 +94,13 @@ else
 RPM_CONF_OPTS += --disable-zstd
 endif
 
+ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
+RPM_DEPENDENCIES += libarchive
+RPM_CONF_OPTS += --with-archive
+else
+RPM_CONF_OPTS += --without-archive
+endif
+
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
