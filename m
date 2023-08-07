Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F623C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045E881B6D;
	Mon,  7 Aug 2023 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045E881B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0FgqWMleT6J; Mon,  7 Aug 2023 20:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0B681ECE;
	Mon,  7 Aug 2023 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0B681ECE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 462CD1BF951
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDF240122
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDF240122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYcBo9Uy7AOF for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5130C40111
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5130C40111
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40BBD846E3; Mon,  7 Aug 2023 20:25:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 22:25:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51435d30ba283036d027f2d02c693da138bbdf71
X-Git-Newrev: 5b60f2782e6d2d5235842671a8837eefbaca4712
X-Patchwork-Hint: ignore
Message-Id: <20230807202519.40BBD846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build failure due to
 gcc bug 110934
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b60f2782e6d2d5235842671a8837eefbaca4712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
