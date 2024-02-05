Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295F6C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6FA40162;
	Mon,  5 Feb 2024 17:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6FA40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xZXMa17FLoq; Mon,  5 Feb 2024 17:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DE114018B;
	Mon,  5 Feb 2024 17:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE114018B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96E001BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7062A60B23
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7062A60B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNtwJzrYFYBO for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:56:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F7E60AE6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77F7E60AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D5086DAD; Mon,  5 Feb 2024 17:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:51:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14c0c37eaf0f91ef61a88b3085c15028f566a394
X-Git-Newrev: 325fe1aecfd20d2653cce6bc189824c6fdfcafec
X-Patchwork-Hint: ignore
Message-Id: <20240205175616.58D5086DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build error on powerpc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5056336251849721521=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5056336251849721521==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=325fe1aecfd20d2653cce6bc189824c6fdfcafec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error message introducted by OpenSSH v9.6p1.

  sshkey.c: In function 'sshkey_set_filename':
  sshkey.c:3705:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
   3705 | }

Fixes:
http://autobuild.buildroot.org/results/ec7/ec780aed5b1c4fdf9b91f6e7be99e8d4c42efa58

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-detection-of-broken-fzero-call-used-regs.patch | 57 ++++++++++++++++++++++
 package/openssh/openssh.mk                         |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch b/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
new file mode 100644
index 0000000000..5c056033a9
--- /dev/null
+++ b/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
@@ -0,0 +1,57 @@
+From 1036d77b34a5fa15e56f516b81b9928006848cbd Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Fri, 22 Dec 2023 17:56:26 +1100
+Subject: [PATCH] better detection of broken -fzero-call-used-regs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc 13.2.0 on ppc64le refuses to compile some function, including
+cipher.c:compression_alg_list() with an error:
+
+> sorry, unimplemented: argument ‘used’ is not supportedcw
+> for ‘-fzero-call-used-regs’ on this target
+
+This extends the autoconf will-it-work test with a similarly-
+structured function that seems to catch this.
+
+Spotted/tested by Colin Watson; bz3645
+
+Upstream: https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b81b9928006848cbd.patch
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ m4/openssh.m4 | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/m4/openssh.m4 b/m4/openssh.m4
+index 5d4c56280fc..033df501c3d 100644
+--- a/m4/openssh.m4
++++ b/m4/openssh.m4
+@@ -20,18 +20,24 @@ char *f2(char *s, ...) {
+ 	va_end(args);
+ 	return strdup(ret);
+ }
++const char *f3(int s) {
++	return s ? "good" : "gooder";
++}
+ int main(int argc, char **argv) {
+-	(void)argv;
+ 	char b[256], *cp;
++	const char *s;
+ 	/* Some math to catch -ftrapv problems in the toolchain */
+ 	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
+ 	float l = i * 2.1;
+ 	double m = l / 0.5;
+ 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
++	(void)argv;
+ 	f(1);
+-	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
++	s = f3(f(2));
++	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
+ 	if (write(1, b, 0) == -1) exit(0);
+-	cp = f2("%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
++	cp = f2("%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
++	if (write(1, cp, 0) == -1) exit(0);
+ 	free(cp);
+ 	/*
+ 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ec9e6613b0..ef530cc850 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
+# 0001-better-detection-of-broken-fzero-call-used-regs.patch
+OPENSSH_AUTORECONF = YES
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \

--===============5056336251849721521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5056336251849721521==--
