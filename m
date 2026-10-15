Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007BBCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A554861154;
	Fri, 16 Oct 2026 13:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ovisBZbRNgm; Fri, 16 Oct 2026 13:11:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D9540610B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156281;
	b=QF/SwLfbWezyggGM/nj0hcHy6aVNxMEI3aPhfI/cEGD0cnYjl99luS5Q6Ln1FfgPfBmN
	 UENJSh3H+U3Lqyf+Ltq0DApU11C2oRLj2FHSRstQgyl7tcf4CGyGdAc8/AZhZ5FVbfOZk
	 P4XLAGQiHUfNGc68kWMMierkWZk57u7Bsuf7lnM/cRvZilvMEWA60ObSdTF6oBJzVw74C
	 qRZb7W75nSDIEfyxkYcV1dgTh8FG1bu2Vo4s1s8gRuIFELeyJ+0iB32GCfRgWweUT9tCt
	 kMgBOZeXPRMOpXgf0y3bvWouo4t66GKOkTuJgUwop2gVMhZjIA0V3O68rQoXJniLJ8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wVOOO9WcVe0Z5dnb8meCREo4dYW02uDBt4arKOaVWgU=;
	b=RXQ3BncX+5CZLBRjOxpjyx3N9raWdcdMBBAzcnYrltkZMaUEhkONW+1LkDKuOEs766Zz
	 Ky2nKwo/Fw7NmdWw4WP4D4GJQUcPh9oHl11m3MBkk1E1/d199kob9QPdYR2P7IgTYX8bL
	 DsKhnEK99Xh4ngHxndLOzRZsAvFAUjDabR+k6cBGkBz8zR9fau0UocgRwyUXMuaeED2Gh
	 m3zKGBvEVSrMiazpE1euwgR/ed4Dh8phmZb1ypQcZBzocFAGs47r5NoSaVv8qy3nDNXAn
	 tdQgFzj20yvhCOgXcE1ZQem9LtsPqYVBLMR6wnvG8TJF6VsiX6PoJ0on5FJZApy2oog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156280;
	bh=wVOOO9WcVe0Z5dnb8meCREo4dYW02uDBt4arKOaVWgU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bKl6p45uNj0byT+mutblzlsjrQK1CVxAZE3IQyOnl7oTg8nLsOKcqQD6AF1yYKxkm
	 xN7MkA9k4dG1ReyG9BIwA4qZYJk7lNYnQ/fXeB4pi6q3IqdPZKu9/KxIrEQ78fqizE
	 skm0x3qlrgLtKTym/2vD9LnyTMX9rY2dzwAGwTnBJz5pbkZP3EOvyBaNtTNge+PD1K
	 GrXUgPHlAxHhZZpZi2JvGD4ihMYxKUO048Z9W8KAMyT3fxets7E8zNU6kNVftluwS0
	 siogX9aKx+1oW49OrmUHAJX+M0LHhwSUNiPm6gD4mtzSoYxlDib0q5ixSy2MsYtKzM
	 m+Qq7glBBSX0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9540610B3;
	Fri, 16 Oct 2026 13:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B35F105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 354A840042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyC4yM0JqP_j for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CDD7C40489
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=AOVPefwKwYgnAXIhbzwmDtYswURYHMa+Da7MgvGU1tNn7E0v50G8R+cLAu/ykl9ypQ2+
 8WR7qk1IyUkKbsGaZmFOE/tKmu1V5bGpO4F2cX2M2Q1esyhQAYkt3+RNojptLihZQTnE4
 MRh90igYZeZg5P88K9pne3YUNNSZSvMv66/Z/5M0Vd3QnwqCLafXHLcmI2aUe+XUGeNaK
 mec6kgcvh2mV203u8gNhexkAIrtRGL2QJY+4DXeCfqSyjEHwci2ZDJKfx+HGXOQsbUJpt
 RtndKPrBIOFnAcSMnmb1lxM4xS52xLWYaGJmklH9+MKJKq4lU+1uQlMI4233jK6uzGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Yzw2LI2pk/JsKNfPESFMA5Pic20bNuSfZcwUU0PaMBU=;
 b=ZZQBLziRIkHsFYMwkLq/NWUCcVJG2mQynGodjzJS2cS0t1JD3c1GAsTQ/9M07st7mj/X
 g5CRA0PYcJXKVOSjUPu3BxylIVLjW9g6gf+vCW96nRCP0q6T5jyYWjFqyKNFsRKzUsbr+
 zVk5SXUNvX/UlvCcn1vVmcmHCf7lndi+Ckpo/0mBrsYNi/zeCApy8lBGPNWhBfnnhSA8i
 Fv+yZCmMLRYAFKh5EuERn/SmYlsJOJS4G7mCSq+1Bp9+5KDdVNz6ZkSOikdeoMhvh+8fC
 g0gCxQF3hVZJEGAC6JeQZpEk2mVyoRKZD9tIvlAK3R216GYrxn6UrUeokjmTHCXdM6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD7C40489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1811960DB; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 030dc6e2532b7047ad4a502b930d8aef3eebc62d
