Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DE5D64089
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B34142B31;
	Fri,  8 Nov 2024 20:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRJKk2oqBKvC; Fri,  8 Nov 2024 20:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F1C42B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F1C42B2E;
	Fri,  8 Nov 2024 20:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA2AC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF99E820CB
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3_Ny5_0g9uM for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 20:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D3580C10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D3580C10
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:55:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C94E85D9F; Fri,  8 Nov 2024 20:55:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Nov 2024 21:51:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d242ab6b8e2805ee173de54bec47dbbcbcecc939
X-Git-Newrev: 9e84f38be87393f5b0d0298f762bfcaf0f76f120
X-Patchwork-Hint: ignore
Message-Id: <20241108205529.2C94E85D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix build on riscv32
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9e84f38be87393f5b0d0298f762bfcaf0f76f120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ported patch from OpenEmbedded:
https://github.com/openembedded/openembedded-core/commit/010b068bcc126dbbc1e2032997e8d83360a7de35

"ffmpeg 6.0 has added assembly routines which uses rv64i ISA
unconditionally, ideally it should check for ISA before using those
instructions."

Fixes:
https://autobuild.buildroot.org/results/8a7082a0f24ebcf264aeac5e0fea704dc6a6bb1c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a010c0168c..1e18b5e2da 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -529,6 +529,11 @@ else
 FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
+# Fix build failure on several missing assembly instructions
+ifeq ($(BR2_RISCV_32),y)
+FFMPEG_CONF_OPTS += --disable-rvv --disable-asm
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FFMPEG_CONF_OPTS += --extra-libs=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
