Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E803C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 13:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F70C82416;
	Tue,  5 Mar 2024 13:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7ZICY17J-jR; Tue,  5 Mar 2024 13:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 277F182370
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 277F182370;
	Tue,  5 Mar 2024 13:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4C971BF32A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B222160E2B
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akDpqqOLXzCu for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 13:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B3AA60E29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B3AA60E29
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B3AA60E29
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 13:54:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412e84f501dso12883195e9.0
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 05:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709646876; x=1710251676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hf4c80ELsXQT3fZeQYOr0XXquuUGw4Lk8VhCxe65M0g=;
 b=OmvztIODgNnvLP+dV2kAWdpK18Jn13DJWOVNz4DqfG3osasGQeOGRSDTGhmUNRkqLP
 o6OfsKudCiU4qGX2m5/stcU4P+PEDMn2AnuslwOPAQ/gxBe0bIPvTkr6MIo+/VaJZaUZ
 Xavd0H509QWcY4CERi7A3T6Nh0SbrjCEYuHMA1O4FmXsHCSeyrqiuYvITsfhn/WGmuAp
 yYO8y9DV58bGUyjvjZRrk0Z0Dsi/PVUnkYFp1IlZi0iBgXJTCXMZThKs5VperAa+3iVT
 cyreEhei3QnNlsCfPUul37fb6As0bXd1cupZhrGsf3aPbx6zFBNmYVVz3dhKlPDjGvQ1
 AApg==
X-Gm-Message-State: AOJu0Yzvxdc/SKgTxF0iC6WqfEya3sRQ0JQwnDnRjXuAVW/c790S3bd6
 134fNr7XQFK+u1MmYV8aIvwJO/8nTKvBhdApep3Te/7ft38cNm8p2KeJhGhf
X-Google-Smtp-Source: AGHT+IEi0p4cFW2OGXg69A3ENl+DVUI8DihLQ86H/FpI3bk1mgInxSn12H0hZcEUMDGvtxSZU7Kl0A==
X-Received: by 2002:adf:ee8c:0:b0:33d:82bb:d1ad with SMTP id
 b12-20020adfee8c000000b0033d82bbd1admr8705859wro.27.1709646875803; 
 Tue, 05 Mar 2024 05:54:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bs19-20020a056000071300b0033daaef7afcsm15365082wrb.83.2024.03.05.05.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:54:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 14:54:33 +0100
Message-ID: <20240305135433.1145180-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709646876; x=1710251676; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hf4c80ELsXQT3fZeQYOr0XXquuUGw4Lk8VhCxe65M0g=;
 b=QHXn04bfLq173jNlonkW8UeIHIxk2n16L6qWIBlU+1bQoKJA9YeDCnMUPVVn4QEPni
 Ub9kq3eFYrc1ZbxRg21rpegZbE/SLWzZAg37IDGtCiWfRnpTnQxPhyZ92pskK3IJXeZZ
 BMu3ZaYoBxyc583PvUR48kdAxsab+c+hFg5U7lDt3NczLoLGNuS/zlGnuV+7BRPRE+8L
 O8YOAr2BpTlDSWhF7T8uOOMa1Wf1qQhXErVeRA+32lLhi163WhCTWlkHCe/i1d4VU9pX
 y03jJX9DyDKzWvjo3C8Y3glKNyOF1fQeI6lC+DydskGiwd1eCF5nGWeBaxQagIy2GaPT
 PeMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QHXn04bf
Subject: [Buildroot] [PATCH 1/1] package/policycoreutils: fix build with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/errno.h:25,
                 from pp.c:20:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was there since the addition of the package
in commit cb328f77f8f07bfd89d6b69385c941a7b281732b  and is only needed
to fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/policycoreutils/policycoreutils.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 56889242e3..49911acae2 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -11,7 +11,7 @@ POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
-POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
+POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
@@ -28,14 +28,6 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
 POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
 endif
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-POLICYCOREUTILS_MAKE_OPTS += \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
-
 POLICYCOREUTILS_MAKE_DIRS = \
 	hll load_policy newrole run_init \
 	secon semodule sestatus setfiles \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
