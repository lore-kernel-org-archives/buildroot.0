Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2C6E7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2DB80EDD;
	Sat,  7 Dec 2024 13:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGhAjS7gLD8K; Sat,  7 Dec 2024 13:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B9CA80EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9CA80EE1;
	Sat,  7 Dec 2024 13:55:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6B96ED7
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4266402D1
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWcezeGN6AgQ for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 13:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E858402C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E858402C2
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 13:55:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56F0886A49; Sat,  7 Dec 2024 13:55:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 14:51:43 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 6c47fca27ebc2249dc10f29a195b8a66c316aa79
X-Git-Newrev: 49568ff31adf5149455db70972123c1faa06cf4e
X-Patchwork-Hint: ignore
Message-Id: <20241207135542.56F0886A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/bluez-alsa: Fix
 compilation with GCC 14 on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=49568ff31adf5149455db70972123c1faa06cf4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

bluez-alsa 4.1.1 uses the glibc basename() function, which is not
available on musl.  On GCC < 14, it would probably compile with a
warning, but GCC 14 now rejects this.

Backport an upstream fix to switch to the posix basename() on musl.

Fixes: https://autobuild.buildroot.org/results/8ada292393185328677b58a69c9e370c3118880f
Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-compilation-on-strict-POSIX-platforms.patch | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch b/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch
new file mode 100644
index 0000000000..b1c8bfaab0
--- /dev/null
+++ b/package/bluez-alsa/0001-Fix-compilation-on-strict-POSIX-platforms.patch
@@ -0,0 +1,90 @@
+From ef85a335ad8919930f62d80ae99a74a5e766fc3b Mon Sep 17 00:00:00 2001
+From: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
+Date: Sun, 25 Aug 2024 08:42:39 +0200
+Subject: [PATCH] Fix compilation on strict POSIX platforms
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Upstream: https://github.com/arkq/bluez-alsa/commit/070ed35ac5cef8138ed4
+---
+ src/main.c            | 2 +-
+ test/mock/mock.c      | 2 +-
+ utils/aplay/aplay.c   | 1 +
+ utils/cli/cli.c       | 1 +
+ utils/rfcomm/rfcomm.c | 1 +
+ 5 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index e93cb33..597ac01 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -13,12 +13,12 @@
+ #endif
+ 
+ #include <getopt.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <strings.h>
+ #include <time.h>
+ 
+diff --git a/test/mock/mock.c b/test/mock/mock.c
+index 83a8ab5..b5bcedd 100644
+--- a/test/mock/mock.c
++++ b/test/mock/mock.c
+@@ -16,12 +16,12 @@
+ #include <assert.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <signal.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <strings.h>
+ #include <sys/stat.h>
+ 
+diff --git a/utils/aplay/aplay.c b/utils/aplay/aplay.c
+index 999d1ef..49b0d65 100644
+--- a/utils/aplay/aplay.c
++++ b/utils/aplay/aplay.c
+@@ -15,6 +15,7 @@
+ #include <assert.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <math.h>
+ #include <poll.h>
+ #include <pthread.h>
+diff --git a/utils/cli/cli.c b/utils/cli/cli.c
+index d480ef1..299c44c 100644
+--- a/utils/cli/cli.c
++++ b/utils/cli/cli.c
+@@ -13,6 +13,7 @@
+ #endif
+ 
+ #include <getopt.h>
++#include <libgen.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/utils/rfcomm/rfcomm.c b/utils/rfcomm/rfcomm.c
+index 9eba57f..20c1214 100644
+--- a/utils/rfcomm/rfcomm.c
++++ b/utils/rfcomm/rfcomm.c
+@@ -15,6 +15,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <poll.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
