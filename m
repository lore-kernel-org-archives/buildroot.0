Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51926CCF2E5
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0704480DF6;
	Mon, 19 Oct 2026 14:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uix8y_1XGf5e; Mon, 19 Oct 2026 14:18:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E144580DF7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792419489;
	b=b9VpCyMhkcyvO4/qxmFJsjnK7djBCvgDmq21g4s6zGy03H7H8TBJ6Y/RthwDPF6pblnB
	 eFSKfsg6tX0PXf9OcTVbUsjwbtmqc15kuOOxXfF7aJFLXRuNcneHPS76pZQQ97HdQaZg0
	 Taxt44AfoH1y+Achq+8u9uc4xmlifVdrMlo6ycn4rJ8S0ha3e2yUhPZoEZ9FyYfKfyY04
	 tqR4jkV20LUNOQl0NltdA+S9yb11owSCARuzothhf11Px1gYFTfqeimzFUhsomV2zKlUm
	 wS/zpw5Oy61qlboItCGcb0ntzdT4hkuCt1vrIr4OiOFvOjYidPWGanDutBWYG5l7ceg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792419489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b36o6fR2w5eYn5FTe3oSwKVIcWcgfOJ2DYXoF+oTBAk=;
	b=JWnoUWSnPYRoX0coGeu8/7PqRJ44qhiXXcPVrt7sXUF2Vl0Q1vkVynFiwcXPUXJ8TwFi
	 RPqfE5F2y0h7GuNVIjwxCYbGWJ5mmv9Y/FuH4TGldF4s4T7f0XcGOvE4rypM3dm499fQb
	 vpTupMEmiZoO8qa3qWW30817EhaTOvIqOq0XD9dDTe5nAD+t/nM1sah9v6dfYKKzpLf4C
	 07OSC4t165EQqe4Mfig2yOZXPoGSxHB1wFCsjYr9E0zTqbWsOWnjzhOOarXQQDiOecOYF
	 M/3Wj/EfZD/yCh6eTTaza2cIQ9ezIO6FvEXtcY4NyTxft4rEYvWi2VLqcRZXW01dN9A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792419489;
	bh=b36o6fR2w5eYn5FTe3oSwKVIcWcgfOJ2DYXoF+oTBAk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WFOv5ZNkeygyAn8Y9eZdjLEZCKub8mlbXmurVUVKli9VsjogA0uSlkv7PBOTyRPRx
	 NJJZ5DDyGK8ap9Ll5ME3mlRU1CzHH/BvOdjgU+b6eNVk009qQSXtu91kNLWfScrsTV
	 O7OsebJ1aKG9z5/r6evtTS2rOLZ+u/aXjbRvFI8ND4zUs+poHdyDDsACkvj0hNJY8v
	 h57PZRxw+m0ihnSUEepIu35z8MuPRoBQg9/CXe0V267BVL6o95U4RR1xxic2LcwleH
	 h/TQMSvJnWkoSBzjcZS+9FmbiQ7lTqkS3+7ALZLIHCbKBcdH993xtOZhf9QTpyzmj+
	 MZm2ivpIEFqKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E144580DF7;
	Mon, 19 Oct 2026 14:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB7C71AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91572606BA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpAriT0QRrts for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 14:18:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3746E605CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792419486;
 b=fxFTvabm+kzCQQCAhyjhQL1Je43+88COhkrwKN/CS6+F9Bs4wnU2yT6HpcPLsWT2HJ2N
 uAYL6mb/+jiLNmYjn+g4f7gd2JAUXzKQ0oG07/GfT6kzqepeD3N4T34WX4eTKsfxgfhzW
 0p7bcPjuxXXiCJ1zL1sAFuKK+0FyxrV+9atpKEDVwMKNoc4e4Z1Lr7KXCE6mt18Q4+/NB
 95GHoS5JChaHnuGqtRCqe0vRDR9Go5NVthssCvYCS5vPE869U9WLLnBRpYaRdO86hknRi
 HpCWjPIsge/6jylPc5AMs2u5aMIYI0mGlE9l39Qa1TtaBw0wCKHdoGtREr1Na33wX4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792419486;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=hfFPhnFMZUlQLkDXjnwJltCrp0pWCHc5sFiQJS9VR/o=;
 b=ANavDCActlFhQFx26j0GdOo6DirZeq4G8NeTpPq69zdziiLuEqprlN4FT2tA55idzV5K
 F+p86q7oZ/WmOgHb8II9P7WtQ0E4ovmBAOFGAos/EOcx8v1CMNcuBxly/kB06xEuy/hUV
 LMPn+9zFCx1DggESEWhTm0SWN1BCylzEC1sW7Oq/fjLzE6Ne88CC4UWrgnYLTkh98X8i5
 2ar0JAMu7sPn1C/ddRI5IxV1JQ7aaAxYaZvw20WVSxYqpzmOxUc+bCqB/3pHNKkQMwuCE
 OiPIhdxDwYqOogV8leDB//LQg9BM7/I0tM0kr8HbylPYUuDnKo1i7IN2HALwh5LIaTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Kpqzk27N; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3746E605CC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so260292366b.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792419484; x=1793024284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hfFPhnFMZUlQLkDXjnwJltCrp0pWCHc5sFiQJS9VR/o=;
 b=YZyiHkY2TkGAeNF924dRGeg7Gn5StRVLbGB131xJTsH0mVUkXMiSEtXUWrFTfSL9iy
 d9pnvyIxhCbEF5gaPTHA0NSLDjqPhzJE+vkecj13buCtqdCwiJCn+dMFO/SmS3x1qHEB
 bw7Zlp/dQUDSNGZO4C30brSaPJDYZMfmDtgEvl410OGxXuvbXWZGkkq0nE7f8wtv4kp9
 5CAMP6ySOQLJD/iLEVWMB+yeyFoVwGnASTAq+vNNvv5LBIXIU6Z93cx28M1c3Xq5gN4y
 OWlL59Sik+HAvKxphwdAlhMWkSYLmxM76/fDQeAIkIbSmfn0AMRnWdcyoRKFQiZUa8bd
 ZUJw==
