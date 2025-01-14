Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D6C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2432A60E72;
	Tue, 14 Jan 2025 07:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7K9UelR--eb; Tue, 14 Jan 2025 07:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9D860E82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9D860E82;
	Tue, 14 Jan 2025 07:30:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74CCDB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5439A40572
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvFuOv1smvPD for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DE804017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE804017B
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE804017B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d9f0a6ad83so1971995a12.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839817; x=1737444617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKnMHn7y3p/LgqaRI7F0ob5STrhUgx4LH/aeXyLQJ5I=;
 b=fjJaWibDxoBAvJsDIcDMSeeEhEOEDNZ6ceVWs9dE4phJX8Guv1cyHSGl0JLSs/EoOy
 IMYGVJulzKnpEQUonjZBp8WvxhFLcQFgDoUSkqbkO+N7u4cMYyLRHrz5zkT5C6uqSN3g
 hOaae68IcpByqTd1p7NA0WFwczjn92G6TVpdo4ATq8Yvy3sYwqgEvLTSX4J/dg33YM0E
 V+3ILuF/K5til3AeyVQrZ7c3VFmldkVKMJHNlR6VFZ6E7n0A7fFdH+SbtFd4kWsxoqEo
 T1sRx+YTurtyF0nQlKDuJZWmyx8bi4WvExRq/MP1bekhIAycDnWWYf1WLMSG4E+tgFnW
 1e8Q==
X-Gm-Message-State: AOJu0Yx6LWM6TvOlEO33FBtIrs2ikdKNiG+HwQrhV/hCcSw2UQvyWzC0
 dkVX7i0Julf9QdGeoOkjU0p40MMymgHfWLrN6h26djqgROv/7U8GZg0erg==
X-Gm-Gg: ASbGncv6va9n2LnV8yuXMAC5gQ0TY/43EjS43FW4jFCTBoPt7WtHoBjr1vMKNI4xOdG
 LwIqOwXGBUakD2I4d5NxUPhun1Dzbu1MadGoLCJGY3CjaaNr1WbRMB0hE35PFpahaBg9Ik0HfaQ
 Jm0HDFInOpzMbeoORE/PRzFvw08VZqQEubTEpeWw/Bir2fVntFhRePgIBUc7cCwTD5ryjfqYf9f
 /XzSo+oyco1yGSLX75NcebpDTdrL4fm5AA8FfpxYaFpbIrItOAhiEP0QGUYWWwttg2FkTTDtQ==
X-Google-Smtp-Source: AGHT+IFdkxIYTT4JGIXpRkKFnlQjef0WaS4H77PTMTMZzLfhyoEhd8Z8mBUihahLGPx5Oj9JpmFbLA==
X-Received: by 2002:a05:6402:354c:b0:5cf:e71c:ff88 with SMTP id
 4fb4d7f45d1cf-5d972dfeb8bmr22483059a12.4.1736839816633; 
 Mon, 13 Jan 2025 23:30:16 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:15 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:44 +0100
Message-Id: <20250114072947.284965-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839817; x=1737444617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKnMHn7y3p/LgqaRI7F0ob5STrhUgx4LH/aeXyLQJ5I=;
 b=PBkxzHtKGR9KCR/iu4G/zHaltfbTNJLiu+uEqZ0+CO82ES2htxRsUzfuSiFYB2/gWg
 SVvvENIiHZlYTKhte6OGf5vltDo1BY+XT2ZpEhNXGcmhWbYGOB27IFsWnpxd7lEesR1M
 rWjKUBZn3OKjzf97WRrQ90lrJRWEoprgtpMNnZ/fKFTF1T0/KzpY+77Srz4Vm4iQ/mQJ
 +MUw/X0qkkC/2zpeMhBbksNrBAARnY740rJpFhPBU6ulqmZtujwzUf5kA/CKefnwurv6
 Exi3bgospQDKQFvigyZGETfoIAAsLSCFQbYpb9MzpZQaO0BG0Sw1Kl3kttb8A1+OgA5u
 Pwfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PBkxzHtK
Subject: [Buildroot] [PATCH v5 2/9] package/libnetconf2: bump version to
 3.5.5
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

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v5:
    - meanwhile project version updated to 3.5.5
v4:
    - revert changes that are related to libcrypt dependency check as
      mentioned by Thomas Petazzoni
v3:
    - no changes

v2: (after review comments from Thomas Petazzoni)
    - reworded the commit message
    - added selection of openssol package in Config.in
    - fixed inconsistency in dependency to openssl

 package/libnetconf2/Config.in        |  1 +
 package/libnetconf2/libnetconf2.hash |  2 +-
 package/libnetconf2/libnetconf2.mk   | 22 +++++++---------------
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
index 1763243120..8f8677db62 100644
--- a/package/libnetconf2/Config.in
+++ b/package/libnetconf2/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNETCONF2
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_OPENSSL
 	help
 	  libnetconf2 is a NETCONF library in C intended for building
 	  NETCONF clients and servers.
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 675c76a500..a0a769a81f 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
+sha256  1d62654cd6cfb3188f71c561fa4138fef38ea1c60d225599ed7093845ab9286f  libnetconf2-3.5.5.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 88163926c0..26b9d31dd0 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,30 +4,23 @@
 #
 ################################################################################

-LIBNETCONF2_VERSION = 2.1.28
+LIBNETCONF2_VERSION = 3.5.5
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
-LIBNETCONF2_DEPENDENCIES = libyang
+LIBNETCONF2_DEPENDENCIES = libyang openssl
 HOST_LIBNETCONF2_DEPENDENCIES = host-libyang

 LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF

-ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=ON
-LIBNETCONF2_DEPENDENCIES += libssh
+ifeq ($(BR2_PACKAGE_LIBSSH_SERVER)$(BR2_PACKAGE_LIBCURL),yy)
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=ON
+LIBNETCONF2_DEPENDENCIES += libssh libcurl
 else
-LIBNETCONF2_CONF_OPTS += -DENABLE_SSH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBOPENSSL), y)
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=ON
-LIBNETCONF2_DEPENDENCIES += openssl
-else
-LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
+LIBNETCONF2_CONF_OPTS += -DENABLE_SSH_TLS=OFF
 endif

 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
@@ -37,8 +30,7 @@ endif
 HOST_LIBNETCONF2_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
-	-DENABLE_SSH=OFF \
-	-DENABLE_TLS=OFF
+	-DENABLE_TLS_SSH=OFF

 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
