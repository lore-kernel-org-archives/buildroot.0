Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12ACD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D8E607CE;
	Mon,  1 Apr 2024 14:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDihosDnqfV6; Mon,  1 Apr 2024 14:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAE76082A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAE76082A;
	Mon,  1 Apr 2024 14:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 743E61BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7EA40446
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx2OI9JkiMLb for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99BA14043E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99BA14043E
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:46:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90DFE8455C; Mon,  1 Apr 2024 14:46:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 16:39:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a8b8e13062029ebfc1d4e43b789c5eb186bc36b
X-Git-Newrev: d69e13b0e965961019b4aab38e187267af3cab78
X-Patchwork-Hint: ignore
Message-Id: <20240401144632.90DFE8455C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: fix riscv32 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d69e13b0e965961019b4aab38e187267af3cab78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following riscv32 build failure raised since bump to version
1.4.1 in commit d8c440936d51b7f76472b43002780f5490b7a3bf and
https://github.com/videolan/dav1d/commit/43ee02a99cce1f221bdb574c9ee484180d71013f:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: src/libdav1d_bitdepth_8.a.p/itx_tmpl.c.o: in function `.L0 ':
itx_tmpl.c:(.text.unlikely+0x76c): undefined reference to `dav1d_inv_txfm_add_dct_dct_4x4_8bpc_rvv'

Fixes: d8c440936d51b7f76472b43002780f5490b7a3bf
 - http://autobuild.buildroot.org/results/28192c494c7a2f88cc90205b6a08afd11782df40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dav1d/dav1d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 74c68d1660..18cb81868a 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -24,6 +24,11 @@ ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 DAV1D_CONF_OPTS += -Denable_asm=false
 endif
 
+# riscv assembly requires riscv64
+ifeq ($(BR2_riscv):$(BR2_RISCV_64),y:)
+DAV1D_CONF_OPTS += -Denable_asm=false
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
