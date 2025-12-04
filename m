Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A9CD2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95AB361C52;
	Thu,  4 Dec 2025 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxEJp9ZCOgb7; Thu,  4 Dec 2025 20:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1B22607E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880768;
	bh=v7J4REbZc9NUcDfV2+2QHFGFJdXP2+BCjJNKl3w5GAs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=byxOAc/uCbW5j15kePF1rCFPQrUk0mXZ63XO3DR+wgjHtOfHnkAJTtt2e1uBODhXl
	 AlXIOuKgsnZ2UF5Q7FBg7jOuzX6hB3k7yYC1FQ8DAKhi9FEAmTHzLxTgwYXm2ThhfQ
	 ib5FNqrcHXJ2B5IkpWYCueRqYhaCR9eBQ0fsxa+LldRm3WqEdsblBwFnLcNjpKz/ak
	 UHCIqLIcO5TPBQWXaHCmUDma6xnxlww3R+iGMU1PTp6dcVl51BKAOhj+3YrqQ9tbDx
	 2bGrnXgkTVRLHa59nw2o7reg2rBa82ZfjQbDllE2iwD+8PLHPlMXglmuJIk+M38SWx
	 DjZ+8hxSFUXLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B22607E0;
	Thu,  4 Dec 2025 20:39:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2300C1BD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41C4407CA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzQWpyaT-wuV for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC7340797
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC7340797
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC57E864D9; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:13:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 784ac62c9495238ef2829496c1042a0c14c8ca26
X-Git-Newrev: df847b57a2543e39135ca073296bfe201082b942
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.BC57E864D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sdl: fix build
 failure due to type mismatch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df847b57a2543e39135ca073296bfe201082b942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 03394b4989b1722b2946c31fd32c5e4690088ddd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
