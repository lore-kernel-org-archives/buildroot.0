Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76B8EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A176D40CCF;
	Mon, 11 Sep 2023 10:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A176D40CCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlvAGjpbMVpR; Mon, 11 Sep 2023 10:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE9C240C3F;
	Mon, 11 Sep 2023 10:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9C240C3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6671BF955
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0739D40CC8
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0739D40CC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhAbrXSBTVFW for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15A8B40C3F
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A8B40C3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 012B286C6B; Mon, 11 Sep 2023 10:35:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 12:27:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3a019470eaa5aa9a47d3465848eebaef66c7491d
X-Git-Newrev: fda8cb53f81e8796b4762c6daba89d4e00606e2d
X-Patchwork-Hint: ignore
Message-Id: <20230911103506.012B286C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openssh: fix
 build failure due to gcc bug 110934
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

commit: https://git.buildroot.net/buildroot/commit/?id=fda8cb53f81e8796b4762c6daba89d4e00606e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Following ICE occurs for m68k builds:
(cd openbsd-compat && /home/autobuild/make/make)
/home/autobuild/autobuild/instance-10/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -pipe -Wno-error=format-truncation -Wall
+-Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing
+-D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
+-D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-closefrom.c
during RTL pass: zero_call_used_regs
bsd-closefrom.c: In function 'closefrom':
bsd-closefrom.c:151:1: internal compiler error: in change_address_1, at emit-rtl.c:2275
  151 | }
      | ^
0x7fa76f4bad09 __libc_start_main
        ../csu/libc-start.c:308
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [Makefile:106: bsd-closefrom.o] Error 1

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b60f2782e6d2d5235842671a8837eefbaca4712)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index e14d752290..a2c3f16129 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -35,6 +35,10 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
+OPENSSH_CONF_OPTS += --without-hardening
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
