Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D3D25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F2C384473;
	Mon, 12 Jan 2026 08:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaDGDIVni9Od; Mon, 12 Jan 2026 08:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C06808BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205576;
	bh=klqe60v9KaynO1/ktIqXrhqcqn6/2Op1JeM+FPfsMmA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1qRMHrQ2OPIG0KHs46Lvyovn8vV7mqL50MK3zsulj6tknDEIVZmieDQG2eI4/S1f
	 ZmofZmGLbg9Q9RQjH03sbG2TgtQm2SJEzDg/NqqPTC3QbonT/ZwPI08eDBgu4APIGR
	 RIdLIyGoftaYr4JQVw6nb6eca1jgHRXMhMPMcK14cMvFg55WVvNlMLKXJh7a1NC3yF
	 l+RZi/k365ME06ymn8+FWTj921EN5mhhJQj0zuUwVHGJN1R09M1h4uvBjoAzC/IC76
	 FcJJ6XbExknIsiOtRyIR+jh860V89+RTgy/ehLBhEX4bJJStx/fFd1uBPtiAVIPqQ+
	 ob4s7WNLwC2Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C06808BF;
	Mon, 12 Jan 2026 08:12:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED43C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF4FB614D8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSHBXM1rN6OY for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:12:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3F37614B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F37614B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3F37614B1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:12:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0DB9A4C3C1E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-3KNK
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:04 +0100
Message-ID: <20260112080419.2516889-89-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205122;
 bh=ko/zPN07ct6K69iiLWAFCkwliuk7PzW9BX3uMhcXj/4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Y00PIt/g31BH91ZzfqUHxErVAa1Zq5REpOY6zjoiP+5NvokJ4FwaHqcQ4049K6tI3
 QNZwYrYv+T5KhxTXNOxVtoh/1+V3TsUzobA2qBHejIDj8jDUcEr9BOCLdqt7JD1YjS
 VbRlz/pDQm1AcRuEJ+Yc51U2VqoDo+n2nyG2RlAXs8uABFle7McvCgRtrHZOM2WAJj
 rZvwZyK6BUocL+iN1OCtEwaCleQX/dDB4tFQqkYPOZ8l9Y3R/dIRiJilhuY5j4cbi6
 LBeMkSbkQ07ocGH/3dLkBjwz9bLuOmm+HqLkbkF/kaRV09cDUIoPzpUzwn0S0BXcut
 J5zi9fasU83JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y00PIt/g
Subject: [Buildroot] [PATCH 089/104] package/x11r7/xlib_libxkbfile: bump
 version to 1.1.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2024-February/003455.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 6 +++---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 7e6199f16b..d8a1173925 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003286.html
-sha256  b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1  libxkbfile-1.1.2.tar.xz
-sha512  0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d  libxkbfile-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003455.html
+sha256  a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec  libxkbfile-1.1.3.tar.xz
+sha512  d80ac41f6fa3a1ffad77ea1f8f9d9542f0bd210d74b263802bc6e6c1594fe325b27f42b5454aeeb36352518963b1ed1fdbbad95d7db3690b2e36d54742b7c236  libxkbfile-1.1.3.tar.xz
 # Locally computed
 sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 2e7f82922f..23fddee97a 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.1.2
+XLIB_LIBXKBFILE_VERSION = 1.1.3
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.xz
-XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBFILE_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
