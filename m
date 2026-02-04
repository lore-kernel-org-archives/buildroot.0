Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B3CE9538A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE5460903;
	Wed,  4 Feb 2026 11:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liQ_dx6XsScp; Wed,  4 Feb 2026 11:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6DB60A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770204946;
	bh=Z/a1xyeMJee59YbEsZgF8MfnNtoX6sumCCAELbSRzqs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kewxJqp/kkDoRgzRaxRIJgB8f7I0qT8YWnPjPJnWxjBgg1cix83XCkp2c0wdeGkjb
	 SvYnA5XmeYTcOy/tO5/tFT8lCgccbr2YiIiQDuZJb9NloDh3AzTNHXtxRQgPBHOkzi
	 Nktb4+nSzE1VA/LEsvFf7FTlWKv/SyeCn5AYi+ABJxPl3opiF7hRnqBJLj70JxeH9M
	 0ulLe9U+4Wn4WqFHKZ3knZ6Lsx+z4vRKwloH8JCbmU7xdemMjImfbEJpBUmJ7bOprV
	 vNVzzEdlLGnRvdLRVJdLdoSfAKrtQyRSGsqCISR3M9bfWrMEy7D2pzKhFhJdtI0CqR
	 JQZg0tu6nJWKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6DB60A41;
	Wed,  4 Feb 2026 11:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3612F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53F260903
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrebb_iurx-m for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C18F2608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C18F2608AE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C18F2608AE
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:35:43 +0000 (UTC)
Received: from framework-OT (ip-185-104-138-159.ptr.icomera.net
 [185.104.138.159])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 12DFE2C82D39;
 Wed, 04 Feb 2026 12:35:41 +0100 (CET)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  4 Feb 2026 12:35:51 +0100
Message-ID: <20260204113551.1606741-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770204941; bh=vRGb3d5/VwvpJpbnY+IVibDDBeZUoDNNrKRU5eqyO28=;
 h=From:To:Cc:Subject:Date;
 b=NGdG9oThZTYCNf2+uVR62MJK9g1fbGR09uEa0EI0soYkpckN+dsbC57+hL3C9uG1K
 vXM0o6VJN84kmXACGG9Ua7wqBEwB2IAu+P7/I4GDxBnfmJIiAezlX+3ar4gjnJ7IgS
 SJwwsJ5JZWs7fhrsiEJaRBt8CyfTK01F6CiJyPFGxsU86vP/luQ/WzagdSA2idbirE
 wBXfVHxlWNWWsRMr3DuwevqlCKMqJcxIb/a2a8kOrREHlWqRLkUAfT0MxVtXW65nBD
 hr7QeLhHDVv9StCNmnKqT3EnahoECydl9E6iLjj7pJqC+vbjT2ArYXb3QmEz934MBM
 dMviWIBlcyDyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=NGdG9oTh
Subject: [Buildroot] [PATCH] package/mobile-broadband-provider-info: bump to
 20251101
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package switched to meson in release 20240407[1].
The download url changed to gnome's gitlab, no more xz tarballs are
available, use the bz2 one.

There is a signed git tag, but no signed release archives and also no
checksum files released, so the hashsum is now calculated locally.

Release notes: https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/blob/20251101/NEWS

[1] https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/releases/20240407

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../mobile-broadband-provider-info.hash                   | 3 +--
 .../mobile-broadband-provider-info.mk                     | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index c965f5c783..53d6a3e264 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,3 @@
-# https://download.gnome.org/sources/mobile-broadband-provider-info/20221107/mobile-broadband-provider-info-20221107.sha256sum
-sha256  d93392566c347a96eed95da8c66a5da0dd94f4115cfb3a305ff2682c64cfd810  mobile-broadband-provider-info-20221107.tar.xz
 # Locally computed
+sha256  6fa60b5e9860a648d7c5b8e4e3f87d6ce6a7622b8a7b5f2d567a9a0d9dddb9f7  mobile-broadband-provider-info-20251101.tar.bz2
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 2744844951..2710683fd5 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20221107
-MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
-MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20251101
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/archive/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.bz2
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf host-libxslt
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
