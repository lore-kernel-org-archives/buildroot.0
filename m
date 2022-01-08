Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A4C433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A31840180;
	Sat,  8 Jan 2022 18:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT78afSjhhd9; Sat,  8 Jan 2022 18:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 886EF400E3;
	Sat,  8 Jan 2022 18:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23FAA1BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A89813F7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKrkulwf4Z6L for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54119813CA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 76D4A81D36; Sat,  8 Jan 2022 18:52:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:57:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be256690788fefad93ab00f0233ddb9414d29727
X-Git-Newrev: 7dc225c38a0c81c2202bbfca1c5e674b47d09f26
X-Patchwork-Hint: ignore
Message-Id: <20220108185255.76D4A81D36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trinity: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dc225c38a0c81c2202bbfca1c5e674b47d09f26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: debug.o: in function `__show_backtrace':
debug.c:(.text+0x10): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/bf78e4be9b9d9ca7d32f922d72ea6cd39a78d3d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/trinity/trinity.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index befb8de826..4dca50c0b6 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -11,16 +11,24 @@ TRINITY_LICENSE = GPL-2.0
 TRINITY_LICENSE_FILES = COPYING
 TRINITY_CPE_ID_VENDOR = trinity_project
 
+TRINITY_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+TRINITY_DEPENDENCIES += libexecinfo
+TRINITY_LDFLAGS += -lexecinfo
+endif
+
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
 endef
 
 define TRINITY_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LDFLAGS="$(TRINITY_LDFLAGS)"
 endef
 
 define TRINITY_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LDFLAGS="$(TRINITY_LDFLAGS)" DESTDIR=$(TARGET_DIR)/usr install
 endef
 
 # Install helper scripts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
