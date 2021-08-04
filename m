Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942AEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:58:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D90761040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D90761040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DC683D23;
	Wed,  4 Aug 2021 20:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoYlS8fP6q4x; Wed,  4 Aug 2021 20:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA1B83D10;
	Wed,  4 Aug 2021 20:58:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F394A1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF444400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y398YmRFlxlm for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:57:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E08C7400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:57:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4FB88B7AA; Wed,  4 Aug 2021 20:57:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:55:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ff6b065041c3c5fbe8d1bad248b8cf67930f70c
X-Git-Newrev: 7122a484b248e20714a0852e341f10adba82e713
X-Patchwork-Hint: ignore
Message-Id: <20210804205747.D4FB88B7AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: fix build failure on
 Microblaze due to wrong symver attribute detection
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7122a484b248e20714a0852e341f10adba82e713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix symver wrong detection. As explained into the patch
pending upstream[1] __has attribute() gives false positive when an
attribute is not supported[2] and this leads to assuming symver attribute
is present but it's not. This consequentely leads to build failure. I.e.
Microblaze doesn't really support it since it doesn't include elfos.h in
config.gcc that determines symver to be available.

[1]: https://github.com/libfuse/libfuse/pull/620
[2]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766

Fixes:
http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1-meson.build-fix-wrong-.symver-detection.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
new file mode 100644
index 0000000000..da20c26f19
--- /dev/null
+++ b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
@@ -0,0 +1,61 @@
+From 3aba09a5c56e017746c5c1652dbc845f4db7374a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 3 Aug 2021 23:39:46 +0200
+Subject: [PATCH] meson.build: fix wrong .symver detection
+
+As pointed here [1] __has_attribute() is broken for many attributes and
+if it doesn't support the specific attribute it returns true, so we
+can't really rely on that for this check. This lead to Buildroot
+libfuse3 build failure [2] where that shows up with:
+```
+error: symver is only supported on ELF platforms
+```
+Indeed Microblaze doesn't support ELF since it doesn't include elfos.h,
+but __has_attribute(symver) returns true.
+
+So let's substitute the #ifdef __has_attribute() with a stronger test on
+a function foo() with __attribute__((symver ("test@TEST"))).
+
+[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+[2]: http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f/build-end.log
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b0250ee..a7281f3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -96,20 +96,18 @@ endif
+ # to have __has_attribute, then they are too old to support symver)
+ # other compilers might not have __has_attribute, but in those cases
+ # it is safe for this check to fail and for us to fallback to the old _asm_
+-# method for symver
++# method for symver. Anyway the attributes not supported by __has_attribute()
++# unfortunately return true giving a false positive. So let's try to build
++# using __attribute__ ((symver )) and see the result.
+ code = '''
+-#if defined __has_attribute
+-# if !__has_attribute (symver)
+-# error symver attribute not supported
+-# endif
+-#else
+-#error __has_attribute not defined, assume we do not have symver
+-#endif
++__attribute__ ((symver ("test@TEST")))
++void foo(void) {
++}
+ 
+ int main(void) {
+     return 0;
+ }'''
+-if cc.compiles(code, args: [ '-O0', '-c'])
++if cc.compiles(code, args: [ '-O0', '-c', '-Werror'])
+      message('Compiler supports symver attribute')
+      add_project_arguments('-DHAVE_SYMVER_ATTRIBUTE', language: 'c')
+ else
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
