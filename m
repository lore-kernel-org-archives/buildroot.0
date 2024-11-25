Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E3AD58D66
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B837984FAE;
	Mon, 25 Nov 2024 16:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67kJt5ndZaBp; Mon, 25 Nov 2024 16:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AFFF84FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AFFF84FC7;
	Mon, 25 Nov 2024 16:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC3244E7B
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADE1261600
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTID44t53kX7 for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19E6615FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19E6615FB
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 700E28404B; Mon, 25 Nov 2024 16:42:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 17:21:46 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 985d126cd78e2b071a57532e5b18867ef3481378
X-Git-Newrev: 7babcd8937a15ae471af706aceb2203ff849127a
X-Patchwork-Hint: ignore
Message-Id: <20241125164234.700E28404B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/ffmpeg: fix build
 on riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=7babcd8937a15ae471af706aceb2203ff849127a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Ported patch from OpenEmbedded:
https://github.com/openembedded/openembedded-core/commit/010b068bcc126dbbc1e2032997e8d83360a7de35

"ffmpeg 6.0 has added assembly routines which uses rv64i ISA
unconditionally, ideally it should check for ISA before using those
instructions."

Fixes:
https://autobuild.buildroot.org/results/8a7082a0f24ebcf264aeac5e0fea704dc6a6bb1c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9e84f38be87393f5b0d0298f762bfcaf0f76f120)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
