Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A087DF3ED44
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 10:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5187E83F07;
	Sat, 11 Apr 2026 10:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91YVJitT5hYy; Sat, 11 Apr 2026 10:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 654AD83F09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775903362;
	bh=qwIzZBlPop5eu25DyNdc6QIiQOwJk2ze11M3fDDEHy4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Xj9MYsxKMOvmx5aHd7ipX4hEo7ycRM/723MIBhSErRyWUiN8WI5NkfstAREN7Hyck
	 7JuqjoBZmjvwnfOIDGOR4/61PqSsvkzpS2ME+tsdlMQA0riC5M4l5ZDCcORqHbH7GV
	 YFfKonQxJjFyx6rVa4HHU9YVV1DVYsXrQy/f8cASAQRNYw0lLOWm/L1CKn3py7M+Ln
	 rU6n7Q6nOT76sQYFglPtmMfUOOIZzpDJBY2mtyeU9d+BKsq42AkkiVZEg8Uq8ft1kJ
	 yU+2Kmbd5OGdBy0M2YkLplYHL+uI8I4TB7mlmt4hdDttgKMDZUBedH3N8B5sWT3u+/
	 1EKMIbvXb68Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654AD83F09;
	Sat, 11 Apr 2026 10:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 580BD194
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 10:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B4C40076
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 10:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fw5y5osbnFOe for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 10:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C7A340181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7A340181
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C7A340181
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 10:29:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c02a.dip0.t-ipconnect.de [79.214.192.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4E26A4C0734;
 Sat, 11 Apr 2026 12:29:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44810)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wBVaX-000000008V4-0I5v;
 Sat, 11 Apr 2026 10:29:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 12:29:17 +0200
Message-ID: <20260411102917.2045764-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775903357;
 bh=eCNe5dPUnF1EvatmVe3hbjcH64JrHExEWRSqIOyzSg0=;
 h=From:To:Cc:Subject:Date:From;
 b=MRGzMjlqB5ScnORHccrSHfRRnba+2/IAOXuKWJaU6B8giWrA3ySnkF0FZra2BEtyO
 NutP1GSC5LBXA7W+68EnszPouz25VmkuZ03eQGiZkXSmbr6OUR5CMXgGShL31niEy9
 eDz4fCKeiyIQLuqc7g5oyIklTXTnKiiE+oZm0FmcBoA8FMZMMDAZUnXAI6nD6QKHfP
 O+dS9ontZHNFkdYDncniC2bB/fjbLcvDdYe5jPjnMtlUA5HuZOXZw8fhmIk/c1M3Nr
 qAAW/BW9Jf52yh5XiSi8DGIeh3PUsIEC0BY+b3zue21AZ3ajGCYK4jGk6kxXwI1byw
 Rlx7fs57H2ToQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MRGzMjlq
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: fix build with libcurl >=
 8.19.0 on 32bit archs
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
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
Please note that Baruch sent a fix to libcurl:
https://patchwork.ozlabs.org/project/buildroot/patch/ec612e55099118043d351762107b9c1a18387130.1775471071.git.baruch@tkos.co.il/

although the problem should be fixed in wolfSSL instead, see
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=294287
https://github.com/wolfSSL/wolfssl/issues/9936
for details.

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
