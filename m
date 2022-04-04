Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10565C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDC640204;
	Mon,  4 Apr 2022 19:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVBkjfZFCzDW; Mon,  4 Apr 2022 19:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9099401A3;
	Mon,  4 Apr 2022 19:35:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C90BC1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B716B401E7
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpxsvhf0sLcC for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:34:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0605A4016F
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:34:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 57E2C82195; Mon,  4 Apr 2022 19:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:33:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 371e42df5e3dfd87640f75f5505149e45ed28f78
X-Git-Newrev: e86a176c9bc9621fa51dd7ad080e89720f74f161
X-Patchwork-Hint: ignore
Message-Id: <20220404192529.57E2C82195@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libyang: disable
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=e86a176c9bc9621fa51dd7ad080e89720f74f161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable tests which are enabled by default in debug mode since bump to
version 2.0.0 in commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
https://github.com/CESNET/libyang/commit/e84f12fc5eccd67ed41e852fa0e23c030ae8acb0
as they will raise the following build failure if cmocka is built before
libyang:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
                 from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/src/libyang.h:18,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/utests.h:30,
                 from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/extensions/test_yangdata.c:15:
/home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
   53 | typedef unsigned _Addr uintptr_t;
      |                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7ae21fbb28b1a69183c5d8ed87cf5f5cbf055026

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ea6cc91be4db390f03c81539a9ae44979fd162ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libyang/libyang.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 832adcb627..a097b3ee95 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -15,9 +15,11 @@ LIBYANG_DEPENDENCIES = pcre2
 HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 HOST_LIBYANG_CONF_OPTS = \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
