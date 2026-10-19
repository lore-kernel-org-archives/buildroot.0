Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC3CCF2E5
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BEFD80DDD;
	Mon, 19 Oct 2026 13:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUMvEeQmOIYM; Mon, 19 Oct 2026 13:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C14480D73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415417;
	b=KzSh1YePzNkMxOFUar6EpW1hqWHXu/Cxa5vp7vfUKsGqOxXwd5mrfHhqYozajFeQ/ztT
	 3MqliHgUbGNVPJNoGV/ssafUVF7xdGMomVtgcsy+KivrKSWJuxr/8l6hNWdjuAL2IcUuy
	 mk77Az/WDLMmRdWKJERBXY/S6K8TwIoPUWhj3q1QRESM4dmTaAgWnOCaWL9vZFAPtgKgV
	 Rn0jDvi65sUTUn0yQB+Uel4yjEmloovV8m7sXK+Y9/hcfslQT9Csdok/Ca0Ofnn7Q2+Lb
	 9kkyR7DV7ohtXIMVjscY4hyN04mi4fIZOKJoaaPf4Huqc/EL/gln45hMODvMJdCv3yQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415417;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XT8GhfjeA6GTdlHKQIyhgvraJz0fpQKiM8B8p8zdxJU=;
	b=WYM8KMgbaAjEHbqXksoKcZy2fwkqrtgudGaN3fNeYJ/rPs+q6E9DNKni72Sy6vS5QcqE
	 +0fmvQcuYD58M1kEscmZFFuTH0q9MDIwWkGfieMjExLp0M4TRrGL8LvFFYf8VL2vcAHx5
	 FcL2cskgUluYfFG3b6BL0HoGNBmJY8vLalSWQBuSIkJcABpcW7+tYESWG670zSt7QIf6l
	 HS9VtKmBL6ha14EaPJeyg7x9AExsD3QyoeYvZo6KP0ZcbUEN5w1HZy5hjGHR9aOVYGm/s
	 415iX9CvqSFWG4qyHG/Al9uzhEMPZmGLciZBZfs9cQihzAb2x+jVLoLinEGIzNZIX/w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415417;
	bh=XT8GhfjeA6GTdlHKQIyhgvraJz0fpQKiM8B8p8zdxJU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=badN0oHga4gJAoI7s6euB394CzzpLikzP2K2JZ6KzTM/iI5ef25xEDPz5dzW8QmhE
	 4bPYYOBh6rPBREzUt7aPSMJy3cgSar+cHGbnwFXM8CaPqhy/6IskjgDGh//qV8NcEh
	 uFB6kiPrX4H9YAEugBPe/7K055aklorJBo+2ph2IisEe8lY03/lGxxBX+saDYfClx0
	 LgcPImBAO+UlauGh7qHkHzwjQ+QxiTPCHYu15t6qqbBqpCakl1ZDS5C8/H5xKpwf/H
	 XauFqB/6thQ6Dj3WMp/J5M8IjmqDc6VWA2Zjsfn7PT3U9iNdfJ0aNxmRITzCS8q1hK
	 lhSG6ZYJQdSjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C14480D73;
	Mon, 19 Oct 2026 13:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9C622B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B4C6060D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7nvPCEUJpfu for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BF9860603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415414;
 b=Td2bxn4aLeUx5oY4pL2g/hc7q93TEis0qYMNFJlfLmUyKsVBt+TS4lrA/bq66Y3bk1ss
 xcUwLUzaPuY5t+02cDeBr85D62kTjZjypdKi4Dz6nGeYO1sZgRhAN3lRQ3ms2LygUNpnz
 Btu+oJI8aa6iYoSDPCou70VPIhzjyLmYK05MIX1uZNJBPrOVlAVipFJ21/8h4w175+Ihm
 ln/9w5AILkWcEsAI4YEeassA0Of5DtAm3VrMz90aV/wX871lmeq33D/+wTQA0xGQ874gV
 TUJa06Lik5oNLHurlGslG06+IYSSUpyyLw+Fjp/nkSS1rfyxbyCgA2x01puY8/0Bf9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415414;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=neaBC+18lqPCslCoLY17pHkCkBg3cbz8DoxbB5yLaxM=;
 b=mmkimSapQSjle80nHQgyJ7colBHWp8/owFm3BNUQt72vllcBRKhKXiIrvv9i1K98OYzq
 momPl6cmb0tq8K0E796j+pO4UaQxTFLb6ow2eGNW6x+3R0KzpdFO0VjcZ3RCX6Kq7NciJ
 +XuThJNWBElGtTzvmn26/hlnX+VNSpOjLNs8lVW8WXyKhxKMa6JCHLpmcBR8vDVprhDrL
 sDy5ua6mJKx92QXHJeO3RLQHXiIQWVJecuT1NDoB6xKgCVx9hiLFtfnfpgmhiq7kHxOs6
 Gl6BPPG69Z53PtGrZBESEs3ljtqwW26Az+zzeimxqLxy+Sh7t/2GkajeQ14yw1BCqlw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF9860603
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEEA8984FB; Mon, 19 Oct 2026 13:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:09:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05dc49017ccdf1be2519460c736432b2a426c968
X-Git-Newrev: 5c248f335f93d50117824beeee9f7381b9a5b8cf
X-Patchwork-Hint: ignore
Message-Id: <20261019130851.CEEA8984FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libhttpserver: security bump to
 version 2.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c248f335f93d50117824beeee9f7381b9a5b8cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 2.0.1 fixes an unauthenticated remote denial of service in
version 2.0.0. A single multipart/form-data request containing a file
part without a name attribute can terminate the server process. The
issue is rated high severity with a CVSS 3.1 score of 7.5.

The release also replaces the blocking-start pthread mutex and condition
variable with C++20 atomic wait and notify operations. The existing C++20,
GCC 11 and threads requirements cover this change.

https://github.com/etr/libhttpserver/releases/tag/2.0.1
https://github.com/etr/libhttpserver/security/advisories/GHSA-q8g6-h8wv-pr43

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index b6b1987464..f4f5263362 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c44d67aba1e4b6767c0fbb895e1acd643601c1e3ee3de7705a59ed09bcd8c92e  libhttpserver-2.0.0.tar.gz
+sha256  cd6a53302415143abff2db2b92e59d3de837652243717c873d4fb41fe22fbb70  libhttpserver-2.0.1.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 7b7aedef0d..535c237f5d 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 2.0.0
+LIBHTTPSERVER_VERSION = 2.0.1
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
