Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75B4CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F96080DF7;
	Sun, 18 Oct 2026 20:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwxbLfnmCtnH; Sun, 18 Oct 2026 20:35:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ABE7A80E3B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792355728;
	b=WmN/SQVnD2oZ+QCiQUI7Wt+2rmHzPub5AVq37WrXsXfRppU39EvKI9QkEzQFuJEvbV1o
	 +0FThMPClLjPqfZBSYF/Ji0lq+/PeyukgJvj0aAzwdnOMOjVp92vrVtj2bOhPj8nFAXO9
	 SqLf1L8T98+IDauJ0LUrhByD+R/CJAbeB1ojrFFt1QmHsjTHxUCA1FvfMmDzsP5qor7Kt
	 Z0N1pDP29pl4NdT7FgLMS2GmBiPPSAu93/7ZngFzSYLYDtVvQ28pB7zK2IfixYMXEBC6E
	 5JakAQseG4L+3A27ZZqPQH6drAGyalq9n6lE6lXaXIqiqSaLoj7QMVcjOX7w9tmSxew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792355728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/9Ts11W4WfX6dVvNXpbsG4KnXg6p6m9WzB0E5TY3MDg=;
	b=VVg3YhW1zEUJpXHF4ZP60o3NB4v3SejmFalrigtV9dYMxx0/MV04RbpFIaN2wCzZvqtd
	 jvAugxpEl71nxo9FBqedomhYJlQyOyEKLEVHZmTfhyOI7gng2fRfpf6Ndcuvr/dfH2krQ
	 NPnWtn8KmEELsXomQyrrES6OxakS72AeNe3GOuElixu6Yf9OiQrLA9RlzQFKCfm1bLVK4
	 u99la2WEEYdmDI1SxiV6fj3F/STUEr1kULHq4a/W+575NEz2f1BKEKfzZJxxsDw7a0Npu
	 7DG5fZFgIqARk3WCBCFIi+IoAthUAREIx0vjjMCiQy1NNq8L7E+2FRFJkGnbdmQoLAg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792355728;
	bh=/9Ts11W4WfX6dVvNXpbsG4KnXg6p6m9WzB0E5TY3MDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LwNSnB6lHha81t7OWBIkh9ZGQIk5NWZ73mDHE3eMAkNnpy6thWXEY3l+V6vrGElzn
	 A0lMF9io1D+VaBT4nQgSnbfk0nOZ2rfVMXtYnC01j2ITNBljw7ShuoHeUtUnNo8o85
	 ZfwVW/lSuT3d8ublqywyLtPZsLNRo7HPd0XZnUsc6UwpB0wTxrA/TLf8cRwHXIpmtH
	 /rvbsRg9ezkJ45T2VtnBWayi0JTkV9bDOjfccLWav7Ml6Bu8vesxtPUPIfmtxTJwr3
	 YkUhW7qP5lP8zF3ZvoPGdc/Rw4BRbFSYwzVXdRsoVOG1Cdsxi1OFNuqVCRTgvyuq/2
	 VsZc7og6CozVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE7A80E3B;
	Sun, 18 Oct 2026 20:35:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 165E82A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0868660622
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8e1NJSAlktQ for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:35:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3905A6061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792355726;
 b=SjtyRw6ldbIto7QVMsi+xeCiGgy2V+wh/GEOgW1RoBK2uB6QLnVrCZgFHikvPIDU2p9d
 J9i4ysE4ZHbTyJyTSqlShQQFRiW8aJ88w1Rvgl6k9wvZ/mIbyCXvpdainpT7oO1bVOwlR
 9XzlyZQSB7jgM+rCkQgahM2LqfhV3WmVxlQ9Jtx/NqumT7nq2Q+7rrTR0xi1RoV180pow
 iZp0Yow3mpqR22Po23MaTNH//Z7IRNB5aWoWywuSLCh2VTc+2OuKzprTTEiwSsYoWtIYz
 1IUHdNydxBR2FEILclSHSFNicwy3H/hVF05XeHYAvrJ85HFv3LaaoZjIFLRyYbf0aAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792355726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GODJFPMfggzH7HtfB4qLwioA8+I6KIG5WwAwier/SEw=;
 b=pDTJieSpFcMnWBTEwo7q9hM5TFJNSVxM/9haJp3v0GAok6pRzD56xQDPFfRhlXYojUxp
 354YdSXiD2gtI8LFLkj/6PwrrAsVuhRcVPW5XQRJM9RmvHiLFYCj7yusKGbxa01xJuWrI
 8QzgnSLMqHA6FwSj7kGPeuhNJy8QWJyXTMAGFy+6woNjdzyyLP7xxV2DBVBNYSXTkUmEI
 GMTliuUu2OdFWnS//Fz7+SfPPCDaLTbRWNBo80ccKNHBcIBeSsTjfU48G694Wr4PrRfiK
 atIyyqz6Hc3ay+ine5RGlOXLcJ2YB8w7gWZrJoyPIHIEP668ZtcHta96UTZ2hBXbrgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3905A6061D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE36198402; Sun, 18 Oct 2026 20:34:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:35:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93c3e0384ff897bfab441c75a61ec16723669cd0
