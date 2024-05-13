Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCEAC25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5595A415A8;
	Mon, 13 May 2024 22:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmO6A0qBFhKw; Mon, 13 May 2024 22:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D885240B19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D885240B19;
	Mon, 13 May 2024 22:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 452561BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3196B81264
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wBCuxzSWN_f for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6757080F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6757080F73
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6757080F73
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:03:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so60172981fa.2
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637830; x=1716242630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGesLcWFGiv6pzDaHZEVKIb2XkTy4mvm7iXzE/OWCuM=;
 b=n7p2vVtVqaJEf+NpFTB69uXa+sfYH2L39IYEtzdnDw1bxdfRrKzEYXsL8/xjhY/7I7
 gssV1/n4WioER3QIFewsNDeN/uIbSmeTtRAiHbVh381x7t16YHFzYO3+V3FZAMuTajk9
 dPOtp8K7jVXdTKUdb8BRwqtfzwFxC7x+F/1xlscVnNgxVIoN5dI1fourCqrpQc5YtNYR
 v9+9i1gds9wUumIIS1hYPmvRjPoz0yyj9M3Rw2rW3yFSGopRglrQBZ7jRrm0Ycxd71Ni
 Jt9ztT2+SyAhfwZgYRGMgiktdUwvoKiHcaz17Tr+VWZO5TuNofSrSa2scP8czDm8T7rV
 dAUw==
X-Gm-Message-State: AOJu0YzmDSWVCk6YSx5dJ7vfxcUHNCifdd2D1IdqZs6D7UAnajRyhJj3
 u8dlI1M7Z+n7p0571Z6BnTQKH81taMItLxl8CbkZua/EyWU8nAnv4IIjZWZf
X-Google-Smtp-Source: AGHT+IE3qb6gR5LKQgEy/Sj2HfhL4k2Au3nv0qlbGoEVirJFm48WPjBCodSL6RmA91BMnhCbAXGhXQ==
X-Received: by 2002:a2e:3218:0:b0:2d8:3e60:b9c9 with SMTP id
 38308e7fff4ca-2e5204b2e71mr68094251fa.33.1715637829649; 
 Mon, 13 May 2024 15:03:49 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:03:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:06 +0200
Message-ID: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <1934329>
References: <1934329>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637830; x=1716242630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGesLcWFGiv6pzDaHZEVKIb2XkTy4mvm7iXzE/OWCuM=;
 b=JrcgzBBLLHXxdpKOqxbl5dwlC3IFSZLpCDcCKsdb1DSNAn3kjIwRQYqP/vOFf8y+7a
 mJlJzHqVQt5gC7jvA/mtVWq4bIyRO2u5bO0HKjF3KN3T/PhjX157TupYBvqqUxj3gflt
 pA1LY0DWj+v6Zk0ItHoMd8rM03flPHFfdi05UWhmkgQvAb4HvixhbFV+j0kBCnyT0Z0r
 4N5FCn2Fv36offkI7Sl5Y3HdUrVR1+7HR7/hOvL3kbxrZIHpocZIhCmhkBDAC71oLO8U
 7P/t4gwMNk1gYmSUU5WH77TTO3ZJ3pscZgPz+NtxQE0nnzsHIZ/Yl16/DT/go7S17t80
 QPfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JrcgzBBL
Subject: [Buildroot] [PATCH v4 01/14] package/qt6: bump version to 6.7.0
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

