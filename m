Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4ACC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 14:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35A761040;
	Wed, 21 Sep 2022 14:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E35A761040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2SajR75T7-z; Wed, 21 Sep 2022 14:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B85F61035;
	Wed, 21 Sep 2022 14:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B85F61035
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F07C1BF239
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 14:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A9CE80E4F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 14:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9CE80E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-6MeBWrimk6 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 14:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213EF80DCB
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 213EF80DCB
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:33:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s14so8219943wro.0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 07:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3CDU8juCqQLaHnok5vlFp9KJpA4wyjqk8eCehmkGvLE=;
 b=BCWMZnnrNF/JDwqWFJBsz2vPaDpboivcpolUtOZIzmKgzl3lLia0e4YeeMmQ2W9EBe
 fFyJv7l3uDfYGSXn5SY85J6Ty7S6rQ5QlqTy6w/X7hdGT5gtOyBS7ViZhNAgGD8sQh64
 9vN9SB4nPqnmj73vSDIEzR5uUGe+RVzvtNBJUIhzShDnZfnnBJY4TStStW8PNlftAvC9
 6rH55eg3RLG6mmZ7iUe2HnrquFMNhD3kbSW2GvJ+NZ01fn+thRgCGSQVO0ia3xqIDLfc
 MHkvfkpAy8ts55TfwmP3e9In2iB9+GfmOF80QLmNTN9xCyIRQo/j242vmTvwYdwMbag/
 bGzA==
X-Gm-Message-State: ACrzQf1zZsQhWAvWjDPJFW1XUR27mblYkWFAvGWfj/8VmriRvHACevml
 0SC0GlRstEAiJpPsaeKU8u1wBa/hLGY=
X-Google-Smtp-Source: AMsMyM4/S8uP9WlrFg1NBg5uJg/k/jbU7qrqIxcaizIEVapugfSNjTdxLh3ir+P25AQpkQri46R0jg==
X-Received: by 2002:a5d:64c4:0:b0:228:e143:ddb8 with SMTP id
 f4-20020a5d64c4000000b00228e143ddb8mr17029355wri.148.1663770813967; 
 Wed, 21 Sep 2022 07:33:33 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b0022a403954c3sm2904032wrb.42.2022.09.21.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 07:33:33 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 16:33:28 +0200
Message-Id: <20220921143328.186633-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3CDU8juCqQLaHnok5vlFp9KJpA4wyjqk8eCehmkGvLE=;
 b=kAFTzVbN0neeFar0ZrNh3kojhqm3to2kSQFcfn5ZWNLQASKPPFoRsMGLcagSgZRhtv
 EmP85c8tJeYV7j5wfri6/wivq8DkkcOl8ozwo1tD1Rb3fKJrBqBjCQm2qAWuCrSBUBvp
 5vtkfQkdioUzy1YB+u1SYtt2bx8JzWfMtwFdrhZPZxy9cL+Q8H93/e17SkahXYesXl5L
 JpD3xnRSo6l5iU+8d5Be6WaS21qCM0v/SqIA9bqM39mvA8tcg8kMLjErdcZ1QKmwLGDQ
 HpCckariOdbciZ9/t5NzeONBkniCs6YoA/BeTH1QQsDaLUdvoU0yuXB27b+9ncnR4+41
 5v4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kAFTzVbN
Subject: [Buildroot] [PATCH] package/gdb: gdb 12.1: enable host-gdb and
 gdbserver support for or1k
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
Cc: Romain Naour <romain.naour@gmail.com>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gdbserver support for or1k is available since 12.1 release, since
commit [1]. Restrict the gdb version choice for or1k to 12.1 for
simplicity. Also enable host-gdb to connect to the gdbserver on the
target.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
---
 package/gdb/Config.in      | 3 ---
 package/gdb/Config.in.host | 9 ++++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 1cad3c4fd8..273b3072ae 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,8 +17,6 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
-	# no gdbserver on or1k
-	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -45,7 +43,6 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_or1k
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3b8d456f1c..e8a34e0834 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
@@ -49,9 +48,13 @@ choice
 
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
+	# gdbserver support missing
+	depends on !BR2_or1k
 
 config BR2_GDB_VERSION_11
 	bool "gdb 11.x"
+	# gdbserver support missing
+	depends on !BR2_or1k
 
 config BR2_GDB_VERSION_12
 	bool "gdb 12.x"
@@ -65,6 +68,6 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "10.2"	   if BR2_GDB_VERSION_10
-	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
-	default "12.1"     if BR2_GDB_VERSION_12
+	default "11.2"     if BR2_GDB_VERSION_11 || (!BR2_PACKAGE_HOST_GDB && !BR2_or1k)
+	default "12.1"     if BR2_GDB_VERSION_12 || (!BR2_PACKAGE_HOST_GDB && BR2_or1k)
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
