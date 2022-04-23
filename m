Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 17:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48BBD4048A;
	Sat, 23 Apr 2022 17:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6x5EEwE5VHLl; Sat, 23 Apr 2022 17:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5300F40160;
	Sat, 23 Apr 2022 17:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAFC1BF5A1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7BD60A9E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LORcAt9XphxK for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 17:09:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35CD8606EC
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 17:09:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b19so15147086wrh.11
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0YvZ+uf/nCjX6cueIZM5M3RkP4wJGGu46BHWwFPwKd4=;
 b=cL4rH4SRhI0KSB8pbunGmh5LPpo6aVY7bEWXdErFnxlfQTxnB+GQ0oEZJF9qRDmAJ6
 7GG0ulUR7HAvRrBO9cWElyF8rbCcLiMIhdj299nlYMCG5WyNDW88og90RvQ29sJT5ret
 442glu0kEth/aR86+daDFoKaxLOedU1KZNW4XYkPlD8QZ2Ijg1wmjCwGE2prrkQnpCCo
 1eYQceytgcq+ERL3FtCJfHjJ2GynC+zGkRRc+SroxOLIH2UcJWR0YTzsgYGbVzoXunmA
 M5GvfpzNK4hpwh1VzrORSjTDCjEFyixRfFLtmAgKT68F05uSjmquSXcK0eM4DJL3B2X+
 ++AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0YvZ+uf/nCjX6cueIZM5M3RkP4wJGGu46BHWwFPwKd4=;
 b=60QNfHSsprrn2t/RiKGwGYoJGhxaikAC0bOmgmKQySxslc2sjYd2229m3NjLoYJONg
 7I0gevkMs1iBMqIbPEFFu46h4GU9DxeR0vWnI4HmxIKRXFUzVr67xE/oTsQRyWN9xhcD
 aaIIQqjLH6P/9LjJovIug+ZWkhsr/t4Mno1i/S/AY0ysC9FZ9j3PCpBnvO+2CXBWr6OH
 imhVS5r24WQjwXCafxaWvZCGBHKGVUDLZIR9VmVfEtQkmfSr7Su84/UoCU7C5Buw82XI
 CcWAgJ2wZxrrFw/W/SEIK6CJy+7d8A3a8glt11QSaSHRS6tXRTAxOcdSkO+qkjo4Od4t
 Nr7A==
X-Gm-Message-State: AOAM531V+99HUVjKVZjWYbGVZY8yRXmXx9IK8Z79eo6qtEsSi3uCCkAb
 y4efM/lrE/PzX45bFYxxFeMCuKC75xk=
X-Google-Smtp-Source: ABdhPJwSPseC/sGLPZC6ZflC4rpURbL33hDibS+gKTmxmCUiOlMuSzP4WTKDM1VRuTVfCLcgaYoCdg==
X-Received: by 2002:a5d:6d0f:0:b0:20a:897d:ad95 with SMTP id
 e15-20020a5d6d0f000000b0020a897dad95mr8525255wrq.113.1650733754126; 
 Sat, 23 Apr 2022 10:09:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a7bc104000000b0038eba17a797sm7184616wmi.31.2022.04.23.10.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 10:09:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 19:06:24 +0200
Message-Id: <20220423170624.991570-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-zopfli: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-zopfli needs C++ since its addition in commit
53972c82964dd1337dff4ccbcdd484d243aef0ba:

nios2-buildroot-linux-gnu-gcc.br_real: error: zopfli/src/zopflipng/lodepng/lodepng.cpp: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/442ae4a02e691b4039d1694620f6284906cdc97f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-weasyprint/Config.in | 2 +-
 package/python-zopfli/Config.in     | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 7fe99c3951..18d72d742e 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-brotli
+	depends on BR2_INSTALL_LIBSTDCPP # python-brotli, python-zopfli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
diff --git a/package/python-zopfli/Config.in b/package/python-zopfli/Config.in
index 0b1ebca85c..dc68a2fef0 100644
--- a/package/python-zopfli/Config.in
+++ b/package/python-zopfli/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_ZOPFLI
 	bool "python-zopfli"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Zopfli module for python.
 
 	  https://github.com/fonttools/py-zopfli
+
+comment "python-zopfli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
