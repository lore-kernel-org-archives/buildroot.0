Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B15CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A42F60623;
	Sat,  3 Oct 2026 17:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BznccZFcoZNP; Sat,  3 Oct 2026 17:35:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 43F0460629
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048959;
	b=pKEgAUCxj2ryc8Nb9VINDvINBRwUvQRPPJVPlQHf+fHqXrqLU14tEAiGv4YO5JehGIU6
	 ytmoIg2I+jt1KJoReXVboNI/js2pQcdsLQvoVMv8n89BBxJbEl2uhTHJBg+Hsk0+tXvbc
	 QQslGMZErNNFunZJGLQQmhQh+QPZUpoHmE73vBnIxzJ/DiueP8CFuhdK4IL29KzZl1mKh
	 AZO3qq7ZfjKNm+B2c71YTobWu2E0rfcbmB8qgUUGz3zE38961T73cuKuiiSRDpd5ZMKct
	 wNew0r/44QK+Z8d4NAEIly/KThorEabdQfWHGV+TEA2u6Z5Dt5pry3rZTpgU26HXmZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CP8qPAgG1Qgx8c1/x0HNJ4/Gy1m642GFrHlMo1NNefk=;
	b=Q1QZ6nUYM+H9+Tk2F+V3EGMMeCN8LvEpRgdqDiVLZJ0qq3GUhmwdnTrErBnis57zd4fs
	 vtJ0xi7NjaYA5EFtVDZJbgalu7vY3m/TUfZKaZusrlezWnKySAZoU+B5aLWf9S81DgQLG
	 72cqWZclnf6ViDkee2H2k+TefCMAiOHGnNoXTGbaA5qLPWs2LXXXQvIuUkHgXp6OgFcHJ
	 02SUJnIbX7ta7dNVx0/AwBCiyGLaqhGySs48b6jfkUuIjMN4dZoDI6kFamOVDUZrp4n79
	 2I9zxqRGPm/yx3E6Jyzquok36rAQRDSxyRbjbvyS11mjXvHViRFLK5CYqPPjy0kjzEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048959;
	bh=CP8qPAgG1Qgx8c1/x0HNJ4/Gy1m642GFrHlMo1NNefk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qVLAA8lItDsufa71LQ7iOSw0HeZd3TPvS9/9980AHl8zO/rzpDpFemCI/pRlXpBt5
	 63B80wbav+47lJWx75zx+VRlDWKC+s79jvsFADXz7etbexnx5+/d69AfzGDkw7ZGN7
	 jPVp9lMN303x8GrLKhtAjQG7a+ruvKnUQAx6k2rxYD9a7yh9Rwr+KIV9XffEwv1tRb
	 Bazzfv5mw78N8RzyJviZRQEHpg/xH8rS7sAcausqojm4/1KHxuSqNJqSwLAcyfL2Tz
	 PqIHpHnwZZeUrkoAlepTHG3ueU8NAf3OIJrnKWud4rjAwA8d8TeDlWk5cqiw0RhY5I
	 wuhik4Xs7keIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F0460629;
	Sat,  3 Oct 2026 17:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC4051D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB6640847
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqBdCmVIwRCU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 28F0A4083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048957;
 b=Z7uxeByi+CfyyZi9FvTGhVSxpD+fIiYtHx65Vn2cLU6KsM0fw04Cbng4OF3vOfTCUTmr
 ap7+ObcSsGBnRqJ8FDRyPHUpoUSB655bedA4vBUBkagKkZvrPcMebFDQNE2pg0vAO/XyD
 +3/uztxn3rQuN7q6OUbSfhUDqBSkc4uqMTMPq+PB+4tEMOWaFo3zf5yq/8y4tCNKkNhMk
 jIHTwBHsSHPlGZpBb1/694frbTZ8GhULut4MN8WJlo0n+DT3IKlxBtuF6KzkuaVKnAK/X
 ZPu368+kjVJ24hJnvZmQzrlUF7J9g3QhOmCeEtJuMbS/XOsQ35JMZrfTKIjv2p/aEsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048957;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cwp1em2WgfLocA1Z3Z389mN6/QhfOx8kq2L0+kU5xY0=;
 b=ZS8JAonGL5ScU6dpJP2iShs38RPoSKFHOfQ21lHczA8TP59wYS/LqJ/g1iMoyZZKCb/y
 bsoerSPSLklWABkoZRpqexTpkxmXda9i2v1lrN4gIMBmdaxdL6tsyjfB6KQotICMz62GH
 1rbwQ01C8pEpXbNSNNI9dceNguldJzKUh0dVtQaEPNayLx9k07pFYq86k6NkX8g+CJYDM
 CTCAaRJlR6Rg4VpIdbQ+Od29cdJvfRLbfu5QdYZyzFmDeQfn+AAXgFHUNMWhAFBcgv4/8
 WbEJsQjmjTzksTsSSumjuqV3Ff4n6YQQmrRZ6jR9aTEe1AdTQrGGbScrc6EZDlZUSkA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28F0A4083D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 542CF8B52F; Sat,  3 Oct 2026 17:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:34:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 084bfa6e6d53e3b3e3fe30edf59c804a7898bcd7
X-Git-Newrev: e493982138e1ad726dd07e2832d40a8bdfbb59d1
X-Patchwork-Hint: ignore
Message-Id: <20261003173442.542CF8B52F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgphoto2: drop autoreconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e493982138e1ad726dd07e2832d40a8bdfbb59d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 8b05934511ab ("package/libgphoto2: bump to version 2.5.34")
removed the patch touching the autoconf macros, but left behind the
comment referring to it and LIBGPHOTO2_AUTORECONF = YES. The release
tarball ships a regenerated configure script that already includes the
jpeg_mem_dest size type check, so autoreconf is no longer needed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgphoto2/libgphoto2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index a639245c25..1c39b26cd0 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,8 +9,6 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
-# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
-LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
