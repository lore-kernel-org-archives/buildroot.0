Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF94CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 06:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0938640AE3;
	Sat,  3 Oct 2026 06:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnlYHHbyuYAO; Sat,  3 Oct 2026 06:55:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECF4A40BAA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010542;
	b=rVgvjsglglAp1UaPzVcioAbQ8iKpbhHHX68Il87VW4g7Pha/TJnExFeWre07U5pPJdS8
	 nV1Cu/Ved3i9etF4gPzj4ehbxv+qlJuPqbBT1xR21n+SrGRrABH4DFLcDjowZJr8vAcyV
	 6AOuMuOvOAEU78M+uYUFSVcf5fTZMa9sWid9xKB7s+s+L8TiG6plqyIaS3hih8R+C8nNf
	 bH4Yb6F/3g8d6iIHxnxt19ZpM/kdmQiOlsJ4arJFGoe5FNw7shEnZiGNMd3F8lsT/sUvY
	 6r26Qb92ckc5YTgSQ4OwTqfl8mgi+ASmAj3COqlgV75GKds/V5E4F4n/5s5MVPWW+1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=efujNPQjpzkFkiFkZqUAJ8UXovzj+8hPqkr8d9zkSak=;
	b=OtUS+VC8AIJJOapFTi7JPKCsti3EO06ANez5d7oN7uxyBb1nxB2I//01JwGiBNWZ+pkO
	 4Rbq2ox3iCZoN1cPSPGUnstNta/XPe7UH2BJgtYcJXgFWqN4gFBfL7Gqt3JUw7XBhuTJo
	 zaf4GDH3mr2p+1dyxM2bBLKdLEH4Oe784b+Zz2ZAaX1NCym+H2YOpegO9Ee2j5z/NqwgQ
	 P684iXUi5KYdM8Zx4CtfbH9d5WBM8Ds63pFOkJUurBe4S8sTL8sHwLw26521k85KdzbmU
	 aknfA+Uxph3khGOJHjPnpoZdtLGf0gZSsQMNnMjzgmjd+FIaORcU+bpUKprvvch+mGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010542;
	bh=efujNPQjpzkFkiFkZqUAJ8UXovzj+8hPqkr8d9zkSak=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e3V2w2dBdilO0yXPv4Ca5v20ohdRDSgEL2gKP/whu/WsEGnLu+GXbSQ22YqjF9UXj
	 M0JbY/369vl5x1dmVBCBtaiY7HR2aqHYOe40MP+XMGk5A6u3Xz04RZlUTt34NWWSCu
	 rzvqkYbQ7n2ESUVUK8WwCgClj8y/8LYubFtT+ijzS9xhNZZ44xg6nLyP35CQeff54d
	 VEZznMNy/zIb4CSFwlmUCa0hGRtrdkAcgHpEUhSErA8ji5RVe3oZ7Th8Za21i59q96
	 29Tzy2RyBbbx6YT6rW9qsrHwKfcvbfvcsOaOXMJtfAGaK+zFKqXLRjgfLruwnLrQW2
	 NyQvZbSIUrQxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF4A40BAA;
	Sat,  3 Oct 2026 06:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B9072E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 715088111D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 06:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shS7-5S7-yZA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 06:55:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1315681112
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010539;
 b=UrWCg2cwFNwqIdGcFlTp7NnDg9Q6P3FxgBfRy5ZZuWUAnDwF+NfwVPOWxNouJDeLw5l+
 FvqbDKSMugdqfdF2WU25k/AEy6gHMTLxmOQ5v3KICQdVysqI+HuAooLOZazzb8vteqE30
 EhIQjH2HX2QBv0nT6svdYryGdIlMZxsATNLME26v1LYgurhoT/9YW0fV0FKKiJcnTQusJ
 9eJqjVQP8O9W3v4BABtke0Fm2eMcLMn5IAqDVgy9hXoMfLwkyxEZA6vaOAMLeNm38bqCq
 qIe34vfugoeblkoRcQhGtC5IdUrOsNXb1212qLsfsW2wHqxeG8PZx99UIz/0SuN+P4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010539;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=px65RHsNkm5sPf8ynwXsp8hdaPijL3Dj84IiQvqutS4=;
 b=IR8S7mEGWTKfwM7ZFUAO+ilh1nLz+GXup9pc/Ghg/8IiEdUofsvY5y7WodrkE1QF6CSk
 98Gz3mNzkFY7bJirb223YnQAKdjLgriTS/dnH9zIS+rjKCNVfiHBkzvtWJ4U1GHtjutDw
 G8eAJmsgSozmc2E/0uVgtY8/jiLyMrksXDKIniL2M+rLa6yxzEtcOdJlniBb9cvkecOtK
 alw46DpmzY8uGfkV20H8RWo8RywuIigP9j/34HVXoopb1HNKBR5UGwE3DTurN9B4ItmkY
 AQxWJK58YzcpmRtzM9fyXvcN4zADGjmr4WuHrrVzc23ExCRB0FqbwWMuwZa7QoC4mkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lqrfo1aL; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lqrfo1aL
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1315681112
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 06:55:38 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso3589495e9.2
 for <buildroot@busybox.net>; Fri, 02 Oct 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791010536; x=1791615336; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=px65RHsNkm5sPf8ynwXsp8hdaPijL3Dj84IiQvqutS4=;
 b=lqrfo1aLzLfufLmGHrttnfJ3DXbCXqJtL3EbDBHfrlUmmlZpyo+CF2/xsckciymhRO
 0xFlWtqS5JUaIfY8bFYXbTkNe+eqCYVzsxRn1UeJXyqkUVLeWhYzZ45aI3+4UREu/jOE
 mnEQl4jtJBJ2dNSLwYHpxVxf9LCPpvEayPDD80IjvcoQyB6ekQUYHNvbdaZnVoovjUNk
 NwIVsXY+LWfilV90erKkBaPb7Smh8nw/ggSwRACIHKzDV+/VJYJANdmyQJyVPb21Y0ns
 YJ0Ck4RozQ3CRk/93lX4vso32ZcVJ9x5ryMhjgutuiwUQ9newb3m7323GJRG45EWg//E
 WTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791010536; x=1791615336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=px65RHsNkm5sPf8ynwXsp8hdaPijL3Dj84IiQvqutS4=;
 b=gUwsDvO8yf33z6b1ieirwKaQ3LzZIS1ph/nR/IrZ9kx9NKCB3O0Wwldfar8PfMnj6c
 Rvt4xH+AUouT862QUiCl0ZMtQs5Pp0x+vNLXskBzdHhtkDNk558nMAyUI976wvGdVek/
 SL7Z3hb2EMlqL2icK3h0lsWBZ0T/Kzqok8MPwYTTB9oqTH1LTEHkV2k87Wn6z2HJfJNF
 +hWgJknzGR1SfS+tou4+l9CVyfgbae3dT4jDRebUlthl0ldRPwAFabvo+InGxFtHcI/9
 aMiEDoiF0T7zszbdLOzqmexk80EyVhB4fLnoM+pMsALWzGeLybUOKS1HVQCKx2VK+4nN
 /mkw==
