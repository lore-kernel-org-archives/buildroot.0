Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACED8414C0;
	Sat, 28 Oct 2023 19:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACED8414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8qKjqKzG-kW; Sat, 28 Oct 2023 19:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D164096C;
	Sat, 28 Oct 2023 19:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D164096C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C84611BF865
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D2EB61283
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D2EB61283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c95c37GWW2Gd for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:44:56 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4153E61244
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4153E61244
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so46723961fa.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 12:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698522293; x=1699127093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B3nuZkohB1mT2kF5u/rprzo1mqRW8gKZVQh4s2rPwqw=;
 b=ENHW4Et+YJpzscHCoyS9ytMnSx5AKmov7TXnoupTmXad7fjnBqIxvY+Ki/K4+2waUV
 IxJc/mE0yw0XYJK5QzlWdJqh6wT6lmIQea+tncW2iGaoS4Fpb5pd0FzImnKo/pksm/DS
 qvzejCwmYmyQCOPW4LO0OFhS4+s/FDRM9bhglJGqHz3rJnrRqPRwgQxYRhoUCFqfNTph
 tqZSrGQxDkgOo4pPgCXj0pezgR0N1hbFHJ4WrfWtBTu0JgTwR6NIqg9Dc6dliLh0CLs/
 urC7Wxg0YYx/34+5ajbCwyqbagEazaD+ufheJEMVxa/jam+UnYTSYV19tS+Sqz9Yob2K
 6qAg==
X-Gm-Message-State: AOJu0YwQtiH+OA59ofT2UcW74c+mQMhrZLUNwkW5AKaHKWmSn8tvoVYe
 Z6++gC4Jn39LQQMz7678BZ1+/g0nuBo=
X-Google-Smtp-Source: AGHT+IEgErqLZspopzf7mjIE30oKFwOycyJ/pKtQay0edjqRNSdwIbSNIMFf1MUE+R6e60BaEM9ZLQ==
X-Received: by 2002:a2e:7e0e:0:b0:2c5:409a:a901 with SMTP id
 z14-20020a2e7e0e000000b002c5409aa901mr4209289ljc.49.1698522293403; 
 Sat, 28 Oct 2023 12:44:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 gy14-20020a05600c880e00b004064741f855sm4721349wmb.47.2023.10.28.12.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 12:44:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:44:47 +0200
Message-ID: <20231028194447.989851-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698522293; x=1699127093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B3nuZkohB1mT2kF5u/rprzo1mqRW8gKZVQh4s2rPwqw=;
 b=iHHGZdDkvzjbZLr/080q8K1lKwN2DEVkPMTr/y9tXrZOQ7DVoSXtlmuD6P0ehPnpip
 +o37Ki5i4RK8LqJ36EkpRhSv7GCXOTyEyh4Ae2obyGc7NjpLOEP6L5oHO094AC6ZT2r+
 OBZeWnAk9sYtXOiWthLihrxxHbJ1YW/7gUg9r5Zp5dbqQL0LIPpWpYtHaENEIWe9A3NP
 Zrp81qWwOcZL8A9Uin9QA9jxVsIB5/qt3M6z0QsFOoiilxuj9zUufwRyB1HSoIUqrlSS
 /eFUTd4E4eemabmKWZlMgv7eHWOtXfIJ4nc7zLZqonAB75gI33f41I7y/vkimcGtJhLN
 llqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iHHGZdDk
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.9.0
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of License.txt (minor updates with:
  https://github.com/weidai11/cryptopp/commit/bc2c8423a1d8a193dcf1e5706c124587f9491b7f
  https://github.com/weidai11/cryptopp/commit/b418f93483562f1b59d0ba963dcdcc16b6a6a793
  https://github.com/weidai11/cryptopp/commit/2bce06d5dbd3f53ebfcff44eef467667e44d8839)

https://www.cryptopp.com/release890.html
https://www.cryptopp.com/release880.html
https://www.cryptopp.com/release870.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-add-missing-shared-library-symlink.patch | 62 -------------------
 package/cryptopp/cryptopp.hash                |  6 +-
 package/cryptopp/cryptopp.mk                  |  2 +-
 3 files changed, 4 insertions(+), 66 deletions(-)
 delete mode 100644 package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch

diff --git a/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch b/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
deleted file mode 100644
index 5f87414d53..0000000000
--- a/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From e4c2e3bc8174f24cf63923619f5d06d85b84ae1d Mon Sep 17 00:00:00 2001
-From: Kamel Bouhara <kamel.bouhara@bootlin.com>
-Date: Fri, 7 Jan 2022 22:59:23 +0100
-Subject: [PATCH] GNUmakefile: add missing shared library symlink
-
-The GNUmakefile install-lib target currently installs the following
-symlink:
-
-	libcryptopp.so -> libcryptopp.so.8.6.0
-
-However, it does not create the following symlink:
-
-	libcryptopp.so.8 -> libcryptopp.so.8.6.0
-
-This symlink is necessary at runtime because libcryptopp.so.8 is the
-SONAME of the cryptopp library, and therefore this is what the dynamic
-loader will search when starting a program that is linked against
-cryptopp.
-
-For native compilation, the 'ldconfig' invocation that immediately
-follows will create that symlink, so everything works.
-
-For cross-compilation however, ldconfig can't be used, and therefore
-LDCONFIG is passed as /bin/true, and therefore it doesn't create the
-symlink. So instead, create it directly inside the GNUmakefile,
-without relying on ldconfig.
-
-Upstream: https://github.com/weidai11/cryptopp/pull/1101
-Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- GNUmakefile       | 1 +
- GNUmakefile-cross | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/GNUmakefile b/GNUmakefile
-index 23273edb..3b55e420 100644
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -1412,6 +1412,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
- 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
- ifeq ($(HAS_SOLIB_VERSION),1)
- 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
-+	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
- 	$(LDCONF) $(DESTDIR)$(LIBDIR)
- endif
- endif
-diff --git a/GNUmakefile-cross b/GNUmakefile-cross
-index 9847f04b..a2b87e4a 100644
---- a/GNUmakefile-cross
-+++ b/GNUmakefile-cross
-@@ -856,6 +856,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
- 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
- ifeq ($(HAS_SOLIB_VERSION),1)
- 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
-+	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
- 	$(LDCONF) $(DESTDIR)$(LIBDIR)
- endif
- endif
--- 
-2.33.1
-
diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 9a113b8f04..a7bc578da4 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release860.html:
-sha512  e7773f5e4a7dc7e8e735b1702524bee56ba38e5211544c9c9778bc51ed8dc7b376c17f2e406410043b636312336f26f76dc963f298872f8c13933e88c232fc03  cryptopp860.zip
+# Hash from: https://www.cryptopp.com/release890.html:
+sha512  903970c4c0312272e93bae0cc3477be66b273dd38c9329fda9f7157ec44e247a3bc16b9d2b4ad625f258af0eaf2dc2c4210d4d14829b455f180983859a5c4b41  cryptopp890.zip
 
 # Hash for license file:
-sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
+sha256  78e4010b682cb94187fe0b57e50116d0ba271ef81104d1ddb35c80c3d81e3169  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 87d6fba237..a538f8c17d 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.6.0
+CRYPTOPP_VERSION = 8.9.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
