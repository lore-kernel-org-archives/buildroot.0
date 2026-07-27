Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E687C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 19:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DBD405DA;
	Mon, 27 Jul 2026 19:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBx87kTh07Es; Mon, 27 Jul 2026 19:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5757405E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785179548;
	bh=rD97ktphpJuQEt3TgDEI95XyWJhonIGheFhmtrDb6jA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m6cAJIlg0SNhzXQQYG7egJgYDeQ3cHRGjwB70RGU6urgvRXE69vxIQQyq9LPu/21n
	 YcZoDVYdIg6PHuXakeA61ko59ppbidZaljpwXiGl8buPGd7GkBe/pfwhJ1xdTIF06u
	 pwsqFUANoC5VcE9VWkj5KMayibGakc/2hGeIjvt9dP54ldnmhXaRNJseQrwJat+yFl
	 4BZ06HlVNkC0l9s1PHw+889E1ysvxDHsHVDklKATAspzsg078xrz9VM5fI3mo5iPIB
	 509zb8JHqBKqh6XKvLBMvD6GZxIz9Zf6ty4on/ke7WWH5gnvAfIkqLZBysrwzcq6RE
	 cHxEFpWJ4Kkag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5757405E0;
	Mon, 27 Jul 2026 19:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B9C350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12607405E0
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vek8KsKm4Ww7 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 19:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A061405DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A061405DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A061405DA
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:12:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf42.dip0.t-ipconnect.de [79.214.207.66])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0AED5A4C3BBB
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 21:12:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52614)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1woQkN-000000001sX-3fXl
 for buildroot@buildroot.org; Mon, 27 Jul 2026 19:12:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Jul 2026 21:12:20 +0200
Message-ID: <20260727191220.102324-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785179541;
 bh=VPZK9/2cc3dNyx7nPqN+xHlWwKDbM8IDJFuwiSe4z+w=;
 h=From:To:Subject:Date:From;
 b=lETS78v3G4BIcoVZD745+Md+Z7qaByyB1jke9zgWkZBX+cCly7QKIBRpS0x/+xWGf
 mQK/yEqKF8cpsB3zTnTO6BpqGvU/qF6iy7H/mqKMEwj1Fma94dztD1PM7Zb03dB+fz
 Hwl/wMjfLV1E59XCkQ+l3wH6hvwm1NOLiM3H4qywayDULDhiLxm0/gF/kPBafuvrxt
 452S9c4r9kHc+bPSbz/lIu3GECPYisXeSnZhgImaH2Rxwj0vcc73J5sW0V1npRnxio
 +7zd/PVm/kvp1/L6J9m/n3is2f0xNYCLQ0krwZSnasmbRt7GaIW2kewQzQeKVL1Lpa
 39YeIcCuPVrhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lETS78v3
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version to git
 c0cbd14550
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

Disable some new configure options which we do not support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d1a23fe3f6f6e47d12e9caf831ccdff9d5357445
with the exception of bootlin-x86-i686-musl which failed with an
unrelated build error of the ffmpeg package.

https://patchwork.ozlabs.org/project/buildroot/patch/20260619142831.3664440-1-bernd@kuhls.net/
was added to the tree to fix other build errors unrelated to tvheadend.

 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 1062dd2c81..8b18bb247b 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ced1ea6ce8b78ac9bfc7e6e8cdc908a57840d25276b5248039661483faad705  tvheadend-37453bc3fe5f9e10f3428ebb1abdc613f8b07186.tar.gz
+sha256  f907bda7faf93fc95c3a705b70c6ce2a21f63ac824a610e39ab58075fca43356  tvheadend-c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4.tar.gz
 sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 73563acb8e..d74adcfe14 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 37453bc3fe5f9e10f3428ebb1abdc613f8b07186
+TVHEADEND_VERSION = c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -18,7 +18,9 @@ TVHEADEND_DEPENDENCIES = \
 TVHEADEND_CONF_OPTS = \
 	--disable-hdhomerun_client \
 	--disable-omx \
-	--disable-pcre
+	--disable-pcloud_cache \
+	--disable-pcre \
+	--disable-vue_build
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
