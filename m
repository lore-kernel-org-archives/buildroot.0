Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D55C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A297A80C2E;
	Thu, 10 Mar 2022 21:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BW_nGWjmk5bp; Thu, 10 Mar 2022 21:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB46980C22;
	Thu, 10 Mar 2022 21:03:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFAE91BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58A840B8B
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lW6uZ_15Ht87 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:03:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E60740B83
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:03:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 005D183BFF; Thu, 10 Mar 2022 20:54:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:02:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 046739df7ef1e704889a24a7e0886865dd32e0b9
X-Git-Newrev: 10c1d887d6082d8806b38b86097c212c4c3ec8f9
X-Patchwork-Hint: ignore
Message-Id: <20220310205500.005D183BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: add upstream patch to add
 seccomp ppoll_time64 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=10c1d887d6082d8806b38b86097c212c4c3ec8f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sshd is broken on 32-bit systems because ppoll_time64 is used by the
application although it is not allowed by the seccomp filter.

Apply the upstream patch to fix this.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-Allow-ppoll_time64-in-seccomp-sandbox.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
new file mode 100644
index 0000000000..16eb6eaba2
--- /dev/null
+++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
@@ -0,0 +1,32 @@
+From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Sat, 26 Feb 2022 14:06:14 +1100
+Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
+
+Should fix sandbox violations on (some? at least i386 and armhf) 32bit
+Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
+debian.org via bz#3396.
+
+[Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
+Signed-off-by: John Keeping <john@metanate.com>
+---
+ sandbox-seccomp-filter.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index 2e065ba3..4ce80cb2 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
+ #ifdef __NR_ppoll
+ 	SC_ALLOW(__NR_ppoll),
+ #endif
++#ifdef __NR_ppoll_time64
++	SC_ALLOW(__NR_ppoll_time64),
++#endif
+ #ifdef __NR_poll
+ 	SC_ALLOW(__NR_poll),
+ #endif
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
