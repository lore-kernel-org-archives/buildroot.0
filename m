Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7CCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF7A41418;
	Mon, 17 Nov 2025 21:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSddP0QlGlxe; Mon, 17 Nov 2025 21:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1FC64141C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FC64141C;
	Mon, 17 Nov 2025 21:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FE4158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6298860EA4
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEuspTPP25aT for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A66D260C0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A66D260C0D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ED7484BCB; Mon, 17 Nov 2025 21:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:28:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea9d7398caf1dc1e6ee102d1b9af5d396f2432df
X-Git-Newrev: 855cd605732331c5231e10b11ab2d246154c7e9f
X-Patchwork-Hint: ignore
Message-Id: <20251117213029.8ED7484BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/distribution-registry: fix build
 on i386
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=855cd605732331c5231e10b11ab2d246154c7e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The S3 storage drivers defines the maximum size of a chunk to a value
thqt does not fit in the native integer on 32-bit architectures. This
causes build failures:

    registry/storage/driver/s3-aws/s3.go:312:99: cannot use maxChunkSize
    (untyped int constant 5368709120) as int value in argument to
    getParameterAsInteger (overflows)

Ideally, we'd like to use a build tag that refers to whether the
architecture is 32- or 64-bit, but there is no such flag. Sigh...

Instead, backport a patch from upstream that papers over the issue, by
using the i386 build tag (of course, that still misses other 32-bit
archs, but are they really relevant in this case?).

Fixes:
https://autobuild.buildroot.org/results/8fa9c5f63f690b27336051be5178f0516e0c54d4/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Julien: add "Fixes:" link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-s3-aws-fix-build-for-386.patch            | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
new file mode 100644
index 0000000000..a725ab8e92
--- /dev/null
+++ b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
@@ -0,0 +1,45 @@
+From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 29 May 2025 11:28:38 +0800
+Subject: [PATCH] s3-aws: fix build for 386
+
+When building for 386, we got the following build error:
+
+  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
+  maxChunkSize (untyped int constant 5368709120) as int value
+  in argument to getParameterAsInteger (overflows)
+
+This is because the s3_64bit.go is used. Adjust the build tag matching
+in s3_32bit.go and s3_64bit.go to fix this issue.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
+ registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
+index 218e3eab..84161fcb 100644
+--- a/registry/storage/driver/s3-aws/s3_32bit.go
++++ b/registry/storage/driver/s3-aws/s3_32bit.go
+@@ -1,4 +1,4 @@
+-//go:build arm
++//go:build arm || 386
+ 
+ package s3
+ 
+diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
+index 55254e49..2ed1f92f 100644
+--- a/registry/storage/driver/s3-aws/s3_64bit.go
++++ b/registry/storage/driver/s3-aws/s3_64bit.go
+@@ -1,4 +1,4 @@
+-//go:build !arm
++//go:build !arm && !386
+ 
+ package s3
+ 
+-- 
+2.51.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
