Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3CCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95DC410C3;
	Wed, 13 Apr 2022 08:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8h003RlnSDZr; Wed, 13 Apr 2022 08:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33EC40A05;
	Wed, 13 Apr 2022 08:12:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B20DA1C113E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE64C401F1
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjdgELXmSbD1 for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE29F400C6
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 07DAB83C16; Wed, 13 Apr 2022 08:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:47:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 17440cadf9d5f0da60505d3ddaeb1ceefddead05
X-Git-Newrev: a4e542e88e4c49582a965521287283dfeba8809d
X-Patchwork-Hint: ignore
Message-Id: <20220413080257.07DAB83C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/postgresql: fix
 build without NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4e542e88e4c49582a965521287283dfeba8809d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without NPTL raised since bump to
version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
https://github.com/postgres/postgres/commit/44bf3d5083e151d772c5d6f656e3e162f573dced:

In file included from pthread_barrier_wait.c:16:
../../src/include/port/pg_pthread.h:31:3: error: conflicting types for 'pthread_barrier_t'
   31 | } pthread_barrier_t;
      |   ^~~~~~~~~~~~~~~~~
In file included from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:114,
                 from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
                 from ../../src/include/c.h:59,
                 from pthread_barrier_wait.c:14:
/home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/pthreadtypes.h:135:3: note: previous declaration of 'pthread_barrier_t' was here
  135 | } pthread_barrier_t;
      |   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/70acbe121236ef0905c4466d4f7a0839723d2c49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6bc346173514c1e1f3c373990c1f48260e66e1a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index c389246f80..1dfb20b58d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -38,7 +38,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
 endif
 
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
