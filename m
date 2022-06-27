Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3454BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA171408C9;
	Mon, 27 Jun 2022 22:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA171408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuTniGmDkrmo; Mon, 27 Jun 2022 22:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A9F140500;
	Mon, 27 Jun 2022 22:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A9F140500
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 576381BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32835410E7
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32835410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEfI1WvrSuma for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C300410E3
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C300410E3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6B3B87673; Mon, 27 Jun 2022 21:57:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:09:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 381a1af2dd63ffb9390c9747d5843846929a2dbb
X-Git-Newrev: 41d60d016461d90deeaacd31e1f66c6333fcca06
X-Patchwork-Hint: ignore
Message-Id: <20220627215733.C6B3B87673@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bdwgc: fix build without NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=41d60d016461d90deeaacd31e1f66c6333fcca06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following guile build failure without NPTL raised since the
addition of bdwgc in commit b0476427f6c0036b7803d591a5394923c4b07142 and
https://github.com/ivmai/bdwgc/commit/7896408d4149347588ed0e36319b53bcea70115b:

configure:60776: checking for GC_is_heap_ptr
configure:60776: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu11 -o conftest  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0  -DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND -flto -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -latomic_ops -lgc -lpthread -ldl  -latomic -lm >&5
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgc.so: undefined reference to `pthread_getattr_np'

[...]

In file included from ../libguile/alist.h:26,
                 from ../libguile.h:31,
                 from guile.c:38:
../libguile/pairs.h:205:1: error: conflicting types for 'GC_is_heap_ptr'
  205 | GC_is_heap_ptr (void *ptr)
      | ^~~~~~~~~~~~~~
In file included from ../libguile/bdw-gc.h:48,
                 from ../libguile/gc.h:142,
                 from ../libguile/pairs.h:26,
                 from ../libguile/alist.h:26,
                 from ../libguile.h:31,
                 from guile.c:38:
/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gc/gc.h:551:20: note: previous declaration of 'GC_is_heap_ptr' was here
  551 | GC_API int GC_CALL GC_is_heap_ptr(const void *);
      |                    ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/819f231a60fc81f9a8dd07bf5411aa9d8f78c3bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bdwgc/bdwgc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index d1c9d4dfdc..cefa975998 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -21,6 +21,9 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 BDWGC_CFLAGS_EXTRA += -DGC_NO_DLOPEN
 endif
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+BDWGC_CFLAGS_EXTRA += -DNO_PTHREAD_GETATTR_NP
+endif
 
 # Ensure we use the system libatomic_ops, and not the internal one.
 BDWGC_CONF_OPTS += --with-libatomic-ops=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
