Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF6C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED1C419E7;
	Thu, 29 Sep 2022 14:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED1C419E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE6b5j4K4oiZ; Thu, 29 Sep 2022 14:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6F0419DE;
	Thu, 29 Sep 2022 14:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB6F0419DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDC81BF3BF
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 14:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6903660BA9
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 14:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6903660BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQhtQL7NgobZ for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 14:26:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8452260B99
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 14:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8452260B99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74185864E7; Thu, 29 Sep 2022 14:26:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 16:04:42 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6221ad98b086d8b6b61247e733f78fce972eb709
X-Git-Newrev: 756edabfb5f17c3d0bdd15f022993da0d60ad6ab
X-Patchwork-Hint: ignore
Message-Id: <20220929142638.74185864E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/openssh: allow
 sandboxing to be disabled as workaround for seccomp issues
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
Content-Type: multipart/mixed; boundary="===============0175865784086148961=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0175865784086148961==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=756edabfb5f17c3d0bdd15f022993da0d60ad6ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

As explained in bug #14796, there are situations where the seccomp based
sandboxing in openssh can get confused, leading to connection issues.

As explained by Thomas in the bug report:

glibc does not care about the kernel headers when deciding whether to
try the clock_gettime64() syscall or not: it always use it, and if that
fails at runtime, it falls back to clock_gettime().  This is how glibc
ends up using clock_gettime64() even if your kernel does not support it.

On the other hand, the OpenSSL seccomp code relies on kernel headers to
decide whether the clock_gettime64() syscall should be in the allowed
list of syscalls or not.

So when you are in a situation where glibc is recent, but your kernel is
older, you get into precisely the problem you have: glibc tries to use
clock_gettime64, but OpenSSH seccomp configuration prevents that, which
does not allow glibc to gracefully fallback to clock_gettime (as seccomp
is configured to kill the process on filter violations).

As a workaround, add a _OPENSSH_SANDBOX option (defaulting to y) to
decide if sandboxing should be used or not.

--with-sandbox expects the type of sandboxing to use, and if not
specified, will use the first one available in a list: pledge, systrace,
darwin, seccomp, capsicum, rlimit. On Linux, only seccomp and rlimit are
available, and rlimit probably does not bring much security-wise, so in
all practical matters, on Linux, sandboxing uses seccomp or there is no
sandboxing, so let's just disable sandboxing when we do not want to use
seccomp, and let configure detect seccomp when we request sandboxing.

Fixes (works around) #14796

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: add § about sandboxing types]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f204766b8fd86e04ba0c1d42296ddd95a48bf147)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/Config.in  | 8 ++++++++
 package/openssh/openssh.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index cc5998742e..08d3c7d391 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -31,4 +31,12 @@ config BR2_PACKAGE_OPENSSH_KEY_UTILS
 	help
 	  Key utilities: ssh-keygen, ssh-keyscan.
 
+config BR2_PACKAGE_OPENSSH_SANDBOX
+	bool "use sandboxing"
+	default y
+	help
+	  Use sandboxing for extra privilege protection of processes.
+
+	  This is normally preferable, but may cause seccomp problems
+	  for certain combinations of C libraries and kernel versions.
 endif
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a8c32f3d33..0e4253fa74 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -21,6 +21,7 @@ OPENSSH_CPE_ID_VENDOR = openbsd
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
+	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
 	--disable-lastlog \
 	--disable-utmp \
 	--disable-utmpx \

--===============0175865784086148961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0175865784086148961==--
