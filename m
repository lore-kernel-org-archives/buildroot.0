Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA58C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C3540A47;
	Sun,  3 Dec 2023 22:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C3540A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHN-2Y61X7vK; Sun,  3 Dec 2023 22:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED0840A4C;
	Sun,  3 Dec 2023 22:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED0840A4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12A561BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E048641575
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E048641575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnuvxM0KiWer for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12BEF40951
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12BEF40951
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0301587934; Sun,  3 Dec 2023 22:24:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 22:31:04 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 55678b84a153456ac4c55bab38ae8eba88d70f9b
X-Git-Newrev: 2369c3b34ad9b31509907b01c44ff2013b6dee55
X-Patchwork-Hint: ignore
Message-Id: <20231203222432.0301587934@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libmemcached:
 link with -latomic when needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=2369c3b34ad9b31509907b01c44ff2013b6dee55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure raised since bump to version 1.1.4 in
commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/11.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: CMakeFiles/aslap.dir/ms_conn.c.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/c8e4e1f9609d1339fe070afe440c63660892600e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a73cbe68b2548308ff7590c4720ebf56f275a6ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index f64ab5ec48..f86cdd3bbf 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -32,4 +32,8 @@ else
 LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBMEMCACHED_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
