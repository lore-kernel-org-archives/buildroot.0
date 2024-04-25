Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C82C10F15
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF7F8264A;
	Thu, 25 Apr 2024 17:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcsYaY_UmBB2; Thu, 25 Apr 2024 17:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE0E48280E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0E48280E;
	Thu, 25 Apr 2024 17:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF6021BF990
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC36641A06
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUpmaVW5AdKv for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0515340650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0515340650
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F103C8615B; Thu, 25 Apr 2024 17:22:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:19:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5b927881daf3023ad38b4e910ab79ad081f7ee4
X-Git-Newrev: b059e084201108255db61a27824d4bb8159d1054
X-Patchwork-Hint: ignore
Message-Id: <20240425172230.F103C8615B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycbor: override prefix at build
 time as well
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b059e084201108255db61a27824d4bb8159d1054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To ensure the correct prefix is used in the generated tinycbor.pc instead of
/usr/local:

>>> tinycbor 0.6.0 Building
..
sed > tinycbor.pc < tinycbor.pc.in \
        -e 's,@prefix@,/usr/local,' \
        -e 's,@exec_prefix@,/usr/local,' \
        -e 's,@libdir@,/usr/local/lib,' \
        -e 's,@includedir@,/usr/local/include,' \
        -e 's,@version@,0.6.0,'
>>> tinycbor 0.6.0 Installing to staging directory
..
install -m 644 tinycbor.pc /path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/tinycbor.pc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycbor/tinycbor.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index cad50e633b..d2fb583e67 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
 TINYCBOR_DEPENDENCIES += cjson
 endif
 
-TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1 prefix=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
@@ -34,12 +34,12 @@ endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr install
+		DESTDIR=$(STAGING_DIR) install
 endef
 
 define TINYCBOR_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr install
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