X-Git-Newrev: 78a14e155a93bcde0392c05ea59fb5e2bda6662c
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.B1811960DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/vlc: security
 bump to version 3.0.24
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
Content-Type: multipart/mixed; boundary="===============5790175877819062877=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5790175877819062877==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/78a14e155a93bcde0392c05ea59fb5e2bda6662c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://code.videolan.org/videolan/vlc/-/blob/3.0.24/NEWS
https://code.videolan.org/videolan/vlc/-/tags/3.0.24

https://www.videolan.org/vlc/releases/3.0.24.html
"Over 130 security fixes across VLC and its bundled libraries"

https://www.videolan.org/security/sb-vlc3024.html
"VLC 3.0.24 fixes over 50 security issues in VLC itself."

Upstream removed unmaintainted libschroediner library:
https://code.videolan.org/videolan/vlc/-/commit/614914f7bb7d4098bd5805724c0d8415d7fa32fa

Upstream removed support for mfx, which was disabled in buildroot, and
replaced it with optional support for libvpl:
https://code.videolan.org/videolan/vlc/-/commit/dcd1e9f447323a97ae230b9d86c7b8fd223426fb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cdddb871d385ef0549819d1dbcffd24a58277181)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/vlc/vlc.hash |  7 +++----
 package/vlc/vlc.mk   | 11 ++++++++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 9634ba3f1f..4c9e67d1b8 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,6 @@
-# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
-sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
-# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
-sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
+# From https://get.videolan.org/vlc/3.0.24/vlc-3.0.24.tar.xz.sha{1,256}
+sha1  dae683b3939220eac4a5edfc816c44e00659e68f  vlc-3.0.24.tar.xz
+sha256  e7cab503d1d7d5849b89d2cf0e1ee60d0ef6d012407791b644b9cfc0cc225fdf  vlc-3.0.24.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 0ce6662353..1f6faa9a57 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.23
+VLC_VERSION = 3.0.24
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -66,7 +66,6 @@ VLC_CONF_OPTS += \
 	--disable-kva \
 	--disable-libplacebo \
 	--disable-linsys \
-	--disable-mfx \
 	--disable-microdns \
 	--disable-mmal \
 	--disable-mtp \
@@ -74,7 +73,6 @@ VLC_CONF_OPTS += \
 	--disable-notify \
 	--disable-opencv \
 	--disable-projectm \
-	--disable-schroedinger \
 	--disable-shine \
 	--disable-shout \
 	--disable-sndio \
@@ -401,6 +399,13 @@ else
 VLC_CONF_OPTS += --disable-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPL),y)
+VLC_CONF_OPTS += --enable-vpl
+VLC_DEPENDENCIES += libvpl
+else
+VLC_CONF_OPTS += --disable-vpl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 VLC_CONF_OPTS += --enable-v4l2
 VLC_DEPENDENCIES += libv4l

--===============5790175877819062877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5790175877819062877==--
