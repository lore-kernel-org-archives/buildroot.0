Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98FECD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 19:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB6B60676;
	Thu,  4 Apr 2024 19:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_EmT0AREnUo; Thu,  4 Apr 2024 19:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACE5160F91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE5160F91;
	Thu,  4 Apr 2024 19:47:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7533B1BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 619B941D93
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poaPV8VsecHZ for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 19:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E02E241D81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E02E241D81
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E02E241D81
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 19:47:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4162c2109a5so4743435e9.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 12:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712260071; x=1712864871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upj4LpqhjujLYBKdOHD6WttahQH5HlJVc6DYwD7UuB4=;
 b=CR0jCDWOwr3p9ykxqocRyBLY/JLUBx6KgJ5LVtJLiuRSR79WD2DSr31+aHRx49Njn9
 V+Zq46mjPFpH7BIXMFDYfaHcPv5tOHCKvAHpLZUD79rIxIWhya+P1scSLW0WnNlJViyQ
 ZqZeHra4+EVKlT4/2WhVAunK1wjINRTVdi0/jMkQnJ/UNeqHfCBMsfiGNSj7hh9jG7B0
 +PKUxxA1141zl8JAjOrOq+8bpCrqMQZGr+Sf03dYGwCCOcsG9s3RWLHEC0gjnZIcRs5P
 clUoxMH8yR9gyy5zAGqkMA13Oqp0vPTmeSk9DD/ZunSemT/hS+vcxmAhl5Do5uSChfOQ
 SCwQ==
X-Gm-Message-State: AOJu0Yy4UVvcshnp0pby1LP7iHPsGIMtau43XjE9lD/I+nLFPIEp7mpb
 5mzamaClwPVSTQE80rMtEGAPlwsKzTv3GifrqLYK6BU5DimI6UMwAfjMNIqB
X-Google-Smtp-Source: AGHT+IFLTTovDI+rb1pXeDbemXJnTSupIPszVjTZwgBorVyrbNHfYZdi3siW8BtjWgNOcPuLVakghw==
X-Received: by 2002:a05:600c:26c2:b0:414:86a2:a5a with SMTP id
 2-20020a05600c26c200b0041486a20a5amr493442wmv.14.1712260070878; 
 Thu, 04 Apr 2024 12:47:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d4ec7000000b0033dd2a7167fsm161811wrv.29.2024.04.04.12.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 12:47:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 21:47:23 +0200
Message-ID: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712260071; x=1712864871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=upj4LpqhjujLYBKdOHD6WttahQH5HlJVc6DYwD7UuB4=;
 b=J1F+8UL7LFGBPOOuXWYQWUTVb294pk90lkj+DnAlz9BQIWvLkHsj4HbG3F4X7c68Fd
 U6HaNdVJBPhizgoajqcmuCrFtPPwUW+qDEQQbZkc7n/OorD+Ceiq2531AulxS8D4O6Kk
 cFVb8wCioCFDNAARK1aSDCWCqKfgBA7FrQbHLPnhBivV9kdUtlXlH9UmleRYjlb3xSFG
 JcyPUydiB9cd7mmu6SCa+bIlVJO6r4TDAUeZOOWSzXZM9txer04XqpzLurO4lCOkqxV8
 7zFYK0joP1viJ9cmivf5SswzizOWkQqUEK7u9haol6xWyLhyIzoR7JvabzM0MVP/HXdV
 3B+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J1F+8UL7
Subject: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set GROUP_T when installing configuration files as root to avoid the
following build failure raised since commit
b6816034ebddd522a8fef9daa454c28fa1230dd6:

/usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'

Fixes: b6816034ebddd522a8fef9daa454c28fa1230dd6
 - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-GNUMakefile.in-fix-root-install.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/privoxy/0002-GNUMakefile.in-fix-root-install.patch

diff --git a/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch b/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
new file mode 100644
index 0000000000..89347c214e
--- /dev/null
+++ b/package/privoxy/0002-GNUMakefile.in-fix-root-install.patch
@@ -0,0 +1,35 @@
+From 25bd5ae1664f5603c05c72b2c38525602f33da0a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 31 Mar 2024 19:17:45 +0200
+Subject: [PATCH] GNUMakefile.in: fix root install
+
+Set GROUP_T when installing configuration files as root to avoid the
+following build failure since commit
+4b3b267db159dc23314de3062859481b7c397e32:
+
+/usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lists.privoxy.org/pipermail/privoxy-devel/2024-March/000760.html
+---
+ GNUmakefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/GNUmakefile.in b/GNUmakefile.in
+index cf79aae1..db1bab59 100644
+--- a/GNUmakefile.in
++++ b/GNUmakefile.in
+@@ -927,6 +927,7 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
+ 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
+ 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
+ 					$(ECHO)  "*******************************************************************" ;\
++					GROUP_T=$(GROUP) ;\
+ 				fi ;\
+ 			else \
+ 				GROUP_T=$(GROUP) ;\
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
