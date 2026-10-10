Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0154ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABA69813F6;
	Sat, 10 Oct 2026 05:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMWQAjSXkxJr; Sat, 10 Oct 2026 05:39:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B80A7813E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610798;
	b=TEKEtIHON4WdJZ//diCvyujcGiUNMRD6RtD9zkQf7uMmuKoe3+7/IoyW4km+QebTmyZq
	 hdwTUY8/SvoH+hlE2nlYjnpBLauSPbQA546IMj4O8/ELiLpTKVCEtcjZi6O+DeSKw6xGD
	 yl2AY4SazMam5Eu5LVmqU0/vq6bPw8+cciJJRssVoPLGM3BCeK+pAnNCmG3dSxDQh4B5d
	 zQhpepucBIQoEerNoV0cgAx2BHSLLKhAe1CCf7pY5hejbSBC8/pJiuO3H6wElaVcA8Klj
	 9gEFB04JH/82Zp6IQa9wed5iMG4qre3Gafg9biIX3OA36IHbVIsnWzsls1RxeAvhy5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610798;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+i0NaeS3hRzxCU2k6DXnNMtKYVE0ufpaNH418H8LtEo=;
	b=O2enXLjsjAVEWFfU2P5+1udISg/sfxUuu/V+g9SEgn0K2GwfIcVoY8wugnSS2yv1OXjk
	 UaXkCzp6VTcA6DbX/1dMFpWidh/MiN6HASJ3ATnbiufqpiUWD7JVtGTZXYsh5IaY49ZNM
	 0eMKfz+mcIFIwR0MMQP1C6NtyHbpctTir/dGDm7qy+D/ke5oFrAWYtycxHURxIdLPawwl
	 ZxKkNvLwyBCzmQPaFQEQmKmokR3yzMdFikcbOnapZ+DbbLoZzwcB+tvmfmKdcziuiOfYt
	 0WvPSRyYUzVmm8EkpSrkLgPPJpsiLHg1wZIl3i/S5nHt7YSy5EuHpyvGcmfkxs24quw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610798;
	bh=+i0NaeS3hRzxCU2k6DXnNMtKYVE0ufpaNH418H8LtEo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mug210YCdMsmPdxCwV8IIssdzwM2//Byk7yGOg8Qv/m2boqsXD3oi5F+HCEbJAkk6
	 HiF9ejSbcybXr1QBB9VMOv4HlKuOZO/ARrEqXFQMa3Ba7PCXwBEnxcIURM7gTz5BsI
	 lv2dtiOfXQCTFCtr75lAHWgpFh38V+bYN+qBvJcYKIvtSU4YopDnrYAaDrtYOHhpW9
	 zpwyhv9NooCl5Xi3ZPVsrAVb3ugcmhPzEPqW5r7NDYpi5VgxlIP6Xku7/t84YyOhNq
	 g1inSPKc7f7Iy4yzZXYYn5tjWHJNvIY4dwt6wANALPYaYMJ10jYeavMh3Kb2kIcNR5
	 +9s1BoDttmvyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80A7813E7;
	Sat, 10 Oct 2026 05:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85321380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AC3B6061E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_UFwjq0Rcnd for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A749860663
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610796;
 b=pKd8ZTgJu1O6JTLzxiTfMZgs2MrRJA4dSP6yTu2MGB2NmraRYm7q9u+qwPvlVLREVQt6
 TF0WCzoYDLQMPvRE01DUPAU89q8RP7Huf0IjfiQLnG93OXmIu+J4VAn5fyUBa2HkqIBUO
 ECLbzzuv4H6WdimSNnKJ8ThjUbGzh0B10lIzrFyPwgDKh0FgghEvDsjQd/OqicxlMNW8X
 zmgk/NEORaGH0jwC222AQXQmNjQKUypVBT1A4pCGu0MfTVLOEAuConH/ge+dylFPWJSjh
 dxdtIlVIe9emrswy9KsLCy8H1rO82ZE5EOrgVqvry4HK6BafbgTrC5Gbqott5QzO9jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610796;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dTSsgEvfGQowOKuLLmljUsTTrIZ9LATnIUO+ij4LfgE=;
 b=iizgCiVW44ZfvL60sVVapvbi6/W1YgjQ8F+sTjeyqNwQZ8hCh3QsiWOKQSkK5khVOn5t
 b0iIj3QBS+PPfwxmZqdx6QU4ytB5xJ5TlrdQOofR68f4V8l21Uz0q91vJ6HBBe3eoo2Os
 D8vstD25UmyNyrhYbSgEcbKUv+1sWJoDbUuyTFVa1nn3j1Yi135N6AWRJl7YSRIM5Pq9q
 +kojMejYYjnQAabC25H4aQDEv6XZS8MM0gM2+6XF8bZS1A1yC916ygX1TB8debk7qhJsY
 wPHlXkhzWTvzJpjz35PkgUyyqKXxDMET3HiMZq6UGinjKcLRUsH3T4KyzpRIT0XEomA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A749860663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F5E38E490; Sat, 10 Oct 2026 05:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 07:38:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a95699a72f72ff76b9f017c0daafa1913c3422
X-Git-Newrev: a19c9e6c44e65eae6f669f9632f993fff8669a44
X-Patchwork-Hint: ignore
Message-Id: <20261010053838.8F5E38E490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb-compat: bump to version
 0.1.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a19c9e6c44e65eae6f669f9632f993fff8669a44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/libusb/libusb-compat-0.1/releases/tag/v0.1.9

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libusb-compat/libusb-compat.hash | 2 +-
 package/libusb-compat/libusb-compat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index b22fa5434d..ea3a89187c 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d199c173fd3cd9d27c7f4bb6608befc7eb761984e6664da7d9d4386ff66fe6fc  libusb-compat-0.1.8.tar.gz
+sha256  b09aa33e943080352041ea3d5ac01fd90ea96e9337212865de0dda776886dbb9  libusb-compat-0.1.9.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index b54dbded27..4e78a213b7 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).8
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).9
 LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
