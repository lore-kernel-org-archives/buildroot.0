Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BE5D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E434011B;
	Sat, 26 Oct 2024 21:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSDMAHq7KwLE; Sat, 26 Oct 2024 21:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1642401D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1642401D1;
	Sat, 26 Oct 2024 21:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9D75C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BEA7401D1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbyPemJmCQZV for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 025D24011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025D24011B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025D24011B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:32:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CC04A4C037F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:32:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49152)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4oOX-00000000181-1gNN
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:32:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:32:25 +0200
Message-Id: <20241026213225.2761207-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729978346;
 bh=gYRoq+bEC698QP3nRugQjWLPHDyAdaWYQFvs2sWJZ3w=;
 h=From:To:Subject:Date:From;
 b=Os/ZOb2EmY3OBp6fx4b/SoQXwCjj9tY1NdufdAGkJQ6DTW/yHBQU8QYyKrsh9X6Ol
 sMGt7BUxhHid2mXZrho4ClSm5UwbExRrJkA8Y8fEuilH3sVyXeaaMQ6jmHAltyWXZS
 HuyNYNrRWBcTyiKIwO1Qmlp1AIW2u+Jk58ulLMKUEE2nNf2mCoQU3LiTN54whpG54H
 jsX+Gnff9/jApRdRqr1o9KXIK2wv8o12DplLGtMX3FnCZUXf2WkKzx1rD0GQzkIPjK
 AV8+B1SmDsdjCnqOGun2ay8YdNwgNNcBg7xio5Xq8UuJu6Z9fwDkGGWcz0G+3vYYkV
 ku3IeiGaoGXZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=Os/ZOb2E
Subject: [Buildroot] [PATCH v2 1/1] package/heimdal: Fix build with
 autoconf-2.72
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

Fixes:
http://autobuild.buildroot.net/results/175/175fb65f0151866cd2d83c91c23b453d8c4489f7/
https://bugs.busybox.net/show_bug.cgi?id=15991

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch description with upstream commit URL

 ...file.m4-Fix-build-with-autoconf-2.72.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch

diff --git a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
new file mode 100644
index 0000000000..5b36c5a784
--- /dev/null
+++ b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
@@ -0,0 +1,27 @@
+From 1b57b62d82a478c1fade350f0fb1d57031a8734e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Feb 2024 09:33:48 +0100
+Subject: [PATCH] cf/largefile.m4: Fix build with autoconf-2.72
+
+Fixes https://github.com/heimdal/heimdal/issues/1201
+
+Upstream: https://github.com/heimdal/heimdal/commit/1b57b62d82a478c1fade350f0fb1d57031a8734e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cf/largefile.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cf/largefile.m4 b/cf/largefile.m4
+index 5c54897be4..cdbbc55431 100644
+--- a/cf/largefile.m4
++++ b/cf/largefile.m4
+@@ -10,7 +10,7 @@ dnl with generated code, such as lex
+ if test "$enable_largefile" != no -a "$ac_cv_sys_large_files" != no; then
+ 	CPPFLAGS="$CPPFLAGS -D_LARGE_FILES=$ac_cv_sys_large_files"
+ fi
+-if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no; then
++if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no && test -n "$ac_cv_sys_file_offset_bits"; then
+ 	CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
+ fi
+ ])
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
