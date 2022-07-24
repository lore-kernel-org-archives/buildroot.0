Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E486C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9DA140C19;
	Sun, 24 Jul 2022 14:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9DA140C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shy4RLUnsjkF; Sun, 24 Jul 2022 14:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFBDF40443;
	Sun, 24 Jul 2022 14:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFBDF40443
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 347371BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C99960A9E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C99960A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUxFbd4fislN for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:43:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A55760687
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A55760687
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:43:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k11so12143388wrx.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcFqSm6OF06Vf01IB06X1z3YOtxBcGgBu1DvRDJxk+o=;
 b=jNyMQ88gy7gfaGT0Xp4V1NukRiGAZFhGPWE9gxFZAvAvvD3CznIU/55+Z1VsRtmkQ3
 /BuhbpZFUu90mVVCzE7ORmSPaL03qsUOL7XNitUfPC9JIb2BzkV2OIRs1qVfbgYrvceY
 fnDTrpWJokaCCMMxFUY90yDG/zimjzS59EnnvqC+e3FyiMxAqN4BbbQLI/DMNAFaWGVH
 sCwbTHTpUntPstLFPZhIfYTBt6N99fz1BcMklS9DmxHb0DJLJFGd5fXUskymgwQuRSp4
 7/v9Pw/Q4MNzTYN1cRpTh5bCEby+0PSKzPwKBYFplBh+2fn7AF/Gr/dJG3qkBID2S3iU
 OjlA==
X-Gm-Message-State: AJIora9LKqY5wiwgUPNwbvmRTdETdbwKoeJ7xL3jhCrsYDG55c0vvyhP
 +5tDU5prfAO/mLrz58sBRpPKlX87pymqlA==
X-Google-Smtp-Source: AGRyM1sLhqY4uPvxAtGoto6i6FdCKZfOosIXD+C8XkgbyR2rFJ6xSvz/R2xf012M5sYRPg057wi2Jg==
X-Received: by 2002:a05:6000:15c3:b0:21d:9f8b:2c3e with SMTP id
 y3-20020a05600015c300b0021d9f8b2c3emr5571336wry.72.1658673818249; 
 Sun, 24 Jul 2022 07:43:38 -0700 (PDT)
Received: from desktop.qsc.com (pool181-019.domashka.kiev.ua. [78.27.181.19])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c154800b00397402ae674sm16796671wmg.11.2022.07.24.07.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 07:43:37 -0700 (PDT)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 17:43:17 +0300
Message-Id: <20220724144318.653289-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcFqSm6OF06Vf01IB06X1z3YOtxBcGgBu1DvRDJxk+o=;
 b=XfjPVewoKVuDaFC5p8w5Kzm9UV2wgXCqO8HDLRagRmM8UYNPNOxyh1jiToKk76rTFM
 MQy1RbAbtiY4xLrtS3q4Rqbbof/6otQ1brh+su6KLgL8HOdPf2nBZdoYAKURDTLJsAnB
 dr0rJI9fS7LzL24f/bBDR3+aLh/jSOKduym0QnSZf7f/wn83MBqqmPeFwvKrbS2E+bR6
 hO9r1rznpmI/4AX9Zq1m7GHGQfho/45Ukq2SW0DMEQ7E/THzrltmjL/uM+n9RQqPBB4w
 vTLOdnIUrCqNGEpnDxHkx0MXFQrSDQt9H28E6jcpyiLHxDjIL4kek5e8fTtZO7GzXoYw
 CsCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XfjPVewo
Subject: [Buildroot] [PATCH v3 1/2] package/libest: auto-select safeclib to
 avoid use of bundled copy of library
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for libsafec can not be completely disabled - currently,
--disable-safec does not exactly allow for compiling libest on
systems without libsafec, but instead just uses bundled copy of
library from safe_c_stub/

To avoid that, do automatically select the full-featured safeclib
package and always use --with-system-libsafec

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 package/libest/Config.in |  1 +
 package/libest/libest.mk | 14 +++++---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index 6abe9d2848..bd5f40afae 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBEST
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_SAFECLIB
 	help
 	  libest is a C implementation of RFC 7030 (Enrollment over
 	  Secure Transport).
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index d9f3cf87bc..0dd3e7d0e4 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -12,14 +12,17 @@ LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
 LIBEST_LICENSE_FILES = LICENSE
 LIBEST_INSTALL_STAGING = YES
 LIBEST_AUTORECONF = YES
-LIBEST_DEPENDENCIES = openssl host-pkgconf
+LIBEST_DEPENDENCIES = openssl host-pkgconf safeclib
 # libcoap support is explicitly disabled because it breaks the build
+# libsafec support is explicitly enabled because we want to avoid
+# possible hidden use of bundled copy of library.
 LIBEST_CONF_OPTS = \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
 	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
 	--disable-examples \
-	--without-libcoap-dir
+	--without-libcoap-dir \
+	--with-system-libsafec
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 LIBEST_DEPENDENCIES += libexecinfo
@@ -55,13 +58,6 @@ else
 LIBEST_CONF_OPTS += --without-uriparser-dir
 endif
 
-ifeq ($(BR2_PACKAGE_SAFECLIB),y)
-LIBEST_CONF_OPTS += --with-system-libsafec
-LIBEST_DEPENDENCIES += safeclib
-else
-LIBEST_CONF_OPTS += --without-system-libsafec
-endif
-
 define LIBEST_INSTALL_PC
 	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
