Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E124C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3600360895;
	Sun,  3 Mar 2024 21:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o577l516xCWP; Sun,  3 Mar 2024 21:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C28E60AE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C28E60AE7;
	Sun,  3 Mar 2024 21:24:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADB921BF33D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 21:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 998D140514
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 21:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Dw7Nc4DV--C for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 21:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7D8D40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D8D40210
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7D8D40210
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 21:24:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d28464c554so51425081fa.3
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 13:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709501057; x=1710105857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuGDn5x+GdxNZ+fV6GYKIeznxnzFUCdbWltqgQoeMLI=;
 b=OZt64J7tvlYmJ70MXWsYm5SfuHlUoV5cw1O5SCovroCT74oIR/jSABwkKMSQyTIt8L
 8pUV/QsuGcnzqwZxFFKOISECKtdd1kzO+AVZalQNlcJhceTSh7FjzhEmnvWiFiGsw7n1
 LC1Vg6B7RbSLg+9SqGcONuPvzjX3fN5YTQ6+o5sXDUP6ctCmwF7LikU0K/A0M4uc6H+h
 7PVs4n2QlMgT8+u8Y9fZt79kEetcW4R+5CijIxQBDMTNkFav/G8iByLce8vnBqE2T05Z
 3sAjz48YEtFtpMlAqTFMyGJSNmaoGWPVQaXLji9RFADUjhXg9DcxgVXyQvGV5YlCVq1h
 sfAA==
X-Gm-Message-State: AOJu0YyB72mSgFnJH1Vxfoqtji74NBhZduwiEbbPIYE8yJatZLVOx2sl
 ArOALVHD+e/WxO3jymWoU9L2xQLHXNV3malZ4uVsBQpmeVfzLGWMG/s9u3DN
X-Google-Smtp-Source: AGHT+IEFN5I2/8+q7VPyepMMwGKlWSKZ5gvr+iO8sSBBHGu4NljXnjGEC+60QJP3DYRoeJYtwYaT/A==
X-Received: by 2002:a2e:9c05:0:b0:2d2:73d1:d259 with SMTP id
 s5-20020a2e9c05000000b002d273d1d259mr4560538lji.23.1709501056868; 
 Sun, 03 Mar 2024 13:24:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c290c00b00412b4576316sm15079451wmd.45.2024.03.03.13.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 13:24:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 22:24:11 +0100
Message-ID: <20240303212411.1139387-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709501057; x=1710105857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UuGDn5x+GdxNZ+fV6GYKIeznxnzFUCdbWltqgQoeMLI=;
 b=L/3COYDchinZQE9dFRY0ihpLR83KZXagKC9JtQaOBh/R/GXBx8Q/HR1IMrFzVzZo8Z
 FZkJ9kP/ggc00LMJ90e9mMJcIYX4TuZEyZizJvPZcY2z87r0eXrv3EMOLTXF/9dqSOtr
 k+IlGthhdQMOQH9E7e8Qnv+9r+tfSUozfeV8+/3VYSQRdXVMzFH8NESHSI8Ey5s8kFgS
 JlSPNPRpV24G1kKrEZNG604TzD60bhy/d2cM6WQcC74DU9IOCCFNEH8diM7DgQx43eVU
 sDP9k0k2tl/9miLwcKrW7YGk1cFE0KSQkueeI68ZQP4Fr3uq/XPhbiYoOYFQQz/ailIR
 xtpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=L/3COYDc
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build with
 BR2_TIME_BITS_64
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS to avoid the following
build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/stdio.h:27,
                 from /home/thomas/autobuild/instance-1/output-1/build/fluent-bit-2.1.7/tools/xxd-c/xxd-c.c:27:
/home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was present since the addition of the
package in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483 and is
probably not needed anymore

Fixes:
 - http://autobuild.buildroot.org/results/ff5c60cd038550453ce138fe2a9383af2f5d6f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluent-bit/fluent-bit.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index e51322aad6..00a8904c55 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -12,8 +12,6 @@ FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
-FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
@@ -55,11 +53,6 @@ FLUENT_BIT_CONF_OPTS += \
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# https://bugzilla.redhat.com/show_bug.cgi?id=574992
-FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
 FLUENT_BIT_LDFLAGS += -lexecinfo
@@ -76,8 +69,7 @@ FLUENT_BIT_LDFLAGS += -latomic
 endif
 
 FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