X-Gm-Message-State: AFuF++nbKDuWf1/iRbNOwWEQU8AoQ5PMh+PYJH34Hol26frSlx6q7c1W
 ylTchYZd3p3SUtz3kq12zKazlN6hds0h+ArVPG6rGyQi0smHoPQsyXzZmMWtag==
X-Gm-Gg: AYBFou2dSi3ZifNkMpBTffdebZWmtKsZ4x0B6aKcdFb/detmAhJNr9WixVVThs/0r+W
 FQp4vg1qnwpCfKbYCQ6bikuGX1z/q742W+QLzg/k3C/IPy59L4QL34BAAnbFXLyjQ9wY3LTiAg1
 OeyhAPhXzfr9+1ONKfJd/HRJOdBCawLaHItUD/G5GqnmTyiOcnOLWR2SId6gexfO24VlIgcwbjU
 3a5J42MbVp59rrxO9IykxR4xrriOOg7vIAN8s440ciMcX1a/qeEpBvt0mNWPWF8JxT0GJXm/WkZ
 ewIovAUK6RH/RWvm7jNnz17k8HO6ncVXez42CyBTzzUQlexM2kyTI6jdgWj037ZAc71lj0dfDxw
 L2lC2UhssWiHIt75tLOVKv/+yK+WLTznSNW/pEAYHQC4KCvpLij2jSi9ZSxnOkFIBFkZ4uUiCsW
 fZi8s9kpq3X6/7pbAkPknVEBKJsx+89oBHJWFnFQnhnHVsHcM1B5ujZ4z0yAbZ3W3kEYsYT5v3N
 mu9tY1SCH/0jkTIEXpd2n8yc9S6+WPo9rWSrawP
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id
 5b1f17b1804b1-4a027594557mr73944085e9.19.1791010536070; 
 Fri, 02 Oct 2026 23:55:36 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280c6597sm155894705e9.9.2026.10.02.23.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 23:55:35 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sat,  3 Oct 2026 08:55:29 +0200
