Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E1CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B57660B0C;
	Fri, 16 Oct 2026 13:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkxnJb_i28oZ; Fri, 16 Oct 2026 13:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CB1260AEE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156114;
	b=VhNt6kx4sKE21hmfxWa+WV4JvkZ1AnVNjFFtWctgJY4Jnr60QbjouT0ovPSk3Rse05xo
	 CKx41UgD7Ypls9yp5NQ6pYt1uirnmqE+O51yVvsiAvdbSDcc/oNbXmZ0gCWzuwft0mEWy
	 kdouUqCjBmf937gcz6bA/Oer5y+ivsjerCYw40MQAn5L7fR9+rgsixVHgduPUBSRYogpQ
	 HTYU7F5zrdoFXeJWeFNbtJaoOmpSUNQY9JQPHPreTvxYlnYH1kn4AEkfalCokAyuu8Ie+
	 mzqTKM01JuZpREc3+4DS/4f/buucx5TJsfzOZcKybM5TOhjdyeM4vtAL6tUexfzBhnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wMBFwxvZvVLzLICyDO7upXVuwTifj1tRiAfRTHE8aqU=;
	b=eSgzbMv/JmyXutIiZND635AJfnKGTt0zVMehA+802uXJLzwbzH3piUeiPBNG8jf4huxN
	 oLGs+2quayH2VMBwUPz31+6Nfx26YrRd87NCQPFS0/G5nANbqfcl4RIvQzWepPu7aoQ8J
	 GRxAMXug/+SYzxhqYlQKBN9pFcTc2YDB993CrxSoX0XqJA0BTwqwc8cFwH5MwEsaJFDR1
	 uGHRRbATL1vZPVRhMxb0XcKiWucUjdewGEZ5lBAIPixdZCQ5S0tMd+mgNcMRHnngw9mBY
	 +ateV8lwVO3tGYMHjZ8CDt1THtDwZhVREBWnGECY9DQVWNTz1TX3zOxBWNVli05KXeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156114;
	bh=wMBFwxvZvVLzLICyDO7upXVuwTifj1tRiAfRTHE8aqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NPZyWszk8mwkFTxppMzH1oXZH8cl3GJsgOHBPcR2eEtd22Tkvv0ePzrttFb0jI11t
	 cf5bcC0TUzWbSDDIE8NhtPynoHD/wHSM5F/e8Uu4/5tRVbfw7MiMVXjq8QYgv2+yfG
	 /Hwq3qBeKAZlf6EMYcAy52b3VCpBJEt3lEyJmK4NcCG3PVUGEhXmVaeIp5AV1NB2pb
	 EHGYhN5+QEO13rLakJ/gd8saq9hNiWHa5LgqHL9AFdC5lEG9RjVqpkNGFh5yG4gUJI
	 5sljzbQa1fjjisXya8Jqh0HBU2WB3MC1938tq7ZR7Faj3U1w1+b2z8qAW6xGO0eqLN
	 uaaUTbIu4wzuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB1260AEE;
	Fri, 16 Oct 2026 13:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8929769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8B140042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1UWvN0qHreq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C51FF4016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=oldgxRCmLFtPTZjS35ASDR5hJRGsqi6cxNC0xVKfZwz0Zdh/Wu/ZZGvHgrjTnnZ17zXA
 9L+LMWukQzvQGGxU2ytjg0x7+jJ0+rKw2Mjsl+kuOEBEiwWBTdZjGn0knJAo3q4Qfvb/W
 EpMmp+wE8IwvDCiWfXARcKrvsaIXlAkwRHsHd2op8/2yNNpiz/ZIBBnpdpYBvpJJYJrga
 qm9Xeh6L6HkfMYd86ouqyxGaEhEwB5EK36bd8TlXXTyaaBZoPzequohtFYWc2/P6hREO2
 pABpvP7DSlWZAUSCMF2ccWp6sdYsB9BISWhK8c4twGnKFxSWOwyzDvb4CeyLC8VTZBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NAI92abAk7Eek8bo1EdtgbD3UqyN+2VpWDdYo3tDq5s=;
 b=hFeI2p4QYKx+uXEvMokC13dpOCooMsLFVV9HXUpbTus33O9l+gblX6dHq1VJAmwdz01r
 BcD6eR51Xfs9H2n4reuVnx3ol/hV43UO4iVkYDHvI21QBQlmxc2P5Zg4XANC4tvRdGy7g
 gConFz03EnY6FwN2RlqqdbchE7MdKwd9Pe+slpZXRl4iMqZq8OZoMggl4gT1Be63afJXe
 jlI0C2pPPCwXVbCCOt6Kf2+FaBBUi/NZ94iVHouc99pcO0mcNUibsuzS1H0YNP5JUP5vk
 /wA941Kp3CqZI2pXSogfnCfFvfecFwwsDIAX5nNPcse4ECs0XUoSUPhl92PITrJlHqA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C51FF4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7739960D9; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 42ba3013d94a536778e9559340982095919754ce
X-Git-Newrev: 0091727a740523d0aaa888e6a08e4611d96bfa22
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.A7739960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vlc: security
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6378398620543963759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6378398620543963759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0091727a740523d0aaa888e6a08e4611d96bfa22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 58dade040a..5ad7fc32e1 100644
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
@@ -66,13 +66,11 @@ VLC_CONF_OPTS += \
 	--disable-kva \
 	--disable-libplacebo \
 	--disable-linsys \
-	--disable-mfx \
 	--disable-microdns \
 	--disable-mmal \
 	--disable-mtp \
 	--disable-notify \
 	--disable-projectm \
-	--disable-schroedinger \
 	--disable-shine \
 	--disable-shout \
 	--disable-sndio \
@@ -406,6 +404,13 @@ else
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

--===============6378398620543963759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6378398620543963759==--
