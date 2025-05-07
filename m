Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BDBC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE9D40D42;
	Wed,  7 May 2025 14:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCiAVKiaNcKk; Wed,  7 May 2025 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D885B40D14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D885B40D14;
	Wed,  7 May 2025 14:46:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB71DEDF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 14:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86E540B39
 for <buildroot@buildroot.org>; Wed,  7 May 2025 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCUga89FLfqA for <buildroot@buildroot.org>;
 Wed,  7 May 2025 14:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E6B4403E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6B4403E8
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E6B4403E8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 14:46:39 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22e661313a3so8710515ad.3
 for <buildroot@buildroot.org>; Wed, 07 May 2025 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746629198; x=1747233998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oCGjcTAN/l1D7f/Gp3BuJ0RajnieI+IFU1xwsR5uhIw=;
 b=knaYywAVmG8zPB+YJ5Qx8uhBUMHgAA/BKe5ktFrT9Y8pTmebPZTvfB57YUpIb8L+gA
 SvVQm/hqCU5KekMDxPSEkOwWsv2Czoa0dxR+5O9rM5GY6lGIaH82ri5VuA5V3Y3vnKCK
 /Iv/1T6owh/YeIHRhEY1zJYB2hKhdaTD5hGn5/3A4E8S4eXh5M6nBWckqN4XKN9QZdtm
 FxeafBYcG0grGtQoijRZdC6t73cTUM7LA81eafYRLxWr0nGnwNotYkInwXE36aPxIeyx
 iCjFe8cIhNPLXPZ1Ni3wTCN0SU2jkwR4bL4NZMvq21Bf3muAnCG+nNe4JldGe8FHKNeJ
 3/IA==
X-Gm-Message-State: AOJu0Yy+WaIh9qT1zQ0l3/gTTK0/ij2gncCqk0wjnVCXVBX3FLwXuyng
 azJKLGHb1l35l3eM5QpYDbkmBvb3L3eXX52wt7bpeeFsU2W0n7b9gpiYCRyV
X-Gm-Gg: ASbGncs/Xfj1dEjOvRApvMTrkncgzTg+WeXdTdRsvaudI6hd5+cNyCA1F1R4NncuSok
 /nAXz61eUnztsX2TQnG2k/RQy8n/18jkETouDel/uU0Lj80iaFfjONDQk/5L/FQdth6TSme3g9p
 FSSDo3FDBdibKilgqU2eGSzyAxgzl2maAOONUeerZPauh4EyYJY14dIXlwdAHW5ycpoS4Ku0K3N
 trRIRZIRuMPFTorevHlcBIU8hNqhg2h6Dre9r/ORDQnaHNT6CvS+peaKAt+gyDth36nAu2Hd3Ak
 ERPduyN/Q1ast7uuZ9+l+mKP9PRyU7511JA0McbKK9PiBqaRiRaGwJvHLStvcmVAoKAUEKMaYix
 LUXpR1TuWSKKhiSyyfyKBLwlDXjA=
X-Google-Smtp-Source: AGHT+IFZNprf7Id2y7zKX30BmWG3X/xd8eKBAlrWywE2HaMiCRma3QWZb/DCbl5pR3rZHyeyerf7eA==
X-Received: by 2002:a17:902:e48a:b0:22e:62f0:885f with SMTP id
 d9443c01a7336-22e62f088c2mr31663745ad.40.1746629198122; 
 Wed, 07 May 2025 07:46:38 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e659c92cdsm15322105ad.28.2025.05.07.07.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 07:46:37 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Wed,  7 May 2025 07:46:33 -0700
Message-Id: <20250507144633.8255-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746629198; x=1747233998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oCGjcTAN/l1D7f/Gp3BuJ0RajnieI+IFU1xwsR5uhIw=;
 b=nl/o2L5Lg4LL2RJSW8yqM13+Wuzb/nio1wo/JUwiy71xV+AoNbbkoP1UJCpM/NBfwf
 ib1MEE1AMHP8lW2ekOhRqClueL4D4QXzNr1wtDYC1FY/V/QZ14alfvt/0Ms5pox878pG
 Fh1Poi/Ztsfa3cl9d5ltReNiyu1JwDGym1ZOFyOlIBTzLRtsHLv5cMEgxkIpOVsHMSem
 5HqUgCAxXR2AM9Q5Kk2ppwS9TRKxR0onEkScs/gQJi7hupz4s/rz73PFDKEgpu+Z2bW7
 rngClXQyizgmr2GK48Tt+16UVx1oCA3x5/lTdCeaRxXHJo7NUvRnWk2HcH3n7+URd5FR
 wRtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nl/o2L5L
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to 3.5.0
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

Release notes:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.0

Changelog:
https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35

Rebased patches for the new version.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
 package/libopenssl/libopenssl.hash                          | 4 ++--
 package/libopenssl/libopenssl.mk                            | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 629d9c26ce..2634d69f35 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 4 insertions(+)
 
 diff --git a/Configure b/Configure
-index 5a699836f3..f9152b1702 100755
+index 15054f9..ac3206e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
+@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index b4b78c97fc..e800b782ad 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index 2a5e58805c3b..0e8c1ce5cc74 100755
+index ac3206e..764ef89 100755
 --- a/Configure
 +++ b/Configure
-@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1764,6 +1760,10 @@ if ($strict_warnings)
+@@ -1807,6 +1803,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 5924c5d46a..9f8b23005a 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.1/openssl-3.4.1.tar.gz.sha256
-sha256  002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3  openssl-3.4.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
+sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c1c5b818d7..5e785e1bf0 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.1
+LIBOPENSSL_VERSION = 3.5.0
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
