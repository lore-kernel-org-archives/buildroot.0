Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E892C6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4DD861264
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4DD861264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBBA82F32;
	Thu, 22 Jul 2021 05:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REyTnVoszS7q; Thu, 22 Jul 2021 05:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D544782EA4;
	Thu, 22 Jul 2021 05:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D31FC1BF865
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D18607D1
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOSiJAZf5ij5 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 05:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71963607CB
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:21:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i94so4499769wri.4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=raykgCLxiZkSLoiKAtmSjpJeN7wNQpcwsbLQcPkN9C4=;
 b=nvP/Z7DBGlafLqOcTQEo9SBKjK2jv5/hiKBYktYrPO5F/15qx6lxbHz+bzOtyJowLW
 CMsj+vDe125h1DSl+cWGTpM3UlAvDr3bIP81zJmRqfjlQYy4CnZ+fq4GSS5qNWi+f4CV
 Hqitd0RftxHAr4NuRG/TP81m2Pl71ey9PN7TZehKcD/k+/lEEcaW/WSWHBI5BaKeG5CJ
 N24PKE8W1hLtqWgRqlXUzmJbfAcCOhrjYMzfY8PCNWfqOGsX4knirxMt+SOnqeTrmTnr
 wt2ISTZp0ZyF1+7sK9kC5oFLL16fvbPNr2hB/NXjr4LDYWhw0ZsfKFO+4yXsyCrl2oXk
 8U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=raykgCLxiZkSLoiKAtmSjpJeN7wNQpcwsbLQcPkN9C4=;
 b=fdsP0grEPOJHHHN5gOh890oHkT+7Xr7N1x2xoYQvvbYmDVM3nHd0z6ovUCgpegdKHx
 6ri6rzUoxVyVsIbOZADkV/QYuwgJ8rcfyES7lg7MN9D4p3asjPrjBiTKAsW24STZrk/n
 dnsmwYwmb3CQwpqCVcGPlh6kESObgx81NXYQPCxTsdJj2wLdBwJRx0Sqjt89q12TjXyF
 jlHo+vUISEXz68PdbJUymwyE20GIKTxKcgCqrXPs+XBgtlLDD+N6cE3aLCh0TMO8JqrI
 hOL5icKEwg4Zynfl3M/rZrbATvlL5JWk8uJVE+hvDjoMWISMsdibAomDOUUCyMDhQSB7
 h9Rg==
X-Gm-Message-State: AOAM5316xpn/01LMf8zunCbPK1A/6z948qD2gMwshDMZ4f8RSmn4OknO
 VP/iDN9xNClTCuB4bpXp6v5NNgD3qWQzPg==
X-Google-Smtp-Source: ABdhPJwYjXQP4P+JJ2zjogNH/qBoJRL6bAKcpyV4U+agI88cBZ65nkbmltsyyu0P93qB8rOrQH39dQ==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr47300099wru.406.1626931260184; 
 Wed, 21 Jul 2021 22:21:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 140sm24482179wmb.43.2021.07.21.22.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:20:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 07:20:27 +0200
Message-Id: <20210722052027.1197168-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/daq3: fix build without threads
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

pcap module and example unconditionally uses pthread.h

Fixes:
 - http://autobuild.buildroot.org/results/b618bcca1a83704f7f15e76cd1e7f1117cbbd464

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/0001-add-disable-example.patch | 49 +++++++++++++++++++++
 package/daq3/daq3.mk                        |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 package/daq3/0001-add-disable-example.patch

diff --git a/package/daq3/0001-add-disable-example.patch b/package/daq3/0001-add-disable-example.patch
new file mode 100644
index 0000000000..c126e32859
--- /dev/null
+++ b/package/daq3/0001-add-disable-example.patch
@@ -0,0 +1,49 @@
+From 1d7031dde8da39cd2151f87d68dddea91f304603 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Jun 2021 11:31:35 +0200
+Subject: [PATCH] add --disable-example
+
+Add --disable-example to be able to build daq on toolchains without
+threads support
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/snort3/libdaq/pull/13]
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 5 +++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dcba62b..0a79319 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,6 +7,9 @@ pkgconfig_DATA = libdaq.pc
+ if BUILD_MODULES
+     MODULES_DIR = modules
+ endif
+-SUBDIRS = api $(MODULES_DIR) example test
++SUBDIRS = api $(MODULES_DIR) test
++if BUILD_EXAMPLE
++    SUBDIRS += example
++endif
+ 
+ ACLOCAL_AMFLAGS = -I m4
+diff --git a/configure.ac b/configure.ac
+index 23b38a2..36a09ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -274,6 +274,11 @@ AM_CONDITIONAL([BUILD_MODULES], [test "$enable_afpacket_module" = yes -o \
+ 
+ LIBS=${save_LIBS}
+ 
++AC_ARG_ENABLE(example,
++              AS_HELP_STRING([--disable-example],[do not build the example]),
++              [enable_example="$enableval"], [enable_example=yes])
++AM_CONDITIONAL([BUILD_EXAMPLE], [test "$enable_example" = yes])
++
+ AC_CHECK_LIB([dl], [dlopen], [LIBDL="-ldl"])
+ 
+ AM_CONDITIONAL([BUILD_SHARED_MODULES], [ test "$enable_shared" = yes ])
+-- 
+2.30.2
+
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index a0493031d8..50e0eaccba 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -12,6 +12,7 @@ DAQ3_INSTALL_STAGING = YES
 DAQ3_DEPENDENCIES = host-pkgconf
 # From git
 DAQ3_AUTORECONF = YES
+DAQ3_CONF_OPTS = --disable-example
 
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 DAQ3_DEPENDENCIES += libnetfilter_queue
@@ -20,7 +21,7 @@ else
 DAQ3_CONF_OPTS += --disable-nfq-module
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 DAQ3_DEPENDENCIES += libpcap
 DAQ3_CONF_OPTS += --enable-pcap-module
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
