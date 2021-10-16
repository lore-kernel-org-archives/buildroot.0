Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D545C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACAE861181
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 13:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACAE861181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AFE8402AF;
	Sat, 16 Oct 2021 13:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUsWVpGnQqnc; Sat, 16 Oct 2021 13:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F4C54029C;
	Sat, 16 Oct 2021 13:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6326A1BF2A1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51A6860717
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 13:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAwYZDOThr1w for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 13:41:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5831C606E0
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 13:41:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g25so31347737wrb.2
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/bl0MdaxofPznriI4AHVlK0HVkY/wUfjoOtgftaLQ2U=;
 b=WONf3LP7nNGQV4YPLWMQTobgZw5Rjk3Cba1SgCMSogwpuH0tlLH3LUsrOnVeQBbdlV
 IF1xWszzDx/bOfm6gZT/LmZ67FBDbln2nztOpepLTD2Reg1LKhBP+5m8j1VZqg8dh99b
 11+Aile2v4ctR73YVy494jv8IL6CxDHJL3oKZhgMK4QhhXnVHtrWwYxIbPwJG/hEr6nv
 MsdR+S2sLyMsD4iSvWONpYH3J+bOL7bP7OZx6VJE95WOMMixiuXR5FmpEp+dJFReQ9eD
 YjC4IX5coAAL3fHdyOW7mOlgh0kRoM8sQx2gbjW4kCmO6z7w9pU/aWv2seYK60Xq83x5
 EKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/bl0MdaxofPznriI4AHVlK0HVkY/wUfjoOtgftaLQ2U=;
 b=6E6ijGwcD6EiQFcUS2BXLHHcTnY7meXQMTd6pqpehFHX6ys0Z6HpZ2WpW4sZAvVcGH
 C4Xx21Hhcf/wHOTzgMpIM/63E11pnJeeUIIuOQqrmF70Dv9k7WG7jMgeiOZwR6Ows9TH
 ru6JDqKzb/4CWyH+WUhk2Z5REg3hpm6NxpLYQO5iP5s+asFFAStFzEaIlHdl6Zmwxwkq
 SYO8qs+/DXgVWpoVyXiN+c6klK4kYy5U0c/qhXjYBLFLy603BcnsEW7WDdiGTOVPqfw8
 uNkCgnImbsyjUrBOnW2+KJUzhLn2mbBKt6Hi4p7cWd02oBAeVtnz3LKTprClBSllnVva
 Sv+w==
X-Gm-Message-State: AOAM5332QVA8qrTlCNxm6jYJvel/AaGafLlwCBMawsKIVgS5f7YBZ8PY
 LO1xQucCRzkn9RWTQyFA5GMDly4AZNg=
X-Google-Smtp-Source: ABdhPJx1piPJF6yGke6ALqx1X7g76Q7+2vBXjKTzqYRBRAX3nJC0/e3hEYA7Jxbn/Of+UDPRdFbU7Q==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr21720838wra.357.1634391697275; 
 Sat, 16 Oct 2021 06:41:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i13sm7794021wmq.41.2021.10.16.06.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 06:41:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 15:40:11 +0200
Message-Id: <20211016134011.3092826-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python2 support has been dropped since version 1.10.0 and
https://github.com/vpelletier/python-libusb1/commit/69fd5a3ed2f674d412131dfaf24bbc2534f3cf13
resulting in the following build failure since bump to version 2.0.1 in
commit 6703b94f24320316ddfc2a3ec3e40fe3876dc8c8:

Traceback (most recent call last):
  File "setup.py", line 22, in <module>
    from html.parser import HTMLParser
ImportError: No module named html.parser

Fixes:
 - http://autobuild.buildroot.org/results/fe011ccb7eac1be9762919f9feda35114e752d8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-libusb1/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
index e464a0394d..fbad70c375 100644
--- a/package/python-libusb1/Config.in
+++ b/package/python-libusb1/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_LIBUSB1
 	bool "python-libusb1"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
@@ -9,5 +10,6 @@ config BR2_PACKAGE_PYTHON_LIBUSB1
 	  http://github.com/vpelletier/python-libusb1
 
 comment "python-libusb1 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