X-Gm-Message-State: AFq9FYKmtAB9RdlyYcBZvUbYVPorBzXGewSxg6JHSHE8a8BB8Mk0v0tA
 VPeAiYy7PD5VCttWPXZE68YSpYt5226MiJ+B6+o3DULDVGC7IXRKqob5U2p1eQ==
X-Gm-Gg: AYBFou0b8Y+vp/Oli2mMQVGvNFbHgVHLlYLLT4wRfpcuK8hk3eyMxis/QxJO3pOHZB3
 pRrOu8JYoa6URwIhz9ANxDQu390QhHBjl7tSGQ7kv22+P1KwRripbbzFZelMx+HbdEF5UDcyakF
 O2WzzokPWOZDn77XN487XsAvmIMKouvuczZ0DJtoyskyB5xzOnOLFxyMV8sZgwiJyhpVs+7oTDH
 RWkQlP3v/WdvCvoTQkWoMuKxbbArwZE9hwxCid+F7myJ3F3EzdAfKn4ZLomBR3H8EOuQj6+PJss
 f0IdTTb5wvea5S5tWGhEYYwh+K1h+sDTp57n4aBGoBwJ4NhXfEGGrIwsDliMaWAHRrZpcexhmvJ
 Urp75T3rRl2CGkAmyIFpIqPJISEdKWCR2mkAUoFx9gzHl90VX2Z1LiIDtyRFZ5vrjg/dJQSxdRb
 Ee5KMqi1ARRY0ydk+g3TdUFfzFbnlmb6RDePNldUregic+TWJTyJbb1Wo4o3SMGX+wGRY+YNYOy
 8NQdud07CztX+DTMhcFdXZN6MxFAJhhxWZ2oE6t23NXjfU=
X-Received: by 2002:a17:906:ba83:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c419f8feb44mr515785166b.33.1792419483422; 
 Mon, 19 Oct 2026 07:18:03 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c40919bde60sm357657866b.60.2026.10.19.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 07:18:01 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 16:18:01 +0200
Message-Id: <20261019141801.1653017-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019060028.1078791-1-yegorslists@gmail.com>
References: <20261019060028.1078791-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/ncftp: fix cross compilation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3:
  - identify the commit that introduced the regression and the affected
    releases, including 2025.02.x (Thomas)

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
