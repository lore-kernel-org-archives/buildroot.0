Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197E7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8DE4826BF;
	Sun,  3 Apr 2022 20:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvdMzMBBm5wT; Sun,  3 Apr 2022 20:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E400D82422;
	Sun,  3 Apr 2022 20:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53B531BF995
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 403A860EB6
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrdCC8mTP3dj for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C1560E22
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1AD2F860FC; Sun,  3 Apr 2022 20:15:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 22:24:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58ab72bb8313aa9be90736c088fe04b199eeaea8
X-Git-Newrev: ea6cc91be4db390f03c81539a9ae44979fd162ea
X-Patchwork-Hint: ignore
Message-Id: <20220403201537.1AD2F860FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea6cc91be4db390f03c81539a9ae44979fd162ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
