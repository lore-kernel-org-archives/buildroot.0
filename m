Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B52C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A1F0409DB;
	Sun, 18 Sep 2022 13:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1F0409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnwTYiGbpaps; Sun, 18 Sep 2022 13:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D46D409B0;
	Sun, 18 Sep 2022 13:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D46D409B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E682A1BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1F2684089
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F2684089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqXUZ3fcidSk for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:30:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBAFE84080
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBAFE84080
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:30:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F18A4200002;
 Sun, 18 Sep 2022 13:30:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oZuNm-00DLPk-Ab; Sun, 18 Sep 2022 15:30:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 15:30:49 +0200
Message-Id: <20220918133049.3180533-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openssh: allow sandboxing to be
 disabled as workaround for seccomp issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in bug #14796, there are situations where the seccomp based
sandboxing in openssh can get confused, leading to connection issues.

As explained by Thomas in the bug report:

glibc does not care about the kernel headers when deciding whether to try
the clock_gettime64() syscall or not: it always use it, and if that fails at
runtime, it falls back to clock_gettime().  This is how glibc ends up using
clock_gettime64() even if your kernel does not support it.

On the other hand, the OpenSSL seccomp code relies on kernel headers to decide
whether the clock_gettime64() syscall should be in the allowed list of syscalls
or not.

So when you are in a situation where glibc is recent, but your kernel is
older, you get into precisely the problem you have: glibc tries to use
clock_gettime64, but OpenSSH seccomp configuration prevents that, which does
not allow glibc to gracefully fallback to clock_gettime (as seccomp is
configured to kill the process on filter violations).

As a workaround, add a _OPENSSH_SANDBOX option (defaulting to y) to decide
if sandboxing should be used or not.

Fixes (works around) #14796

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
index 63a28f3af5..9fab2c9038 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -24,6 +24,7 @@ OPENSSH_CPE_ID_VENDOR = openbsd
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
+	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
 	--disable-lastlog \
 	--disable-utmp \
 	--disable-utmpx \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
