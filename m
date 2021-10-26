Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D01C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9D360E8B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E9D360E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFBD40170;
	Tue, 26 Oct 2021 07:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQE8EP-Uv_Mt; Tue, 26 Oct 2021 07:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 122EA401B6;
	Tue, 26 Oct 2021 07:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 977F01BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 870C780F3B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJAAbKHmh5SZ for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:07:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BAFF80F27
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:07:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d3so13166695wrh.8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJeb2Te6oV7V29mYuAPXZpLHfdeXQgimXBvH514jIk0=;
 b=P+sgpAphr3Fgb3SnhwyrQQXDwObqrsP4x1SL1IUwsAvrFV7HMZsSseReXoc7GTO/ev
 gT89gnBx6/tD7h4Y30WXLoCbX74aLcnaZ7ttcgl5rSn1FeY0SuLyrj4gSj9dhf4dd0Ti
 sGjWnZRBEb7TzjEipNYXRqVix9A/rGpVBG04l9e6esdUsTbxclur/R2/ovFHO//gnEVp
 7kwRM15BbTk2CSJri5nkSAL1aZseAKZuJxEiWtk3gmxfjwBZxGWEtCCJ3F30OnH1JHwt
 jNFl7MyvnI8SRcqartE1AkPRzijkTW4DszwgqkSUsW2Xai0JcFRw9ULD4V4gNzUgfxHN
 mh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJeb2Te6oV7V29mYuAPXZpLHfdeXQgimXBvH514jIk0=;
 b=4+RGZyeuEtJcc5leS2KT/PExG9U6eU02ma+orCjIa1QZZBoLv7NESiu41/GiTzVL6m
 GUt1GtgshOExgVxqo5Ztcgg9TLhwzmjWVEpItulf1YN9/JLef80EokQxmQB9SYZd9/jZ
 +nEWrZC4pHWHsm5ybujFpXBB06VPZAPELbgE6DJtFuwdBXyd36H7PP9DlbrDvU0HeToi
 8GU5rmO5OpwVQVNtfn4pI+36Rt+Sjez3w6IZ5YwneSaPmT3aKnE9ix2ZzMr6FDwfuv99
 vi1/s9+V/OQtEzQcKhrv/I/BpB7rpBYHu0sa9PmsxX6O13/33nOMHEAJcJ630iLEcZRx
 bbiw==
X-Gm-Message-State: AOAM532bWa+uhZV3FvibWPrjZn/7FtpwEBcwbmpIes3TMzno/zCrHa4Y
 TA9eCGAG6ci4TKlrQsuQZmZss+myhxM=
X-Google-Smtp-Source: ABdhPJxlF+pVA9OU51e9bdob8OdWvQFz2rWGNzUMthbOuiL/TLil7f0/Fon68R018VQPgMjLUVxqLQ==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr3337867wru.274.1635232061094; 
 Tue, 26 Oct 2021 00:07:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id h2sm7218407wrv.54.2021.10.26.00.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 00:07:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 09:06:03 +0200
Message-Id: <20211026070603.3811023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ruby: needs gcc and host gcc >= 4.9
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ruby needs gcc and host gcc >= 4.9 since commit
5f1c6758a561134e30fe9fb7fae55e5d6e97d01a and the addition of AC_PROG_CC:

In file included from vm_core.h:85:0,
                 from iseq.h:14,
                 from mini_builtin.c:3,
                 from miniinit.c:51:
thread_pthread.h:108:43: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
     RUBY_EXTERN RB_THREAD_LOCAL_SPECIFIER struct rb_execution_context_struct *ruby_current_ec;
                                           ^

Fixes:
 - http://autobuild.buildroot.org/results/f196f8bc68d1b4c20bddced89478598a3fcd3dea
 - http://autobuild.buildroot.org/results/81bdac585600877d3fa8d9478b7f160dbd1537a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/Config.in | 2 +-
 package/ruby/Config.in          | 7 +++++--
 package/webkitgtk/Config.in     | 2 +-
 package/wpewebkit/Config.in     | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 65f08d1c5e..4abb04844c 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 141db90140..c210120945 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -3,11 +3,14 @@ config BR2_PACKAGE_RUBY
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
 
-comment "ruby needs a toolchain w/ wchar, threads, dynamic library"
+comment "ruby needs a toolchain w/ wchar, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 425bf81e4e..bc8207d93b 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -25,7 +25,7 @@ config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 6fc1e668fd..8357051e93 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
