Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B04CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2986D405E0;
	Mon, 28 Sep 2026 11:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmIoy-JqWXae; Mon, 28 Sep 2026 11:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 32127405C5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790593660;
	b=te3zA64qfxR4H4hpyGiwJujfr8xzuKmfl0LGmjg3ssykjsgT3imefugF3DNB7LMBoS20
	 s75LfCFnU3sBYtV72VudbZuAVkTrqZzBDNDbyi1Jc8iOKnFxRvHXA+zc3vrCVu5yJCBKr
	 T/J1rjrUMO6CdLwGXbZRguCHzVxrgxuEF6HoD0FZZ0Pf3BFtGIDkq+aqpPcMvc3C3cxGf
	 WjLrdW6OOQD20I373zBZt8hlQ4ofnX7yUZTEmSXi3vxRhqYBMFfYeZm7gN7qzIvD0Pqzk
	 IbR+s3ZGEnZKIgB2M66ahHx+Zi6Aa4oFN2Llom50azKRxj9wVmshABp1UTdy8ChzOOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790593660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qqcMCHztUtfY3iLHXoHekmDaWd1TPVMQKYxAxnIOJaY=;
	b=dpcpT5XHEU5kSKhFrHvZExoscRV/ADsOO0kQl6RPEkL8MWi/aP9aB5Vmd49p8XQAw4oy
	 +jzUHyDfD82RBhU42aTV3g4VdmirWWG/xB79vrqVDGhinEE27zsm4hiz0rhmpuLQJi6+r
	 hSZaLgMEok2d7X6uRoqJJQYdPWb0yiCXgv85oActsMRkUi/izbO8VRj4SHjLysLiyIfH5
	 D7WCoCmeutgpe/q23siZfmV+rGiLU1fGzlWUQVzTuSEBnBEAlBeU85jqOFlV8s+njWiNB
	 xehPUOASvl3vQTe7L7VWfyL3cfkaLDypSjsGM5JTPXFYvaD41ceAWbr1887065GC06A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790593660;
	bh=qqcMCHztUtfY3iLHXoHekmDaWd1TPVMQKYxAxnIOJaY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=raaweKUGZ1i6YkfN753IgfQ/f7a7Ve0PBhuoNykbJ++9veuxPQ+cSa/5EFwBuefnJ
	 j0kKViqr4tXhnKlmkECIrwMm8tEgL6GIK2FAPSCI7Yr7iypm2fIoh0dpnWWZB2LNb+
	 TBoMe51Jvsid4x84raifBIBTMMnpId4/HyQE7jgUAjo0bG4uh4LYfz1/suQgv+J4kX
	 jf1bSJ01sxMaaQNmOpUMhGTYLo6AiBoTHbTq4Jn7DI2QGA37ni6bsoTDTiLvkyMRHL
	 OYabFd9VKiYzVfPn257/NtyWpqEn/HXjiM2PLLUIZMsFG+VQ8Tp4iQrMPIf1Uzn21W
	 yAurFYsh4Oggg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32127405C5;
	Mon, 28 Sep 2026 11:07:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0B024E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714FA80A98
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbJ_A5LlWkke for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6CE1F80A06
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790593657;
 b=oWlLndkV5hmB3mpEKmLX2I//psGXu/8JZPQv5EzUe3AWC/jXRqh4g6E59LxQ+/O+/hDg
 MbE2X5bj3nh8throGzmLxMeZomFYvaD3HgqLVA6eMYoepgm7lWLFNXIWjM/48eJdCWzh1
 0dbgYnpPid5QR+S9YQ19x7D8K/XvRGA3DDolIV+R3OmhFCfd+sBMaulQ+6YRr3Vmy8KNR
 lDuCuGazl38TvNWTpTcWd8SDZpSl5wKaS3J9ijJs8RUbu1mKZt1PTWJAdMZgtJxf1jbQc
 bAIvdLf6kWZ3tm4PsER72esxKjMmRfU4BDVWMihDZaYwge9tRXV3WembRHiddzH7EFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790593657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AjyviVntgIfuSr7Mpwyfp5gO7hiUGJPkuTnl3HlQ1eA=;
 b=bDwdzdHNSSK+qtdOl0GAyju73Bxo3cS0FgBPtYw3BxPQ1Bl1xpbXsfa4mxek+MvjRnyr
 GsedfvNdnL6DKtTT4mwOlT61EL0CWLvIBB2GTD1FYGAbRh2CrdWt9xAhMsMFEYmY7yxIt
 WXvgOZ6MPzHsE/4D+NnN65EL/xbGAf6rYwmNUrwsRdPEx166l17lzBy3nSdHxgQjbYwBv
 PYCrqyxe7+2YeSlFOe0LYM+6mBwxA6Iu17v8nCFnIg+2DOv+BIUZ8zojPehk+uDCj/h3b
 sj/gLTRvYdVgaB46iEjcbso/TOvEYD/LOBK6eVMc/GyFl28V6zHda4OLoFoXveut8XA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE1F80A06
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:07:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 353D78D9DB; Mon, 28 Sep 2026 11:06:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df39c8c52422c44d30cc70879b5d222569cf5cad
X-Git-Newrev: 441ccd8dab358a725bbf3b70e8e698314f71edb4
X-Patchwork-Hint: ignore
Message-Id: <20260928110625.353D78D9DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: fix static build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/441ccd8dab358a725bbf3b70e8e698314f71edb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump to 3.7.3, libsoup unconditionally includes <dlfcn.h>
in soup-init.c to detect whether libsoup2 is loaded in the same
process. Static-only toolchains such as uClibc-ng without shared
library support don't provide this header, so the build fails:

