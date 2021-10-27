Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAE8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B992E60E76
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B992E60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CE740187;
	Wed, 27 Oct 2021 13:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xaPEbEHbPWhc; Wed, 27 Oct 2021 13:52:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D844940101;
	Wed, 27 Oct 2021 13:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6731BF4DD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE44440101
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTc8NjhdWNiD for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3300C400F6
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B36F882C7; Wed, 27 Oct 2021 13:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 14:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc26ee8e1b84faa9feaba7fc6fe911ad74ccf7e0
X-Git-Newrev: 04d7ea4720cbc1e9c4d7ec6307aff71567b0653d
X-Patchwork-Hint: ignore
Message-Id: <20211027134931.7B36F882C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: Makefile.in: fix elf2flt
 invocation options
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

commit: https://git.buildroot.net/buildroot/commit/?id=04d7ea4720cbc1e9c4d7ec6307aff71567b0653d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_BINFMT_FLAT_ONE is selected, elf2flt must be invoked with the
"-r" option to ensure that a single contiguous binary image is created,
regardless of the architecture default image format implemented by
elf2flt.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..50ccd0f25d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -178,13 +178,19 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt)
-TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt)
-TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
+        -Wl$(comma)-elf2flt=-r)
+else
+ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
-TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
+endif
+TARGET_CFLAGS += $(ELF2FLT_FLAGS)
+TARGET_CXXFLAGS += $(ELF2FLT_FLAGS)
+TARGET_FCFLAGS += $(ELF2FLT_FLAGS)
+TARGET_LDFLAGS += $(ELF2FLT_FLAGS)
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
