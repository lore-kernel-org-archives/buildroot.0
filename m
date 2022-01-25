Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30877C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCC24050F;
	Tue, 25 Jan 2022 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zDq9rL673un; Tue, 25 Jan 2022 21:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3765F40345;
	Tue, 25 Jan 2022 21:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4491BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A05481846
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTzZ-fpW3xWk for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:15:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3C79817C3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:15:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A504C825E2; Tue, 25 Jan 2022 21:08:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:10:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f9a1c621302c6cdf01dfff88f0343d7b03a6107
X-Git-Newrev: ee228403e9741b6c799ce1ef34c15993086f266d
X-Patchwork-Hint: ignore
Message-Id: <20220125210819.A504C825E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: use binutils wrappers for
 target libs
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee228403e9741b6c799ce1ef34c15993086f266d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
normal binutils tools. The difference is that with the
wrappers, gcc plugins will be automatically picked up,
which is necessary to build with LTO.

With this enabled, it is possible to build everything (including libgcc
and libstdc++) with LTO by setting BR2_TARGET_OPTIMIZATION="-flto".

Note that you'd expect that the GCC build system would automatically do
this when --enable-lto is set, but this is not the case. There are some
open bugs [1][2] to allow building libgcc and libstdc++ with LTO support
but it's apparently not done yet.

Note that there are also reports of problems building libstdc++ with LTO
[3], but it seems that's no longer a problem (and the bug didn't get
updated).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59893
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77278
[3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60160
---
 package/gcc/gcc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3adc1d4e16..128cf8421d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -104,6 +104,7 @@ endif
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
 
 # libitm needs sparc V9+
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
