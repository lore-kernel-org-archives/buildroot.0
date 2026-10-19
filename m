Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C9ACCF2D3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 06:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6423C606EC;
	Mon, 19 Oct 2026 06:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Fr8SX2nWt_W; Mon, 19 Oct 2026 06:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C98260634
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792389637;
	b=ZTiyJ4N3c4Lc2atKK6A6fYnYCldAVv0kTFprfwP9vbjPkgK1+pErpJTDMu7hGrzNhcHr
	 rP4WMJHl/zvHSFRc4TmurFpX/v3m6gm7qm51I6Z7LTn6Fdajc4QOGzFd+i4poCIL71cIi
	 H7LiUzta4tiVKpo9i5cEvmFZWeLpY6XownpsxnQFkpeDZIFaRgrgR6stdmY+esw26ncLO
	 8eh/tLegnZ8YOr6UtwoX1JwqdO0H6k92JC86Vs3x4dcTsOG23Iyo7hvtH7oxVU0ilzOF2
	 BEuLCnfzp+H7FfJXGDeuwBCkhaizXYzz5WXX+fqR22PPuucF049B0ykTTGhd1QWNgKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792389637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HjLrJDxi9yB5JChH/xQ4TtoReVY5Vp1SmdjJTRkhK8E=;
	b=rYdb+9Y2RdP4phIQfti3Z3x4A433nqgKEEkkXFuO8+owjEfWfpILRPETlxJy6zFx5AaA
	 uouVgjpPrRKwydS6N3UO3+M7gcRbFcvZVa5p+8dF9bizvHI5hJJtAR3gHMkqVyl7lZmI7
	 Rp40oVm6BHA90MZU5Dbef3R7Qh8hf331kN8xAd/ZM+4kRDz+7L9jlwmDbqMQzY1O7PCZ1
	 8MPHoq8i9uOBlzMJZNm8B5RytERcj0ElzN2aM+kPhjhBxfZNZuwUgnFZO3bwTupqIqRLx
	 dsaLcktCLKUgmIwYZPfmPyIPiS/Q4KwfgxRju7K8zGZ/paiLAq9H/6byJqdXMY2LmYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792389637;
	bh=HjLrJDxi9yB5JChH/xQ4TtoReVY5Vp1SmdjJTRkhK8E=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pcJzg2/WbbBPhxxq1C2EbuBtlviYoU9PG6GHE1/y4cCbic7NZXvOOQCLsHY3+dlXw
	 2MgTTncYVbeH3Mf1rjYjF2CNopDCznjoNSbk6eLt1SsywPJ9itjY4mW1SFRLtUa9Wq
	 I8s7bkkYhlLwUmHuHQce59K/o8Z7Nx39n+7tD//9Eet0ZDgmKF79dx0p98j9QMm4xP
	 IEHptlDWR5bI3kZFrcehrMgGoqCvqTrA7sGLU8SsNMQBRKO1KvU9kA87YWJ4AdpqU/
	 /79GA5PtV8lNrnbKXW1mTp9VkNNWNS1k/58d9Py8QAjS+Csh/KFwUIDW+joxFPbPei
	 UeV5E75Htxc/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C98260634;
	Mon, 19 Oct 2026 06:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2477279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88ABC80DA1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoZHMdB5Jnoc for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 06:00:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D9FB80DD2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792389634;
 b=XhSQbPd92+BLS1nLeWKoRzLD/VpZW3xvVD1r9Nc3Hlb5NEfmPV7ONqNkD+WyRADBMkiM
 ktXKqaXVidvdQUa4+cedR3r1Pj8AO3ll8ObRNxrkomv4FqFD58zgBdUi+VfX4I7AoRncB
 51LkiDusreGwqx5oqJMr/wNahyEIgTB9QgxIlotn4RW/6KmkGbZ/lXlQiln5Y66ROGVp8
 yoqKul8NbQV+NYngfk6lfDBvmiUbHBz89CZ+a+h8rRdO2tjFDTYbhoKEYfPXGZyY4x2Zt
 GiVDb1eTa83EQpmzrpdJ/OquJ++cLvoiYZPaGFIs+zW+tcY6s8h12PR+uifHoaUIvww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792389634;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=vy1c9x9URlUZBp/r/aMtidXNwCmR4621Kt0T0HD2JEU=;
 b=BpsERxa8OyKe7E/XlKjEfSrnnPX+hNynSF5peqRQ1JTQxj0sBkcEX1zdSUrE3RxIr/Xo
 8rdFk8n9zJ8nfzB81J55UerqT5K46PEE/mYL1rZOOpSMhbpDxsAdiI//phov6bBEdITH/
 +ZAoFG6LV/qljCQxuD7Z9/33FaKs4qle6xe1AX4grcHtpd7IwGb1+Wsz4RktS9vbiqKb/
 lZK2Kan2IuRfXLxqASH9WoF/bU5J6ssq99vQwbhhsFjG9iDfqNTBt/vkQ2ZejToi/z5i5
 jiMSfUC7Tps8HNnlo3eyteYBIGuRCQl8ZwAU8D1E4Qhhw2MXZPY4rGgtzF/yDXNgMKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=hgKNiVfE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D9FB80DD2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 06:00:33 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2dc8cb0decso116366966b.2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 23:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792389631; x=1792994431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vy1c9x9URlUZBp/r/aMtidXNwCmR4621Kt0T0HD2JEU=;
 b=1aEnpwyFhgrMt8EsDwaNqb+bZHIfrjsWT0M5AHdGE16PzHCX8c3qPYtyFEm1vZQMd0
 my/UBkzLwoCRivtpVj+atOcO3/eE5av6nYLCzA0llx+zo+tT40wn3xpkj0BVMDMK6JVB
 3QUUJzeybrgGopegzx7sFDJkO96+ZuL1jDrUVdJx5Ze8xyp0Z/t2MJGLfPxhegk1IxKw
 /U05BT9pFw0/rv4OSOPsiy8hFgMcnnleVq7Edf21AyuQsO3E1VrJIu80DS+4keDjcZ95
 GqYZ09k6jGqmpl0bu2i9vVJmwUg8iEcSic0MR/5fRvK5mO1g/gu457p96DWXu/Ds2ONu
 iTXQ==
