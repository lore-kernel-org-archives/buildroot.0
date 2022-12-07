Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A44EC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E683A41894;
	Wed,  7 Dec 2022 15:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E683A41894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oxg_N68sLNx2; Wed,  7 Dec 2022 15:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F8F4189E;
	Wed,  7 Dec 2022 15:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F8F4189E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4A481BF955
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD164054B
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD164054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MoRHcsqOKvLB for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3C640101
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE3C640101
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC96F85E09; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 16:03:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 595749c38517a00fe99d68795d592e3340330cb2
X-Git-Newrev: b267a2241c3c3b4e782d0e96d5709eb17b897d24
X-Patchwork-Hint: ignore
Message-Id: <20221207150805.CC96F85E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/memcached: fix
 static with shared build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b267a2241c3c3b4e782d0e96d5709eb17b897d24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When BR2_SHARED_STATIC_LIBS is enabled, both --enable-static and
--enable-shared are passed to configure. memcached configure.ac only
looks for --enable-static to make the build static. But when linking
against openssl pkg-config only returns dynamic linking dependencies,
resulting in the following build failure:

/home/thomas/autobuild/instance-1/output-1/host/bin/aarch64_be-buildroot-linux-gnu-gcc -std=gnu99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2 -pthread  -Wall -pedantic -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls  -static  -o timedrun timedrun.o  -levent  -L/home/thomas/autobuild/instance-1/output-1/host/bin/../aarch64_be-buildroot-linux-gnu/sysroot/usr/lib -lssl -lcrypto  -ldl
/home/thomas/autobuild/instance-1/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/11.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld: memcached-memcached.o: in function `conn_new':
memcached.c:(.text+0x1668): undefined reference to `SSL_set_info_callback'

BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
static only build.

Fixes:
 - http://autobuild.buildroot.org/results/363c84eaa69350e02bec0b35b88d4bdf4dad804c
 - http://autobuild.buildroot.org/results/0bde41bb700100d8df5ebdb1b64dfdc76c7af475

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7ca04fcb42051c53ff146cb7566d9ddd95a3a71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memcached/memcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 1fcb8c2afa..e8c64cb192 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -29,4 +29,8 @@ else
 MEMCACHED_CONF_OPTS += --disable-tls
 endif
 
+ifeq ($(BR2_STATIC_LIBS),)
+MEMCACHED_CONF_OPTS += --disable-static
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
