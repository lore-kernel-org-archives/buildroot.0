Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AD0CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40014820E9;
	Wed,  2 Oct 2024 20:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmvJ9Ab07gc0; Wed,  2 Oct 2024 20:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B8184088
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B8184088;
	Wed,  2 Oct 2024 20:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C76571BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7A38407A1
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVajihcSZUPd for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36C5407D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36C5407D6
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADB6884705; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceff8dbaa554ed543ec1c09ee8e2a76f40a0415c
X-Git-Newrev: 4e8d8d2345ea121b1e9d228603ece1142c9bb82f
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.ADB6884705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: pass -mno-fdpic if FDPIC is enabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e8d8d2345ea121b1e9d228603ece1142c9bb82f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building the kernel.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0a213d17b5..126e92e84c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -163,6 +163,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
@@ -184,7 +185,12 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_CFLAGS += -Wno-attribute-alias
+endif
+
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LINUX_CFLAGS += -mno-fdpic
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
