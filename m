Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AFDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AA460BDA;
	Wed, 13 Apr 2022 07:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-9ZwKod8Mf9; Wed, 13 Apr 2022 07:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084BF610C3;
	Wed, 13 Apr 2022 07:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35FE71BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 322E760BA1
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WC8MBLe-r3lz for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:34:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gateway.work-microwave.com (gateway.work-microwave.com
 [185.170.114.92])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 031A760B9B
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:34:40 +0000 (UTC)
Received: from mail.work-microwave.com (mail.work-microwave.com [10.9.5.20])
 by gateway.work-microwave.com (Postfix) with ESMTPS id 81D8540223;
 Wed, 13 Apr 2022 09:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.work-microwave.com (Postfix) with ESMTP id F18A7F22A35;
 Wed, 13 Apr 2022 09:25:47 +0200 (CEST)
Authentication-Results: mail-wsvr1.work-microwave.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=work-microwave.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 work-microwave.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1649834745; bh=u+V7qY+DAg0DT2dB5SYNlbQLIjT6eZyxdgz0pf
 R0Yrc=; b=tbmEJk5zGbxwMA93hfM5lGAlrXXRdTBJZ4fNVFJK/4umMVOdlDg+no
 acncVa29CE3mwb5Wlv9l1llrMmNLT+Yw8oOaRARs0AwT0M1qvR2chKRdS+q12bsK
 FOYpGMoZ0wC0f2Nh3dTeHqYfmWRKNqyplsokT08vhxtDmTxEp9iIg5Zi2JA9infE
 +0hPH/opcmtNJ/GRI2fOXU40XpK2lYCiqtmjSbE9nx8TBUlk/XVjjVhEjCGN5Kj3
 /KtgPYmGCnSi8huNWZ/M/rxfS0hv6nA4zX+6V3uYc5gvnSVCCx1Xn97Julhr7ZoQ
 1VvJA5Zuxd90890h1Ik+AFUY9wHhEcgg==
Received: from mail.work-microwave.com ([127.0.0.1])
 by localhost (mail-wsvr1.work-microwave.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id VxRR8Z4DjFCo; Wed, 13 Apr 2022 09:25:45 +0200 (CEST)
From: Johannes Agricola <johannes.agricola@work-microwave.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:24:46 +0200
Message-Id: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libwebsockets: Require C++ toolchain
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
Cc: Johannes Agricola <johannes.agricola@work-microwave.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Autobuild for libwebsockets failed as a C++ toolchain is required:

http://autobuild.buildroot.net/results/f9631db632211e610b8a146e22bffda0ffb8fa28/build-end.log

Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>
---
 package/libwebsockets/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index d7b529cafd..59d1e1097f 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_STATIC_LIBS && BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
@@ -9,5 +9,5 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 
 	  https://libwebsockets.org/
 
-comment "libwebsockets needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libwebsockets needs a toolchain w/ dynamic library and C++ support"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
