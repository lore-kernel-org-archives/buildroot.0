Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB13CA0FEF
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 18:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DF860AF1;
	Fri,  1 Sep 2023 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80DF860AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxzEGlRA9K9z; Fri,  1 Sep 2023 18:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3E560BCA;
	Fri,  1 Sep 2023 18:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3E560BCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1181BF3FF
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 18:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F2544209F
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 18:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2544209F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rflb9MlOvd74 for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 18:55:15 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB064209D
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 18:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB064209D
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c0bae4da38so2107145ad.0
 for <buildroot@buildroot.org>; Fri, 01 Sep 2023 11:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693594514; x=1694199314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p1i1wzXPUN6I4tIN3bH7k3IvXkIhOHbMRqwgCKLj14k=;
 b=OHCEA3Xe+L+l7mrfOE2G/AkfWTKnAEsA3v4FoyZrW6EJJ9cptNTSH5MSt/Bp9b8aeh
 DQf2fvto5BCueMNmIJBgzdZKfLVQXYsYNcX0/Z+N7lJ0YVtVaNVmiss10+rhg+KsnvyA
 f5TPbGkAfpC2AA9chBlHSoY8AWGD/xFdL78y2e5SJffEyYETxFKg0+JaEo65Oi3TraK9
 9nebFhn2zrIckieetr9m1KKw+0OFKe0Mr2XOuoAJEUPXRb5gfv1XbWjfm93VO0t4Xl3e
 gkLnJyjis5aywMWSpF/wv7hMbsqJ/lbuIPVoeVyfi4YZQiFeVli3Z22mvtjlVti/SaVq
 fdWQ==
X-Gm-Message-State: AOJu0YzexJII/nl9i3B9D7jx2xmFWsvWs2g+h4lGno6sdmE4mmS3YknQ
 u1bTtbFZnqP+7lBd9gqw6UDeubY8tWA=
X-Google-Smtp-Source: AGHT+IHU489lyqNsw/ffb4dHdmZYuR58E1bNg2Do74svOOCXt68bu+4tZR3V3lY6/n2Q7vrMcPthjQ==
X-Received: by 2002:a17:902:e54e:b0:1c1:eb8b:799d with SMTP id
 n14-20020a170902e54e00b001c1eb8b799dmr4691225plf.21.1693594513747; 
 Fri, 01 Sep 2023 11:55:13 -0700 (PDT)
Received: from Adam-laptop.amarulasolutions.com ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 jb4-20020a170903258400b001bb97e51ab4sm3298266plb.98.2023.09.01.11.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 11:55:13 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 12:55:09 -0600
Message-Id: <20230901185509.1031327-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693594514; x=1694199314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p1i1wzXPUN6I4tIN3bH7k3IvXkIhOHbMRqwgCKLj14k=;
 b=Qbzquco1ArOIsWDuPra8nJ4pbNj6ZM0/ENWLAJNT1bQTt4CkdH6T8CRKL4xH6x+SZE
 BbTRMX9U73eo2Szgpqy5qWpDXMHNyAQp3DuJvUFRbenHDQwaIWds8XJ405hlUaDogy3W
 AxX1pwzq3VUMiVY6FZUlVSe40A1PB3ulgnlB9Q92/hvYhPA+lFXLkXHOITaPlWslf1LW
 XAStS/g0/vwHrmIEPeV/XJmPxpeSCPqh3aUjLasjbelHqwPB7s3aSXW9epG9Ay5kWVBS
 FuSXiI9BT28nan931z5iquqZ7kKBl4hGVljE3eHhvUdZuRPkYJfi6oxenwfgpODGIfFz
 3JjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Qbzquco1
Subject: [Buildroot] [PATCH] package/libopenssl: bump version to 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...002-Reproducible-build-do-not-leak-compiler-path.patch | 2 +-
 ...igure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 8 ++++----
 package/libopenssl/0005-Revert-Fix-static-builds.patch    | 4 ++--
 .../libopenssl/0006-Add-linux-x86-latomic-target.patch    | 2 +-
 package/libopenssl/libopenssl.hash                        | 4 ++--
 package/libopenssl/libopenssl.mk                          | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
index ea26a31075..9353c1ae90 100644
--- a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
@@ -15,7 +15,7 @@ diff --git a/crypto/build.info b/crypto/build.info
 index 2c619c6..49ca6ab 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -111,7 +111,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+@@ -115,7 +115,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 9f34e1f5fb..629d9c26ce 100644
--- a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,9 +21,9 @@ diff --git a/Configure b/Configure
 index 5a699836f3..f9152b1702 100755
 --- a/Configure
 +++ b/Configure
-@@ -1424,6 +1424,10 @@ my %predefined_CXX = $config{CXX}
-     ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
-     : ();
+@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
+     }
+ }
  
 +if ($target eq "linux-ppc64" && !$disabled{asm}) {
 +       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
@@ -31,7 +31,7 @@ index 5a699836f3..f9152b1702 100755
 +
  # Check for makedepend capabilities.
  if (!$disabled{makedepend}) {
-     if ($config{target} =~ /^(VC|vms)-/) {
+     # If the attribute makedep_scheme is defined, then we assume that the
 -- 
 2.25.0
 
diff --git a/package/libopenssl/0005-Revert-Fix-static-builds.patch b/package/libopenssl/0005-Revert-Fix-static-builds.patch
index 2bc0b961eb..149ad54fc5 100644
--- a/package/libopenssl/0005-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0005-Revert-Fix-static-builds.patch
@@ -16,7 +16,7 @@ diff --git a/Configure b/Configure
 index 2c17f4186b..94cab4c3c4 100755
 --- a/Configure
 +++ b/Configure
-@@ -1438,10 +1438,6 @@ foreach (keys %useradd) {
+@@ -1377,10 +1377,6 @@ foreach (keys %useradd) {
  # At this point, we can forget everything about %user and %useradd,
  # because it's now all been merged into the corresponding $config entry
  
@@ -27,7 +27,7 @@ index 2c17f4186b..94cab4c3c4 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1728,6 +1724,10 @@ if ($strict_warnings)
+@@ -1671,6 +1667,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
index a59db73314..9ecc50b1ae 100644
--- a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
+++ b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
@@ -14,7 +14,7 @@ diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
 index 2200a85b16..bcf54a2a53 100644
 --- a/Configurations/10-main.conf
 +++ b/Configurations/10-main.conf
-@@ -861,6 +861,10 @@ my %targets = (
+@@ -868,6 +868,10 @@ my %targets = (
          asm_arch         => 'x86',
          perlasm_scheme   => "elf",
      },
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index b43281c7eb..1c82cd7cf8 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.0.10.tar.gz.sha256
-sha256  1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323  openssl-3.0.10.tar.gz
+# From https://www.openssl.org/source/openssl-3.1.2.tar.gz.sha256
+sha256  a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539  openssl-3.1.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 8bc3687921..9c1dbe8694 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.0.10
+LIBOPENSSL_VERSION = 3.1.2
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
