Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9149EE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 23:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7421240501;
	Wed, 31 Dec 2025 23:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dch2Iojsl0u; Wed, 31 Dec 2025 23:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 777E940516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767222689;
	bh=/u3V6IvRkttl+yYr2HhGIPqYxpYd33w8DCpmMJ8GSdw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WQHHpRoEcZbk63ZOVEN3q6ziqQnQcw4kXforhyh7STM19HYk8Glr0BMfGbu4RO2Ik
	 LFYuXnBkiEInwO6UCHpsZdvW09ZjfysBqUrmDSQ2/bfI7QAo6BKdDT5Ua+vNc0fU0N
	 nJYT6PDsmO5UcFA0dCn06ZVph/LEMVEWLzCaz+UHbIOssFJJIsjDwmq6EtzVm5YwuY
	 KID5bdSkelCLqoKmNeP4CFcVVzZpSs4U/zqQMhWUnmCDrg7r87BaOdVoPHrAtKma3N
	 Wfzq0/6mPAK+ocdRCefr3LDv3T9zO3pEPSCY9+IrdxKd9IIbodpBxYzLeIy4xqyRTg
	 IeT41DRIMlCwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 777E940516;
	Wed, 31 Dec 2025 23:11:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C74B7218
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B86B3608B0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0vcBCbcc2bA for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 23:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A590D60893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A590D60893
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A590D60893
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:11:25 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-657523b5db0so2467950eaf.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 15:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767222685; x=1767827485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nghSWit9UZ9SRQX6VYZF7o+5g16YCafJxZ9alZwSe9M=;
 b=cPICC6qZ1PHZi+uabRCHx5x4pUFTbdRXimfCXMtGKrJyoapms2IK82yXFGcsLrYnir
 WnMzKSQBKJxWJOgLuikwBwYOfpNe5LTgW41qAIx1C9Ne3mxq9k2nYMClbGItpKtrNQl/
 /uf3T0Dokoozx358myTaqr8bYsxfNMDHIOOIwoyS6y+iJO1KOt5JtsgMRneKsHBT1tUo
 nD6diFZyfjQLghxoSLR1MGLlek+CNlgWiKwkqJ2k7PFVYea8G83RXsneUTYsKKkDfuZ7
 1CbkJA7Guq0K9qqrJCQ2jcMiGKVQzWI+a4Nrtx0IvC60mGl+597UTWYn58qiHuf1EAvd
 3YPQ==
X-Gm-Message-State: AOJu0YyxP7yj4GyA+2EzsroPinYT+urlM13xKbX7IbTaaE3V9XLOOd+V
 /DvkDy2izc/+xUtTlkk41+Hj98iMzC8m7XqF+bg0yjUgM8VD/kkf50ppIfC66zY+C3Q=
X-Gm-Gg: AY/fxX7fgxnLj5n6IWFHIWTqJNtRGYlfSSq4KjwKPa+5fFGavEufXBt/Yy1K/WDVUws
 shllpjdDpyOCm6s7JyeGKGfqXCbdrZ8rzw/xFtRgxmMvs62n7hgJmBHxitDlLRkbQbmgiEFHTeP
 gYrzCXKf5pVyM0LSJBl4jo77YbCg4H0xT4oMebImvIQeh3PLzqNcU0pNKih27QL4vlffowoevYJ
 5/pzyU+a+CkrG+QYu4wc63m8D/PxZUiU4lq+3MovQa/zfoYSmHGJ3vY3m2qe69R/HKFF6SkFuwm
 Pl2WOwTbO4bVy3hTDtbdpBcbHAHHUtdyZsWNmm3FXq+lYJridAYczClTexQfzmeRgIzRm1j58qk
 WfQxwU5N3XdfdNGrctJnUL+pzQPVEfzoyu4VsThAODkxDcfYRB5lyAyeyrCKbiXf6nadyUHwhLd
 /gXw23xbkrDKhn3beRUMDqREw56eqnVwFhqyy8IjEdwhNFeI9L4SUJCfZVRB8W79PYj2bnRo2JE
 A2JfEWxABYj4MZLri/lCdn4/FieXZmgC34RSjOoI78T5G6G4Eu9hFU=
