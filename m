Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5F5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 11:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0370361057
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 11:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0370361057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A16E76076B;
	Tue,  7 Sep 2021 11:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDd0hk0eGF5h; Tue,  7 Sep 2021 11:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A56605F6;
	Tue,  7 Sep 2021 11:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AD451BF2CD
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 11:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A7DC403CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 11:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2JWGoGeCm7k for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 11:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A562840420
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 11:46:00 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y128so12382210oie.4
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 04:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlJ9ocbL6EIn5LBGbmJpxWstOi1e79DRA+AdUmMM6Js=;
 b=grT4CD87nVkhz3PA4Az3if+Gm672+gDwa7/ssBl6lTl5nGyMSGVWkk/7NpRNm7ugK8
 yt7Gbf+15lTwORZkTXTVWY0PFnNQlXQLRS4W6/YDdPz8tBankxPeeIwVWHDzOT7XgGdS
 MadOIm8ooOSGVvxT0dOjTBtTI2u9tIrhoVDhvUtH4NJjEitG0x1iQSbm0vtnFBxyriu7
 qGeWAeNWycGnEx1elCda0r/Ks/aw+Lu9e8UwnvALodNqq//ZXfaBhRuCkD/0EYlR0whe
 ZQQ6ZYimRmztvurSE01Jy8Qpz41ZGzX9gUlumazF/l2AW0narTEs272UH62Su5eHvhn2
 1TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlJ9ocbL6EIn5LBGbmJpxWstOi1e79DRA+AdUmMM6Js=;
 b=oD1BtYTDgyzVTVnSgx8K/1a5GeffK+Fw9cfGq6yGbBFgDlZ5+lSsjeTXxCHGMid3WH
 i449lGROyiRmui2RNOX+MuzKZ4efxa2sRmMhJTpfeuEH+ZpV3gk1pMICdGUY2rQ+gYxJ
 c0u3toxJDPqYhvTJxIG+5u8T7oirZEofvpGkPxfEp5knLhunuRy0uUkUeyHOA+cMP+Zy
 GP1uGB7nU4BRfrfBWuJJyznnl+Px7OgQfkIMlR1Ql8bfuMcEVCW8UsENyiWAmWOfp9K/
 ymxyE9IPGKKEK8BPm4oRkYaDV4mOqz38/eQXE7XzkoEbNfriF4KKsn4DDXfmznKWZ83b
 NdXQ==
X-Gm-Message-State: AOAM531KYotZclOfoGe7q2oLx1r+rGCb5ByOJfmm42SiWMtKrbN9JVBv
 TWYwUJB7u0vpXHHeV43oY0a2o0lFrgo=
X-Google-Smtp-Source: ABdhPJzdvQj1MFxlRaBMJYMYSTFNt5QclOSo+aOskgseSbF7Q1RbvHJncottyjefCfLxc8GhpfGaJQ==
X-Received: by 2002:aca:a996:: with SMTP id s144mr2533853oie.175.1631015159347; 
 Tue, 07 Sep 2021 04:45:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-233-80.hlrn.qwest.net.
 [97.118.233.80])
 by smtp.gmail.com with ESMTPSA id v186sm2053889oig.52.2021.09.07.04.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:45:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 05:45:56 -0600
Message-Id: <20210907114556.3977493-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.69.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Rebase remove cpp requirement patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../libglib2/0002-remove-cpp-requirement.patch   | 16 ++++++++--------
 package/libglib2/libglib2.hash                   |  4 ++--
 package/libglib2/libglib2.mk                     |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index 9393bd258a..691f3147ef 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -1,4 +1,4 @@
-From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
+From 36f4c37fb2a27d93cd58460fa9cc54a0c1cd957e Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
 Date: Mon, 16 Sep 2019 10:12:38 -0700
 Subject: [PATCH] remove cpp requirement
@@ -17,7 +17,7 @@ https://gitlab.gnome.org/GNOME/glib/issues/1748
  3 files changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
-index 7ef8c48..128e65d 100644
+index 873cb0314..5ada525f7 100644
 --- a/glib/glibconfig.h.in
 +++ b/glib/glibconfig.h.in
 @@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
@@ -29,13 +29,13 @@ index 7ef8c48..128e65d 100644
  /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
   * is passed ISO vararg support is turned off, and there is no work
 diff --git a/meson.build b/meson.build
-index 4bbf4c2..ac59f4e 100644
+index 4f1178aa4..a087d6e27 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.2',
+   version : '2.69.3',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
+@@ -1697,20 +1696,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2330,7 +2315,6 @@ subdir('gobject')
+@@ -2340,7 +2325,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
@@ -76,7 +76,7 @@ index 4bbf4c2..ac59f4e 100644
    subdir('tests')
  endif
 diff --git a/tests/meson.build b/tests/meson.build
-index e4ea226..7fd974c 100644
+index 6741f8f52..316cf2527 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -55,11 +55,6 @@ tests = {
@@ -92,5 +92,5 @@ index e4ea226..7fd974c 100644
  
  test_extra_programs = {
 -- 
-2.23.0
+2.25.1
 
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 15e0085f78..b045a74a46 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
-sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
+# https://download.gnome.org/sources/glib/2.69/glib-2.69.3.sha256sum
+sha256  47af2c6e06becee44d447ae7d1212dbab255b002b5141d9b62a4357c0ecc058f  glib-2.69.3.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4f13622e36..4315ceca52 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.69
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