../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory

Add a patch, submitted upstream, that checks for dlfcn.h at configure
time and skips the libsoup2 detection when it is not available.

Fixes:
https://autobuild.buildroot.org/results/4effebe5fc12146749e704dd56f695363cc8fbc3

Fixes: 55cec1d01307f8e93c6ce61c95c22c863fc1ce28 ("package/libsoup3: bump to 3.7.3")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...only-use-dlopen-when-dlfcn.h-is-available.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch b/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch
new file mode 100644
index 0000000000..e2caa3c52b
--- /dev/null
+++ b/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch
@@ -0,0 +1,67 @@
+From 9dae8238db84a1ce2aeb61cce41af4718157172b Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sun, 27 Sep 2026 12:03:53 +0200
+Subject: [PATCH] soup-init: only use dlopen() when dlfcn.h is available
+
+Commit 1296cbf983f0 ("soup-init: Use libdl instead of gmodule in
+`soup2_is_loaded` check") unconditionally includes <dlfcn.h> on
+non-Windows platforms. Static-only toolchains (e.g. uClibc-ng built
+without shared library support) don't provide this header, so the
+build fails:
+
+../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory
+
+Check for dlfcn.h at configure time and skip the libsoup2 detection
+when it is not available. Without dynamic loading, libsoup2 cannot be
+loaded into the process at runtime anyway.
+
+Upstream: https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/571
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Assisted-by: Claude:claude-opus-5
+---
+ libsoup/soup-init.c | 9 ++++++---
+ meson.build         | 4 ++++
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-init.c b/libsoup/soup-init.c
+index 3392e8e..a57db6e 100644
+--- a/libsoup/soup-init.c
++++ b/libsoup/soup-init.c
+@@ -17,7 +17,7 @@
+ #include <windows.h>
+ 
+ HMODULE soup_dll;
+-#else
++#elif defined (HAVE_DLFCN_H)
+ #include <dlfcn.h>
+ #endif
+ 
+@@ -26,8 +26,11 @@ soup2_is_loaded (void)
+ {
+ 	gboolean result = FALSE;
+ 
+-	/* Skip on PE/COFF, as it doesn't have a flat symbol namespace */
+-#ifndef G_OS_WIN32
++	/* Skip on PE/COFF, as it doesn't have a flat symbol namespace,
++	 * and on platforms without dlopen() support (e.g. static-only
++	 * toolchains).
++	 */
++#if !defined (G_OS_WIN32) && defined (HAVE_DLFCN_H)
+ 	gpointer handle;
+ 	gpointer func;
+ 
+diff --git a/meson.build b/meson.build
+index 4422215..3140ceb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -167,6 +167,10 @@ libpsl_required_version = '>= 0.20'
+ libpsl_dep = dependency('libpsl', version : libpsl_required_version,
+   fallback : ['libpsl', 'libpsl_dep'])
+ 
++if cc.has_header('dlfcn.h')
++    cdata.set('HAVE_DLFCN_H', '1')
++endif
++
+ if cc.has_function('gmtime_r', prefix : '#include <time.h>', args : default_source_flag)
+     cdata.set('HAVE_GMTIME_R', '1')
+ endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
