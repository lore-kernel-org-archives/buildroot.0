Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCE2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC71260F4C
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC71260F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED6680DFD;
	Sat,  4 Sep 2021 18:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2UAvdMeh7at; Sat,  4 Sep 2021 18:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98AE80C5F;
	Sat,  4 Sep 2021 18:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA1F1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 580AA6071E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RezHyE1_gj9V for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA2F6072F
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 464718834C; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:20:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60f7c478e4682eb6d562b1f38fbfa44ce4b37675
X-Git-Newrev: 0f0e913f10caf21f23c2e46f210519a7a3bc0b32
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.464718834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: rework build and install
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f0e913f10caf21f23c2e46f210519a7a3bc0b32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create libzstd.pc in the build step instead of triggering a
lazy build during installation when it is missing.

Move PREFIX=/usr to ZSTD_OPTS. It is needed for building libzstd.pc
during the build step; for consistency, make sure it's available in all
steps.

Attach '-release' to the targets, since the default is to
build lib-release and zstd-release. Its only effect is to clear
DEBUGFLAGS (which are just warning flags).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: add check-package disable]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 5a96c11309..9c97eb0e11 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+ZSTD_OPTS += PREFIX=/usr
 ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZSTD_DEPENDENCIES += zlib
@@ -60,12 +61,14 @@ else
 ZSTD_OPTS += HAVE_THREAD=0
 ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
 endif
+# check-package disable OverriddenVariable - override intended
+ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
+		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) zstd-release
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
@@ -76,9 +79,9 @@ endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
+		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
