Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B2CCF2E5
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 14:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18FAE80D35;
	Mon, 19 Oct 2026 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUiWlOqDWbS9; Mon, 19 Oct 2026 14:30:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E3DD380D9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792420210;
	b=oacUSvZL0QOWdzArE6QgLlF1BFEV+cz/v8zixRXl3AoNXXTycxgP0jFLkbPOB8Pixsix
	 4CnpFn4wR3my/DfPMcSv/lCXafBbFkWAWwbA7sGXntid2qUL1J2DarUrh3x1YqfxCWutq
	 EacF2p13HCOSw7MZHynr0NaKDuaDJ3o9+Pl283NVArIon8/kWl1xWNDIx6Z38i40MeNJw
	 JBqFDxNZBS9hXlnQgvlwua51GEbX84ds52prNCNX+fDbLgOBs0iyu2Acj4/ufHwxFVTPJ
	 IVPO9u2Okx0gkKAcjd3XELdqQeCSZIadVLLs189QDgWahlGShTnV8FaE4JMeWDHm04w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792420210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B87k5eXV2r+15HC3MWcRP6dORqUSdBTZ8bpE1SlAZjg=;
	b=d0FV3TxAk/1WPK2ddflabwClEVsAQQ99vcxP7/phnfwM7YxT7bvAaX9TLeBiWhao/L/g
	 iyY61b0fKbUnOWiglqg8fqBql9Ubg1GYYGoVQI8+r65D8WqbyaeiFWQThveh+V950Vctl
	 LbnJscL/kjSBtVYAX4RpZfLvmx10rjqixmNKNwGKQHR95yLfKe2mT+EWqzt2AFW+5H1nF
	 lugj12wbtq4U5T1KVX1WuumKcrd16/zqqmofTv6OrV0r3q+DKpnoEQuK2PkD2T9UUGkox
	 WBCkGi9ynO1BDV4CC+ah0OcUbyxXAAAP2Eke0AIz40gZSDOazrXZgMjOK5h1Eh2b0qg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792420210;
	bh=B87k5eXV2r+15HC3MWcRP6dORqUSdBTZ8bpE1SlAZjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NvbNRjAA5Yd+PqkjNq529Y1rxjqa85Kb/EZQMD8JpsKJfpgkc7n2fi+v14v6jSdYy
	 M0T9/b1bfJoCdPUtATiXWnesA03ygI+5p3KIdb3Hn6zuHrvJuM2Kz1YxU85Z6VKdBD
	 5UVKiyk7zQdREP4I2C/DQZzzdhhtP8ZIDkt7GKnI88IwnhLUaVW7GQq1VnvSp/zH0h
	 z7kkRUOM31/bsZy9sAa7H+IWmU6NEpcPq8KwWXVsgETgUqabsvHmnNM0h10J5Rg4QH
	 EpaOX6H+H44eX/jQ/tqUn/owuAVK3bZaGihpvTH5pYkSBUR1HjfRSKVFVWhSVkT6kI
	 O+0rLpAI5DJOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3DD380D9F;
	Mon, 19 Oct 2026 14:30:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1461E1AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063C880D9F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfqHqKNk24Rb for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 14:30:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00EE580D35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792420207;
 b=dPSIzKRPSOJ9S4q0ejZ9/wD6n8H1TV2zmBAFJiP+i1MUPFKkyEjXiEjbWjMNj38FwQEd
 XtJiVsN8YhZNdZpmIWTPEt4RgIdftdp3Kh/nC27wM3g82x0K6qz6sIX2wfpwhYCov6Fx/
 i+TbdauuuHp6Cj3CcHH4SJryRViiYW1XqJmMaSEn+GbBPHkdb6IlY31qUxNUz7GQfE9OW
 LhQosRVXZXpTqq+8AGnWahjKsATvjDp3PIthT5mZA2DOsJB6C41qUpjAUpfmu+GyK2VdX
 JBCa7GbWFIXmS29LrSvQLo9YKihox8K3QVcU8k8m1oEIjECmcQaJITuyWqWnZf1dZww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792420207;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KZplvon8Szy103w+8z2c+QfnPAA8saU7g4ozXRad8n8=;
 b=brCbbuFSDwgBFVokN14qEFZLA4AVNgPZQa4IyGK1WOs04PQJgXa5xEsMhSwunBV2Hyej
 SzEJnAkM39BQ+7ZQIdjIxFoA6p345esneh8YXDRFW/yQ7f+ood5dP/oSIEsxgAox0xXtm
 O7+qziYpI6hGEMFE5Hu5f4/8fNDgAY46lJbsKd+WnY24xqODZDinIClRw/7Itm1DMwGCC
 8GHRVlydOLvciVtPvrTzbwjxqFRFXOdKbMAJ+oQp6nQUF9Mm6cSpcG0oHAUgkWNAWCHlQ
 tl8TyrrdSj1ruu5oKAN5sesjx/R7zIE90AN3huLD3U7N1sCUz6M0aw50/B2g5Tw80ag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00EE580D35
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 698209871D; Mon, 19 Oct 2026 14:28:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 16:29:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 145bbce3eac839e55183db7f09b07e5af2ecaf12
X-Git-Newrev: c65582cfd29a1c12457fb506014673bee727e9b8
X-Patchwork-Hint: ignore
Message-Id: <20261019142844.698209871D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncftp: fix cross compilation
 detection
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c65582cfd29a1c12457fb506014673bee727e9b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

