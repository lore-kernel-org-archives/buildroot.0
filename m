Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86080D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 17:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A58241388;
	Fri, 28 Nov 2025 17:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYaBghA55fxx; Fri, 28 Nov 2025 17:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F3341382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F3341382;
	Fri, 28 Nov 2025 17:57:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD939708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A423A8468F
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7cfhyDXckRx for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 17:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C5D8468D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C5D8468D
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 17:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D872586035; Fri, 28 Nov 2025 17:57:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 18:54:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ce96f8ce959b20094617f08bdbbf60105d8229
X-Git-Newrev: 03394b4989b1722b2946c31fd32c5e4690088ddd
X-Patchwork-Hint: ignore
Message-Id: <20251128175720.D872586035@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl: fix build failure due to type
 mismatch
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03394b4989b1722b2946c31fd32c5e4690088ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch to fix:
./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
./src/stdlib/SDL_iconv.c:50:29: error: passing argument 2 of 'iconv' from incompatible pointer type [-Wincompatible-pointer-types]
   50 |         retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
      |                             ^~~~~
      |                             |
      |                             const char **

Fixes:
https://autobuild.buildroot.net/results/cfb/cfb1f9a0137332cf080ce862722e4fe8ad275031/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add "Upstream:" tag in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...src-stdlib-SDL_iconv.c-fix-types-mismatch.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch b/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch
new file mode 100644
index 0000000000..4915c6cadc
--- /dev/null
+++ b/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch
@@ -0,0 +1,50 @@
+From 390974b8a9d5e513d48d794818dbe180e0f80b16 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 28 Nov 2025 10:57:41 +0100
+Subject: [PATCH] src/stdlib/SDL_iconv.c: fix types mismatch
+
+When building sdl this error shows up:
+./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
+./src/stdlib/SDL_iconv.c:50:29: error: passing argument 2 of 'iconv' from incompatible pointer type [-Wincompatible-pointer-types]
+   50 |         retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
+      |                             ^~~~~
+      |                             |
+      |                             const char **
+
+Let's pick only this code from upstream commit[1] and left the rest
+untouched.
+
+Upstream: [1]
+
+[1]:
+https://github.com/libsdl-org/SDL-1.2/commit/8a8135d91f9361448521765c9da00401fab866a1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/stdlib/SDL_iconv.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/src/stdlib/SDL_iconv.c b/src/stdlib/SDL_iconv.c
+index fa56a99e..369f6881 100644
+--- a/src/stdlib/SDL_iconv.c
++++ b/src/stdlib/SDL_iconv.c
+@@ -43,12 +43,10 @@ size_t SDL_iconv(SDL_iconv_t cd,
+                  const char **inbuf, size_t *inbytesleft,
+                  char **outbuf, size_t *outbytesleft)
+ {
+-	size_t retCode;
+-#ifdef ICONV_INBUF_NONCONST
+-	retCode = iconv(cd, (char **)inbuf, inbytesleft, outbuf, outbytesleft);
+-#else
+-	retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
+-#endif
++	/* iconv's second parameter may or may not be `const char const *` depending on the
++	   C runtime's whims. Casting to void * seems to make everyone happy, though. */
++	const size_t retCode = iconv((iconv_t) ((uintptr_t) cd), (void *)inbuf, inbytesleft, outbuf, outbytesleft);
++
+ 	if ( retCode == (size_t)-1 ) {
+ 		switch(errno) {
+ 		    case E2BIG:
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