X-Google-Smtp-Source: AGHT+IEXY69bGBq3a/y6umYNtzbmrNsgm/BevfYQyBXb53wpSbpW19ZbV6Z20naOiwV7La45PQy3Yw==
X-Received: by 2002:a05:6820:f029:b0:659:9a49:8dfa with SMTP id
 006d021491bc7-65d0eb709b2mr18037963eaf.60.1767222684629; 
 Wed, 31 Dec 2025 15:11:24 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f4cd66csm21515068eaf.7.2025.12.31.15.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 15:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 16:11:22 -0700
Message-ID: <20251231231122.732957-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767222685; x=1767827485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nghSWit9UZ9SRQX6VYZF7o+5g16YCafJxZ9alZwSe9M=;
 b=iZpN/Z4nP1txuoU8U2YMB+mvxKbyIwduBOcHG3TmnIwVNWVuonH60yozA454WyT6xo
 koHR6wfFHnFkYBOYByxaMiKWRmX8b/WEWZECcxc+uEo9+WOT/g8ZRB8vpAKh3NwIWdNg
 3YijZ/rPJ/z20EcYW4ucy4kbuxHSilQz9QyADxFOyRwUZLqgXt2G9WErI+JO6rNVrz0z
 bREHj2EbJxx6csAElCsiMXMmRC78SXpZ/E/IsMmxI9e6YCM+ZQeXRJMgsWA0FZN0JVuh
 ZbRqPJY5FcVNG9IEIeOxQPU6DiC9nY4WoXjoga+28R9akJ0YRIiShYRcFbGsIkta17kh
 a9yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iZpN/Z4n
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 33.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to set -Dprotobuf_BUILD_LIBUPB=ON for host-protobuf now
as some libupb headers now appear to be required.

Also set the new -Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON option
to ensure cmake doesn't try to download dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 6 ++++--
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 98159ad897..db91cf296b 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e  protobuf-29.3.tar.gz
+sha256  6b6599b54c88d75904b7471f5ca34a725fa0af92e134dd1a32d5b395aa4b4ca8  protobuf-33.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4540443702..e2158216c4 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 29.3
+PROTOBUF_VERSION = 33.2
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
@@ -26,6 +26,7 @@ PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_BUILD_TESTS=OFF \
 	-Dprotobuf_DISABLE_RTTI=OFF \
 	-Dprotobuf_INSTALL=ON \
+	-Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
 	-DWITH_PROTOC=$(HOST_DIR)/bin/protoc
 
 HOST_PROTOBUF_DEPENDENCIES = host-libabseil-cpp
@@ -34,12 +35,13 @@ HOST_PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_ALLOW_CCACHE=ON \
 	-Dprotobuf_BUILD_CONFORMANCE=OFF \
 	-Dprotobuf_BUILD_LIBPROTOC=ON \
-	-Dprotobuf_BUILD_LIBUPB=OFF \
+	-Dprotobuf_BUILD_LIBUPB=ON \
 	-Dprotobuf_BUILD_PROTOBUF_BINARIES=ON \
 	-Dprotobuf_BUILD_PROTOC_BINARIES=ON \
 	-Dprotobuf_BUILD_TESTS=OFF \
 	-Dprotobuf_DISABLE_RTTI=OFF \
 	-Dprotobuf_INSTALL=ON \
+	-Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
 	-Dprotobuf_WITH_ZLIB=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1e1833980c..fdfbc4b4f1 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  26ee22a630b0dbfce4de03adc5600fbc  protobuf-5.29.3.tar.gz
-sha256  5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620  protobuf-5.29.3.tar.gz
+md5  59060f8bb01846579e5c8d95917ad925  protobuf-6.33.2.tar.gz
+sha256  56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4  protobuf-6.33.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 898a133d37..8db9a2f621 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f7/d1/e0a911544ca9993e0f17ce6d3cc0932752356c1b0a834397f28e63479344
+PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/34/44/e49ecff446afeec9d1a66d6bbf9adc21e3c7cea7803a920ca3773379d4f6
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
