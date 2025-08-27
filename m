Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00641CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 07:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80BD81234;
	Wed, 27 Aug 2025 07:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYr3PpYEPq2a; Wed, 27 Aug 2025 07:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68B981230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68B981230;
	Wed, 27 Aug 2025 07:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EFFBB8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185D081230
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIeV4sveiWlI for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 07:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.53;
 helo=mail-wr1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2ECA8122F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2ECA8122F
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2ECA8122F
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:17:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3c79f0a604aso2056667f8f.2
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 00:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756279076; x=1756883876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LESgV4ns7k0JLnCflns0nQNDIjDzanppknHVWB3otao=;
 b=PLgJi//eHz2YZZZKwdxL7Xw0q4QgaGBEKIsDNAOipBzw14KZHtI6aHaJ6174YbwiN/
 8FKHS0O5XEKxANpfUF7DwwR83TeYrO0LuIQ0ASk5QAPrAm7pu/8mvFpon6q6H5lj1bik
 prijatsQWNsO7HqbWxe2hGK9bhehEBAoJ2cMrv4zU7Mu3n3P/qRDII/CNuqVSxfsZ1co
 +MAFkHSdk6KxR68ESR8NizxmBMTH4B7gtjH0YbYj2zQ73b8x/0+PuHy53JUkzjZHbwIj
 g3O2FV8x2ztkkk8fV3MUy+erHfxQfP/uMBe99MK9MuuY6uw/EsQFhe1xG3hwVdo44zc7
 b2NA==
X-Gm-Message-State: AOJu0YxDBv1q1nOPtfFUsZH1OSDX9gWEQeeaKQXf/n6PgkxCxsq8WNig
 YLIayJq1VswqaCYLddP++RWtA+OxZ2YtkALEQWhJFpcVJ/1+8J80ulOOtJw7ag==
X-Gm-Gg: ASbGncvjQ8oUXRbHQBPFV85G2P56EJOHuTKC+lQxJrxAGvE6lYw0Ykfm8fCeVlZIvfU
 nOpjHQXIHJ/XbfJbPyT6aBZ1sSMX+nyb+fU/d8MkwEx+SvcGAO4/Y2xmhbx0wIAxIV3l0FZTG7k
 CDjePhaJcfqUndY3/FIqruxpDlFnGGKqLInjGHiwr4+fXEeqlSUSzc/OHwOFc4PKmIwEH5iWVTK
 EfWS/JzjuWhaMuv5S9OUL04Sk3QehJ0QzD2JzxQXn1D9XTogPUq2u/0mt3nBCiUTzi9j6dM6RBM
 3i+xmllL03Utzr/Uw8LFD8vMzJfrIl96w/Bp6ElgacxgYpbnH3+1lzBsmMbu2moKk+GvcsxEHr5
 ZHnmGgD7yZuV3YfrO2iNXFvjQxYftSfhvLgJ3xBmBauO+dZKl5sABR2XYpUnXuVnlGJNCO5it
X-Google-Smtp-Source: AGHT+IEsgKCJzOt2i9dnjkhPqpxAua/+PvWiSZF7riu/l4ztyd1PvDdsrOoN95oAxBtQXRI+Rp9IPQ==
X-Received: by 2002:a05:6000:400e:b0:3b9:48f:1960 with SMTP id
 ffacd0b85a97d-3c5dcdfc37amr13793376f8f.49.1756279076396; 
 Wed, 27 Aug 2025 00:17:56 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cc7b699d5dsm2220435f8f.48.2025.08.27.00.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 00:17:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 27 Aug 2025 09:17:52 +0200
Message-ID: <20250827071752.1760654-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.81
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

News:
- https://www.lighttpd.net/2025/8/13/1.4.80/
- https://www.lighttpd.net/2025/8/17/1.4.81/

See Changes from 1.4.79:

[build] remove references to libev; no longer used

So drop here as well.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 9 +--------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 4adbd08648..a23af84c28 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
-sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
-sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
+sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
+sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5337042340..71c860a31a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -76,13 +76,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
-LIGHTTPD_DEPENDENCIES += libev
-LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
-else
-LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
