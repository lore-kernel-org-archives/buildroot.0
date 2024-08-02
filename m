Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD52C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C5980CD5;
	Fri,  2 Aug 2024 17:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mQoV53iFSYw; Fri,  2 Aug 2024 17:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9756B80D96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9756B80D96;
	Fri,  2 Aug 2024 17:27:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4F2C1BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 900F880D96
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gI9X9FIk9zy for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF06A80CD5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF06A80CD5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:27:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A119C83B56; Fri,  2 Aug 2024 17:27:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 19:24:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86e51fd5fe2810bbf833b48c4914dcd2de01bdbe
X-Git-Newrev: 9880dba15c25ff8d1ca59a255a538b8fb881962c
X-Patchwork-Hint: ignore
Message-Id: <20240802172711.A119C83B56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=9880dba15c25ff8d1ca59a255a538b8fb881962c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since switch to
meson-package in commit 1fa58814c09a71444f961b61a9a2c399b9163fc2 which
wrongly removed -DCAIRO_NO_MUTEX=1:

In file included from ../src/cairo-mutex-type-private.h:45,
                 from ../src/cairo-scaled-font-private.h:45,
                 from ../src/cairoint.h:415,
                 from ../src/cairo-arc.c:37:
../src/cairo-mutex-impl-private.h:231:3: error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
  231 | # error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.  Define CAIRO_NO_MUTEX to 1 to acknowledge and accept this limitation and compile cairo without thread-safety support."
      |   ^~~~~

Note that prior to 1fa58814c09a71444f961b61a9a2c399b9163fc2, the
condition was:

 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif

but that was in fact wrong, because it meant that toolchain with
linuxthreads (not NPTL) would have thread support, but a thread-unsafe
cairo library. The condition was changed from
BR2_TOOLCHAIN_HAS_THREADS to BR2_TOOLCHAIN_HAS_THREADS_NPTL in an
older commit, 92f14307ba670058d0b3692fb8e82753d6ad6868, but now
cairo's mutex support builds fine with linuxthreads, so we can use
CAIRO_NO_MUTEX=1 only when thread support is not available at all.

Fixes: 1fa58814c09a71444f961b61a9a2c399b9163fc2

 - http://autobuild.buildroot.org/results/a123355b6d315d2fcda646d3f1c7b588cba78258

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cairo/cairo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4ace04ebbe..ba25620f8d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_m68k_cf),y)
 CAIRO_CFLAGS += -mxgot
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+CAIRO_CFLAGS += -DCAIRO_NO_MUTEX=1
+endif
+
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
