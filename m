Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC649C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B411405D7;
	Thu, 30 Dec 2021 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45ZjCphYzeSL; Thu, 30 Dec 2021 15:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B56294057B;
	Thu, 30 Dec 2021 15:35:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 465C51BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3693741514
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id do9vKcc-Loi2 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:34:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 361D9402B2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:34:40 +0000 (UTC)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout04.t-online.de (Postfix) with SMTP id 61E2B5D2E;
 Thu, 30 Dec 2021 16:34:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd70.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2xRm-3LtWU50; Thu, 30 Dec 2021 16:34:30 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43652)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2xRm-00078U-3r;
 Thu, 30 Dec 2021 16:34:30 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:34:29 +0100
Message-Id: <20211230153429.2038516-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211230153429.2038516-1-bernd.kuhls@t-online.de>
References: <20211230153429.2038516-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640878470-00004E7B-9884BACB/0/0 CLEAN NORMAL
X-TOI-MSGID: da08701f-87c3-4a6b-a314-5f16cd7202a8
Subject: [Buildroot] [PATCH 4/4] package/intel-mediadriver: add option to
 disable Gen8 support
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add option to disable code for Intel Gen8 GPUs, reduces size of
iHD_drv_video.so from 36M to 33M.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediadriver/Config.in            | 10 ++++++++++
 package/intel-mediadriver/intel-mediadriver.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 2d5adbcf59..c29c2fb6ab 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 
 	  https://github.com/intel/media-driver
 
+if BR2_PACKAGE_INTEL_MEDIADRIVER
+
+config BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8
+	bool "Gen8 support"
+	default y
+	help
+	  Enable support for Gen8 GPUs (Coffee Lake)
+
+endif # BR2_PACKAGE_INTEL_MEDIADRIVER
+
 comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6cadc3612c..fd3b22a851 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -32,4 +32,10 @@ INTEL_MEDIADRIVER_CONF_OPTS = \
 	-DMEDIA_RUN_TEST_SUITE=OFF \
 	-DMEDIA_BUILD_HARDENING=OFF
 
+ifeq ($(BR2_PACKAGE_INTEL_MEDIADRIVER_GEN8),y)
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=ON
+else
+INTEL_MEDIADRIVER_CONF_OPTS += -DGEN8=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
