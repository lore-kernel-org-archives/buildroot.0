Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2E8D6B6C0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BD260A9B;
	Wed, 30 Oct 2024 19:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyIU1PfTIfP6; Wed, 30 Oct 2024 19:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD6F60A90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD6F60A90;
	Wed, 30 Oct 2024 19:00:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 075B85E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8DD860A41
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTKcxrjYyfA1 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09C6060900
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C6060900
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C6060900
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:32 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so693425ab.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 12:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730314831; x=1730919631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmX1HtlmKtMEOKLdvxNcnU2uOKTv17iKtsrv5H7w2Dw=;
 b=u13OS/i1RBhXl94x/2QogvGCbFGe3pqhOvee+FxUsIKjr/YIrTZKG95+4vZMwkx5wD
 65GkH24HkYKCB0SPPDue8i/y7pouZHq0ppAXCDlu1c5xjff5QmwjPQuvGuvf5QyzOGbn
 OKRLOfHyCoHDyrrFjP5vLKzjKO06XPbGDq4ArOwyHQ9bSX5BmuV+evGJIZ/wLljv67gv
 Om/CNvYpf6VPq534i9TE3iGAm3KWy1bo/8hNhssk/83VDhuQyMrVzT7DYr60iS4jmIsa
 pG+m6oOA8zVuGRb5joz7Iz4TD+sYajKDDXNrdpkiwuVTfsJZAEOAjT60v8eTbVKWdVfQ
 Mbpg==
X-Gm-Message-State: AOJu0YzTlUwz+bm1GE8jkRTG9iD/3lCoz40PzWU7hwboJTGZq1+0x+/P
 AJcc2oIYq1BVZWrdTia0xqxJceWccLm6AwARSY1tUA1NhwROFMnV4zgg+A==
X-Google-Smtp-Source: AGHT+IFCOLBGvk3XeAcgCzPJ1JWtqr70rFVNfEdeRHnJH9Zh7IcHyxeoyh6qAKDahR8LVcYKl1MjeQ==
X-Received: by 2002:a92:ca08:0:b0:3a3:9337:4cf4 with SMTP id
 e9e14a558f8ab-3a4ed2651c5mr137818365ab.4.1730314831134; 
 Wed, 30 Oct 2024 12:00:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df3c48sm29881875ab.34.2024.10.30.12.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 12:00:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 13:00:19 -0600
Message-Id: <20241030190020.1444105-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030190020.1444105-1-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730314831; x=1730919631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmX1HtlmKtMEOKLdvxNcnU2uOKTv17iKtsrv5H7w2Dw=;
 b=E9xS3RMPvtq6CbAzXqZkmoEwZlicSLPrKWy7OmUVduKMtZui1t0pogDqG6n204t+ff
 lLan6WrF1Q0KhbueM6geeA7/kQrT76yY7t1M0utayVyBRD0ST/wz8pRXUg6/L+TK4o5f
 /bZBelbj0IvoXFDG8/ZiAmSyR5o3uzVFWV9WcryeALwvvXgldRJGja04X4iuLskG/8md
 hEEeECYtgPvQbJ45KTApJzKYunnRwBiBEDlNZW4eCgLqWCma+6bE3ickoh4Yf+/SijD4
 kLCDtRO6yR0imjgVQBKbbABhV78X5k4q6pPZGwwT1zfIeq5SOWdIIVhlia1xjWXL7Ysh
 7aYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E9xS3RMP
Subject: [Buildroot] [PATCH v4 5/6] package/mosh: fix compatibility with
 newer protobuf versions
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to backport a patch to fix compatibility with newer protobuf
versions.

Remove CFLAGS setting -std=c++11 and enable autoreconf so that
patch is applied properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mosh/0001-Bump-C-version-to-C-17.patch    | 49 +++++++++++++++++++
 package/mosh/mosh.mk                          |  4 +-
 2 files changed, 50 insertions(+), 3 deletions(-)
 create mode 100644 package/mosh/0001-Bump-C-version-to-C-17.patch

diff --git a/package/mosh/0001-Bump-C-version-to-C-17.patch b/package/mosh/0001-Bump-C-version-to-C-17.patch
new file mode 100644
index 0000000000..eea3889828
--- /dev/null
+++ b/package/mosh/0001-Bump-C-version-to-C-17.patch
@@ -0,0 +1,49 @@
+From eee1a8cf413051c2a9104e8158e699028ff56b26 Mon Sep 17 00:00:00 2001
+From: Alex Chernyakhovsky <alex@achernya.com>
+Date: Sun, 30 Jul 2023 16:19:46 -0400
+Subject: [PATCH] Bump C++ version to C++17
+
+Protobuf versions since 3.6.0 have long had a C++11 dependency; even
+more recent versions have picked up an Abseil dependency bumping that
+to C++14. Since it is now 2023, defaulting to C++17 is reasonable, so
+remove the conditional C++ standards version check that mosh
+previously had and replace it with an unconditional C++17 check.
+
+This means that all future commits can use C++17 features. According
+to https://en.cppreference.com/w/cpp/compiler_support/17 this means
+that minimum effective compiler versions for mosh become:
+
+gcc 7 (May 2017)
+clang 5 (September 2017)
+
+This, in turn, implies that future versions of mosh will no longer be
+available for RHEL/CentOS 7 (June 2014).
+
+Closes: #1267
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/mobile-shell/mosh/commit/eee1a8cf413051c2a9104e8158e699028ff56b26
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee70c7b..7f7dc3b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,9 +22,9 @@ AS_IF([test x"$PROTOC" = x],
+ # automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+-# Protobuf 3.6+ requires C++11.
+-AS_IF([pkg-config --atleast-version 3.6.0 protobuf],
+-  [AX_CXX_COMPILE_STDCXX([11])])
++# Protobuf transitively requires at least C++14, get ahead of the
++# curve and require at least C++17.
++AX_CXX_COMPILE_STDCXX([17])
+ 
+ WARNING_CXXFLAGS=""
+ PICKY_CXXFLAGS=""
+-- 
+2.34.1
+
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index c938f70719..3c41a17401 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -9,9 +9,7 @@ MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
-
-# protobuf needs c++11 (since 3.6.0)
-MOSH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+MOSH_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSH_CONF_OPTS += --with-crypto-library=openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
