Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4133C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9097A60B10;
	Sun, 27 Nov 2022 13:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9097A60B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tadZzwEcYQ4r; Sun, 27 Nov 2022 13:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB98B60AD2;
	Sun, 27 Nov 2022 13:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB98B60AD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89A61BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A184060AD2
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A184060AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXJIyiqVPndP for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:07:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A45C605A1
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A45C605A1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:07:59 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-14286d5ebc3so10202178fac.3
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cqdnmzB1uck8A5PFV23hRp+qyirNspWzYVEiHTntrY=;
 b=lotHCEY1qPPNnVGBo/Qg6wVyKlovGtMstEEIScfwZ6yxaGBrfj9QdzM4aqoNjt63M3
 Pv0N+FmXIr9GAHWQY4BhfmCK+qcx+uz/o1vOPQ8KCzo4J62HluDqxMOaUPQ41iGCnkSA
 DY7XKui1OZweE5B1rccUC1KaCQHqmyNYBTWB2aa3aigBua1UD5jdprAhkHB2vB77wQmx
 rvXw6FiTutChM7U94v3bt6ZOpHccgoVJfW/CbkllHaQczsAnpkSMCwkRJXwuxyULxIm1
 zSCV9yaO9Vro5aFCPE+aYeOJYm2V18pPCIRPbYkt9ZZbBYDnjmMWb0hoedYFou5NqCXJ
 TZKw==
X-Gm-Message-State: ANoB5plOo0JbEWnQbJiw0SmE3wCGSj+C4hA7fASxuxEHjWkHWOEFjlNu
 oXgaeFnCrxkMsASJoRB5EYlPonSNZUE=
X-Google-Smtp-Source: AA0mqf7gwfTxwbEPyrVxgJ0Pdjng6MapG3L734Lr2S9YyZD2lUB096dLrQDUHWik0IjilTYDrKDHCw==
X-Received: by 2002:a05:6870:9d09:b0:143:2972:e928 with SMTP id
 pp9-20020a0568709d0900b001432972e928mr12539702oab.69.1669554478396; 
 Sun, 27 Nov 2022 05:07:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:07:57 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:15 -0300
Message-Id: <20221127130739.1862398-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cqdnmzB1uck8A5PFV23hRp+qyirNspWzYVEiHTntrY=;
 b=ON7EHo+Sv4BCTKHHd4gXJ3xPfivbUlv4MjIfRpWEA9est7g1Zyob5vJ9amXARGSeED
 3b1Jns8dYUnCGmm6nlO5ZKfFWZgYOalkJ7rqWZPE/Cmtd6JPdaSfoF+5UrZq+wRyRjor
 WEnN6o8H78OxmseyG4BEUMRwbMM4ZJCg72fO2tKbbN/TxGoP1b9R+zbMVeAZUjZ0OILK
 7iMJ+3dztaHJfStPRRufHlp60wy1Kj7dfEOcnt/fOLXQYppGwjLP1A7Ia651IDJ/3Hrn
 uqWHNDBd95fd4UyX3RBBkFjFd2ZSaZxPdNt38RTp9iygs2r2VYARlFsDVWnxhgi0SnDX
 OdrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ON7EHo+S
Subject: [Buildroot] [next 01/25] *: fix typo for separate(d|) in text
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

seperate is a common misspelling of separate

Fix all the typos in the tree that are not related to patch files.

CHANGES
  seperate -> separate, in the list of changes
Config.in.legacy
  seperate -> separate, in option name and help texts
package/leafnode2/leafnode2.mk
  seperate -> separate, in a comment
system/Config.in
  seperated -> separated, in a help text

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 CHANGES                        | 4 ++--
 Config.in.legacy               | 6 +++---
 package/leafnode2/leafnode2.mk | 2 +-
 system/Config.in               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3090466d2e..192546993f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7475,7 +7475,7 @@
 
 	Architecture: Default to bf532 CPU variant for blackfin,
 	Fix flat one memory region support for m68k and disable flat
-	seperate data support because of compatibility issues.
+	separate data support because of compatibility issues.
 
 	Defconfigs: Minnowboard and Raspberrypi: Fix errors with
 	post-build scripts when systemd is used.
@@ -8011,7 +8011,7 @@
 
 	Minor fixes.
 
-	Merged/seperate /usr handling is now also performed for
+	Merged/separate /usr handling is now also performed for
 	staging so cross-gdb / gdbserver can find the libraries.
 
 	Updated/fixed packages: autossh, conntrack-tools, dcron,
diff --git a/Config.in.legacy b/Config.in.legacy
index 17f0858e70..284e7bf887 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3240,7 +3240,7 @@ config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
 	select BR2_PACKAGE_RESTORECOND
 	help
 	  The policycoreutils package no longer offers restorecond
-	  as a option.  This package has been moved into a seperate
+	  as a option.  This package has been moved into a separate
 	  package maintained by the SELinux maintainers.
 
 config BR2_PACKAGE_SEPOLGEN
@@ -3834,7 +3834,7 @@ config BR2_GDB_VERSION_7_9
 comment "Legacy options removed in 2016.11"
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-	bool "PHP CGI and CLI options are now seperate"
+	bool "PHP CGI and CLI options are now separate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
 	select BR2_PACKAGE_PHP_SAPI_CGI
 	select BR2_LEGACY
@@ -4864,7 +4864,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_VUPLUS
 	select BR2_PACKAGE_KODI_PVR_WMC
 	help
-	  Kodi PVR addon was split into seperate modules
+	  Kodi PVR addon was split into separate modules
 
 config BR2_BINUTILS_VERSION_2_23_2
 	bool "binutils 2.23 option renamed"
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index a02aad4302..e82ca2e1ee 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -23,7 +23,7 @@ LEAFNODE2_CONF_OPTS = \
 	--enable-runas-user=root
 
 # Leafnode2 needs the host version of b_sortnl during
-# compilation. Instead of creating a seperate host package and
+# compilation. Instead of creating a separate host package and
 # installing b_sortnl to $(HOST_DIR) this binary is compiled
 # on-the-fly, host-pcre is needed for this
 define LEAFNODE2_BUILD_SORTNL_TOOL
diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..e6dcd25455 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -443,7 +443,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
 	default "C en_US"
 	depends on BR2_ENABLE_LOCALE_PURGE
 	help
-	  Whitespace seperated list of locales to allow on target.
+	  Whitespace separated list of locales to allow on target.
 	  Locales not listed here will be removed from the target.
 	  See 'locale -a' on your host for a list of locales available
 	  on your build host, or have a look in /usr/share/locale in
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
