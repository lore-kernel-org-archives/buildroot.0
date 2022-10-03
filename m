Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A188C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1807882F57;
	Mon,  3 Oct 2022 15:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1807882F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1KQiLw66EtS; Mon,  3 Oct 2022 15:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E6382F76;
	Mon,  3 Oct 2022 15:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E6382F76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9841BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34BC882F57
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34BC882F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuK-YnhqAlqm for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:06:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E7782F51
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06E7782F51
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:06:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m15so14969972edb.13
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HgE8Dvw/ViqmU5O2aoneyCQgsI0RLdkoirHoGYR0BRM=;
 b=0KAwYt6Qc7OSM5mtaCpvrfiX5NvSgQ+mxax8fxxshjCkmCFGKnMw49pHktu7BDLHwY
 7ymuPGpC9XP1hdeDThNwGNC/161q9XIGQM2+WELMstAQowKbs0/3QVKmTZa12VTQ8dsl
 0/t+oHN5OhIAkSp/6UDkEHLnW6mms4vfRHR3PG27fr9FZbqGgM1C4gF0ZGb8OQbPmmcZ
 E1oxgEjHIGCgRvvRNibcOMmfzblX/U+ck5ngggrxrpEk6WhDpg0hF0vCMqaGoH7C16El
 0SpH9KDab4QxWwEVy2I4p4xtX062bQutgP2ReujJg5s1h0+RytEuvYYewbBr3tZn/ztS
 O4BA==
X-Gm-Message-State: ACrzQf1K5+Qsp0FJGcQJF55fqhK3Y0WzePR06pu58ipH6ss2YWFpNVh8
 CQtV1UfzB5KcorQgVhGKUafi9rghJcYGkQ==
X-Google-Smtp-Source: AMsMyM5v2F6JyhZ3a7i2qRiPyCKk648FrAY9J9MRKXvjzKcKqxGypYmU4RRLzgm1PhW0srmVr5e/MQ==
X-Received: by 2002:a05:6402:169a:b0:458:fe61:d3b4 with SMTP id
 a26-20020a056402169a00b00458fe61d3b4mr4640750edv.140.1664809572215; 
 Mon, 03 Oct 2022 08:06:12 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090631ce00b0078135401b9csm5579608ejf.130.2022.10.03.08.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:06:11 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 17:06:09 +0200
Message-Id: <20221003150609.3235085-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HgE8Dvw/ViqmU5O2aoneyCQgsI0RLdkoirHoGYR0BRM=;
 b=cxGGuPQHTU8eOMoL/UUUFV87g4qc8oCwjVJNKGHJDqwrM7/hYUNJma6wbl1mlByb1r
 y7Jk1ECc/On8sxTSpU/L+E1HHDuKAEmXeP0CjRXxN4avJ0r9GbL+2ESzmB0qLuJ45ASG
 MWlCfKOIs1+QLvLxY18AG0kakO8RlD/c4OOK4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cxGGuPQH
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.8
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Updated to the new PCRE2 dependency
* Removed unneeded patches (file m4/stack-direction.m4 is not there)
* Removed autoreconf step because unnecessary after not patching m4
  anymore

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...01-sigsegv-fix-build-on-microblazeel.patch | 32 -------------------
 .../grep/0002-sigsegv-fix-build-on-or1k.patch | 32 -------------------
 package/grep/grep.hash                        |  4 +--
 package/grep/grep.mk                          |  8 ++---
 4 files changed, 5 insertions(+), 71 deletions(-)
 delete mode 100644 package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
 delete mode 100644 package/grep/0002-sigsegv-fix-build-on-or1k.patch

diff --git a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
deleted file mode 100644
index 06869b716e..0000000000
--- a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3079cea1b18fe72aa1da6b04e561abfb36f4f443 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 09:57:23 +0100
-Subject: sigsegv: fix build on microblazeel
-
-Fix the following build failure on microblazeel with diffutils 3.8:
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=3079cea1b18fe72aa1da6b04e561abfb36f4f443]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- m4/stack-direction.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index c90d69733..70286c8f5 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       m68* | \
-       m88k | \
-       mcore | \
--      microblaze | \
-+      microblaze* | \
-       mips* | \
-       mmix | \
-       mn10200 | \
--- 
-cgit v1.2.1
-
diff --git a/package/grep/0002-sigsegv-fix-build-on-or1k.patch b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
deleted file mode 100644
index 73385fe9f7..0000000000
--- a/package/grep/0002-sigsegv-fix-build-on-or1k.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 10:06:31 +0100
-Subject: sigsegv: fix build on or1k
-
-Fix the following build failure on or1k with diffutils 3.8
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 70286c8f5..29e398d77 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       nios2 | \
-       nds32* | \
-       ns32k | \
-+      or1k | \
-       pdp11 | \
-       pj* | \
-       powerpc* | rs6000 | \
--- 
-cgit v1.2.1
-
diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 29d9eb1cd6..6f3bca89ad 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz.sig
+# http://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
+sha256  498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382  grep-3.8.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index a485f23dc7..318e00940d 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.7
+GREP_VERSION = 3.8
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CPE_ID_VENDOR = gnu
-# We're patching m4/stack-direction.m4
-GREP_AUTORECONF = YES
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
 GREP_CONF_OPTS = --exec-prefix=/
@@ -40,9 +38,9 @@ GREP_DEPENDENCIES += libiconv
 endif
 
 # link with pcre if enabled
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 GREP_CONF_OPTS += --enable-perl-regexp
-GREP_DEPENDENCIES += pcre
+GREP_DEPENDENCIES += pcre2
 else
 GREP_CONF_OPTS += --disable-perl-regexp
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
