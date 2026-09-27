Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEF4C98338
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 22:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BCE80DE5;
	Sun, 27 Sep 2026 22:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ucff50baQCX; Sun, 27 Sep 2026 22:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6F7D680DE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790547607;
	b=CAzNlhW8gqpaX+MepGld8N8NdT3bhylUNJfniyiMrIKw3zUj3t9iAnGZ60EJ5DzlIHZH
	 qSAfX8Eg8jrMZWdgBCGFZBk/eHEXmuCotd6cdm1CMXiD/IlLpxNTi/UDoGmdsIzKUw4fM
	 wFmrBRKs8jumOK4H6o1QEI2jO6hA50LNn0n3B8Uk4Eo0hx2Hbd5/tnW51jvsTq0xLvcej
	 wdIZVV0G5jFkm+xZX5mklKvMPV6o05AyYEjXmqIK1ukohtM+z7NLYVosla0cnynYcFuZw
	 1an+aqF52ZaZoIsMhcme8MKP5TH90xe/3bqeiS2S7ujxBFfQyhn40L9WDQg6MBCA8KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790547607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gD/udIZcG5Rw5AMSq6WpC5qiP+/0aFpbpL56pnptimU=;
	b=kLB+Pz9XpmMU48eXEE8jgmmxPxtwPgxjB9yjXdU7fk+h5qHwQ5BtYLBVBu+d+s7Kih3W
	 wLdadR/nnGj4/JM3SeGZItiQBQ6VdBXWWmCv039UY5UpEN9zYjLuahFThWvYeH+gDR6c4
	 eL50v3drHlpPTurE2ZgqO6FqWvoc5YsrDgIq2xFlMzPmFfjKilGyvt2SJJCF/zCmjqxB7
	 dOuOecufRWpvxHGtwtFKrmwWZATRq3PnXXZuuVlMsLDZGZzF/2Kk3m0ouPxHR7bmvsBLT
	 7NKqQ/RW6sA7rLKHIghyTllnt6qeHlmCGLZQvGHGxYreyJ2JFWLGRh4u8vvFtSGgbMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790547607;
	bh=gD/udIZcG5Rw5AMSq6WpC5qiP+/0aFpbpL56pnptimU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=HNN02+ry96k4pJ8LLv3By9mWoUZVg1pVhFU3JJxVGXaB1bLZQ6AGZU1TlF3njP0qi
	 /vmm08XI17iaqYK46VM7ZSM9zpSN7QNuQRRxO/QTR57MR/cWt8o2f9mrCRRI1eFaiv
	 FJMnQAX0A0ikBS6SaSO6wK0NNyY4oiQv8+bLpitzO9TQRp95K3TvYGUj1Xty9zWqUJ
	 suSweXK5HHipcutd9bqUrlinOUtWPEB7ach0ngxq+PBdhTVyJyhYcx3+cqs2aqKTsJ
	 qU+2tKpFimZ1cGCEV0/hvr0ZDwiou8l5DWwrWr6XkzP+sE4uFKyDScZROGKMLuid1a
	 Lsx6aiC8qp03g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7D680DE8;
	Sun, 27 Sep 2026 22:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 713633A0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 22:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61FEB406C3
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 22:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dq7uA11zPLGe for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 22:20:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 055E640621
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790547604;
 b=I4fq+owr3cl9BtT3YL3Kd4Tw2ScVnR5BS9DunNBiHeTPpwoBTsBIcAlDwWDoErZLcRDZ
 wj1vuWivnVirVL6x7/xrIZ4UTRjRPVFxOSSqbJyWLnQUhXV+Psw+0iyecU2E0l6bH8GKU
 FOwsUJRw7E1ntbaG2jTVWzNB4XwQvNc8dVWhi+C+wI7J43zjHkeidEI/DGRiPKw5CW3uT
 CNcasiA634IQi67cXdzLtPkoCC18OMa9spO2mSFxByyRHLrnJq6BDGF2QU46Ca5teVLfc
 738FWXx6wY4VglPGoTt3EJcHeAsLKr68fgKH3mlLgM15vU2a1vLhJ3DmU+1X0tRTJtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790547604;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=H30M2/wn2T5co8G4ahN83jMNdZKRH+rQaebnskGfvPM=;
 b=oZgtVfoE7ZRMOEFOzcGpAr0BFOnkyfaVXhG6uW8RsPRDEscU3oPC+ohy483PtQMg0Tj5
 IViYTy6ucWa2jDXrO+Sw2aJ8TGM35JQveFOVBLgl3O4do+4nMBF0Vc3FPPQKi8QTGyzAG
 RKecznRLYGzxFDKrlxh9+EDLQ/Ce4VqKOZj+oXS7coIHOtdppsL9mr6GZg4KjQPtvEi/o
 i1niy2EDBw0C7OH/Q34le7rXRh1UjLEs3jCmA96Ipd0iWeve3B+8el18qPqDxVuMUtJ55
 stPnPZC5BVRpbsKb38gk0ToA3lT6oSEzsdxMGuuRYFfcxPoIbkMTzTYiDMWlDZo+MqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=PAPlF8e0; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::d;
 helo=mail-ed2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0d.google.com (mail-ed2-x0d.google.com
 [IPv6:2a00:1450:4864:33::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 055E640621
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 22:20:02 +0000 (UTC)
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ac6f5c507fso750812a12.1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 15:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790547601; x=1791152401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H30M2/wn2T5co8G4ahN83jMNdZKRH+rQaebnskGfvPM=;
 b=YBXYIoN/hfqmUzAgwBCBAbWFU+YK6oayqPW7jGRF8H0PZKgDGuiX7xYUQjoLnmB2JT
 p15taZc2LXbwNDsrm76aFF+PAniQJMKTETjxTer/6RWo8OQkhiW30H0hsswteRdbLX1S
 6ckXKR2BuvPOmUZVIkOy79WBiyuZq4L71IcQnYEiICFpRbRhRGS5zEFp/cOqOFdGuhRu
 yGpsfLGI43oDpkbyqL/c+m84S03RynONMg8HHqkQBp3zVBNneWrdaq36YfNChbi4CHXf
 AA909wyrD8Orov7TyUSInifGj/ljqi6A1hIyWx85R+pXtcuHVbf1CgUfywsiR+Ozh1lW
 e7/g==
X-Gm-Message-State: AFq9FYKCKDccJSZ8ToX41L8WCZmJVr5cPAJMsn5GeoW/BYsHkzzQn1lE
 RrWBBXjHASKOJFm53RDTykGbiaDb/mKSTwIIXb2JLOXZqpiiLavqT3xuc7va3g==
X-Gm-Gg: AYBFou3LUWzq6bSx4Lsi22m9NtwSCKXQ/isEpb1ENN4uYHY8hitDEWrhaXp9TsWt9d0
 5GB/EVVhSHb8qMkpZmPOpax9MVSbLJcRgAlNhUIMa1mfzdNn0upjPQpvd8J5U2zfOxOp0xElSct
 5TQCBJ//64DIwIWFPnI0MGUugicv65L+6n2H5nvImZDhpEGNdxhBBluyvcmPyURhfawPAm23Kud
 BgWUnVD1rb2u/cahJ42QMbWtnEFAB+OHYP6peWlJWBAPhDEJ2ZXkm1CXltAFMgyFtLby+9CD/qb
 YhwH3g66igLKou8JErbWScf1I2/TYlwTa9qpm6+JyiMfKskfTxto5mBh+j1htOvlWljO7Xw80Zo
 0AP7eI5fqVXM6Ybn6Y0g/fB95qfE+t/4hAPO2oM2woQs1s7nNYyT2qW3vDsKfbNiyOhlrShe3li
 E+/FHHpXQCbLuwO7S5ro1rev9e9zPA56uItLw8K7JU8TJ3JakmpMqQ8QhBvUl+vkPAa8uP+Uqzu
 bYKG4oCZ79eqkLB5eFWe5Kr5LaaBhXRx8laThRN9kNqKwY=
X-Received: by 2002:a05:6402:2105:b0:6ac:5dfd:7e65 with SMTP id
 4fb4d7f45d1cf-6ac5dfd8289mr2264942a12.41.1790547600311; 
 Sun, 27 Sep 2026 15:20:00 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aae5cb9b0asm3363999a12.9.2026.09.27.15.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 15:19:59 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 00:19:58 +0200
Message-Id: <20260927221958.864086-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libsoup3: fix static build
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since the bump to 3.7.3, libsoup unconditionally includes <dlfcn.h>
in soup-init.c to detect whether libsoup2 is loaded in the same
process. Static-only toolchains such as uClibc-ng without shared
library support don't provide this header, so the build fails:

../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory

Add a patch, submitted upstream, that checks for dlfcn.h at configure
time and skips the libsoup2 detection when it is not available.

Fixes:
https://autobuild.buildroot.org/results/4effebe5fc12146749e704dd56f695363cc8fbc3

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 ...use-dlopen-when-dlfcn.h-is-available.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
