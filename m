Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F32CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4721D413F3;
	Wed,  2 Oct 2024 21:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJcL4XNd-9qO; Wed,  2 Oct 2024 21:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F04413F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1F04413F6;
	Wed,  2 Oct 2024 21:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEE781BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BADB3413F6
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_4QWH0Vkavw for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E9540190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90E9540190
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887B084BCB; Wed,  2 Oct 2024 21:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:37:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 540a0a567a4d3f092bb5a2ff7f4fdd1042533c51
X-Git-Newrev: 295701f1ab56dbcd45f0d73e52f7c743a8984927
X-Patchwork-Hint: ignore
Message-Id: <20241002213835.887B084BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: fix build on big endian arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=295701f1ab56dbcd45f0d73e52f7c743a8984927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error happening on builds with
big endian architecture target and libflac enabled.

```
[ 75/243] Linking build/tests/test-pitchshift
/home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
collect2: error: ld returned 1 exit status

Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
Build failed
```

There is a missing definition of the `SWAPS` macro in
`/src/io/sink_flac.c` file.
This patch adds an out of tree patch that copy the `SWAPS` definition from the
`/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.

Fixes:
  - https://autobuild.buildroot.org/results/b88/b8895a81411dc7622b0aba9f2f0eaa0aef5a1a10/
  - https://autobuild.buildroot.org/results/bc7/bc733f5192b354cb960b6a4726efb597be4bb06c/
  - https://autobuild.buildroot.org/results/ea5/ea52dbcc14c2bab300277053f0b9599a8e82294a/
  - ...

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-sink_flac-missing-SWAPS-definition.patch  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch b/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch
new file mode 100644
index 0000000000..5f321b5363
--- /dev/null
+++ b/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch
@@ -0,0 +1,45 @@
+From aebf4fb23df2c4ec8857aef05a468991054a58c1 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Thu, 19 Sep 2024 18:57:16 +0200
+Subject: [PATCH] [sink_flac] missing SWAPS definition
+
+On big endian architecture with libflac enabled the following error
+would happen when cross-compiling aubio with buildroot.
+
+```
+[ 75/243] Linking build/tests/test-pitchshift
+/home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
+collect2: error: ld returned 1 exit status
+
+Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
+Build failed
+```
+
+Indeed there is a missing definition of the `SWAPS` macro in
+`/src/io/sink_flac.c` file.
+This commit copy the `SWAPS` definition from the
+`/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.
+
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+Upstream: https://github.com/aubio/aubio/pull/407
+---
+ src/io/sink_flac.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/io/sink_flac.c b/src/io/sink_flac.c
+index 04144793..0a1cbc26 100644
+--- a/src/io/sink_flac.c
++++ b/src/io/sink_flac.c
+@@ -36,6 +36,9 @@
+ 
+ #define MAX_WRITE_SIZE 4096
+ 
++// swap endian of a short
++#define SWAPS(x) ((x & 0xff) << 8) | ((x & 0xff00) >> 8)
++
+ // swap host to little endian
+ #if defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+ #define HTOLES(x) SWAPS(x)
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
