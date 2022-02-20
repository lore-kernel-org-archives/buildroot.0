Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A372EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 480AA80CE3;
	Sun, 20 Feb 2022 19:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9Wpategv04A; Sun, 20 Feb 2022 19:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CCBA80C8C;
	Sun, 20 Feb 2022 19:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19C251BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 136D8404B7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-3UB011hbmn for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E923404B2
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:18:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BA59827FE; Sun, 20 Feb 2022 19:11:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 20:15:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 324f0552526d169c24cd75e9dadf67641f2beef0
X-Git-Newrev: 20c5569f9c2415364a1d873bc5089dc0ff0f8a35
X-Patchwork-Hint: ignore
Message-Id: <20220220191100.9BA59827FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=20c5569f9c2415364a1d873bc5089dc0ff0f8a35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: src/backtrace.o: in function `print_backtrace':
backtrace.c:(.text+0x37): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/74da4f4deab5f0ae9405d063ad52a5d4904a964d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 61851bd2dc..1b6fd611f5 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -109,4 +109,9 @@ else
 CONNMAN_CONF_OPTS += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+CONNMAN_DEPENDENCIES += libexecinfo
+CONNMAN_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
