Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77103CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12B780E36;
	Sun,  4 Oct 2026 16:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8A33cb3-DTds; Sun,  4 Oct 2026 16:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B9F2680C98
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130495;
	b=CmWRAFIFQHRISolLSNBckH41Fcsr0Ydw4s8b4x+SnTRGJcy24Z6tzt0Fj3IfhezL9zsH
	 oR4zkz0yQoVXF6hWTWAR8NZmiqlKGkNm4Lt3/IfqVof06BDOsVYNsJqca82Vt1hWvQ0Qr
	 m3Md+AKm/AWW1cZhigwZH1f1zGoxeIUA1iy4fC2pntDWwj0VR5NUGT50q3YUUD+fWGXCa
	 PV+WrDgoHuiU1j01DLoQ59ceerEtr5iuDLmRCCLNXEmylMn0EO7yO9MhwTPoTPlwkor50
	 obN25Q8uOxql5dv/LiDb8qPQRCUUcYzdmXaci1iuEenNIH+yXPeFS1UEQC2nFr7v0yQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=88H2S6IX6SLHa2FOMAvihHTT0c+/1O4ICtOZIqkH2Ak=;
	b=QUw2AlgfsZdvedxE6p17iHnftWS3vlFTe5eGwThxSyJhSnI74MKybdP/otTu6Vl/f2OX
	 isgYaSCsX45pdqcQvE5pl2lRx78dwWiFb6AhMZvcix1nvcyj1p+QghHNIaIJqNV2/qlx6
	 5+IZ9Hkt9FbTDcnvWhYIOxsdfGw8zn26aidB7CzmXIQzEsuXH81VufaASXjH1uPOu4RlB
	 l9h5dzMUOYf1y3uY5g7UJqRW/HksMZlivvUXw+7b0XjhNLgAWr8R8ZAc+9J+GFREEXLJu
	 o7rLbkKYlW40Fgv/fPHaUSl8dNIQMTk+A0SDntiomDwPAZuYmfApvUV8PrTP5oTLHEg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130495;
	bh=88H2S6IX6SLHa2FOMAvihHTT0c+/1O4ICtOZIqkH2Ak=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mehskoqTU6+/oaeR3qbr6ha+AjGpqxGS2wmT8UXTmB0ju9sbcZorFkg6Sv6f+AMfK
	 GmyN+QQv+kHN6XWMJyrz3Mn5xFbdZecHe9cXuOdQt0J+S5uWXhs0ygUsLVLeNXskuv
	 VQt8zm4Pp612X8lT39V8DRhIu/O6953DlG7Gym4zpsyzRecOn1FB0iXIyNFI4GFLVv
	 th/2wnWVdpsmKACBHUZLyeEV9LQ663r1eVCDOywXC7bdzTTJnCpiqJlQF8y5XXx+/a
	 c+qyQfZ4QZWOEiW03nDTnz22kx2OxIn8SNDk5onHfb/r2L1OHiR4xkHkqYMcWaG70m
	 ZPA2YG4FHhCWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F2680C98;
	Sun,  4 Oct 2026 16:14:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4386435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFAFE406C6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LBVYlyOI7Cx for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F058D406C3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130492;
 b=aWdbedcQ/ODJQ3HuRF9jGeDU8o1488ozSjSFjlMsawYwR414wJKvJ3jwRQgZopi/xx7/
 Xf+uWwfdr6hnJmsgG5ASgxoc3vPuOEztaCKluRbiS138923eMmfM4WzFlH4+PSxCDzXZb
 RaU69XEl3Drk5RBdgP3Cog3goYMhrJ7wPvpiLChG80hv2mOfSjSa4me+e/fB5O6HkCcJD
 Ztg/oBGmNWxgS4/XZNF7b3Aix4xt4CVfSk8ggUfA0S6JWA8g7yCfx51h38Y/d6jxdeSOz
 oCxiY5Vj9A47bEBty+AruM4Qu/gvkxbbZZNg54TeuWoRRXgIOgMWVSLYi0+hurMC22w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130492;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b6/LkCcClUptg2zhck8deN00OJnqZW89A1bktNhZDbc=;
 b=AEg2H5s6Ye5yaVYvYJfIZB+gPOo8TntQcawhHt9l+/NfkHuMcxLea8xt+BHh+uh+skuI
 EUidJAoDOSM8SSnuIoki6wCAWA2p/nNtVdBrRF3Jx+LJzrzUDh70wVJjtev+uF8LBUizH
 LZAGxQCLlc/twCJTXs19GUNh6GzzPucfaXzsYK3kuxxdM6hXyVOd6WjLyIIvQIvPi813n
 3huNqbt2S0sPaa+WxPOP1vTD5HupLa7wZGPNKK8rg2g60WNoKJT6zLlVX37Y3vH4NGSeb
 9BrnmP9ACm4G6HPByF7C4lwrNLD2jyU9kCYv6PtzSHKrAvlt8Qi0FlMAmszjkqtKlOQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F058D406C3
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB2AD8D283; Sun,  4 Oct 2026 16:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:12:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b12c9294ff5369120bd99b7af9a7a9c343c37b40
X-Git-Newrev: 5feefc6be00f40e6333feb9b2a9710c0c463fee6
X-Patchwork-Hint: ignore
Message-Id: <20261004161336.AB2AD8D283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5feefc6be00f40e6333feb9b2a9710c0c463fee6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.5

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
CVE-2026-XXXXX (GHSA-q492-cfcm-895h)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 78f59f6b67..30265f4aab 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
-sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
+sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 3428646016..cd171b9637 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.4
+LIBHEIF_VERSION = 1.23.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
