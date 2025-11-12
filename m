Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A635CD37B2
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C75E80A08;
	Wed, 12 Nov 2025 19:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRIoGtD3JXyk; Wed, 12 Nov 2025 19:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7236780A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7236780A83;
	Wed, 12 Nov 2025 19:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E57230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBC480A83
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lanot0-uEzwL for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C053980A08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C053980A08
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAFE98442D; Wed, 12 Nov 2025 19:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 20:35:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2afa96009857e96736285444afba071d8615986
X-Git-Newrev: 7fbd14776311f8b8767e7a98a1e1f62836f1e288
X-Patchwork-Hint: ignore
Message-Id: <20251112193943.BAFE98442D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudfread: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fbd14776311f8b8767e7a98a1e1f62836f1e288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the build for non-threaded toolchains occurring since the
bump to 1.2.0 by buildroot commit 537555a37f53360020a11df8065450d88e9d107c
and the switch of the build system to meson.

libudfread uses

dependency('threads', required: false)
https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/meson.build?ref_type=tags#L66

which falsely detects threads support:

Run-time dependency threads found: YES

although the toolchain lacks threads support:

$ grep THREADS .config | grep =
BR2_PTHREADS_NONE=y

There is an open Meson bug report discussing this problem:
https://github.com/mesonbuild/meson/issues/553#issuecomment-421562520

The only dependees of libudfread, kodi and libbluray, depend on thread
support themselves so we require threads support for libudfread as well
to fix the build error.

Fixes:
https://autobuild.buildroot.net/results/839/839d1b879187454ba9064845451f2c2ff398a663/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libudfread/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
index c1f3f23af9..803bfee0f5 100644
--- a/package/libudfread/Config.in
+++ b/package/libudfread/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBUDFREAD
 	bool "libudfread"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  UDF reader
 
 	  https://code.videolan.org/videolan/libudfread
 
 comment "libudfread needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
