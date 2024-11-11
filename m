Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6ECD2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49C780D2C;
	Mon, 11 Nov 2024 13:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6xrRHyb0XTn; Mon, 11 Nov 2024 13:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C638580D48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C638580D48;
	Mon, 11 Nov 2024 13:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0BAFDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCBA580D2C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsY1FnebPGGn for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA5680D3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA5680D3A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB1BB86017; Mon, 11 Nov 2024 13:36:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:04:25 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b39aef82bc2ef59319fb706c65a8b034f34bf3da
X-Git-Newrev: 05bf32e2aa02070868d45f0b3b9b6b76935af838
X-Patchwork-Hint: ignore
Message-Id: <20241111133628.EB1BB86017@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/iproute2: fix
 building error using designated initializers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=05bf32e2aa02070868d45f0b3b9b6b76935af838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

This patch fixes the following error:

arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  442 |                 NULL,   0,

The analysis of socket.h [1] containing the msghdr structure shows that
it has been modified with the addition of padding fields, which cause
the compilation error:

struct msghdr {
	void *msg_name;
	socklen_t msg_namelen;
	struct iovec *msg_iov;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
	int __pad1;
#endif
	int msg_iovlen;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
	int __pad1;
#endif
	void *msg_control;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
	int __pad2;
#endif
	socklen_t msg_controllen;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
	int __pad2;
#endif
	int msg_flags;
};

The use of designated initializers allows the issue to be fixed.

[1] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h

Fixes:
- http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 57d94b293b0b0826a17784d326c46f0bdc02f685)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...signated-initializers-for-msghdr-structur.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch b/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
new file mode 100644
index 0000000000..fbe89bac2a
--- /dev/null
+++ b/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
@@ -0,0 +1,63 @@
+From 32da5f26dee03600a9ca72a99016d95f05c4f1ec Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 28 Sep 2024 11:03:11 +0200
+Subject: [PATCH] arpd: use designated initializers for msghdr structure
+
+This patch fixes the following error:
+
+arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
+  442 |                 NULL,   0,
+
+raised by Buildroot autobuilder [1].
+
+In the case in question, the analysis of socket.h [2] containing the
+msghdr structure shows that it has been modified with the addition of
+padding fields, which cause the compilation error. The use of designated
+initializers allows the issue to be fixed.
+
+struct msghdr {
+	void *msg_name;
+	socklen_t msg_namelen;
+	struct iovec *msg_iov;
+	int __pad1;
+	int msg_iovlen;
+	int __pad1;
+	void *msg_control;
+	int __pad2;
+	socklen_t msg_controllen;
+	int __pad2;
+	int msg_flags;
+};
+
+[1] http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c/
+[2] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=9c9824bcaf092cb99988d59717674b73b5d0d19c
+---
+ misc/arpd.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/misc/arpd.c b/misc/arpd.c
+index 3185620f..983e546d 100644
+--- a/misc/arpd.c
++++ b/misc/arpd.c
+@@ -437,10 +437,10 @@ static void get_kern_msg(void)
+ 	struct iovec iov;
+ 	char   buf[8192];
+ 	struct msghdr msg = {
+-		(void *)&nladdr, sizeof(nladdr),
+-		&iov,	1,
+-		NULL,	0,
+-		0
++		.msg_name = &nladdr,
++		.msg_namelen = sizeof(nladdr),
++		.msg_iov = &iov,
++		.msg_iovlen = 1,
+ 	};
+ 
+ 	iov.iov_base = buf;
+-- 
+2.46.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
