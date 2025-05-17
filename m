Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8CFC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDD260D58;
	Sat, 17 May 2025 10:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zouu3ZDs0F0b; Sat, 17 May 2025 10:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA5960C2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA5960C2A;
	Sat, 17 May 2025 10:37:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DC71DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2A3E40409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqjRtPpb3KlX for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C96840529
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C96840529
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:37:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA60A86E7A; Sat, 17 May 2025 10:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bae9b29cd2a6008c5945747a45dfe8af54fae35
X-Git-Newrev: d0fe20e891a8ac2bd724c3359e1e7c0cf9a96553
X-Patchwork-Hint: ignore
Message-Id: <20250517103756.EA60A86E7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: fix build failure with
 no NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0fe20e891a8ac2bd724c3359e1e7c0cf9a96553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of libfuse3 from 3.16.2 to 3.17.1 in Buildroot commit
a4430578aeb6ca460813f4ff7d833cdd839a3249, libfuse3 uses
pthread_setname_np() which is only available with NPTL.

Some initial fixes were made upstream, but are insufficient to fully
fix the problem, so this commit brings additional upstream patches
fixing the issue completely.

Fixes:

  https://autobuild.buildroot.net/results/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libfuse3/0001-Fix-meson-function-tests.patch   | 121 +++++++++++++++++++++
 ...ld-make-special_funcs-check-more-reliable.patch |  41 +++++++
 2 files changed, 162 insertions(+)

diff --git a/package/libfuse3/0001-Fix-meson-function-tests.patch b/package/libfuse3/0001-Fix-meson-function-tests.patch
new file mode 100644
index 0000000000..7af9721337
--- /dev/null
+++ b/package/libfuse3/0001-Fix-meson-function-tests.patch
@@ -0,0 +1,121 @@
+From 4840ffe9e8610934d91b27061ff149cc74b41c28 Mon Sep 17 00:00:00 2001
+From: Bernd Schubert <bschubert@ddn.com>
+Date: Thu, 24 Apr 2025 16:49:08 +0200
+Subject: [PATCH] Fix meson function tests
+
+Several meson tests were incorrectly failing
+
+Checking for function "static_assert" : NO (cached)
+Checking for function "pthread_setname_np" : NO (cached)
+Check usable header "#include <linux/close_range.h>" : NO (cached)
+
+These functions get now tested with compilation tests
+and get found on my system.
+
+Checking if "static_assert check" compiles: YES
+Checking if "pthread_setname_np check" compiles: YES
+Checking if "close_range check" compiles: YES
+
+Upstream: https://github.com/libfuse/libfuse/commit/82bcd818fb3e7d5ced9b0c04b7b7a98a892e807e
+Signed-off-by: Bernd Schubert <bschubert@ddn.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 67 +++++++++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 49 insertions(+), 18 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ba551ed..d1346d0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -59,6 +59,8 @@ include_default = '''
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <assert.h>     /* For static_assert */
++#include <pthread.h>    /* For pthread_setname_np */
+ '''
+ args_default = [ '-D_GNU_SOURCE' ]
+ 
+@@ -72,32 +74,61 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
+ # Test for presence of some functions
+ test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
+                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
+-               'utimensat', 'copy_file_range', 'fallocate', 'static_assert',
+-               'pthread_setname_np' ]
++               'utimensat', 'copy_file_range', 'fallocate' ]
+ foreach func : test_funcs
+     private_cfg.set('HAVE_' + func.to_upper(),
+         cc.has_function(func, prefix: include_default, args: args_default))
+ endforeach
+-private_cfg.set('HAVE_SETXATTR', 
+-        cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
+-private_cfg.set('HAVE_ICONV', 
+-        cc.has_function('iconv', prefix: '#include <iconv.h>'))
+-private_cfg.set('HAVE_BACKTRACE',
+-        cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
+ 
+-# Test if headers exist
+-private_cfg.set('HAVE_LINUX_CLOSE_RANGE_H',
+-        cc.check_header('#include <linux/close_range.h>'))
++# Special case checks that need custom code
++special_funcs = {
++    'static_assert': '''
++        #include <assert.h>
++        static_assert(1, "test");
++        int main(void) { return 0; }
++    ''',
++    'pthread_setname_np': '''
++        #include <pthread.h>
++        int main(void) {
++            pthread_t thread = pthread_self();
++            pthread_setname_np(thread, "test");
++            return 0;
++        }
++    ''',
++    'close_range': '''
++        #include <unistd.h>
++        #include <fcntl.h>
++        #include <linux/close_range.h>
++        int main(void) {
++            unsigned int flags = CLOSE_RANGE_UNSHARE;
++            return close_range(3, ~0U, flags);
++        }
++    '''
++}
++
++foreach name, code : special_funcs
++    private_cfg.set('HAVE_' + name.to_upper(),
++        cc.compiles(code, args: ['-Werror'] + args_default,
++                 name: name + ' check'))
++endforeach
++
++# Regular function checks
++private_cfg.set('HAVE_SETXATTR',
++    cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
++private_cfg.set('HAVE_ICONV',
++    cc.has_function('iconv', prefix: '#include <iconv.h>'))
++private_cfg.set('HAVE_BACKTRACE',
++    cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
+ 
+-# Test if structs have specific member
++# Struct member checks
+ private_cfg.set('HAVE_STRUCT_STAT_ST_ATIM',
+-         cc.has_member('struct stat', 'st_atim',
+-                       prefix: include_default,
+-                       args: args_default))
++    cc.has_member('struct stat', 'st_atim',
++                  prefix: include_default + '#include <sys/stat.h>',
++                  args: args_default))
+ private_cfg.set('HAVE_STRUCT_STAT_ST_ATIMESPEC',
+-         cc.has_member('struct stat', 'st_atimespec',
+-                       prefix: include_default,
+-                       args: args_default))
++    cc.has_member('struct stat', 'st_atimespec',
++                  prefix: include_default + '#include <sys/stat.h>',
++                  args: args_default))
+ 
+ #
+ # Compiler configuration
+-- 
+2.39.5
+
diff --git a/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch b/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
new file mode 100644
index 0000000000..dccaf52326
--- /dev/null
+++ b/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
@@ -0,0 +1,41 @@
+From 6f50c950d09ad09339437b81ce22b36e0e2749c9 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 25 Apr 2025 19:00:14 +0200
+Subject: [PATCH] meson.build: make special_funcs check more reliable
+
+Unfortunately while cross-compiling with build tools like Buildroot it
+happens to have repeated flags or anything that could lead to a warning.
+This way the check fails because of a warning not related to the special
+function. So let's use cc.links() and increase minimum meson_version to
+0.60 since cc.links() has been added during that version.
+
+Upstream: https://github.com/libfuse/libfuse/commit/8e226c6af6f386a88ed53d0a0940ff6b869b372d
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d1346d0..d3d236d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,6 +1,6 @@
+ project('libfuse3', ['c'],
+         version: '3.17.2',
+-        meson_version: '>= 0.51.0',
++        meson_version: '>= 0.60.0',
+         default_options: [
+             'buildtype=debugoptimized',
+             'c_std=gnu11',
+@@ -108,7 +108,7 @@ special_funcs = {
+ 
+ foreach name, code : special_funcs
+     private_cfg.set('HAVE_' + name.to_upper(),
+-        cc.compiles(code, args: ['-Werror'] + args_default,
++        cc.links(code, args: args_default,
+                  name: name + ' check'))
+ endforeach
+ 
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
