Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1662EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:20:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA02F61AD2
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA02F61AD2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669ED4024E;
	Mon, 15 Nov 2021 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkXSRgZgKV6p; Mon, 15 Nov 2021 22:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD3C40231;
	Mon, 15 Nov 2021 22:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC5F61BF406
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8CA06078A
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 457RjK5Q7sis for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 22:20:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C07546066E
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 22:20:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r8so33496838wra.7
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 14:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mi8oFPXfbCZZVJon2AN7QeaaHEcT0GR/iRZg6oZjhjM=;
 b=Vx1uP0yrKE6CGGUXDUDbKD7FgGqkYoxIrNpxALKLW8ThY7VaSyNTFHMNWurMEpsMWf
 Bk5+D33fVBqUqcXPwIHOc38lPblxeHUijUh2knBVp0SAIOyB9outSka+QhNhXSF9NeSR
 o+cAKXfIt5H0FH3iNm8OW7obYAhXK4GdWBBZYvU8bt1vf8t/4ILVrfn3aOACG8e3YNvg
 PdllTG6RI4WrxVg9APOaZ3I+g6pyBhpTpgRLJQ1Z5j8RHiGimuR71Zh7rmbqDSVg5QSz
 zHOmSM8nr/n9/9PK4AK2831FQ2sJwyGQDavCVwTjVBKbP1zdME2NjC56rMVhPTtBlRwS
 oVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mi8oFPXfbCZZVJon2AN7QeaaHEcT0GR/iRZg6oZjhjM=;
 b=TcjZ6wlZVlosiZFI5AqLXKYfUJLHn7eyNIwkh4lgfcLFBalX9d80o2VnrnROauKGWO
 KhpF4ag3/4jP93Goc5BHGn3tssN9UYsYmpscgUQXOfFJJS9JIp6OStXhkSD5RlMOjQri
 EtsUYhLDEHEErlrMf953DZKm4dPZR2v6a4RvQCpyaOeicy9jHjIDSg6MuTBLzCGkr9Hw
 KcMpy4w/iVtel1J/mthcLr6lQxsRunYkvsDEIiB0BjcqQEc8GkAq1NfbWKiNEHkBytCx
 QbjLdsdbWNONoA4HGey6inAfUjCOcKBB9YGCiRNTtKZ6QQ/iY+dV06BgSyBxJxTlLqH3
 TTyA==
X-Gm-Message-State: AOAM532dqGukK6DMyRdDDuv04qvv1MafBvyoDrcyLjg+s33zPWVqZA/P
 cPoBO12BsZqgSZ37ELeP37R37VQBJ60=
X-Google-Smtp-Source: ABdhPJyV4DEFiziG0iqr9dQ5HMIYjzIGRm0QBMDFfORx+jUxfsCTPgKTI9pLQjs+cBpwhDaoL108jw==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr3205696wrn.90.1637014817702; 
 Mon, 15 Nov 2021 14:20:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m125sm498601wmm.39.2021.11.15.14.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:20:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 23:18:05 +0100
Message-Id: <20211115221805.3956738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump to version 0.9.1
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Fix build on musl by disabling fibers through the new KJ_USE_FIBERS
  variable:
  https://github.com/capnproto/capnproto/issues/1167
  https://github.com/capnproto/capnproto/pull/1313
- Update indentation in hash file (two spaces)

https://capnproto.org/news

Fixes:
 - http://autobuild.buildroot.org/results/1a54cf9e7223c2bd67a5c85a6f2f42aa98da3a53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...it-architectures-using-64-bit-time_t.patch | 37 -------------------
 package/capnproto/capnproto.hash              |  4 +-
 package/capnproto/capnproto.mk                |  7 +++-
 3 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch

diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
deleted file mode 100644
index ce70ab8f29..0000000000
--- a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 12:10:28 -0800
-Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
-
-mutex code uses SYS_futex, which it expects from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-rv32 is using 64bit time_t from get go unlike other 32bit architectures
-in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
-this aliases it to NR_futex so that SYS_futex is then defined for rv32
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved from:
-https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- c++/src/kj/mutex.c++ | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
-index c81cead7b..e1594b117 100644
---- a/c++/src/kj/mutex.c++
-+++ b/c++/src/kj/mutex.c++
-@@ -39,7 +39,13 @@
- 
- #ifndef SYS_futex
- // Missing on Android/Bionic.
-+#ifdef __NR_futex
- #define SYS_futex __NR_futex
-+#elif defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#else
-+#error "Need working SYS_futex"
-+#endif
- #endif
- 
- #ifndef FUTEX_WAIT_PRIVATE
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index d4500e0aad..7fd0e6158b 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6d8b43a7ec2a764b4dfe4139a7cdd070ad9057f106898050d9f4db3754b98820  capnproto-0.8.0.tar.gz
-sha256	9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
+sha256  daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535  capnproto-0.9.1.tar.gz
+sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 901b57ecda..7fc07043fb 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.8.0
+CAPNPROTO_VERSION = 0.9.1
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
@@ -29,5 +29,10 @@ else
 CAPNPROTO_CONF_OPTS += --without-openssl
 endif
 
+# musl doesn't support getcontext/setcontext
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