Message-ID: <20261003065529.117519-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/kbd: bump to version 2.10.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove one upstream patch

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 ...e-dlopen-and-memfd_create-for-libra.patch} | 48 ++++++++++++++-----
 .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 --------------
 package/kbd/kbd.hash                          |  2 +-
 package/kbd/kbd.mk                            |  4 +-
 4 files changed, 39 insertions(+), 50 deletions(-)
 rename package/kbd/{0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch => 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch} (77%)
 delete mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch

diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
similarity index 77%
rename from package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
rename to package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
index 3c83146d7..38733d337 100644
--- a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
+++ b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
@@ -21,17 +21,20 @@ Signed-off-by: Alexey Gladkov <legion@kernel.org>
 Upstream: https://github.com/legionus/kbd/commit/6ff3161c1e5d448920d412a269716cf42be155b5
 [Fiona: backport to 2.9.0]
 Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+[Francois: backport to 2.10.0]
+Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
 ---
- configure.ac               | 19 ++++++++++++-------
- src/libkbdfile/Makefile.am |  9 +++++++--
- src/libkbdfile/elf-note.c  |  3 +++
- 3 files changed, 22 insertions(+), 9 deletions(-)
+ configure.ac                 | 19 ++++++++++++-------
+ src/libkbdfile/Makefile.am   |  9 +++++++--
+ src/libkbdfile/elf-note.c    |  3 +++
+ tests/libkbdfile/Makefile.am |  5 ++++-
+ 4 files changed, 26 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 05cecab..0691167 100644
+index ffd67fe..e1a78f3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -81,7 +81,7 @@ AC_FUNC_STAT
+@@ -85,7 +85,7 @@ AC_FUNC_STAT
  AC_FUNC_MALLOC
  AC_FUNC_REALLOC
  AC_FUNC_STRERROR_R
@@ -40,7 +43,7 @@ index 05cecab..0691167 100644
  		strdup strndup strchr strrchr strspn strstr strtol])
  
  AC_SEARCH_LIBS([timer_create], [rt])
-@@ -263,13 +263,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
+@@ -267,13 +267,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
  ])
  AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
  
@@ -60,7 +63,7 @@ index 05cecab..0691167 100644
  	[PKG_CHECK_MODULES(ZLIB, zlib, [HAVE_ZLIB=yes], [HAVE_ZLIB=no])],
  	[HAVE_ZLIB=no]
  )
-@@ -284,11 +289,11 @@ AC_ARG_WITH([bzip2],
+@@ -288,11 +293,11 @@ AC_ARG_WITH([bzip2],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_bzip2=yes])]
  )
