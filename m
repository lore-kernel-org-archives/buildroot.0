Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6555ECA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9794060C;
	Mon,  5 Oct 2026 11:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aThwSPWN4yjZ; Mon,  5 Oct 2026 11:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2418D4060F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199813;
	b=T99ml/yC/ZA2AOJQWShYFxwaiaSVXHj0MTI+TEcHaQhQKfCDodiRReb71bfRKZcSJy+7
	 0TyhKoxSju59DX/Zw2Y7MfpJUFqvzTRmJfUhL44USHtkUDQ6NZn8o/xAw+sJ+cNK9A665
	 3Yar21F+Uq+k6JdBhfWirqq+VEYCLqn+Hn2uaCbOh3z2j1aVKNqBDE9DinHI0boHeSF4e
	 xlCE5naSgGVpiSJ2RaehG6tBzGMYGcGA4U08HCFbFN44gABeHrPVeJ60D2SriymFJga4U
	 AqHwDDxK+zQntmYjuLwUwpuH5CsCBTO/LYhgYP6WycjfwVJdeWXcV/McXXh3kZ4WyLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=xC9ymmMTAlySgoTFn0P9CdhHkSj5m5pmEhjIexc/KhA=;
	b=HzJoNo6oYFFWD+jjofdIthc3a8zd1yul9uHIJ1sYTKhuxEsdG194SfIjKg2FEysU8CbR
	 Jrzt0eDYt36HJOBganyunSqmUG86JpbLOQcNQOniZKZJaX/Ecv2g2DAOqhWppq6IaRzqi
	 Q4iybfLV/tcHK72XLOBanAjSe4Erbd+UswWfPkMWMqwaiPuI8Y1ZrMiSDeVqNLpSZMWpl
	 bk+jJVkcJJB0PJL5UL0VYAfY7sWpwcH0rarxFGvG6Jqd0aT3KpIAooY3jJBxDU0me7dkU
	 aUu8GOQWF43Y2qkgQkbFQmJS2asLeRITBdb3TO60N1nLHLHJoFvZQyvLgfMzRRTGzKQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199813;
	bh=xC9ymmMTAlySgoTFn0P9CdhHkSj5m5pmEhjIexc/KhA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gNiVtAqKwir6+rnO5idIwNKWcSMkjv/L5oZiT+2Fq468UaDHFVPiy/iL8EAArlW8+
	 h/mfVVxnqPhBkpNm5M4w22LDZDCRW8tbP9x3gz/5oe7tKdjoz/hxBE8ihfT5wpLPNR
	 G3VEU1ZGrkclO4k01NEIdFFV2VS5bFExrp5QSVzm2LsW9LN64KkQK/ydvQrLgGpRS0
	 ozaTM8L9LFlLLh89zIcYvSi7T27FNaL0ei3heDQ/39jaXBzZdZz3eKsaAtO+jkdTV7
	 DYXkY5PdTwLyozvqf8fQ95rRAy684z4KV2yiwLBYcBHUHOTm4v+c1IjWNImp+c9UYi
	 SLp3DYvzkTUag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2418D4060F;
	Mon,  5 Oct 2026 11:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7AF1A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 401E780C0C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0zRQG8rP25L for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3770380C0B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791199238;
 b=Jhrd4BGVXmwQzvw+769/fYOTCJpF55c++d3alSw5gfi1WFUFxLAry5kTIu1cN5QziH26
 fEU1nrcOXK3046QtrL76etHCJ34d6+SwVecMseqigl6r/EZFlKOAcVIA5OnqS9IzMDNgs
 gNbpEkBG6HsvUyEhWQ2oCqffHWLNTEDA3lAGPbFqa71bTkzrMP1VnUqatkv8dNMrv2TWV
 BPNyLu3Dq18mgFxTBUMosreXC82nxeeP6CmrbDG203Z1FaP/QNxjfqalZdhCMXpWkB7V4
 EG2EnQu3CSdHZxHZj+54HZ0DTY0MezdWS0mOGe8YgafYIQEWeiAp1Lnhl1YkcyTElmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791199238;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BhYmryNk5IMPxke/cy/O3uHkHIPoqp7lnjpryvKplDw=;
 b=lMPtcKw+kE+GxsUccGbmflJGyGjZQdLbm+en1i2MJsnuI8r+ZsCd8tVEFLRjPLEBHeZp
 pvkU7f6TTrupJoYi8UBSHHxcpOvJz24j5u7CCriKkvgKxfyTLv7IFTzcYhMuesqNd2Xtr
 Sbv4J6yhDp6fx42/hj9If9tVZNxJo84HxLnftDIv6aRLlwyxmmbL2oM3w80ns7a3b/+IV
 ef3yu/Wg4AguHg4QrNOL5+24R6V96L3pyuXff7H02BpKoCTDTU/LcPy+CMs2gEJaaiyYW
 GVK7NieDasGilELb/uiL+ZSPwOupbtlnGszalmIK9kldMI25uE3tsKUt2XVYMHr9ECQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3770380C0B
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:20:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FB8D8D591; Mon,  5 Oct 2026 11:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 13:13:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b3f1d6d9d3cd6bff010ef8ab638b1f55defd58d
X-Git-Newrev: cdddb871d385ef0549819d1dbcffd24a58277181
X-Patchwork-Hint: ignore
Message-Id: <20261005111922.7FB8D8D591@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: security bump to version
 3.0.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdddb871d385ef0549819d1dbcffd24a58277181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
