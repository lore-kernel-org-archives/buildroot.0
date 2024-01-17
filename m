Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D2C47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 16:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E3083D9A;
	Wed, 17 Jan 2024 16:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E3083D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CV7IOUB_VSCp; Wed, 17 Jan 2024 16:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F410083D42;
	Wed, 17 Jan 2024 16:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F410083D42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD2B1BF289
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 16:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1137383D42
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 16:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1137383D42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6Zac4SP-cZP for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 16:17:42 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DCFB83B8F
 for <buildroot@busybox.net>; Wed, 17 Jan 2024 16:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCFB83B8F
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-559de6145c3so753429a12.1
 for <buildroot@busybox.net>; Wed, 17 Jan 2024 08:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705508260; x=1706113060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYX2ZuO7kj4x3ReaQjCH8bwWHTiVUgNkboaO67zYK7o=;
 b=eyc3yUeqXjWstaQXuHF3vVs8frVywlj/EK73TdWZFAY6KJQIpza4frGyp11px3eYdy
 Rdvv1jk7XDIIUWddT6rvAOdRWVf86zb270RPo4U1hi2L+WIUpA6NTsc/Egirsh0PF0Hl
 95KGw6+2/uXxxpqdrW78sqczHXHR4fYMw0UFK30gpR67Uk5A1b6uZaOW1OLPBgiXVAWa
 f5nnPcptAZHKtnUodrr7aNXs6dCZzazgcjOFDjIX3bka6eDWRgLWqLI9HDcVR0PRnIes
 Ktpee2N1ZZVrwZAoSIpmnJCN+YxkKHmFN5V73EBrSgfSEolhIBaL0ss6tfOKC+lIEw9A
 F4Tw==
X-Gm-Message-State: AOJu0YylFJYN0Xixpq/leWQkzQ5I8nCvY566srCPhWkauuAt2hZiFakF
 9TQ/G92suo+9VK+r9LNrQNcJZlZn/8o=
X-Google-Smtp-Source: AGHT+IEW3K40guFWlO1fdLEVSDqwA1+1N8vJPdWBl7VjdoOVObWWd7GPfchhtDt5hZu0XKJnD+4AXA==
X-Received: by 2002:a50:8d56:0:b0:559:da56:322f with SMTP id
 t22-20020a508d56000000b00559da56322fmr653060edt.72.1705508260209; 
 Wed, 17 Jan 2024 08:17:40 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 ev24-20020a056402541800b005581573e251sm8324911edb.2.2024.01.17.08.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 08:17:39 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 17 Jan 2024 17:17:26 +0100
Message-Id: <20240117161726.37599-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705508260; x=1706113060; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eYX2ZuO7kj4x3ReaQjCH8bwWHTiVUgNkboaO67zYK7o=;
 b=hOZ42A7djy4BtLqrNt7uEMtEPhhkU3HiuwUzwWXhkb3hxBwn/FOi2ck8Q0SZrb0a1m
 MLs/xC55vevLmkrzkGHYOIRNeNvQClWO14r25nQ49NIsfddyaHkOF4jkpXBLNSLNLNRc
 YdrDtG02w5mRGQk66mtPpfXdVw7VbQdk7aSI/KQ7ZU1Vblr28ZNxvvJXXVxcFMsMrm+v
 USMEmKU3979ftWOOibwxyKoXUc0itjS27NTgqbbcQ2algEdRlxH+VV0Y5IWeScK5q9j2
 G0uThHoh+ao27E7Gis1/liS1WgJheC9uCDYoZ4AjQL9mhg7PadDHbIYFUotjUW6Vbpqy
 a9aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hOZ42A7d
Subject: [Buildroot] [PATCH] package/gnutls: security bump to 3.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see CVE-2024-0553: Fix more timing side-channel inside RSA-PSK key exchange
see CVE-2024-0567: Fix assertion failure when verifying a certificate chain with a cycle of cross signatures

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 6ad363f01..47fb34ea7 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.2.tar.xz.sig
-sha256  e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77  gnutls-3.8.2.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.3.tar.xz.sig
+sha256  f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e  gnutls-3.8.3.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3e9987cdc..8a4f3345a 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
