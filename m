Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D02C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD8D80275;
	Sun, 30 Jun 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic4qHD7uRtas; Sun, 30 Jun 2024 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7967080BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7967080BA1;
	Sun, 30 Jun 2024 21:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F64A1BF34A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D11780BA1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 21:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpbjqAEdiK42 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 21:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E6EF80275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6EF80275
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6EF80275
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 21:09:41 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so31203171fa.3
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719781779; x=1720386579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEIoKQPacn5XH2TvD9DwrBrJiihhBF1sLwiDaFKIfBY=;
 b=pwcm0grK/rpL8qJ5jpL5QtwS12263lI5JuxQZ2OHwkMbn5j8f0rFgN9Cu1SJN9Ly7n
 rbyYdJO3BMup2zY+VcjvjQdCJS82+4gezSLVTFaoz4WFdNj13EelxFEVHWu7boUNThn7
 /SlwyL8Nn0gnl5C019Q6/3AJcFFeeUfiq5DGQyloFDvFBDNXfxBzgGGBDllNsRs6NYN4
 B38zfqz0xp8Lg+SUsK65ikyI3FS20jSUdyN1m2CvnTZdZbP06yRZT6OGei1fexx7eWNg
 19cGt6uSfZqunvIfiQQcCgO1HZD0FGLeoT9xAJ4HjQAaUKmGJOdw4beR0uHbOwSgsRqO
 9rJQ==
X-Gm-Message-State: AOJu0YywPJP+kvQDOT5Nr6/w4EzrEI4EkLv1/kQkzH62NeXu/6AS/Qqf
 QZp31BOAOFa6mSycn/qqwdC4WlA8yF51atKgvzfHG0OK3uyEmT/eiQbiTg==
X-Google-Smtp-Source: AGHT+IGZ808CjkF7Eh7quiP6ydtWTtERtFsqPjq3++q11sSJbhKqerLvexWzrSso++q/Xrs4O9Z8xw==
X-Received: by 2002:a2e:bcc2:0:b0:2ee:699b:466 with SMTP id
 38308e7fff4ca-2ee699b05d3mr11397541fa.36.1719781779232; 
 Sun, 30 Jun 2024 14:09:39 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42577a0d108sm43338015e9.0.2024.06.30.14.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 14:09:38 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 23:09:38 +0200
Message-ID: <20240630210938.1590435-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719781779; x=1720386579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=aEIoKQPacn5XH2TvD9DwrBrJiihhBF1sLwiDaFKIfBY=;
 b=IJtnYWV1LuGnEP+WLGteHH/jw+Mc52vIyADC2x5+WGfA+ZyXBT3uSGGWsM9oR/ytQ/
 MjPJjztIdo5HE7WoCz7eI9oA8vn9cti0F0am0HYne4r9rGRUBCpHCdwiMQuZnQ9bwozK
 /8THduqgHAfZ8ENTJ/jjN2aFqMqbTZTpGJ7wkUJdRHJpcPgJqnWZ50v5xdeS29DUE9Uv
 zU/9UdGgHt/oOIdOlcpHhXtEpaq9EuSVI3N0CMRvRcCffMoO03CX7mTjwgx8C5cmJbJe
 FM6NSwywsfj4JkgRzn2ToLRtdFBUjXF4IxT45EecX2DEaZh/Ewk0vM+9FIs+RigUPGsR
 1n0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IJtnYWV1
Subject: [Buildroot] [PATCH] package/tar: fix linking with libiconv
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport two patches from upstream to fix linking with libiconv, e.g.
with this defconfig:

    BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
    BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
    BR2_SYSTEM_ENABLE_NLS=y
    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
    BR2_PACKAGE_LIBICONV=y
    BR2_PACKAGE_TAR=y

It is interesting to note that the first patch we backport is the first
commit in the tar repository after the 1.35 tag, and was comitted the
same day the release was cut...

Fixes: #4

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tar/0002-Fix-savannah-bug-#64441.patch    | 28 +++++++++++++++++
 package/tar/0003-tests-fix-LDADD.patch        | 30 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 package/tar/0002-Fix-savannah-bug-#64441.patch
 create mode 100644 package/tar/0003-tests-fix-LDADD.patch

diff --git a/package/tar/0002-Fix-savannah-bug-#64441.patch b/package/tar/0002-Fix-savannah-bug-#64441.patch
new file mode 100644
index 0000000000..049e08c27b
--- /dev/null
+++ b/package/tar/0002-Fix-savannah-bug-#64441.patch
@@ -0,0 +1,28 @@
+From 8632df398b2f548465ebe68b8f494c0d6f8d913d Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Tue, 18 Jul 2023 17:02:23 +0300
+Subject: Fix savannah bug #64441
+
+* src/Makefile.am (tar_LDADD): Add libiconv libraries.
+
+[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=8632df398b2f548465ebe68b8f494c0d6f8d913d
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 36c9543..e2ec58d 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -52,4 +52,5 @@ AM_CFLAGS = $(WARN_CFLAGS) $(WERROR_CFLAGS)
+ tar_LDADD = $(LIBS) ../lib/libtar.a ../gnu/libgnu.a\
+  $(LIB_ACL) $(LIB_CLOCK_GETTIME) $(LIB_EACCESS)\
+  $(LIB_GETRANDOM) $(LIB_HARD_LOCALE) $(FILE_HAS_ACL_LIB) $(LIB_MBRTOWC)\
+- $(LIB_SELINUX) $(LIB_SETLOCALE_NULL)
++ $(LIB_SELINUX) $(LIB_SETLOCALE_NULL) \
++ $(LIBINTL) $(LIBICONV)
+-- 
+cgit v1.1
+
diff --git a/package/tar/0003-tests-fix-LDADD.patch b/package/tar/0003-tests-fix-LDADD.patch
new file mode 100644
index 0000000000..c00f14d2c1
--- /dev/null
+++ b/package/tar/0003-tests-fix-LDADD.patch
@@ -0,0 +1,30 @@
+From 71530f72d21d9af00b5688948111666f62f5ec4b Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 19 Jul 2023 15:48:25 -0700
+Subject: tests: fix LDADD
+
+Problem reported by Christian Weisgerber <naddy@mips.inka.de> in:
+https://lists.gnu.org/r/bug-tar/2023-07/msg00015.html
+* tests/Makefile.am (LDADD): Add $(LIBINTL), $(LIBICONV).
+
+[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=71530f72d21d9af00b5688948111666f62f5ec4b
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ tests/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1884b72..b696f01 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -337,4 +337,5 @@ AM_CPPFLAGS = \
+ LDADD = ../gnu/libgnu.a\
+  $(LIB_ACL) $(LIB_CLOCK_GETTIME) $(LIB_EACCESS)\
+  $(LIB_GETRANDOM) $(LIB_HARD_LOCALE) $(FILE_HAS_ACL_LIB) $(LIB_MBRTOWC)\
+- $(LIB_SELINUX) $(LIB_SETLOCALE_NULL)
++ $(LIB_SELINUX) $(LIB_SETLOCALE_NULL) \
++ $(LIBINTL) $(LIBICONV)
+-- 
+cgit v1.1
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
