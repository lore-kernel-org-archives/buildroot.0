Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5781CCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D5E610D9;
	Fri, 16 Oct 2026 13:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbU0mOksahXt; Fri, 16 Oct 2026 13:11:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 22096610A9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156277;
	b=Y+Vb9YG1k7BesHr2C7D/+riAYtp4UMtmehSRquR/8kVNioCggbCxadzQqV3MnVtI02nH
	 /70ViEjFuj87pO6ppfNUgFaR0NrKjG4jpI82uZcehbBhOkja0NM0WVbDFojKMljKc5Bab
	 MLJPRLxVq4Txk+WjhhM6E/qTZiFaz05uaz0lwk5NFSzgEKieid7Nnso0WxYQ2BlUaegrr
	 NSmkn68lWuD3MVtCGglAFMPr+jf6dkbvZTzhWjIaIxAjyLtEe4OxKlrrcHJ29j1vxo3xt
	 Xl+0Vy62O3i46rZS1mVc0FwMjekTyrOuXNhDLr7ejj6BCYGARYkyEEQ7RwB0uWkxByw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1FG9c0UMX/8Bot2LC+ZEQaWobSE2E/EVRw3PN2nMcP0=;
	b=pfe2QaHKSZWMe2g+b3l/7PY/wcvb0nQgBnnxwPkk9zLopxZ/3+kJ83LJ4j7OW+YDOGY5
	 egOmOeXSlSV6gwvBRRQyknV49zdNdYIpcAr/GCeIMUzo9CE9lUbXxs9FFseb0EA6P3l54
	 BKbwE9X9J9A4UnXNpkqEgpwQR2G7lxp4AFhBDGNd87H3OVYkfC8KMzxgLQaWIKgKMn48t
	 bbG5t8cNCHYXmpLLC+BMoZPf/XE7/zOiQbhCb+EhUBxX+p5+/Cvj6Nn9XiAvO5xuaG/Ej
	 xRaghGiJybtcdrebGHd9yRWxnXnLuc9H120K79rlFcoNjTCo0hb5ABmK9zHWg6a5Clw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156277;
	bh=1FG9c0UMX/8Bot2LC+ZEQaWobSE2E/EVRw3PN2nMcP0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BA8lZl9AogzkrrC92LOD7x06sEng9K+QG4RiT/LveXXFSmEIlJxHcQvyM4Vg9mcU7
	 XueM47Nvlip3ALBZ+n03b8eq/8OkgzCyvIla2fL7kjY0RCAUD9vMCBAlmSshyo/rmJ
	 QZ9+hxZoM3F9N4VItmZ+5boKqZjM0nsfLEJVrYlfOeXDyQR9Snvc4xXKXm3UPENdJ/
	 Kn4QotKKwnZVSUujm2RI0b+UMEicAOLImsl6u+ysKg6TcTgUHEKmT6mcBD859HZhWd
	 MSI6KtwcdSR/4+zGvLhwngTXaCxrz6XFhigwm+GiXAyLBLOvP8CwkuN4EsjhUKPhkI
	 4zyNHl09OHfHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22096610A9;
	Fri, 16 Oct 2026 13:11:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCA3105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6537D409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7LPhqo8juMbv for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2635409F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=Mk+XUqH8L/SEcd9PqsEw18xgoSrFNQZqkGTA9tcvCsAKUML2HxMEFJAAy1jAjiDH0aH7
 lC6rphDjKw6626CHmckN9rSemwf6hXrnpGhyAJnIl8cMdGSjXzCilUtM7QeUAgBK1pma7
 9pMKOj8iLmjxEyo+40TrxGHx7WgJE0/lghJBhHcDtp7t+XXpwnjIdP/5qO7j+sGsNJQC4
 pJBtIZfNP1fCLIrudjGunDW1FB5jz8mZrRl/2GmsC3eMNvo9BB6vI6IVCQkCcikwQcMZ4
 FdK4WYFnRQdYkWrI51pfMOWrjNc7sGDAAE6Oc1JWu+dM5TO95feKalThoJg6eouAz7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qZp/xytu6ssLfu5Atmh8CyRrhraR/cfvFcNMD8fifDQ=;
 b=cFG6M+ceg2T+qBO4q4crnRO2CDKBW+Tw7bPYOJXCDVCp344NaF2EZW0un/LaaqimcaVY
 no19U5TxNeI0SCwkgTsazm3q+kPDntLYO+9f3WZRZsAD8xApBH73pe1Z5zOzH6dOlE2yE
 Sx9CITCEzqPR2eOelgGJ/ebOSL2aI2A157OJARQhDmq5IX/HPcMlWrsJyW7EGKNob51E7
 XoEEYVDRqwfSYNAJYj8ARMl8DQ7btR6TDKiwT0m+6g9vlyooaNdeFGjEfoPeYL55Y8XaT
 vgbaaK8cZu8QQE5llhjT2JGSkHQsR0GH47/f4zo4WtYgtq4h3z3XUZC9q2nut/MFBIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2635409F6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A28AF960D9; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 841cdc40172890bdc26b99f74b166324dd12d476
X-Git-Newrev: dc7e2cca5c333c5e653d48bc1a4e4cf006d447b3
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.A28AF960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/hwdata: bump
 version to 0.412
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0509322583105148974=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0509322583105148974==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc7e2cca5c333c5e653d48bc1a4e4cf006d447b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/vcrhonek/hwdata/releases/tag/v0.412

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57ed2d0d6821971c62eee39696a748395502c518)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0509322583105148974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0509322583105148974==--
