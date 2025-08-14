Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B67CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E6880DB7;
	Thu, 14 Aug 2025 20:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hItagWGDQ5Gg; Thu, 14 Aug 2025 20:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A2080E40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A2080E40;
	Thu, 14 Aug 2025 20:06:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FEB228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADF2480D0F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0j1fRU0xX2L for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE3580C93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEE3580C93
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED35E8758C; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:01 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a3bbfe3b089feb420aa14a5a4216a152ce4254fe
X-Git-Newrev: b52125245ef2758b2615cc4742a72c3e0b1bffdd
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.ED35E8758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/snooze: fix build
 w/ uclibc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3857853469860223860=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3857853469860223860==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b52125245ef2758b2615cc4742a72c3e0b1bffdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The following error occur on the autobuilder for static build using
buildroot toolchain and uclibc:

```
/usr/bin/make -j17 -C /home/buildroot/instance-0/output-1/build/snooze-0.5/ PREFIX=/usr CC=/home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static"
make[1]: Entering directory '/home/buildroot/instance-0/output-1/build/snooze-0.5'
/home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static    snooze.c   -o snooze
snooze.c:22:10: fatal error: sys/auxv.h: No such file or directory
   22 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~
compilation terminated.
make[1]: *** [<builtin>: snooze] Error 1
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_STATIC_LIBS=y
BR2_PACKAGE_SNOOZE=y
EOF
make olddefconfig
make snooze
```

The error doesn't occur on external toolchains.

The `#include <sys/auxv.h>` was orinally included in the initial commit
(see [1]) to use the `getauxval` function declaration. This function
usage has since been removed in commit [2].

This patch removes the include that is no longer needed.

[1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
[2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe

Fixes: https://autobuild.buildroot.org/results/aec/aec463f87094a47ee059113f08e8ee3604dcea9b
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: J. Neuschäfer <j.ne@posteo.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit a00151af54382bd4da22ac7e9a5e40b614dcbdb6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../snooze/0002-snooze-remove-unused-include.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/snooze/0002-snooze-remove-unused-include.patch b/package/snooze/0002-snooze-remove-unused-include.patch
new file mode 100644
index 0000000000..fba92cd6b5
--- /dev/null
+++ b/package/snooze/0002-snooze-remove-unused-include.patch
@@ -0,0 +1,36 @@
+From 2eebd33c10d5a0f1a9831e3e49215857ab41ec03 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <perale.thomas@gmail.com>
+Date: Sat, 2 Aug 2025 23:09:31 +0200
+Subject: [PATCH] snooze: remove unused include
+
+The `#include <sys/auxv.h>` was orinally included in the initial commit
+(see [1]) to use the `getauxval` function declaration.
+
+This function usage has since been removed in commit [2].
+
+This commit removes the include that is no longer needed.
+
+[1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
+[2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe
+
+Upstream: https://github.com/leahneukirchen/snooze/pull/24
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ snooze.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/snooze.c b/snooze.c
+index e47ad11..11925ca 100644
+--- a/snooze.c
++++ b/snooze.c
+@@ -18,10 +18,6 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-#ifdef __linux__
+-#include <sys/auxv.h>
+-#endif
+-
+ static long slack = 60;
+ #define SLEEP_PHASE 300
+ static int nflag, vflag;

--===============3857853469860223860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3857853469860223860==--
