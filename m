Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13763C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50FB605B5;
	Sun,  6 Sep 2026 09:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4SJASwp-_rP; Sun,  6 Sep 2026 09:29:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA4BC605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686941;
	b=PNydE09wkBZdmfBDZnv5WMCK7bcDA9/8UeXQ3aGgwWpluGfy1PRTbhubtschIsX2lav2
	 qhnAdKvyJFl+rvy5pEyrjbjEKYKSXLBqUE3/gWjucsigBYkJwvOjm+wERzNJWQp0A+uBj
	 2cginXboH8+GFMYjTaZAIGHgA5a0OAuTvm3j5XyDLQwe+30ASxPapt3gJ2a5x/cD+gtuc
	 YJfEJijGCgTHdUAjNP92h5YMS9MydH4v6iL20ewtrahqhHZqfR8S4kXxMnkyE2UnJqtDX
	 5HwBwk8WN6K8qTiwVzwUsMS7tmKJIPUVF3aj/CDsuHli0FnXYyewaH0VIZ9oHT7goxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5z9Vk4Lhwsy9LtYjjhKQ0kZK5N08HZvc+7FXC41ff6w=;
	b=taGVVbNkIsF4eUh8MDtM/McDYNUwQiGb7TH2xXXz49m0Z88OcTewhvKYCvRtChzOa9VJ
	 yD7W5H9hM+SmUZJldH5pL4EfAXKyoqW3WjTr3wkeDQVYeUUF+Yh3lUnYo59ciKPMwfxbB
	 yXK99YmLgG/XoDlJn16SJ7QeIGpYeAk9RU1ioWE1pmwvGHOMhkUyZfFtV57wHwGatggb/
	 BBeyE67OVkfG0GFODezP5D5JAa8a4XV+cDkeSiJJzCEKi5L8rbAK0VYZCmg5EIN9NAmmX
	 1j//ZptaNfM2FasM7WDsL80LDo9Ms2y/+ICWpj/IwmVeXiUMzCj1s9HBxM4QUyEvZCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686941;
	bh=5z9Vk4Lhwsy9LtYjjhKQ0kZK5N08HZvc+7FXC41ff6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bTrJe7R8wHy5X9IIzpU2isa0EmUn53zjFrl8m0deXysm0BLhCDv25DKJpl9nXujej
	 vwt2t6N15a6PkXcI56F01MY3HWGsUVABirHnjDrorMkxgh4yRgZxf+fqOmhm+h+v0c
	 CxOTUpICuymtAsbRYUjnW3nrIK5+/b9OPiusjQSjP1zEjBP9c1X+RWXef/Wxs7arpT
	 s6hrKZcsZ3y4bOHxYo5qykt79S8c78wjhFBd4FjSXUWrzxU8ZDY515z0ATELyzvOkP
	 8EiWKEd5/BtCW26HZbKx15KKWbDP7GIVVNsFMpayOlwLX+xr0xjvtgDz349Udv3TI/
	 eVWPJlmrGl0pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4BC605FF;
	Sun,  6 Sep 2026 09:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F3E72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16AF640620
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTUUaijb9S0X for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:28:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61DD14061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686939;
 b=TcZ4GIsuqdRO5cjRm4EZobUSOEpTe2Z7LTs8h+7AJm9ZCh3fcD+pcl/RLp9nEpEYvAMe
 KdkoKbh0lnElRaQaDR9mj1IE7bfBhVnJnvP/7S4Ej5tT/BSe9PUWm4VR9tvKOu8xaSbae
 0d0n/t8TO3biBW36/SS7x/+TAMYEBYc6q4Ure4k4gREPkGhNzZmu7gdXCJJjJbQ0Xo54v
 y25ljUawY3cdaG039OTsrkqFqwtSB0RtO5vxDJptUrbTvb+mPziL509Ln6ufApMmheSWU
 lx+uto6JllZyWHUq6E8UkMbMuo+kPcxmfFi2PhK4onKE3OBSLetjs11BhVdhkKJ9u6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686939;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SjAFyCURlCrZ05qiNoE4a4jWEwo/YpVPBcPOBP3G0eY=;
 b=nkDwl9zCSl09K/JHc4nVwy65CDLsq9MShZdb9bCo8aKQA5bvj4cJ2fzF/ULPGpvFP1ud
 r8R8eud2ZYU34xDpX5Rm2RB9m+Ewi9trMitkf+pgmb1lUzjxupaMEdBJMNOrAR9MInsbY
 zdDbG+vJuT+Cmyh9Np2i8dpvkuWb6K0sofd361C4Ir+JkPKBbbOslkVTeJfFlUUailadU
 54u5ycm3D+v81OAA93mB5sK6AweGQY/jp8W/WQPneVoUCFcOzjN9/9FVl68qmrXhzv+Z7
 Ye44479jWuonfffjo1FIXLHjWtdyH0E5TjHYCJ1PEzfPmyHozJ0YPOoDqzlZ5rWRssg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61DD14061F
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:28:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF09952B3; Sun,  6 Sep 2026 09:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 11:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2b7199dea314353b7cdf417ba8625d7c201ece7
X-Git-Newrev: 64ed9e6c43fb531f011caf4b9aacc9e8c1f8dd00
X-Patchwork-Hint: ignore
Message-Id: <20260906092757.EAF09952B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: needs gcc >= 10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64ed9e6c43fb531f011caf4b9aacc9e8c1f8dd00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 9a43bf6593aa981040e5ab91e69946af4fe0cee2 bumped the gcc
dependency from 9 to 10 but forgot to propagate this change to the
libcamera-apps package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera-apps/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index fa41d1be2d..397d59b6d8 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
@@ -25,9 +25,9 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.5"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10, headers >= 5.5"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
