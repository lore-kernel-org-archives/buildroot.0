Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B861C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EDE68434E;
	Fri, 21 Jun 2024 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbH-e68EBjgv; Fri, 21 Jun 2024 21:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E0484345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E0484345;
	Fri, 21 Jun 2024 21:12:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 133581BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62DF884326
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cokov0qb22IA for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7766F8432E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7766F8432E
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68349813BC; Fri, 21 Jun 2024 21:12:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:11:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa7607026f3fab04836a2e0deb6de9f467a9cd5a
X-Git-Newrev: 4aff617b9591dc46d965eaa00f9701943e0cd723
X-Patchwork-Hint: ignore
Message-Id: <20240621211230.68349813BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build failure with
 gcc 11.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7995216168143898841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7995216168143898841==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4aff617b9591dc46d965eaa00f9701943e0cd723
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch fix the following build failure:

output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g0  -pipe -Wno-error=format-truncation -Wall -Wextra -Wpointer-arith
-Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign
-Wno-unused-parameter -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation
-fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=used -fno-builtin-memset
-fstack-protector-strong   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE
-DHAVE_CONFIG_H -c port-aix.c
sha2.c: In function ‘SHA256Init’:
sha2.c:360:1: sorry, unimplemented: ‘-fzero-call-used-regs’ not supported on this target
  360 | }
      | ^
make[3]: *** [Makefile:106: sha2.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [Makefile:199: openbsd-compat/libopenbsd-compat.a] Error 2

This commit applies an upstream patch that improves the detection of
-fzero-call-used-regs=used.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...ve-detection-of-fzero-call-used-regs-used.patch | 32 ++++++++++++++++++++++
 package/openssh/openssh.mk                         |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch b/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
new file mode 100644
index 0000000000..1b91b15a79
--- /dev/null
+++ b/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
@@ -0,0 +1,32 @@
+From f9193f03db0029fc9c31fbdb5c66a2737446bd8f Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Mon, 25 Mar 2024 09:28:02 +1100
+Subject: [PATCH] Improve detection of -fzero-call-used-regs=used.
+
+Should better detect problems with gcc 13 on m68k.  bz#3673 from Colin
+Watson via bz#3673 and https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
+
+Signed-off-by: Darren Tucker <dtucker@dtucker.net>
+Upstream: https://github.com/openssh/openssh-portable/commit/f9193f03db0029fc9c31fbdb5c66a2737446bd8f
+---
+ m4/openssh.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/m4/openssh.m4 b/m4/openssh.m4
+index 033df501c3d8..176a8d1c9282 100644
+--- a/m4/openssh.m4
++++ b/m4/openssh.m4
+@@ -20,7 +20,10 @@ char *f2(char *s, ...) {
+ 	va_end(args);
+ 	return strdup(ret);
+ }
++int i;
++double d;
+ const char *f3(int s) {
++	i = (int)d;
+ 	return s ? "good" : "gooder";
+ }
+ int main(int argc, char **argv) {
+-- 
+2.43.0
+
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d7f4db59ca..5a568d5fd1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
+# 0001-Improve-detection-of-fzero-call-used-regs-used.patch
+OPENSSH_AUTORECONF = YES
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \

--===============7995216168143898841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7995216168143898841==--
