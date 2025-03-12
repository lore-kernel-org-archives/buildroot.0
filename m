Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30BBC28B2E
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 18:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D648204E;
	Wed, 12 Mar 2025 18:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWEffIooHA3X; Wed, 12 Mar 2025 18:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C16D381EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16D381EC1;
	Wed, 12 Mar 2025 18:15:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9010C1DB
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73C1D60E76
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbQL2YXAjX6J for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 18:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9882860E68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9882860E68
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 18:15:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8490487E86; Wed, 12 Mar 2025 18:15:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Mar 2025 19:13:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3c3c2cc3bcd22423f027004a4092745d7432dd3
X-Git-Newrev: 3e88ba41a9b1ab610f07eaa62132036e46ac9bd9
X-Patchwork-Hint: ignore
Message-Id: <20250312181516.8490487E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: Add upstream patch to fix
 building strace on m68k
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e88ba41a9b1ab610f07eaa62132036e46ac9bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ec3de790a66373f270f731519e2ef51c293ba683/

Currently it's not possible to build strace on m68k when using
musl because the version of musl in buildroot doesn't have the
m68k specific definitions of POLLWRNORM and POLLWRBAND.

This is already fixed upstream so manually apply the patch
until the next release.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
[Peter: add autobuilder ref and upstream link / s-o-b in patch description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/0006-m68k-fix-poll.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/musl/0006-m68k-fix-poll.patch b/package/musl/0006-m68k-fix-poll.patch
new file mode 100644
index 0000000000..cafee534e4
--- /dev/null
+++ b/package/musl/0006-m68k-fix-poll.patch
@@ -0,0 +1,26 @@
+From b09e3174a695d1db60b2abc442d29ed3f87f0358 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 7 Aug 2024 08:51:03 +0300
+Subject: m68k: fix POLLWRNORM and POLLWRBAND
+
+As noted in commit f5011c62c3 ("fix POLLWRNORM and POLLWRBAND on mips")
+m68k uses a different definition.
+
+Signed-off-by: Daniel Palmer <daniel@0x0f.com>
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=b09e3174a695d1db60b2abc442d29ed3f87f0358
+---
+ arch/m68k/bits/poll.h | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 arch/m68k/bits/poll.h
+
+diff --git a/arch/m68k/bits/poll.h b/arch/m68k/bits/poll.h
+new file mode 100644
+index 00000000..00063f41
+--- /dev/null
++++ b/arch/m68k/bits/poll.h
+@@ -0,0 +1,2 @@
++#define POLLWRNORM POLLOUT
++#define POLLWRBAND 256
+-- 
+cgit v1.2.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
