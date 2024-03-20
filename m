Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD53C54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D373780CCE;
	Wed, 20 Mar 2024 20:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmSzgAy784ke; Wed, 20 Mar 2024 20:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB998130A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB998130A;
	Wed, 20 Mar 2024 20:33:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8422A1BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714674025A
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0R17KBp7ngGq for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6032E400E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6032E400E0
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:33:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596E4836E6; Wed, 20 Mar 2024 20:33:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 21:31:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d8e92e318c39b9d838ca607a3213c7ed1f69bc0
X-Git-Newrev: 752ab5a9e635f4c039c031ed00381356b60f4398
X-Patchwork-Hint: ignore
Message-Id: <20240320203347.596E4836E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mraa: fix build with musl >= 1.2.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=752ab5a9e635f4c039c031ed00381356b60f4398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with musl >= 1.2.5 (raised since commit
f7f03445cf320adbbc41270a806b38c911d3454a):

/home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c: In function 'mraa_count_iio_devices':
/home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c:341:38: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
  341 |     if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
      |                                      ^~~~~~~~
      |                                      rename

Fixes: f7f03445cf320adbbc41270a806b38c911d3454a
 - http://autobuild.buildroot.org/results/1f16df70e49a9f8823a791c0fcc677de07136835

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mraa/0002-mraa-Use-posix-basename.patch | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/mraa/0002-mraa-Use-posix-basename.patch b/package/mraa/0002-mraa-Use-posix-basename.patch
new file mode 100644
index 0000000000..3c5c99f031
--- /dev/null
+++ b/package/mraa/0002-mraa-Use-posix-basename.patch
@@ -0,0 +1,45 @@
+From 47c3850cddd63cebd9dc48e411963314449118f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Dec 2023 19:16:35 -0800
+Subject: [PATCH] mraa: Use posix basename
+
+Musl has removed the declaration from string.h [1] which exposes the
+problem especially with clang-17+ compiler where implicit function
+declaration is flagged as error. Use posix basename and make a copy of
+string to operate on to emulate GNU basename behaviour.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/eclipse/mraa/commit/47c3850cddd63cebd9dc48e411963314449118f1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mraa.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/mraa.c b/src/mraa.c
+index 653ea1fa7..b556d0455 100644
+--- a/src/mraa.c
++++ b/src/mraa.c
+@@ -12,6 +12,7 @@
+ #endif
+ 
+ #include <dlfcn.h>
++#include <libgen.h>
+ #include <pwd.h>
+ #include <sched.h>
+ #include <stddef.h>
+@@ -341,9 +342,11 @@ static int
+ mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
+ {
+     // we are only interested in files with specific names
+-    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
++    char* tmp = strdup(path);
++    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
+         num_iio_devices++;
+     }
++    free(tmp);
+     return 0;
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
