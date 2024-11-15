Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D4ED68BCF
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 20:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0965F40795;
	Fri, 15 Nov 2024 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaDAcgIfyrTP; Fri, 15 Nov 2024 20:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005CE407A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005CE407A7;
	Fri, 15 Nov 2024 20:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC06BF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C92DF606FA
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In5tNLW_96pT for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 20:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=lhupfer@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40CDB606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CDB606CC
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40CDB606CC
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 20:23:33 +0000 (UTC)
Received: from localhost (lhupfer3.xes-mad.com [10.52.19.224])
 by mail.xes-mad.com (Postfix) with ESMTP id 3F284203A6;
 Fri, 15 Nov 2024 14:23:33 -0600 (CST)
From: Liam Hupfer <lhupfer@xes-inc.com>
To: buildroot@buildroot.org
Cc: Liam Hupfer <lhupfer@xes-inc.com>
Date: Fri, 15 Nov 2024 14:23:24 -0600
Message-ID: <0682724078f4516c3f7992d4c16588a5d1381013.1731702127.git.lhupfer@xes-inc.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1731702213; bh=AMfDBmbqqX0MIAynw+MjSTJ5OzewHAR4g3HILnuhxto=;
 h=From:To:Cc:Subject:Date:From;
 b=EEY9gkgyR/E0JK+wH1xslQMPpyO5gjC/7tRnnI+5oJ8zmK2DBFRFcdLlLcElg0soI
 jcNpIDuOWlOXr9f0BqqudmXHnOSuY36GWrs2TrurkztoV9doxUL2VYUJECzJkcc9IU
 t7mE5944hNvnpCs1E+GmpVuKTfDiuQNId0CV2qjw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=EEY9gkgy
Subject: [Buildroot] [PATCH] package/python3: select host Python 3
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

Building Python for the target requires host Python via
PYTHON3_DEPENDENCIES. Host Python is exposed as a standalone Kconfig
option, so when BR2_PACKAGE_PYTHON3=y, it is possible for host Python to
be built even when BR2_PACKAGE_HOST_PYTHON3=n.

Select host Python 3 via Kconfig to expose why it is built, similar to
libffi.

Signed-off-by: Liam Hupfer <lhupfer@xes-inc.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 38f0580aa4..cfc08bad86 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON3
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_HOST_PYTHON3
 	help
 	  The python language interpreter.
 

base-commit: d571951c67d63824fcdf96cba8b59c80876a827a
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
