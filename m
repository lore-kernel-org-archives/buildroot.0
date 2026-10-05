Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2620CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D513C4064C;
	Mon,  5 Oct 2026 11:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFf5WO0W5ZOy; Mon,  5 Oct 2026 11:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C933E40633
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199228;
	b=f5KmJZVNhTv1ot54fJqcpfKeErj+bp+Zux5zP1LJhp8XEquvZYtorJEP6va0dVoxYG0P
	 tG5t8rcVVMynYSIxAvn+OHMM9M4eTuMaE6SWCDhU0nHy5rcwiv8IcDk5Qdr/bv8fIRi43
	 xrU1FWrZi/rSe7qG6En6pQLhkorIKnkNHRl1JZs3q2Nos/SzudB+IOsKOqoq+UXnVQs5I
	 LXZ1hg/fvGOx/yO0om2MtHdd8syOJu2ZaNJ1IkTYZEQNdxr0FgepVb6EFcBGTLujvNnqA
	 YiORNu2tJpmAJIV3eAoHCs8YUDO8nTOXXPJPLHr/grtW1A25NZSKsxVkTYJlWLrPb0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=KUl06WlyqMGEb2yk832AQo0aBy+Pk/iM+xmX7/BBZO0=;
	b=Z8pDbeFYtI/XHtOIdzDh9alVaTo5Jp/2zl/s8fJv5YCbj10B4UzE/dq0Xc/7EkAp/tYt
	 p0OxgSBWQlJkApINZ1y5uJSFJvwOju3//iRL48J6+3Ygn3bN0GlU7DxRVr7I0CVqZ5LHp
	 tM3fwtyczy/ZBRn43nq0dgsi0aMVWMFw7Suj+1zfj2vbucpur9ekCfiFuPvbt4y5rZQn0
	 kZ+TQ8/7/7zlXmIatS0rzBvGDQdS1BFDcHfwnoDNXU0YzILa8cdFB53XSiSz4hgQgk1bV
	 gfpgHlOA6xViz9dQzs0Vxjb0k//3Old65BLo82NI76o3WyYtp0rE3FRz+we8TuVzwUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199228;
	bh=KUl06WlyqMGEb2yk832AQo0aBy+Pk/iM+xmX7/BBZO0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ItujZ+YGYVu2VUniYeml9gI+2lWaGcEBL4/F1TFmKCFBcBAD0Z0uFBXvflFbzzPBy
	 C68PkzDTvJ2pxZggbR9BVNCmjgBDBReFIpffBSL9QNXZd0ya2g+SYUgi7jzslbRi4y
	 8CzlyjWt1WGDu7OWuk9cRQFfUiOJNPhcT8GEkIF68D14rY5EE/IROSRAB3E/awpj6o
	 hYzHjoFK9JngAupjKaJejj+cbLQmSwePRoaU00MnwjEOBakfpygcNYNdUUz/0QueFd
	 zc7tUBLsqdf9C1Hx33ud30eZwsxpirZDI7KETyFCQzTwwsojkzX57xUMvhrEKv7Mo/
	 u/UgePtgbu+qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C933E40633;
	Mon,  5 Oct 2026 11:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4122E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3928096C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH30cwFZB0zF for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 52E4A80960
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791198776;
 b=ispSG+ytta3EzvBaaAjQSoHan0HUOylpv/Qnq1sO14yX/Pakx6nTpkj3yOGWYzIFb/+U
 6UrtYg7Ti5rQSCv3ZbfIDBQAZuN29O+ZSEB1PgYWjKTz+eCGA6T2fexiLbtzPl/dJJc5d
 XZU+ROookhoLxUGI4Qcc/c3SV9pAEwQkxnBeL+oBGsZa99DJA81QpzZcwYh+VR/5mxCTm
 OKRAbnp3iWHfP594l6OiydeZtAataQxq9e35jy9lybXzaa961F6MtbmDV3Yiy4nqNvlbD
 h0YhNPITDzNtgrJdJVTQNDccip3AXC6bSL9HmJxXm6qs+Zl2ZzERFKV84hHV8VAMKdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791198776;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B4zhqx+v7Ok9bTNidzTTLPOoeJIJkUwmBmKD290D+gw=;
 b=ns4iQMhWJYSYgCwzsaAZMYaXOppj4blkrUk+fjzOAHKvgai7vhoW5uXDqw90aIcs1Owq
 ya+xRJu39pqXsnljQ7xp9EuAMWYAc91W0iVY6SvXTi4jPM4Zivp6TzRv7127FZI+xTPBc
 jND9no42CVefMB036mhD2G9Juew/J4QtDkjAPbeHVW1tcrrUl5bjk0xk49UvX5nWaVMMD
 v2qrUEaev766D7VEXAALgET+rOmSLN8HsFg0xbIebDxoEjj8I+fYGbO2c/odoKdqTdrph
 5BzSHUkODERF9Ni2EgCrl07abUnkg4IChfkR/xTSTYBJoGrxKTeuwEJ1a23H8hGQGfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E4A80960
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD6D18D585; Mon,  5 Oct 2026 11:11:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 13:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c29ff5b9b38e87af3df0c95c7e3d6f51c0c0688b
X-Git-Newrev: 57ed2d0d6821971c62eee39696a748395502c518
X-Patchwork-Hint: ignore
Message-Id: <20261005111138.BD6D18D585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwdata: bump version to 0.412
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57ed2d0d6821971c62eee39696a748395502c518
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/vcrhonek/hwdata/releases/tag/v0.412

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 0046b56c75..a698a26265 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
+sha256  f0c64cd7e31d70a5fb3a52e53ab50a61e74c0421a6381eaa45114eec3bde5fe7  hwdata-0.412.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 20ecd799b8..5858b821af 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.411
+HWDATA_VERSION = 0.412
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