For details see [1], [2], [3], [4], [5], [6], [7], [8] and [9].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
[3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
[4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md

[5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
[6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
[7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
[8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md

[9] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md

We also apply the associated CVE-2024-33861 patch from:

https://download.qt.io/archive/qt/6.7/

As Jesse Van Gavere noted:

"This is not applicable to 6.4.3, the affected versions are detailed in
the bugzilla report below and it's only 6.5.0+
So this seems perfectly valid to go along with the version bump.

OpenSUSE report:
https://www.suse.com/security/cve/CVE-2024-33861.html
Bugzilla report clarifying affected versions
https://bugzilla.suse.com/show_bug.cgi?id=1223917"

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v3 -> v4:
  - Explain why the associated CVE-patch should be part of this series
    (suggested by Thomas)
  - Squash the CVE-patch into this patch.
  - Add CVE-ID to QT6BASE_IGNORE_CVES. (suggested by Thomas)

 package/qt6/qt6.mk                            |  4 +--
 .../0001-Fix-CVE-2024-33861-for-Qt6.7.patch   | 36 +++++++++++++++++++
 package/qt6/qt6base/qt6base.hash              |  4 +--
 package/qt6/qt6base/qt6base.mk                |  2 +-
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +--
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +--
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +--
 package/qt6/qt6svg/qt6svg.hash                |  4 +--
 8 files changed, 49 insertions(+), 13 deletions(-)
 create mode 100644 package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 1edb252c96..b87cb6748d 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.7
+QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
new file mode 100644
index 0000000000..f016788017
--- /dev/null
+++ b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
@@ -0,0 +1,36 @@
+From 7f88945625f560796c86a267086f163e74c1407b Mon Sep 17 00:00:00 2001
+From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+Date: Sun, 12 May 2024 07:15:32 +0200
+Subject: [PATCH] Fix CVE-2024-33861 for Qt6.7
+
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+Upstream: https://download.qt.io/archive/qt/6.7/CVE-2024-33861-qtbase-6.7.diff
+---
+ src/corelib/text/qstringconverter.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/text/qstringconverter.cpp b/src/corelib/text/qstringconverter.cpp
+index b5749843..fd45ccf2 100644
+--- a/src/corelib/text/qstringconverter.cpp
++++ b/src/corelib/text/qstringconverter.cpp
+@@ -1954,7 +1954,7 @@ struct QStringConverterICU : QStringConverter
+         const void *context;
+         ucnv_getToUCallBack(icu_conv, &action, &context);
+         if (context != state)
+-             ucnv_setToUCallBack(icu_conv, action, &state, nullptr, nullptr, &err);
++             ucnv_setToUCallBack(icu_conv, action, state, nullptr, nullptr, &err);
+ 
+         ucnv_toUnicode(icu_conv, &target, targetLimit, &source, sourceLimit, nullptr, flush, &err);
+         // We did reserve enough space:
+@@ -1987,7 +1987,7 @@ struct QStringConverterICU : QStringConverter
+         const void *context;
+         ucnv_getFromUCallBack(icu_conv, &action, &context);
+         if (context != state)
+-             ucnv_setFromUCallBack(icu_conv, action, &state, nullptr, nullptr, &err);
++             ucnv_setFromUCallBack(icu_conv, action, state, nullptr, nullptr, &err);
+ 
+         ucnv_fromUnicode(icu_conv, &target, targetLimit, &source, sourceLimit, nullptr, flush, &err);
+         // We did reserve enough space:
+-- 
+2.45.0
+
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index cb111bd405..0f45826a45 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60  qtbase-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256
+sha256  11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a40233b8b254  qtbase-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..b8040e395b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -9,7 +9,7 @@ QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
-
+QT6BASE_IGNORE_CVES = CVE-2024-33861
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 0735df3af2..1eb0b5b460 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256
+sha256  9d49d4fd8345d8a40b63e0b65cd49c1d8286e33a7f1409bf1316763f654e19f5  qt5compat-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 98c8931962..17d5090076 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
-sha256  b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366  qtserialbus-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256
+sha256  498193a9860664f8a55f676656c45af179ac13d48184af43fc58ddf795bb76dd  qtserialbus-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9341978d86..cd51fbe435 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de  qtserialport-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256
+sha256  b1f02a3d8c9cc8ba2ffa7cca3749f1f147d327e8dfc633fd4ec3cb770d7981c9  qtserialport-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index bb239cb012..32c1a79a5c 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
-sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256
+sha256  1518f40e08ff5e6153a6e26e5b95b033413ac143b70795dc1317e7f73ebf922d  qtsvg-everywhere-src-6.7.0.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
