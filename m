Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FDBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D8560F4C
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99D8560F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B15832DC;
	Sat,  4 Sep 2021 18:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nf6LN2E5jNY; Sat,  4 Sep 2021 18:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7488830E6;
	Sat,  4 Sep 2021 18:32:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF71B1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 299F840274
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-Y0AIYRDQnO for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A90E401E5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 512458834A; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:20:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f0e913f10caf21f23c2e46f210519a7a3bc0b32
X-Git-Newrev: 32041f050e42ac15af463622274a889ff8d044ed
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.512458834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: Prefer dynamically linked
 tool
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

commit: https://git.buildroot.net/buildroot/commit/?id=32041f050e42ac15af463622274a889ff8d044ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the libzstd DSO is available, then link the tool
against it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 9c97eb0e11..e970d87cbf 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -49,6 +49,13 @@ ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
+# prefer zstd-dll unless no library is available
+ifeq ($(BR2_STATIC_LIBS),y)
+ZSTD_BUILD_PROG_TARGET = zstd-release
+else
+ZSTD_BUILD_PROG_TARGET = zstd-dll
+endif
+
 # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
 # one. Building a multi-threaded binary with a static library (which defaults
 # to single-threaded) gives a runtime error when compressing files.
@@ -68,7 +75,7 @@ define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd-release
+		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