@@ -75,7 +78,7 @@ index 05cecab..0691167 100644
  	AC_CHECK_LIB(bz2, BZ2_bzDecompressInit, [
  		HAVE_BZIP2=yes
  		BZIP2_LIBS=-lbz2
-@@ -306,7 +311,7 @@ AC_ARG_WITH([lzma],
+@@ -310,7 +315,7 @@ AC_ARG_WITH([lzma],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_lzma=yes])]
  )
@@ -84,7 +87,7 @@ index 05cecab..0691167 100644
  	[PKG_CHECK_MODULES(LZMA, liblzma, [HAVE_LZMA=yes], [HAVE_LZMA=no])],
  	[HAVE_LZMA=no]
  )
-@@ -321,7 +326,7 @@ AC_ARG_WITH([zstd],
+@@ -325,7 +330,7 @@ AC_ARG_WITH([zstd],
  	[],
  	[: m4_divert_text([DEFAULTS], [with_zstd=yes])]
  )
@@ -94,7 +97,7 @@ index 05cecab..0691167 100644
  	[HAVE_ZSTD=no]
  )
 diff --git a/src/libkbdfile/Makefile.am b/src/libkbdfile/Makefile.am
-index 2511064..ebdb28d 100644
+index ea7aaf2..d301ca6 100644
 --- a/src/libkbdfile/Makefile.am
 +++ b/src/libkbdfile/Makefile.am
 @@ -10,14 +10,17 @@ headers = \
@@ -107,7 +110,7 @@ index 2511064..ebdb28d 100644
  	kbdfile.c
  
  libkbdfile_la_LIBADD =
- libkbdfile_la_CFLAGS =
+ libkbdfile_la_CFLAGS = $(AM_CFLAGS)
  
 +if USE_ELFNOTE
 +libkbdfile_la_SOURCES += \
@@ -141,6 +144,27 @@ index 842be9d..bc4a684 100644
  
  #include "elf-note.h"
  
+diff --git a/tests/libkbdfile/Makefile.am b/tests/libkbdfile/Makefile.am
+index cf31f3f..0b1f516 100644
+--- a/tests/libkbdfile/Makefile.am
++++ b/tests/libkbdfile/Makefile.am
+@@ -22,12 +22,15 @@ noinst_PROGRAMS = \
+ 	libkbdfile-test02 \
+ 	libkbdfile-test03 \
+ 	libkbdfile-test14 \
+-	libkbdfile-test16 \
+ 	$(NULL)
+ 
++if USE_ELFNOTE
++noinst_PROGRAMS += libkbdfile-test16
++
+ libkbdfile_test16_SOURCES = \
+ 	libkbdfile-test16.c \
+ 	$(top_srcdir)/src/libkbdfile/elf-note.c
++endif
+ 
+ libkbdfile_test16_LDADD = \
+ 	$(top_builddir)/src/libcommon/libcommon.a \
 -- 
 2.55.0
 
diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
deleted file mode 100644
index 1324d0b53..000000000
--- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
-Date: Fri, 5 Dec 2025 16:45:36 +0100
-Subject: [PATCH] libkbdfile: fix zlib build
-
-Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libkbdfile/elf-note.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
-index a0fd9e2..d3b8d5c 100644
---- a/src/libkbdfile/elf-note.h
-+++ b/src/libkbdfile/elf-note.h
-@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
-  */
- #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
- 
--/* For symbols being dynamically loaded */
--#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
--
- /*
-  * Helper defines, to be done locally before including this header to switch between
-  * implementations
-  */
--#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
-+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
- 
- /*
-  * Originally from systemd codebase.
--- 
-2.47.3
-
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index d46a60a80..83b45b0e8 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
+sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 6e34a45ba..12e638200 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.9.0
+KBD_VERSION = 2.10.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
@@ -14,7 +14,7 @@ KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 
-# 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
+# 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
 # modifies configure.ac and src/libkbdfile/Makefile.am
 KBD_AUTORECONF = YES
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
