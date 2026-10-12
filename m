Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9786DCA9ED2
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52616402BE;
	Mon, 12 Oct 2026 10:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al3Dour0gJNc; Mon, 12 Oct 2026 10:22:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F532403AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800542;
	b=LwM3s6M7lM7y1auv7HAn6WcA5Hv6bIGw6d7pra4hawKBmm49yCGo6ETMIh/Q1D6nun6j
	 z2FZzDpqdpoQsUMYTnYn3XUG+jW5PsStlMHU2VxbKCmWZz7gtQ62vcZ1QZoyCGSnz1b6z
	 ZpwRVq8HKYrEaKJZNPGlj9XGQDUgNVLcnaZcRjp3ADZjj8cCSBtJ2x2SC6Z9DEtgOzAB0
	 lZfRQvXoEGxAT5C69fbtse9oa7PGrqghL5Arql9I3aE1mPPM0c4QgxZDTRxXkZatLg+xD
	 MvjZtiQzj7JgJkA4fQuoNejQcAUJOz4NSEFG5LIKJBV5oKEBKlOcyatetwr3LpBUrCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VPAtoHtbDbQAslpLdlLF+8ysyLx0ND+qNThrezflSuE=;
	b=qvCNv5iKdXQezKJsZ6DNA6ze7cMu2du0e5jfGPtohw/AVIzBl5HolD2wjH9e2wEHc9fr
	 Ifx5zOEWbPmgIcTJFggiVB0WTlKujx9ZSHMf6tLeK/5go9xp27Haqnj+q9FpSReBYEuo9
	 wkwYOhIZdeBb8KD77IBl85kyxOpnbu4A19YYHTsH59c77HrM51kBJdsrF0eKc8F6XcQur
	 iBPodFrPypN4B1MseOQF282jJHEg4JnJzfVp9PVjXWFfvgIp3drGbRb2cRjtJ8GEQxTWO
	 hRS3Uy8ALaqKOin8Ba0+nBTpG3FdbDyrKGkvto6p1S8tBdMx4JaNQCBwrpF8b9tNItA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800542;
	bh=VPAtoHtbDbQAslpLdlLF+8ysyLx0ND+qNThrezflSuE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aGPTFZfqNuncFZCtoWjeeyIrPG1VoAtBjO/BbwZQsMH7qR9Pu0PEA571m+hdyXhhM
	 msk9nTEDBfc3pX8Nn3Sq0v2C6NYjtlghzUnIhMoUY72MMPivlaWVxeRDRPl+tWcWt/
	 Xt44rHbOS88onHB+/VpF2iqbltlnceDEMbgq1gHwP26cFRNMEXzdGeRnmSldKTal3V
	 TpsXcasMBw//4THQ3VKLUlC1movJ3D5yIkVzRO7cWY+3yzfwfHU0+TXS+JkVTHsPD/
	 Lim2SaboZgFdD7HSsxBCuBGrXZHb7GkHg9xklXPjfLHjerHQtCLV7GJ8+vh+rIvB+l
	 hsbEkaObBx2gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F532403AE;
	Mon, 12 Oct 2026 10:22:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA1DD5E
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D81D605F3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-ngY1_DLR9R for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E078605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=O1AHuGkLR9ovEswvQc/L+Gk0Zv0v4336WF3I2XqZcskkzkH3MaXXVrJGX+4BzUjQdi64
 OK8q7G1ZDCKbDnsVoMFDRP91LARjCfZWK7UZEJtlOUiSlgah23hnEFAZ2irFEImDDr7Gt
 2sw8gDsK4BS6VzjAZ7YlupSCvSIymAC3lyXq4HEp0v84tph/BIBMPCDFxgYSDdg+jkzyp
 CYWXxTe2qHrMGQN4oOfSmBNFaIgsRXRDaUob/WzUcB7SzfEX2/n9+95HHKfLoueckoRLJ
 tCFZDTIbeHsM4uGSPNYQU0y1XTLCbpIEdJg03cHTv898dZO3gXKpf6Ye+S6J1i0RsIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Oqndeb/En0MsGI4CTUPIl/cw3s8diXLquiWORh1rOwo=;
 b=rNeCjVe4vs5lpkS0YXjqmKLOm5guRs/5a5gtDGBzJas4NXVQfQ6JIB3i0NpoURPrB4vo
 0QGZ9nQDQG9et1FhgeSakFAvLlas1gmqgxwfd8YlezyVqOXtGZbhXfIHHe3ChksyVcVsh
 QoMvskhj8HRdFOCVXzyS9kn4knh/rdqlKLqTDhZ/YLFpRBcTyQp6CHPzeOSVyF+DRh7xJ
 VHxNN9j5d/9tjyNVtQMms6IlPEWPid6ZI4EraRG+ZtFFAQrH+cYAQaHb/k1WCt6uaxMe4
 rFdO7WR2QUO1u/AxR2WIh5dyFbNndmitNuXRtmudz8wQIkUyUvhla9K9oBdsufsw4ag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E078605E5
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C7EF93491; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 12:20:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58019aa10c624e5d8191f2741927370bf0265082
X-Git-Newrev: e17cfc9b3b728059d97f9f8c4d890b4444125d1e
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.3C7EF93491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutekeyboard: enable build with Qt6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e17cfc9b3b728059d97f9f8c4d890b4444125d1e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable building of cutekeyboard with Qt6. With the merge of
QuickControls2 into qtdeclarative, the corresponding Kconfig option has
also disappeared in Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/cutekeyboard/Config.in       | 12 +++++++-----
 package/cutekeyboard/cutekeyboard.mk |  6 +++++-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
index bd661b0cd4..ee8017def0 100644
--- a/package/cutekeyboard/Config.in
+++ b/package/cutekeyboard/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_CUTEKEYBOARD
 	bool "cutekeyboard"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE || BR2_PACKAGE_QT6 # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5QUICKCONTROLS2 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK if BR2_PACKAGE_QT6
 	help
 	  CuteKeyboard is a Qt virtual keyboard plugin for
 	  embedded applications.
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 2b0f5a9f2c..baaf371f97 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -6,7 +6,11 @@
 
 CUTEKEYBOARD_VERSION = 1.7.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
-CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+ifeq ($(BR2_PACKAGE_QT5),y)
+CUTEKEYBOARD_DEPENDENCIES += qt5declarative qt5quickcontrols2
+else
+CUTEKEYBOARD_DEPENDENCIES += qt6declarative
+endif
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
 CUTEKEYBOARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
