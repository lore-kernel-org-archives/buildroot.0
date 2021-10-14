Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14837C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:09:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448AE61056
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 16:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 448AE61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7B6606E6;
	Thu, 14 Oct 2021 16:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V73OR9q_SQax; Thu, 14 Oct 2021 16:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4165C60609;
	Thu, 14 Oct 2021 16:09:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0C221BF575
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBF21403BA
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 16:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0Rl81B5NYYY for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 16:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA0C1402AC
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 16:09:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r18so21143904wrg.6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqBNNsKSNfJJiaCI+PjI+o7dX9gym7/awdEtfqwnXJw=;
 b=XZpqtBC2oGcPUJX/ABD9QKLZGRETelFRBXymXmtnqcDXzsaEeggq8hNJVbaS1ZO1xi
 Q2zUXUW18QRofzOM3m0NltzwQyfOfmaxqC3iFY0Gy8l3Zy3PFvgJ76nRM6cbdw/vDrhV
 JGbpmBIgHhVhM47gtoq/F1a5534YN5vn97YVGSKSAN00yYL4xlnGvFVqEjAxQygjDil+
 zy2DujR+vtY6NY76Gc81jw2w72TS7cW5HTwNg1d+7OrHWPn8m7hZ3Hkghkxj4amEyZhl
 Xext7uA782JYCG0ucR4zyvlOz+cnaom4DII+XXqf2LW5UZpbd8q5pFa0qL9cljaGZzDw
 Y9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqBNNsKSNfJJiaCI+PjI+o7dX9gym7/awdEtfqwnXJw=;
 b=npbUR5v9B0zVw91s158uVK5FEYr+te5/tONd2HK97pvyS8Y9GuW4Fihp91h8uUN8XJ
 qNSvNCeXO+W1/xuxFuXYYYftK0BaQykVbDzWxBStVTYAeRxiSM/rdAEYSLB17tsJTB/K
 /BWEEkDn8pa9oAKuGub36oKfXO8kowyd2YfnwVc93DQhJQ7uc332GZn775lib/FVAHND
 dyXZxjtGLowkTH5nlURfwoaip39bmSdZjQy14krMCBmVhwa9nBZqqqTOBA7wWiXt14xG
 Dcb9VSDRYPVyGozayaMO01tdMe07kGIBxY+I+hIcAhGUwh4UIdaNa+RU3QNYHKKIfLTO
 D+yg==
X-Gm-Message-State: AOAM530kp5Jgot9lLfWqfyUZYUs/y+EiBgB80funWCJNqAG5o/tUFw05
 lzUuPIiubfRkxDXPwc9ZZGSxBakYAXQ=
X-Google-Smtp-Source: ABdhPJzIUyHnWKhmLZNRqP4RibuAbnK5ne2s9H6ylaDpYjJFHSPweJqX2oP+91y/OrUVntBK+uO3rw==
X-Received: by 2002:a1c:9a4d:: with SMTP id c74mr6550524wme.139.1634227782419; 
 Thu, 14 Oct 2021 09:09:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o23sm2614330wms.18.2021.10.14.09.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:09:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 18:08:24 +0200
Message-Id: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libdbi: needs dynamic library
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libdbi needs dynamic library to avoid the following build failure raised
since the addition of the package in commit
c6aac6ebdbbd3873110a9e19de1957e49cb9344e:

dbi_main.c:84:2: error: #error no dynamic loading support
   84 | #error no dynamic loading support
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9cd56a625cbd52b0c070e2d462e02f5161d9631d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdbi-drivers/Config.in | 4 ++++
 package/libdbi/Config.in         | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/libdbi-drivers/Config.in b/package/libdbi-drivers/Config.in
index 087e6aaf0e..7c505340c1 100644
--- a/package/libdbi-drivers/Config.in
+++ b/package/libdbi-drivers/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBDBI_DRIVERS
 	bool "libdbi-drivers"
+	depends on !BR2_STATIC_LIBS # libdbi
 	select BR2_PACKAGE_LIBDBI
 	help
 	  The libdbi-drivers project provides the
 	  database-specific drivers for the libdbi framework.
 
 	  http://libdbi-drivers.sourceforge.net
+
+comment "libdbi-drivers needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libdbi/Config.in b/package/libdbi/Config.in
index ded2bc6e53..13ac344f82 100644
--- a/package/libdbi/Config.in
+++ b/package/libdbi/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDBI
 	bool "lidbi"
+	depends on !BR2_STATIC_LIBS
 	help
 	  libdbi implements a database-independent abstraction layer
 	  in C, similar to the DBI/DBD layer in Perl.
 
 	  http://libdbi.sourceforge.net
+
+comment "libdbi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