X-Gm-Message-State: AFq9FYJAQtT6Vd6MQQ7uv9lJE8WhZeFxX8NcBxMFe5766p2mSQ1eAhpS
 xe67m7s0LUfeMwIzr7Z1GaaAcZA5fBSju/nG3AVVjhSqYmoVsVn3daGSMOgxog==
X-Gm-Gg: AYBFou1NBPOKq8FlSIh4QvS9M8t73rBBV5a9ZranlzlVqCrQ2uPW/X92qiVFglZWbFG
 kIbCEGdD8NOkNez7DPJ9Dl+MBptvQ1ihDvpDUOdCnhFaTyfmhtB2hIy46kSalw6xhsa/9cwVlsv
 XOgqhhTlxev5MeA9kHR6WUEmusyD4o9qziMHM46QAUcqLWR+Bk1lv3pUbmjhHJtHg1pi8Q62eJ6
 oppF58EhtpJz7wL5SIGgupaann6HmIu0I1rKia6R4pqzD+MYoWV08Iylk6tLN8Ol0wuadcPP1F8
 VqWFumXTL+ur9/RxVKrv/OmZbihUkeNWjP+ztuyFxVNNjRTBOhp4VrzkggZf1Z3yviY+CVR06x8
 e8j/4wo7hkkrNNzoJOyXSaSGFgzw8xVRcJh87cISaVLwDzT+YVaAMzwaMBUl/kxUexbG1/qyegS
 qSflTDQHYhpvAvP6mpgbn3BT45s2XpcZQTEgjYD77CcN7ONAPavCx3FiumsPcfo69mdVfs/vZpt
 qGYsb29rCz1SB2JBT4a8idaJFvSmr/XmyYtlfhc978JRKM=
X-Received: by 2002:a17:906:1007:10b0:c42:4750:8d38 with SMTP id
 a640c23a62f3a-c4247509286mr218918566b.30.1792389629765; 
 Sun, 18 Oct 2026 23:00:29 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4090dcf35asm322613566b.19.2026.10.18.23.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 23:00:29 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 08:00:28 +0200
Message-Id: <20261019060028.1078791-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903114721.984785-1-yegorslists@gmail.com>
References: <20260903114721.984785-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/ncftp: fix cross compilation
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

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

This is also why running autoconf was dropped with the 3.2.9 bump in
commit f8bc27111531e9607f79121414f61c0c2d5f83c0 (package/ncftp: bump to
version 3.2.9). That commit left the host-autoconf dependency behind
though, so drop it now.

Fixes:
https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
Changes v1 -> v2:
  - explain why configure is patched rather than regenerated (Thomas)
  - drop the leftover host-autoconf dependency

 ...cross-compilation-from-host-and-buil.patch | 60 +++++++++++++++++++
 package/ncftp/ncftp.mk                        |  1 -
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
