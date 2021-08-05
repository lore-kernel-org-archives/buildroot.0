Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2FFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:21:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1896104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C1896104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F0C608A1;
	Thu,  5 Aug 2021 20:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5o0PI-3PQJUh; Thu,  5 Aug 2021 20:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89ECB60A70;
	Thu,  5 Aug 2021 20:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA53D1C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B10608A1
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHfIS8o2E9gp for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:20:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4596078C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:20:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9CF3B8C5CD; Thu,  5 Aug 2021 20:20:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:20:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f0e913f10caf21f23c2e46f210519a7a3bc0b32
X-Git-Newrev: 32041f050e42ac15af463622274a889ff8d044ed
X-Patchwork-Hint: ignore
Message-Id: <20210805202034.9CF3B8C5CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: Prefer
 dynamically linked tool
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=32041f050e42ac15af463622274a889ff8d044ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
