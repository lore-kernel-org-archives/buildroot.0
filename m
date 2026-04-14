Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1827CF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C6642B21;
	Tue, 14 Apr 2026 16:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGJVn7_Ir77U; Tue, 14 Apr 2026 16:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152CF42B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776182886;
	bh=8jEF0HiGcroR6NL6i6HXmS27/yk3n8dpyg0+DzTMDUc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEjtoRVLa6xRfJ2yJHk33pRrPi8KLOSfqQgrTzpjZkq2d6mKFg4q5bRWNv0U2cVbj
	 IGJjAyTT1TO32d8cgGtvPj8/oYFNjRd05HsHjou53PzGjDV3sOBO8XnkYS5HUgUavk
	 oNcV8Xj/EYY0LoHSyb36Kd2CH7u2eRvynsQd2ODVrekd0xwJ4eWyUwBUIAZ8PtkrMI
	 tBAXQugYxl5GlL4kXDUrhj5OusDpx6Uxwuo2UPiT2sdGaoVXw72iIby6ZltjYngHVG
	 h+vKEhvKsUVaxlTCRygFBuX+fQGKHb2cSgLUc7c5HRRyGgib2tYsV2rplr+VazIEFN
	 nEkukfHsTw4Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152CF42B25;
	Tue, 14 Apr 2026 16:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 886D8237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D1E540088
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJsP_x_YckAV for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41BAC40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41BAC40055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41BAC40055
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:08:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2F77A4C2DFA;
 Tue, 14 Apr 2026 18:07:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgI8-000000003ZX-1qr9;
 Tue, 14 Apr 2026 16:07:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitar Tomov <dimi@tpm.dev>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 14 Apr 2026 18:07:07 +0200
Message-ID: <20260414160708.2041081-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414160708.2041081-1-bernd@kuhls.net>
References: <20260414160708.2041081-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776182835;
 bh=YUu6WR6ftZYCk1ANh4nES6KW6n72W3sbfI1vbpJqfIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SGkHiRwAPbx593vbzh+Mr9bYEygU1voTsm0wAMd06PKr7nqNj7nARAT5WukXB+Gbv
 dfhK+kmFjkSjUy41CCb+7TF3kycbxuiQ4qgySW8oVU1t2it+Th1sKWnT2PCAQSbdC/
 hoQQ+L0AgEtDbRLGLeS2qThaPQkNWyI7VrGpY87YIiVJWSOhnfHQtY+QZmvz6ud7Pe
 vEnAnr5yiGc6U/ZDlyMueTQ0zEc4Ue8o2XtI7EvHbyclI4FU7rkK9IVLKUPSq3OhC9
 PROHoIwtlLeSwXWhTYL9RhqnBZ5uzSEOOCTsD5NXC4MVQW4mT8NxOWIqH05SzUDKyn
 tYfC3cRUif5OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SGkHiRwA
Subject: [Buildroot] [PATCH 4/5] package/wolfssl: fix build with libcurl >=
 8.19.0
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

wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
("package/libcurl: security bump to version 8.19.0") removed
SIZEOF_LONG_LONG definitions from libcurl autotools build system,
breaking build with wolfssl.

Fixes:
https://autobuild.buildroot.net/results/baa/baa74a47464ed3e21d0adad64dd0c7c708c9ef85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...TS_H-in-options.h-rather-than-config.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch

diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
new file mode 100644
index 0000000000..67f9672c2a
--- /dev/null
+++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
@@ -0,0 +1,60 @@
+From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Fri, 27 Mar 2026 17:01:02 -0700
+Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
+ types.h depends on this definition and config.h isn't consistently available
+ at runtime. Fixes #9936.
+
+Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
+
+[Bernd: rebased for 5.7.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cmake/config.in    | 3 ---
+ cmake/options.h.in | 3 +++
+ configure.ac       | 4 +++-
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/config.in b/cmake/config.in
+index f2524e41e43..6054b6dbe7b 100644
+--- a/cmake/config.in
++++ b/cmake/config.in
+@@ -19,9 +19,6 @@
+ /* Define to 1 if you have the `gmtime_r' function. */
+ #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
+ 
+-/* Define to 1 if you have the <limits.h> header file. */
+-#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
+-
+ /* Define to 1 if you have the <pcap/pcap.h> header file. */
+ #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
+ 
+diff --git a/cmake/options.h.in b/cmake/options.h.in
+index 985b54241d6..c46ada8045d 100644
+--- a/cmake/options.h.in
++++ b/cmake/options.h.in
+@@ -31,6 +31,9 @@ extern "C" {
+ #endif
+ 
+ #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
++/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
++#undef HAVE_LIMITS_H
++#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
+ #undef _GNU_SOURCE
+ #cmakedefine _GNU_SOURCE
+ #undef _POSIX_THREADS
+diff --git a/configure.ac b/configure.ac
+index bce600f2ecc..c5cf9f320c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,7 +116,9 @@
+     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
+ fi
+ 
+-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
++# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
++AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
+ AC_CHECK_LIB([network],[socket])
+ AC_C_BIGENDIAN
+ AC_C___ATOMIC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
