Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B88C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 14:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F4C60BAA;
	Mon, 19 Sep 2022 14:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F4C60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUbXUqW8e0Gj; Mon, 19 Sep 2022 14:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295F60B55;
	Mon, 19 Sep 2022 14:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2295F60B55
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A983B1BF310
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 14:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8517340BA9
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 14:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8517340BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqXA2w_xKh8t for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 14:20:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17305400C4
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17305400C4
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 14:20:21 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oaHdC-00A71i-OZ; Mon, 19 Sep 2022 16:20:18 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3ccebc93;
 Mon, 19 Sep 2022 14:20:08 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 17:20:07 +0300
Message-Id: <20220919142007.1967434-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1X41ZrNHlAYbfyYCQZMQiP1t3sNnTyzVtw2Gs/17sH0=; b=YPoonK+9rB2oaRALxh1fTukEEA
 7SBMI/+ND6s6lIebzABlmIRCOfmUAJPDhKDKrp+vtvVS+Qq6k5oVwCdSSgX5hp/c+b4K8L6RtEEvb
 EZ8obYWTzcPUPHNwU2PILAiBAKgDTNsSnr/X/QYKubpfSNm5F6vDNJAdvgMjAoLBE0oA0/l2Foj5A
 5EO3NUWxqFXFln2ViRGzXbx+rkD04Kdc9UDxc+L+9Qq3zOvzUps1W0vksDY+o6PjzDkDHOb/m0T21
 faCMzJTpC0YWavulT2Uvm6iqr0U3VjNPem+HqftePyHdJmKWopJCBPsmfw2HnNu0PtZ/rgms04RFB
 m28R1gfQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=YPoonK+9
Subject: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.38.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to a new major release which brings in improvements and a few
new features. Release notes:

  https://webkitgtk.org/2022/09/16/webkitgtk2.38.0-released.html

This release also includes security fixes for CVE-2022-32886,
CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0009.html

The CMake option to build the documentation has been renamed from
ENABLE_GTK_DOC to ENABLE_DOCUMENTATION, therefore update the build
recipe accordingly. Option USE_LIBNOTIFY is no longer available, as
WebKit now uses the notification portal D-Bus API directly without
relying on libnotify. Lastly, version 2.38.0 introduces a new WebRTC
implementation based on GstWebRTC which is left disabled for now to
keep the existing status quo (WebRTC not available), and adding an
option to enable it can be done in a follow-up patch.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7c6d7d65b5..c2512be9c6 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.7.tar.xz.sums
-md5  466351cf35e4f742590919380b5dee93  webkitgtk-2.36.7.tar.xz
-sha1  36078148b6e0ef002f0279b25b1caf173f851ac8  webkitgtk-2.36.7.tar.xz
-sha256  0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743  webkitgtk-2.36.7.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz.sums
+md5  a69cd8fc05f7299458b4faf1bc99b875  webkitgtk-2.38.0.tar.xz
+sha1  6dcb65b8dc56c52f086bfeecfca7920e9cc78348  webkitgtk-2.38.0.tar.xz
+sha256  f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd  webkitgtk-2.38.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 014d92bb41..336744954e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.7
+WEBKITGTK_VERSION = 2.38.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -18,12 +18,12 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-	-DENABLE_GTKDOC=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
+	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
-	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
