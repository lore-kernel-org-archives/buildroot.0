Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFADC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B3542EC6;
	Fri, 28 Feb 2025 16:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RDSknhTLAlR; Fri, 28 Feb 2025 16:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24ECB42D53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24ECB42D53;
	Fri, 28 Feb 2025 16:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA9A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A677D419E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3yqWhbxSTmn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CA141998
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73CA141998
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B5FB874A0; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 21:01:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c44722b0ca6c1ab7d0f7af6a703361f553e4747
X-Git-Newrev: 4033902ad095bdeb6a32c827a6275b49ad61a3bb
X-Patchwork-Hint: ignore
Message-Id: <20250228162931.6B5FB874A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/musl: Fix -ztext build
 failures on microblaze
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1792326198690051959=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1792326198690051959==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4033902ad095bdeb6a32c827a6275b49ad61a3bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The particular combination of LVM2 (which enables -PIE), musl-libc with
dynamic linking (and thus -ztext, banning TEXTRELs), and microblaze
leads to an error because a TEXTREL is produced in musl-libc's Scrt1.o.

The upstream patch added in this commit fixes (or works around) the
problem.

Fixes: http://autobuild.buildroot.net/results/5bb283eff4b4a2b17d1028bbe0b3e1bea8fbeba8/
Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...visibility-for-C-entry-point-function-_st.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch b/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch
new file mode 100644
index 0000000000..6359565cd7
--- /dev/null
+++ b/package/musl/0003-use-hidden-visibility-for-C-entry-point-function-_st.patch
@@ -0,0 +1,42 @@
+From 9c78557af0a5e521cdb46a4ca7630f2987d2523e Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Sat, 10 Aug 2024 19:49:24 -0400
+Subject: [PATCH] use hidden visibility for C entry point function _start_c
+
+the file-level crt_arch.h asm fragments generally make direct
+(non-PLT) calls from _start to _start_c, which is only valid when
+there is a local, non-interposable definition for _start_c. generally,
+the linker is expected to know that local definitions in a main
+executable (as opposed to shared library) output are non-interposable,
+making this work, but historically there have been linker bugs in this
+area, and microblaze is reportedly still broken, flagging the
+relocation for the call as a textrel.
+
+the equivalent _dlstart_c, called from the same crt_arch.h asm
+fragments, has always used hidden visibility without problem, and
+semantically it should be hidden, so make it hidden. this ensures the
+direct call is always valid regardless of whether the linker properly
+special-cases main executable output.
+
+Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=9c78557af0a5e521cdb46a4ca7630f2987d2523e
+Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
+---
+ crt/crt1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crt/crt1.c b/crt/crt1.c
+index 8fe8ab5d..10601215 100644
+--- a/crt/crt1.c
++++ b/crt/crt1.c
+@@ -11,7 +11,7 @@ weak void _fini();
+ int __libc_start_main(int (*)(), int, char **,
+ 	void (*)(), void(*)(), void(*)());
+
+-void _start_c(long *p)
++hidden void _start_c(long *p)
+ {
+ 	int argc = p[0];
+ 	char **argv = (void *)(p+1);
+--
+2.45.2
+

--===============1792326198690051959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1792326198690051959==--
