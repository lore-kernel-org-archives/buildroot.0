Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E607DD3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E96140554;
	Sat, 19 Oct 2024 20:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3DLZu6J4vyw; Sat, 19 Oct 2024 20:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65F44054C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65F44054C;
	Sat, 19 Oct 2024 20:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA1C3A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490D74051E
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aytuh92oXmSQ for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E913C40507
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E913C40507
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4AF686086; Sat, 19 Oct 2024 20:16:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 21:53:39 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: de77e894a688f8f5bbfdb92f06504d1cef8db1fa
X-Git-Newrev: e64dc2d46ad2de156b7ce34beb1c03fc8a1d4319
X-Patchwork-Hint: ignore
Message-Id: <20241019201636.D4AF686086@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/aubio: fix build
 on big endian arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e64dc2d46ad2de156b7ce34beb1c03fc8a1d4319
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
(cherry picked from commit 295701f1ab56dbcd45f0d73e52f7c743a8984927)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
