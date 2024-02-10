Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0270DC4829A
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 10:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF16842E7;
	Sat, 10 Feb 2024 10:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHBf4VwQdS4J; Sat, 10 Feb 2024 10:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E43C841B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E43C841B1;
	Sat, 10 Feb 2024 10:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 213AF1BF5F6
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 10:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B28A40A0F
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 10:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyZwwW6LYbvH for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 10:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81FD540A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81FD540A0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81FD540A0E
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 10:36:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20A12A4C0686
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 11:36:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52838)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rYkio-000000001QO-3NIQ
 for buildroot@buildroot.org; Sat, 10 Feb 2024 11:36:34 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 11:36:34 +0100
Message-Id: <20240210103634.3502847-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707561395;
 bh=7wuztLC5oinBqh0XbhoM/W8tfZ/5TZAHEdExhyKE5m0=;
 h=From:To:Subject:Date:From;
 b=UN3RyE7PE5LxNJu13vFCqW1npd2aEj4iUUZO9isUodNBttkSbZvWH1B90nIZTJcyu
 ojXqVRzwsUwaxW61eIhWci8hzfjIYS3UcMMRwVKdaa55XDGDzyY7nqX+oI6HrYNPfz
 RunxqIjZSEz/cphgXLgR2PBTKb767U/CJx3FHLR1Erqk3U2xVSIa5TGHkl+hK8X3bt
 poMYYL/YRtSxHm4HkPXOLMS+ydNEicKj5vuDkbheETgUp1lgwIniaU3TpsyjPL6OnX
 VRQ3fFH3ptLt4r0H31snhfhVsE2KsIxmrFkY5gb5HH1sfzv3sfXcihfiGUSvEHJL2U
 dP8ZOER0BIyMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=UN3RyE7P
Subject: [Buildroot] [PATCH 1/1] package/heimdal: Fix build with
 autoconf-2.72
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/175/175fb65f0151866cd2d83c91c23b453d8c4489f7/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...file.m4-Fix-build-with-autoconf-2.72.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch

diff --git a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
new file mode 100644
index 0000000000..655ede2af6
--- /dev/null
+++ b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
@@ -0,0 +1,30 @@
+From 2b372170c894ed9aa3fe2fca976f3541ea7041d9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 10 Feb 2024 09:33:48 +0100
+Subject: [PATCH] cf/largefile.m4: Fix build with autoconf-2.72
+
+Fixes https://github.com/heimdal/heimdal/issues/1201
+
+Upstream: https://github.com/heimdal/heimdal/pull/1229
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cf/largefile.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cf/largefile.m4 b/cf/largefile.m4
+index 5c54897be..cdbbc5543 100644
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
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
