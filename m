Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA4ECC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E4A4086D;
	Thu, 15 Oct 2026 20:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id En6mKDvl5ulG; Thu, 15 Oct 2026 20:12:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C9D94089E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792095136;
	b=IdUcik00GSDkrW9MdKlEkB6j3JiyeFzFTaQUQWuDUDmjr8y5PkCNYf6+xsc1OaN98e1v
	 VXXrkABQk6ilPGLDf4ZZzbXH41woiIWY6M0o2ExtftYH6XroGq6UQLQkOlD6aSAb+RgoU
	 ROhzvOi/k1CF2ZwzpQVh3uLFMWOFqBXEODEYbvFMu4REh3xCq+E/pWDBYdF0FKCsk7oZh
	 g9dOFM/AEufA/ALpI+Rj5uK4fVx7eDILTz8/dI/36BcHCLFz20ZxKE5+loxyO5D8IHkQZ
	 +S3C1XzIFwY7wHos1fHjNZ/MV5zEkcsQcLDtJkL4qbp3ufXYogz/UOJKZUbh+gM2/MQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792095136;
	h=X-Comment:X-Original-To:Delivered-To:Received:Received:
	 X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:Received:To:
	 Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:X-Patchwork-Hint:
	 Message-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=+h5fJBcXDZhJg27QBvyd+ykEt7zjSQFlcyNN9R+astA=;
	b=DDkvDl85wAxyKijH2Lk0SqUhOk4YZW+R1ZKPedYy4TIEvOQxnxOgHj+nBiX6U9NUQDkm
	 n4jv9+ANuY7KBpAEwDJN3i2PoUa2VcZ4I8hUdxaElxPcAp4WjpVjXb88cYOH4C0x6A23y
	 h64LZSH2kckPnGiq7KCVeCk+MUM5ciZmWwOOOP9TvfoUbBGLtF7aTrS3REAibXD0/N7g+
	 tPnrxHD8jedgDZ5uNbIzRVabZBKmZB27oI806kTbkOx9d7K+DE6hYKET9h9t+HL0vzMNz
	 V9aJRrmIWhpY2U0DU4pe2FuHw+dzHg0ymYwiKcFy7qlQx+HVBccVEQ3Lsv5ORPWUXLg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9D94089E;
	Thu, 15 Oct 2026 20:12:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBC71AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE7040452
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzvFMlXDXYM8 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5B6D840087
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792095133;
 b=nURO1R5YC/Py72qiJxcUdC9MYNiPQcP8IpdjbKwmExh+FENgVwxdFlwimmVloyrjB5/d
 2pjQ8XPMKJyJQrHLW0CBGUG0saFJpEdPcyVtr3Q3gyTp7QhI5KeHaybtjpymZQEWXBQPr
 D/LhC6d7uwU04YR4w85X4B5PKk9w1s6dGHa6x5xATmdpwmh7Ap3mEohJA0M7bmVFGZ9+d
 g/h0oO9jScs/9W9qCaJfpwfq1qQgIaWQiX/xKOp8KwpQiHr5oFiu5TpokXR0V31IP5fWZ
 vpaYV6v+NUqTYH9UII8QBJgNZdbd1bzYEe+qeCv4dhPyVctEyoFtd6DaHsEha3kIw1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792095133;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qPkVQQe+txslWZD4hjGz+Wwl6+T3YcYAKlQv7bu+5Vk=;
 b=aQtYcrJ0iP3ZTBY9wr5ZlGdiGrbqA1kYebW7GWPvhC9sJJ7/5vMEIbl6mQ6w5NAVmrUp
 ciAnDxlDsIAwiN5az0qvIBaQlXkOTxpQVxj34biEMX+95/13yid2tCFM2fa+BxXJ+YH/6
 ENJFQnTO2ZJQ5sHBmGVB1s7Ti4wv1E71Asm/WUgjldMv0GzAy5upKKrAOBJAVKiectMZ6
 7KVJHaljNp4aLRI6kqOZwDfeIKiEgUWE+lpDcYd16ZEsffCT8o1uTWu2JEdbWEEySGvZ4
 uLQSunNVIZO29VNJhyn5GzWrUEkNo8PFuOw0WXePShUoDYVPHUvDIqND4tr6kYOG++w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6D840087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC2995D69; Thu, 15 Oct 2026 20:10:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:11:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bafb66de2d6cecfd5e6b8c10d77f8936c1910338
X-Git-Newrev: 48e8a1f041190e38fb00750ecda0b52357153ad3
X-Patchwork-Hint: ignore
Message-Id: <20261015201052.9DC2995D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version 5.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48e8a1f041190e38fb00750ecda0b52357153ad3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/mikebrady/shairport-sync/releases/tag/5.6

This version adds support for Mbed TLS 4.x.

Classic AirPlay now needs an ALAC decoder to be selected. FFmpeg is
enabled by default, and the bundled Hammerton decoder, which older
versions always used, is now optional. Use FFmpeg if it is available
and fall back to the Hammerton decoder otherwise, so that existing
configurations keep building.

AirPlay 2 support now needs plistutil on the host, so depend on
host-libplist.

The LICENSES file now also lists the bundled FFTConvolver (MIT) and
pair_ap (MIT, BSD-3-Clause) code, and other copyright notices were
updated.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/shairport-sync.hash |  4 ++--
 package/shairport-sync/shairport-sync.mk   | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index dc7c7eee5b..1eafe03b53 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a1242d100b61fe1fffbbf706e919ed51d6a341c9fb8293fb42046e32ae2b3338  shairport-sync-4.3.7.tar.gz
-sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
+sha256  20271e220e859b8f60a707597187564d3bda7dbf69dd61aa1357ec1656285246  shairport-sync-5.6.tar.gz
+sha256  5ffb12379c3293e48010d0ed04185940e107b54e48b520d58d847da53a153c33  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index a792e461ef..7fd1a23eb3 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 4.3.7
+SHAIRPORT_SYNC_VERSION = 5.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
@@ -54,13 +54,23 @@ SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2),y)
-# host-vim needed for xxd
-SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux host-vim
+# host-libplist needed for plistutil, host-vim needed for xxd
+SHAIRPORT_SYNC_DEPENDENCIES += libplist libsodium libgcrypt ffmpeg util-linux \
+	host-libplist host-vim
 SHAIRPORT_SYNC_CONF_OPTS += --with-airplay-2
 else
 SHAIRPORT_SYNC_CONF_OPTS += --without-airplay-2
 endif
 
+# Classic AirPlay needs an ALAC decoder: FFmpeg if available, otherwise
+# the bundled Hammerton decoder (always built in before 5.6).
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+SHAIRPORT_SYNC_DEPENDENCIES += ffmpeg
+SHAIRPORT_SYNC_CONF_OPTS += --with-ffmpeg --without-hammerton
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-ffmpeg --with-hammerton
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
