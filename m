Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B674046A;
	Wed, 27 Apr 2022 19:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrxnKSPauB8Z; Wed, 27 Apr 2022 19:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D510E409DA;
	Wed, 27 Apr 2022 19:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 077641BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FCA80C7B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DR8YNhuuKLe for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA57E813FC
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2ED6384606; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 999edde7dfdf574d7a25ad6e69900b2e1f8ceb0b
X-Git-Newrev: 6af4292de79c9110b26fcedee192b27672ad7173
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.2ED6384606@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: don't rely on implicit
 GNU extensions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6af4292de79c9110b26fcedee192b27672ad7173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch so that we don't rely on implicit GNU extensions.

Fixes:
 - http://autobuild.buildroot.net/results/c22/c227166c2825ae4e884936fbe627f3997e0e19b7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ild-don-t-rely-on-implicit-GNU-extensions.patch | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
new file mode 100644
index 0000000000..fcafa98f46
--- /dev/null
+++ b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
@@ -0,0 +1,108 @@
+From 0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9 Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Mon, 10 Jan 2022 14:51:55 +0100
+Subject: [PATCH] build: don't rely on implicit GNU extensions
+
+Currently libwayland assumes GNU extensions will be available, but
+doesn't define the C standard to use. Instead, let's unconditionally
+enable POSIX extensions, and enable GNU extensions on a case-by-case
+basis as needed.
+
+Signed-off-by: Simon Ser <contact@emersion.fr>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9]
+---
+ cursor/xcursor.c        |  1 +
+ meson.build             | 10 ++++++++--
+ tests/display-test.c    |  1 +
+ tests/event-loop-test.c |  1 +
+ tests/fixed-test.c      |  1 +
+ 5 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/cursor/xcursor.c b/cursor/xcursor.c
+index 0506680..188be7c 100644
+--- a/cursor/xcursor.c
++++ b/cursor/xcursor.c
+@@ -23,6 +23,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include "xcursor.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/meson.build b/meson.build
+index 07bbd29..cab267e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -14,6 +14,12 @@ config_h = configuration_data()
+ config_h.set_quoted('PACKAGE', meson.project_name())
+ config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
+ 
++cc_args = []
++if host_machine.system() != 'freebsd'
++	cc_args += ['-D_POSIX_C_SOURCE=200809L']
++endif
++add_project_arguments(cc_args, language: 'c')
++
+ compiler_flags = [
+ 	'-Wno-unused-parameter',
+ 	'-Wstrict-prototypes',
+@@ -79,7 +85,7 @@ if get_option('libraries')
+ 	]
+ 
+ 	foreach d: decls
+-		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep)
++		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep, args: cc_args)
+ 			error('@0@ is needed to compile Wayland libraries'.format(d['symbol']))
+ 		endif
+ 	endforeach
+@@ -87,7 +93,7 @@ if get_option('libraries')
+ 	rt_dep = []
+ 	if not cc.has_function('clock_gettime', prefix: '#include <time.h>')
+ 		rt_dep = cc.find_library('rt')
+-		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep)
++		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep, args: cc_args)
+ 			error('clock_gettime not found')
+ 		endif
+ 	endif
+diff --git a/tests/display-test.c b/tests/display-test.c
+index 763adc9..a6f410d 100644
+--- a/tests/display-test.c
++++ b/tests/display-test.c
+@@ -24,6 +24,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
+index 9d43c91..a51ba8f 100644
+--- a/tests/event-loop-test.c
++++ b/tests/event-loop-test.c
+@@ -24,6 +24,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <assert.h>
+diff --git a/tests/fixed-test.c b/tests/fixed-test.c
+index 47a4dae..0b58797 100644
+--- a/tests/fixed-test.c
++++ b/tests/fixed-test.c
+@@ -23,6 +23,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <assert.h>
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
