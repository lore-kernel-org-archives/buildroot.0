Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF6FC3DA7F
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 08:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA88A81DCB;
	Fri, 26 Jul 2024 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAlKfHltFUbS; Fri, 26 Jul 2024 08:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5614681B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5614681B71;
	Fri, 26 Jul 2024 08:28:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCFD01BF3B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABB140247
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_L7AZ4EWvb9 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 08:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31C0A400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C0A400D8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31C0A400D8
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 08:28:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so13642485e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 01:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721982479; x=1722587279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kM8fGoNs3+E07RObyROI3byw5ppCqDz3t9Nq6Sgb+kk=;
 b=OG1lWfz/ePTCW08LH0J/qJId/5rWnTHVuhmOdCEI5IN8j5WZw0PwHVQH2/i7UQvUYY
 UDNB3RwLl3OVEG3tL/mOggJfPmnrq7R+Pu9G/Pi3vFzqIAGBE9UXlxPZjPh+GWe4nQ2G
 XLPBxopn05DaLyKuHxPj9DcYyIGC22qeRyjAg4E6SvOrqT5DfDCa+bDYrtpb2BZSvYDi
 l9vLdbZkHRbMLnItOBS76H0zVMTWSHO/X0rkts2nv52/edqkepSM+qBFZ30GYDGlXFsW
 F+EXMwB/n6tptLp3FTISx5plFHUs7BHNkAafWhKd+0oMFlfAJLTdu1ZlYMyxF3THENja
 f3uQ==
X-Gm-Message-State: AOJu0YzrloBQjHvQyQ/EzNGi5C1zBjSIajvEUhJi7e1z6ScGRB7CauDd
 Km7JlTPEBQAvQ+c8ilant/8xStGXhiZIJZE7ibFWd9OhIU9Lp+NjqGH5Ag==
X-Google-Smtp-Source: AGHT+IGumMbxSnAvnih/Ogn1HOy07Wxio6wqIDdg+7IjjSxq+cWGuXCZVnaauzLR+BBA8uFZv/ygKA==
X-Received: by 2002:a05:600c:19cb:b0:426:6ea8:5037 with SMTP id
 5b1f17b1804b1-42806bf1bf2mr27301255e9.37.1721982478375; 
 Fri, 26 Jul 2024 01:27:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93594b6sm109017195e9.5.2024.07.26.01.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 01:27:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 10:27:54 +0200
Message-ID: <20240726082754.891552-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721982479; x=1722587279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kM8fGoNs3+E07RObyROI3byw5ppCqDz3t9Nq6Sgb+kk=;
 b=VPoOsAQvn8W0UU2iQjq+iykO2Iof+mztk0AwK2aKzEVYVDKO53dguM3I24uFu954v4
 Pnz3ZjdlBw/2XC33AMIaqQ3m4xnhWn/Xh5B6QXoiDrs4K7voWsAUsHMqjgt8+WNZmyAL
 RfxJD72gRx7oeU4buymVGmknv62v7m327AWc+R10kBzH6+VZbJ+1SMXauot2JwEjDp5T
 lK3/FKf3jEVbgqNbgyzozTshX+NB1UqmKSO0hsdQGsKrzI3ChwU3pt5EOpPsz3rS2kMM
 ik8LBJXeO3rWWU8JSQOsaGpnaM/2kIcnjY981/W44J2y84xxd9oeGll2xHfJheOOz/UN
 5e8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VPoOsAQv
Subject: [Buildroot] [PATCH 1/1] package/libdex: needs dynamic library
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since the addition of the
package in commit 70319b47f646f74f407ed3355baf5b581a10518a:

FAILED: src/libdex-1.so.1.0.0
/home/autobuild/autobuild/instance-11/output-1/host/bin/mips-buildroot-linux-musl-gcc  -o src/libdex-1.so.1.0.0  -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libdex-1.so.1 -Wl,--whole-archive src/libdex-1.a -Wl,--no-whole-archive -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-Bsymbolic -fno-plt -static -lucontext -latomic /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libffi.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libglib-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.
 0/../../../../mips-buildroot-linux-musl/lib/libatomic.a -lm -pthread /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libpcre2-8.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libz.a -latomic -Wl,--end-group
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/crtbeginT.o: in function `deregister_tm_clones':
crtstuff.c:(.text+0x10): relocation R_MIPS_HI16 against `__gnu_local_gp' cannot be used when making a shared object; recompile with -fPIC

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/f527cab99141ecbbbd13c12177a2cc8903bed3a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdex/Config.in  | 4 +++-
 package/sysprof/Config.in | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libdex/Config.in b/package/libdex/Config.in
index 5f94a79b73..17abc0b02a 100644
--- a/package/libdex/Config.in
+++ b/package/libdex/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBDEX
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
 		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,8 +17,9 @@ config BR2_PACKAGE_LIBDEX
 
 	  https://gitlab.gnome.org/GNOME/libdex
 
-comment "libdex needs a toolchain w/ wchar, threads, ucontext"
+comment "libdex needs a toolchain w/ wchar, threads, dynamic library, ucontext"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
 			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 32a5f99798..a4f53a1179 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on BR2_USE_MMU # glib2, libdex, json-glib
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # libunwind, polkit
+	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
