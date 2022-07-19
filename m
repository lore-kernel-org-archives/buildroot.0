Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 836C240C66;
	Tue, 19 Jul 2022 16:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 836C240C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXqA9PPLlS4i; Tue, 19 Jul 2022 16:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA8840C69;
	Tue, 19 Jul 2022 16:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA8840C69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90DF01BF9B5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FFBF61198
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FFBF61198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnACjtYHyfdF for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:27:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9336D60C27
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9336D60C27
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83F1983DDE; Tue, 19 Jul 2022 16:13:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 18:26:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a1ccba72dddebe2d15945fdef3ff4831ee5b0a6f
X-Git-Newrev: a087851b4e5b5717ae96de637f333c9c8cded724
X-Patchwork-Hint: ignore
Message-Id: <20220719161348.83F1983DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/procrank_linux:
 fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a087851b4e5b5717ae96de637f333c9c8cded724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Pass TARGET_CFLAGS which will contain -static to fix the following
static build failure:

/home/buildroot/autobuild/instance-0/output-1/host/bin/sh4a-buildroot-linux-musl-gcc -Wall procrank.c -Ilibpagemap/include -Llibpagemap -lpagemap -o procrank
/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/buildroot/autobuild/instance-0/output-1/build/host-gcc-final-10.3.0/build/sh4a-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/8eccc34c99a75501179fe93a80646cc684261ff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 22b7fb8a8d86ae5ba9d247e919f94f400bc225f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procrank_linux/procrank_linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
index 7e743194fc..415a4e41b7 100644
--- a/package/procrank_linux/procrank_linux.mk
+++ b/package/procrank_linux/procrank_linux.mk
@@ -10,7 +10,8 @@ PROCRANK_LINUX_LICENSE = Apache-2.0
 PROCRANK_LINUX_LICENSE_FILES = NOTICE
 
 define PROCRANK_LINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
+		LOCAL_CFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define PROCRANK_LINUX_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
