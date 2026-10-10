Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC6CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AEC040835;
	Sat, 10 Oct 2026 06:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eo0ylSEzefPi; Sat, 10 Oct 2026 06:58:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F9F24084B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615499;
	b=dvH3b2xH9FIiGxBtT/wQI2IAsLIYbeB5CZw1dy313ydwB6Wdl831FqncKb1JFmA/HUdy
	 RagJCbBvM5ela6OFibD8V5/sPmPyLwM4KMRgZ5eJG1lzTPU/cbejDGWxioUcG3dE/oRS6
	 yBpSwUYjFJhlLx5VOXK/iSQRcWKRBSdS/og2S2cAWNXXBMDyrNDImnI8u65aNfDx5iPHd
	 sJkLm5obCtc5d85MFJyN1+yoV5ymWsmJBQhM3LIJP+/pm80Up6daAb+TEBaEbmJQ2p601
	 0xf8/zEa4hbLM7IDjE3QSBhGqqTmwgBtPS110kd+EENQvkcjVp6uRV0L1JDC87sK3Xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y0H0yeZGF2b0WqFQ8CysVetzP7L7slSJZYOF2cY303E=;
	b=U4b+4UO4eVrKWpY9g54zN0aSiAEHDDuzhWdt1rUbG0j6QruQN9YcEk6V+DrDB62iDf2H
	 3Chc921LDC/+o0gkokgiWtby7yjoKjrhtSRF3eD07kWxzJQPXnOFglUkMJXgai/QiFoRy
	 DPSFfUkB3UROpImSqGNDIbjw6HfDxYC4ckryUnNdIzW4BKj71IrDcxIVBF8yR3TkWBLyz
	 s0twYPn37v0qUDbnRHonaywiqMO3G9F+/w2mw/8dqCw/YjYpFfyc2uagSg23aVXiHAUMr
	 bNjX3DJy0IoeAEr9Tca1QpF1G4kCNIeQySs0NO9I/gGg/sim/djt0bHWXT/qGAvtSaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615499;
	bh=Y0H0yeZGF2b0WqFQ8CysVetzP7L7slSJZYOF2cY303E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VDJeMCLTFaP1NeGO3UGswH4JtgWW9GLzz/XlhsUr6ruQ40NISsFwWLgvnzIcB35Y1
	 sArDRyyUTHkAnK0kPS4oq7QxgniuaRD5jQQ1/F+JLBytFRehLZDvG2l89I7HijINZ/
	 NAWKayNVcGRK4p7tCYn8DXqqmdMVzOLJzuRRZMBgEODsxU1CP4H9+etW/3+slBPMjp
	 vhJ29kRe9GgsPYJ9jrYxgK9JUlBCitie25P/tNEiWTd/NeTFYd9AvZY0flA0NIlBZS
	 HGkFmF3Y6a0xHTTuhuJQrQGZfKx7+6oZGjdfs6q+VTuag4OKGK557uI8ii5AFLyuap
	 QQNCTfdKcTa1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9F24084B;
	Sat, 10 Oct 2026 06:58:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABFDA75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91EC860629
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4W9rj1vrxt5S for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:58:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01D7E6061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615495;
 b=gNt4Dc2B9Ij6+KmqxWTxmYP1+/PmAADlaBxqGh0yJR8YlnTMeD0DzoVHbwU44GDUh00L
 eUCcv0lL6Zjn/jPGfBt1h6ifma58VsNdilvMfQLrF6cRDhfsNnRKzhcFIfHaEQDKVjPDE
 5uVd348AGE6ht29PLJ1a1KVmlOZkxIJYcByyNVtndCmgw14OWMjjJqKmHPJ6jC15hQpTN
 HBQ7x8+ZkKWIlVTrA3evO/0yQZTa3kfrUL/D0vyA0SOrfzV6D4J+hhiY92yTEPa9YG39I
 Hh85dNiL48VNFGV3TjjVKrlZ3K/TqqwVMC6daVCc+ssJBLGUSIdKgjlvVnjjHDnGk1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615495;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7VXDb8wVIeF7gOXprgXn6Bk6/JdQ7RcTNBkrJfrMj+Q=;
 b=DyngI3rrlbSS70y9RCZ+KgDF1JniRBxrvgU16MCVXvifYJQUDjZ6QAHPCA93evAWDVZX
 lokZhqDWRVm7pl/koDSIq1+kil9uLWpZ4/Nl+puxUqBmVXrwo8gB6naR3m/m7oNXvad+z
 kJUSxIbQa4oge9ruzrm3GNLZiOXiG4MXjNCRDAhbA2Y1bdIYfqejNd5PKsAMtcPPfLBz0
 sDHQlaKo8MVMGY2zakDOm1bBSxSmBjw4MwNLmVLQxVXHc4CzbVQYaDRPc9zLfaGTLIut9
 g2HtcJ3BpEVynaIUrYUp6B9irR3dBT7rsoMsRvcqyrPDKIaW62AGxe4d4Mwn+z4/YTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D7E6061F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:58:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E74798E646; Sat, 10 Oct 2026 06:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 08:57:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2a7c4db4be1900a88c7062dcf5f0f0b4bbf5434
X-Git-Newrev: b1b5bfef44b78435a9110b2db9fb8751701dfda0
X-Patchwork-Hint: ignore
Message-Id: <20261010065656.E74798E646@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: bump version to 1.15.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1b5bfef44b78435a9110b2db9fb8751701dfda0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
