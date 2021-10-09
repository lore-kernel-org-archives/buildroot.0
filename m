Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4ED4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:30:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E4660F6C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76E4660F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4861983268;
	Sat,  9 Oct 2021 09:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2Gl8E4JbOIc; Sat,  9 Oct 2021 09:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB24F83211;
	Sat,  9 Oct 2021 09:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 236B31BF27A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 208D360B6F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmGYNQMtxmKg for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 09:29:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1196C60683
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 09:29:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t9so48204242lfd.1
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RMxZf7bokqvB86Dpu2T07f8d/aHagQzuErXkC7t/sU=;
 b=FHVmYQlQPTaUBMIcjF0gBwHOnk78uNKJXcmBNIaQVSmSc0EXxfWfMi3lcneYEfJSO5
 /u3IfOZvHIX7Pq/+UdtfHaOp0Baa501VoXOP1JwmIAKj3LkBuojzBM8mN3sD5984IYfW
 /y9mh+yylCBpkZrkioxXmvTbwEunuaeFrPwvZLajXE9/5VI+MHIidBlNlAtXH2OR/RMc
 jgGMVTFw9EwWeL/oKioyndKHEQTmfr+EFcDLGkVNX9Kd2fms01kRcf7Jvi+y4c3/KOiv
 jUgmrABxT0F+K+REU3x6pf32qPMvulEnjpXD2z3yPNNnQqaGLGKr8uJyLiJiC1QI4mCo
 7Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3RMxZf7bokqvB86Dpu2T07f8d/aHagQzuErXkC7t/sU=;
 b=YCrl6VzwSaGWs+354+RJmDVso8bjvNJUKoxQZxnxqlsikFezOZUxsvBL3+8OjnE5bf
 6czSGCnc48t9yE6S9jLFUjJEjNZGArIPMekSvmgB8VSZgJd8CCuHEvTIVQatNbWE9B+s
 FvUskQm42nKfngX7Yz+6Yu5ClkAMB+yO6Lwq0tjP0Eculto3ljdO5uaGSPgVblFrsn5c
 izHlhJ42mVVfjsycnPZusVYT+cp1/pUFVckqeyP6docHzoKrRw5jqJwEy/gavSWgwpL4
 7mC8CFSHLaPeN+L5v96zLhiwPA7dSW9aA1y16eojn+Rzcd4KW9lINnxKeDWmGXdwA+3Q
 AlXA==
X-Gm-Message-State: AOAM532S3badOsYTdiqmGAdWCg8KOPZfISKZhUWw4aWALurILVMRUqvV
 MbXVSjDVatkCI2eMnY7NW4tIhrvcqkI=
X-Google-Smtp-Source: ABdhPJw0gguRZ+L++l8UB/LaPj/Ar3AGXdLb+6B8ISlfrI51koR7YpOO554dw3XolCMhSCp6RKq1Nw==
X-Received: by 2002:a05:651c:289:: with SMTP id
 b9mr9010833ljo.465.1633771790870; 
 Sat, 09 Oct 2021 02:29:50 -0700 (PDT)
Received: from localhost.localdomain ([94.254.51.197])
 by smtp.gmail.com with ESMTPSA id g5sm170026ljm.74.2021.10.09.02.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 02:29:50 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 11:28:57 +0200
Message-Id: <20211009092858.89370-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009092858.89370-1-troglobit@gmail.com>
References: <20211009092858.89370-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libite: bump version to v2.4.1
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream now supplies sha256 hashes, so drop upstream md5 and locally
computed sha256 in favor of that.

The hash for LICENSE has changed due to the copyright years and author
last name being updated.

The hash for chomp.c and pidfile.c has been changed due to copyright
years and author last name being updated, as well as doxygen comments
being added to the files.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 11 +++++------
 package/libite/libite.mk   |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 1a553d2bcb..6f461f9b76 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,8 +1,7 @@
-# From https://github.com/troglobit/libite/releases/download/v2.2.0/libite-2.2.0.tar.xz.md5
-md5  8533ab27d0d4a7c745f11925907795a9  libite-2.2.0.tar.xz
+# Upstream .sha256 from GitHub
+sha256  8fad6b8a1e7e0d6b546863104dfe25dfe0bb2d2a9b98ec8e155d23392ef58514  libite-2.4.1.tar.xz
 
 # Locally calculated
-sha256  3fdeb48ea3d9220f91111ed7a68e1e68edfc70346d0108a49bab73a47a7dd761  libite-2.2.0.tar.xz
-sha256  a8a7506c64ce46a58c17838b0f678f8c2567d71869402f97d19460ddec4882f5  LICENSE
-sha256  89053891d46d04a21d4a492f68038703e179986baffa458201810f4222b57427  src/chomp.c
-sha256  a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
+sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
+sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
+sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 69a90d7187..7ccf642e50 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.2.0
+LIBITE_VERSION = 2.4.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
