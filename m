Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC96C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C964073C;
	Mon, 25 Mar 2024 18:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QD8NepXwoj7i; Mon, 25 Mar 2024 18:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1232A4073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1232A4073E;
	Mon, 25 Mar 2024 18:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F78C1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A4881E76
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbAidDakbj_U for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8474B81975
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8474B81975
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72CEE83F9D; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:07:25 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b0c6e9f3f6ca8f357a8ba11a9c6decf4a30984a1
X-Git-Newrev: 16960faf65fc7ef0b17b6eedc1e75d0ca38798c7
X-Patchwork-Hint: ignore
Message-Id: <20240325181656.72CEE83F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libunwind: fix
 libucontext handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=16960faf65fc7ef0b17b6eedc1e75d0ca38798c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 6ea2a27f9047696ce1c463ad55fb4a78df136954 forgot to add -lucontext
to LIBS resulting in the following build failure with zeromq:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libunwind.so.8: undefined reference to `setcontext'

Fixes: 6ea2a27f9047696ce1c463ad55fb4a78df136954
 - http://autobuild.buildroot.org/results/893defe1588b2ca03c115b59b47be3f4aed438fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 766c1613aed2fe10bee96b8b515f88bb6ee7a310)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 15c4e4863f..94e9bbd1b8 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -17,6 +17,7 @@ LIBUNWIND_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
 LIBUNWIND_DEPENDENCIES += libucontext
+LIBUNWIND_CONF_OPTS += LIBS=-lucontext
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
