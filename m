Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BA8C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC00408DE;
	Sat, 29 Oct 2022 08:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC00408DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9k1-_0xzre3r; Sat, 29 Oct 2022 08:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F3F40863;
	Sat, 29 Oct 2022 08:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F3F40863
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007CC1BF348
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1BD40863
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1BD40863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rVsxgp88GCk for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB26540761
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB26540761
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:45:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l14so9369626wrw.2
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQOnSzQdSol2kIQWT7HkLzFeKVPhdKdcTHdsWsZPqF0=;
 b=mEHZGUwrzqHk+cF5hoShmGDZIIMNS9z8T89SNhrjOFODVyGvE+ZAHHapsEevF9BWH/
 uDuhxMeEZaOB11GibGSGhzr/rZw+b90EJRF8CHdFM4YT5IgwI/ZGnsbPsotnYKboN102
 kOPIvWxrumx3G+Ik5/7q1A+MrUX+wcFA4f0Mgm3qhIzVh6PU7dBd7N5q34YpFIFe9hwC
 9NumnwR+BNMVMLezLOAGmAcXC73YZMABiZ2xtyrmwHoV/Go/YH25IEvkEUfe91pQwjXS
 zkpuf6HVd1jZXFCq7RFfdryqoAD6AFAk1Uwh0Z+6xCmKqibUzB3CRg30Fv8nMl94Mj6w
 XUFA==
X-Gm-Message-State: ACrzQf3URpdt3NXZkzH2g//NedlsPrfhSEnkfDV3AT6Dpucixqo2KraF
 S5516gPP1z0hCmD/3xA8mfUgWT8NbLk=
X-Google-Smtp-Source: AMsMyM5EKs7VCaLVQ5yzvIkJ/lXuIIqCsOHAm15PrcWT5TfZJ9Duu64QzIIQoB/EioGN94VnWGCYEQ==
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id
 f15-20020a5d50cf000000b0023686df257fmr1841226wrt.374.1667033106400; 
 Sat, 29 Oct 2022 01:45:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m19-20020a056000025300b0022cdeba3f83sm935899wrz.84.2022.10.29.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:45:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 10:44:55 +0200
Message-Id: <20221029084455.97704-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
References: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQOnSzQdSol2kIQWT7HkLzFeKVPhdKdcTHdsWsZPqF0=;
 b=dO75LwFRrSqfxSVjM0VjGGG8wZeTR5bqP2nFr728kpATVgOFj49CAr5V1ZWyA65RYz
 ZnqUN2hf10CoRqoz5rGdibRaT+iYti/i+2qE5cy8RIJ1GuFBfrT6rSARnclk2JMHDZdt
 QFPe21mGaKEJXgaSTIw00+VY8J5vTAsrZfwMUhJOkzjsmWS5zYf3WeEH5n+Z78PUM6Yu
 G+N8HWhzKQqU0+XdBKvsjifSDrApK8BnE08Nkl3o2Seua2UigVk3TK0l9xAAG0TllPQa
 d4n00qvGC4cvpQCnPKgx39zPFJ+REkl9Gp0jmbZh5Ick/GJ3x9QoEPrOyEcrLWQLlN4P
 kGcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dO75LwFR
Subject: [Buildroot] [PATCH 2/2] package/numactl: bump to version 2.0.16
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Use official tarball and so drop autoreconf

https://github.com/numactl/numactl/releases/tag/v2.0.15
https://github.com/numactl/numactl/releases/tag/v2.0.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Do-not-stringify-SYMVER-symbols.patch | 25 ---------
 .../0002-link-with-latomic-if-needed.patch    | 52 -------------------
 package/numactl/numactl.hash                  |  2 +-
 package/numactl/numactl.mk                    |  6 +--
 4 files changed, 4 insertions(+), 81 deletions(-)
 delete mode 100644 package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
 delete mode 100644 package/numactl/0002-link-with-latomic-if-needed.patch

diff --git a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch b/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
deleted file mode 100644
index c6981aaf73..0000000000
--- a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f96c96af7fbf2779b15f66f03b10315a24fb4f5a Mon Sep 17 00:00:00 2001
-From: Scott McMillan <smcmillan@nvidia.com>
-Date: Fri, 9 Oct 2020 08:56:52 -0500
-Subject: [PATCH] Do not stringify SYMVER symbols
-
-Upstream: f96c96af7fbf2779b15f66f03b10315a24fb4f5a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.h b/util.h
-index 99ada33..f2a20ac 100644
---- a/util.h
-+++ b/util.h
-@@ -22,5 +22,5 @@ extern char *policy_name(int policy);
- #if HAVE_ATTRIBUTE_SYMVER
- #define SYMVER(a,b) __attribute__ ((symver (b)))
- #else
--#define SYMVER(a,b) __asm__ (".symver " #a "," #b);
-+#define SYMVER(a,b) __asm__ (".symver " a "," b);
- #endif
--- 
-2.30.2
-
diff --git a/package/numactl/0002-link-with-latomic-if-needed.patch b/package/numactl/0002-link-with-latomic-if-needed.patch
deleted file mode 100644
index 6dff0cb233..0000000000
--- a/package/numactl/0002-link-with-latomic-if-needed.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 6 May 2021 23:08:36 +0200
-Subject: [PATCH] link with -latomic if needed
-
-numactl unconditionally uses __atomic_fetch_and but some architectures
-(e.g. sparc) needs to link with -latomic to be able to use it. So check
-if -latomic is needed and update numa.pc accordingly
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/numactl/numactl/commit/e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9]
----
- Makefile.am  | 1 +
- configure.ac | 2 ++
- numa.pc.in   | 1 +
- 3 files changed, 4 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 44d0d76..34f6815 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -151,6 +151,7 @@ SED_PROCESS = \
-         -e 's,@exec_prefix\@,$(exec_prefix),g' \
-         -e 's,@libdir\@,$(libdir),g' \
-         -e 's,@includedir\@,$(includedir),g' \
-+        -e 's,@LIBS\@,$(LIBS),g' \
-         < $< > $@ || rm $@
- 
- %.pc: %.pc.in Makefile
-diff --git a/configure.ac b/configure.ac
-index 659a765..e3b0eb3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,6 +24,8 @@ AM_CONDITIONAL([HAVE_TREE_VECTORIZE], [test x"${tree_vectorize}" = x"true"])
- 
- AC_CONFIG_FILES([Makefile])
- 
-+AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
-+
- # GCC tries to be "helpful" and only issue a warning for unrecognized
- # attributes.  So we compile the test with Werror, so that if the
- # attribute is not recognized the compilation fails
-diff --git a/numa.pc.in b/numa.pc.in
-index 8a0f202..cc04d50 100644
---- a/numa.pc.in
-+++ b/numa.pc.in
-@@ -8,3 +8,4 @@ Description: NUMA policy library
- Version: @VERSION@
- Cflags: -I${includedir}
- Libs: -L${libdir} -lnuma
-+Libs.Private: @LIBS@
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index a261eab9d0..757001b750 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
+sha256  1b242f893af977a1d31af6ce9d6b8dafdd2d8ec3dc9207f7c2dc0d3446e7c7c8  numactl-2.0.16.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 6ff94091e9..b2f349255f 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.14
-NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
+NUMACTL_VERSION = 2.0.16
+NUMACTL_SITE = \
+	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
-NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
