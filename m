Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EFDFF886F
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 00:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98E942262;
	Fri,  1 May 2026 00:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJUW0N7BBUjn; Fri,  1 May 2026 00:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B7742254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777595040;
	bh=8RQ0MDY8Ugp/eoQKn7hGMYE1E4y7hIsBtLqUCfOvsdY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lVVZuasP4byd7SaCvywmS3m3neacRNCSpu1m+Nh8mqKSo8774JoMAQnuK1H+RHDDD
	 Gbr3XV6FBrYmXlzjj34dTjw0LU+7iK+ODd1Q6dkB3psSImbv4VXLvlrCSHW8Q+aWz/
	 OHN1C30tEglTdkq5oxZy1Z85+V8N76HxcbhJkJKZ1iS54Jio96U5VKy9VnEXKRVGmu
	 WxY6AF5kj+3jufXzq+vbsKSuJ5GFT8sbobjj5DI4mhOCjE07p7hDfTaPPlVAXkzVoh
	 X4pk390EXxFrZmRGgL1fMAOmr1k+j5Owa5cJll4RovvMdxoS2MHepbmmHX/LEg+gdB
	 MpwDa0F0cN5sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B7742254;
	Fri,  1 May 2026 00:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C668127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 693356F735
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm_NAq7BUP6T for <buildroot@buildroot.org>;
 Fri,  1 May 2026 00:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0F2F6F71F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F2F6F71F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0F2F6F71F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1w559E2Niz-005yRS; Fri, 01
 May 2026 02:23:53 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Fri,  1 May 2026 02:23:20 +0200
Message-ID: <20260501002320.1761716-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501002320.1761716-1-fiona.klute@gmx.de>
References: <20260501002320.1761716-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bjjChbk+IEONvo7OgoVZHGlPYLyhwGepB6YzjDyJrYlpZXECSkC
 xM+m38ek9nOLv4GjEzO96I00yaRhWocxyO4KF8ZB8Rr49+s7LT/TERMQE6i+p0HmPaXUF8Q
 J79EMoOl4uzym81LzhpT+X504fc7kDBjoPMz+iiTjzibMarTQHtPkWoPQhPU19oTL13Gno5
 1LSNB8sTArQ6/Rz8VOuOQ==
UI-OutboundReport: notjunk:1;M01:P0:KOdhZ/Nzt4Q=;MxUbBdsVRgwlTuSAAYwI20NXjg1
 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
 im5GPQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777595033; x=1778199833; i=fiona.klute@gmx.de;
 bh=Y6Z57E69N7HhuFTdEFzrzO7hroiO5lEuoEy3F/jhXDg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kKsxRbp2CS4CBg+GlnLD4of6y98jn6uxkicFp3XpO1Be0Hy5kQRdILjkX5V41V8/
 Lx9+GQ0pi84VAg0cop1YZch85O2V8LBIhWhm+rEQ2yIJ9bzjXH1CYAoHvXbxDKWFL
 5xGfdAwEJH5uCs1ONoxzdjvRBoEJNT8XoSW6OGhZJ2Cl8Wvvt3XKVB8JA0HH7Jjyx
 lpRJAe/W3j1Dz7HD8eGI9mHxTq1zG14LbQbh2JG+JqGG1OjWPHOPSMJmZNZ9bIMn8
 GyzOwScrw7eVRzn7dx6zuJACztbc80xdSNoV0RpZE1I9cLh3bPfapikHQehoLehvA
 VnBtbVpGowuAWlHYCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kKsxRbp2
Subject: [Buildroot] [PATCH 3/3] package/eudev: fix install with
 BR2_ROOTFS_MERGED_BIN=y
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Eudev install creates a symlink from $(sbindir)/udevadm to
$(bindir)/udevadm if sbindir and bindir are different [1].
Unfortunately the check considers only the configured values as
strings and does not resolve symlinks. This means that in a merged-bin
setup with sbindir=/sbin (symlink to /usr/sbin, which is a symlink to
/usr/bin) and bindir=/usr/bin the /usr/bin/udevadm binary gets
overwritten with a link to itself.

Set sbindir according to the merge setup to avoid the problem, bindir
defaults to /usr/bin in any case.

[1] https://github.com/eudev-project/eudev/blob/9e7c4e744b9e7813af9acee64b5e8549ea1fbaa3/src/udev/Makefile.am#L139-L140

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/eudev/eudev.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 1a56cfd2f0..3c22b13d86 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -12,7 +12,6 @@ EUDEV_INSTALL_STAGING = YES
 
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
-	--sbindir=/sbin \
 	--libexecdir=/lib \
 	--enable-kmod \
 	--enable-blkid
@@ -21,8 +20,14 @@ EUDEV_CONF_OPTS = \
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
 EUDEV_PROVIDES = udev
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
-EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+EUDEV_CONF_OPTS += --sbindir=/usr/bin
+else
+EUDEV_CONF_OPTS += --sbindir=/usr/sbin
+endif
+else
+EUDEV_CONF_OPTS += --sbindir=/sbin --with-rootlibdir=/lib --enable-split-usr
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