ncftp still ships a configure script generated with autoconf 2.13, which
determines whether it is cross compiling by simply trying to run a
trivial program built with $CC, instead of looking at --host/--build.
That heuristic breaks when the build machine is able to execute the
binaries produced by the cross compiler, which is typically the case
when building for x86/x86-64 on an x86-64 machine:

  checking whether the C compiler (...) is a cross-compiler... no

configure then takes the AC_TRY_RUN path for the remaining tests. Those
tests link against the target libraries but are executed on the build
machine, so they fail as soon as more than the bare C library is
involved. The most visible victim is the curses detection, which links
the test program against the target libncurses and then runs it:

  checking for curses library headers... checking for ncurses.h... yes
  checking for curses.h... yes
  checking for curses library... no

With no curses library, ncftpbookmarks is silently dropped from the
build and installation later fails with:

  install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory

Other checks are mis-detected the same way, e.g. the 64-bit integral
type checks, which end up breaking the build itself:

  checking how to scan a 64-bit integral type... cannot scan
  io_get.c:763:96: error: expected ')' before 'PRINTF_LONG_LONG'

So add a patch making the generated configure script follow what
autoconf has been doing since 2.50, and consider the build cross
compilation as soon as --host is given and differs from --build,
regardless of whether the produced binaries happen to be runnable.

Regenerating configure instead is not an option: the macros in
autoconf_local/aclocal.m4 rely on autoconf 2.13 internals (AC_LANG used
as a value, AC_FD_CC, __oline__, ...) and upstream generates configure
with a patched autoconf 2.13 (see autoconf_local/acgeneral-2.13.m4.patch
and acspecific-2.13.m4.patch). A modern autoconf fails with:

  configure.in:53: error: AC_LANG: unknown language:

This regression was introduced by commit
f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to
version 3.2.9"). Before it, a pre-configure hook regenerated configure
with autoconf precisely because the bundled script "doesn't detect
cross-compilation correctly". With 3.2.9 that regeneration started to
fail, so the hook was dropped, which brought the broken detection back.
That commit left the host-autoconf dependency behind though, so drop it
now.

The issue is present since 2025.05, and in 2025.02.x since 2025.02.1,
where the 3.2.9 bump was backported as commit
6b0e4d82c31ee04e8a6abb48323252a7cd97c177.

Fixes:
https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/

Fixes: f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to version 3.2.9")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tect-cross-compilation-from-host-and-buil.patch | 60 ++++++++++++++++++++++
 package/ncftp/ncftp.mk                             |  1 -
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
new file mode 100644
index 0000000000..c3ecd61d1f
--- /dev/null
+++ b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
@@ -0,0 +1,60 @@
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 3 Sep 2026 10:00:00 +0200
+Subject: [PATCH] configure: detect cross compilation from --host and --build
+
+ncftp still ships a configure script generated with autoconf 2.13, which
+determines whether it is cross compiling by simply trying to run a
+trivial program built with $CC. That heuristic breaks when the build
+machine is able to execute the binaries produced by the cross compiler,
+which is typically the case when building for x86/x86-64 on an x86-64
+machine: configure then concludes it is not cross compiling and starts
+using AC_TRY_RUN based tests.
+
+Those tests link against the target libraries but are executed on the
+build machine, so they fail as soon as more than the bare C library is
+involved. The most visible victim is the curses detection, which links
+the test program against the target libncurses and then runs it:
+
+  checking for curses library headers... checking for ncurses.h... yes
+  checking for curses.h... yes
+  checking for curses library... no
+
+With no curses library, ncftpbookmarks is silently dropped from the
+build and installation later fails with:
+
+  install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory
+
+Follow what autoconf has been doing since 2.50 and consider the build
+cross compilation as soon as --host is given and differs from --build,
+regardless of whether the produced binaries happen to be runnable.
+
+Note: configure is not regenerated during the build, hence the generated
+script is patched directly.
+
+Upstream: N/A, patching a generated file (upstream has neither a public
+VCS nor a bug tracker)
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index d955e20..2311c73 100755
+--- a/configure
++++ b/configure
+@@ -845,8 +845,13 @@ int main(void){return(0);}
+ EOF
+ if { (eval echo configure:847: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
++  # If --host was given and differs from --build, we are cross compiling,
++  # even when the build machine happens to be able to run the binaries
++  # produced by the cross compiler.
++  if test "$host" != NONE && test "$host" != "$build"; then
++    ac_cv_prog_cc_cross=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+-  if (./conftest; exit) 2>/dev/null; then
++  elif (./conftest; exit) 2>/dev/null; then
+     ac_cv_prog_cc_cross=no
+   else
+     ac_cv_prog_cc_cross=yes
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index c56fc86848..4075449c53 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -11,7 +11,6 @@ NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = ClArtistic
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
-NCFTP_DEPENDENCIES = host-autoconf
 NCFTP_CONF_OPTS = --disable-ccdv
 
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