X-Git-Newrev: 218a6b7a7440b4a73046b2d8d3d2600071326f5f
X-Patchwork-Hint: ignore
Message-Id: <20261018203403.EE36198402@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/raw2rgbpnm: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/218a6b7a7440b4a73046b2d8d3d2600071326f5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

raw2rgbpnm is a tool for converting raw images to RGB PNM. While the
original repo is at: https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git

A mirror is hosted on freedesktop:
https://gitlab.freedesktop.org/camera/raw2rgbpnm so use that instead,
as it likely has more resources for maintenance and availability.

As the build is simple and has no dependencies nor releases, use the
commit ID of the head of master branch at the moment.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/raw2rgbpnm/Config.in       |  6 ++++++
 package/raw2rgbpnm/raw2rgbpnm.hash |  5 +++++
 package/raw2rgbpnm/raw2rgbpnm.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0dda356bf7..bb2d74b99f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2671,6 +2671,9 @@ F:	package/libiio/
 F:	package/lightning/
 F:	package/umtprd/
 
+N:	Paul Elder <paul.elder@ideasonboard.com>
+F:	package/raw2rgbpnm/
+
 N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/bdwgc/
 F:	package/guile/
diff --git a/package/Config.in b/package/Config.in
index 2a85456034..bbf138061a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Development tools"
 	source "package/mawk/Config.in"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
+	source "package/raw2rgbpnm/Config.in"
 	source "package/ripgrep/Config.in"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
diff --git a/package/raw2rgbpnm/Config.in b/package/raw2rgbpnm/Config.in
new file mode 100644
index 0000000000..3d8f36459f
--- /dev/null
+++ b/package/raw2rgbpnm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RAW2RGBPNM
+	bool "raw2rgbpnm"
+	help
+	  Convert raw bayer images to RGB PNM for easier viewing
+
+	  https://gitlab.freedesktop.org/camera/raw2rgbpnm
diff --git a/package/raw2rgbpnm/raw2rgbpnm.hash b/package/raw2rgbpnm/raw2rgbpnm.hash
new file mode 100644
index 0000000000..5ac2c4fbf5
--- /dev/null
+++ b/package/raw2rgbpnm/raw2rgbpnm.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  3d0df8cca5f3e1fd45c9f1e76344413ea58a753d93b9764272dad0498a482cfb  raw2rgbpnm-f28b903ca63b4c221dc011df5edf1d51eea533d7-git4.tar.gz
+
+# license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/raw2rgbpnm/raw2rgbpnm.mk b/package/raw2rgbpnm/raw2rgbpnm.mk
new file mode 100644
index 0000000000..fc6d9064a0
--- /dev/null
+++ b/package/raw2rgbpnm/raw2rgbpnm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# raw2rgbpnm
+#
+################################################################################
+
+RAW2RGBPNM_SITE = https://gitlab.freedesktop.org/camera/raw2rgbpnm
+RAW2RGBPNM_SITE_METHOD = git
+RAW2RGBPNM_VERSION = f28b903ca63b4c221dc011df5edf1d51eea533d7
+
+RAW2RGBPNM_LICENSE = GPL-2.0-only
+RAW2RGBPNM_LICENSE_FILES = LICENSE
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
