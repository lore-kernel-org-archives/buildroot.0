Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC25D6B6C0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75B2160906;
	Wed, 30 Oct 2024 19:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCMimw-JIhoG; Wed, 30 Oct 2024 19:00:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A665660A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A665660A88;
	Wed, 30 Oct 2024 19:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1AEB5E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1B76811F2
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeWJM--txTz9 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9058811F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9058811F0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9058811F0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:00:33 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a3a5cd2a3bso547475ab.3
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 12:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730314833; x=1730919633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apm5Qr4IjcAm+ie8k89aMgFbPHvRXpqtoR9h6ipCDhI=;
 b=Yz5hCasVBHUbC9F9gekBjGtskRW8fYTCIb3ATMeDgrBIZzfYnulL43ppzX2n+dZWQw
 u7KZzL+G4hZXMQPHTH+qYNc0Ha6N5uzaquoUzLgoxdnOWtyOTczA1860yvN6J9eZyYif
 cW7EYIVMyrWIrA27ZaG3xiy62/dZ7d2ipl2DYSW6cltAJMmBUZkiEOFh3i/txZ8MqfSC
 TsqyLfPGPaYGVly5zbzKJRIsy86832l1Rn1C8qGC+R94VHW3aJh/opOlHyjAomY5WrZB
 ET1EkY2HD7r3/0uKT8eA8UsBD+drLpEMCiHV+jDYD8mFjy6ZbSo+0Mvpdeky0XlZf/XC
 umdg==
X-Gm-Message-State: AOJu0Ywp5SDb/jy60pIf8aYQvwJKyx1ctilWms8YO150Hn5jZJxkjD3x
 ZZhWMDiI8V6xCiP5XSnoJz/jnU+Hw80SY6ozzNe25HuXVGcdGWxkQ/e16A==
X-Google-Smtp-Source: AGHT+IEB3ND5oseZVrrYIja4DbEFFv3mfShBrFg7gb58kUMGY0/l+9lryb8EXml0ObOQGWcLeXy4dQ==
X-Received: by 2002:a05:6e02:1606:b0:39b:3894:9298 with SMTP id
 e9e14a558f8ab-3a4ed1bd7demr185987915ab.0.1730314832322; 
 Wed, 30 Oct 2024 12:00:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df3c48sm29881875ab.34.2024.10.30.12.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 12:00:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 13:00:20 -0600
Message-Id: <20241030190020.1444105-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030190020.1444105-1-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730314833; x=1730919633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apm5Qr4IjcAm+ie8k89aMgFbPHvRXpqtoR9h6ipCDhI=;
 b=cljJ5Nv7xt166WaNQFFFuFXGuRFqluw5sWIrs96u/88zBRGa4HcH2SBK93h6JQnbfM
 jw8ByT4jT7QWQQYTzAuPVeKPShZhskzBnflYjP68kfJtmyeU2dCJVl8HrWc4Zq2DQCRo
 ZjrrA5MJ/zV9SS/Bm0bGtp7BsULw2jucqtTZHQFnxaOSeV+SlWSXBYxli6G/Yt+Y/u1+
 bO2rge0haMQKAS0ZnQnZQ6G4wGZHbTXTpgeGVY/RANvQ12UqWepIAfDdeYVdvshqt+ZF
 yhskcBwTIAwYeXfthz1pumXsvS/UUfSLk26N1rerqgpQZnL9msv35p6IOSO7CaWfxZ72
 bRyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cljJ5Nv7
Subject: [Buildroot] [PATCH v4 6/6] package/collectd: fix protoc version
 check
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

We need to add a patch fixing the protoc version check in collectd's
configure script.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...onfigure.ac-fix-protoc-version-check.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/collectd/0004-configure.ac-fix-protoc-version-check.patch

diff --git a/package/collectd/0004-configure.ac-fix-protoc-version-check.patch b/package/collectd/0004-configure.ac-fix-protoc-version-check.patch
new file mode 100644
index 0000000000..edf5008f03
--- /dev/null
+++ b/package/collectd/0004-configure.ac-fix-protoc-version-check.patch
@@ -0,0 +1,48 @@
+From 77f33d05355b115d3384d94c1c4e36c56ea28b09 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 30 Oct 2024 12:45:51 -0600
+Subject: [PATCH] configure.ac: fix protoc version check
+
+The current version check for 3.0.0+ fails to handle cases where
+protoc is above version 3.0.0 but does not start with a 3, for
+example protoc may have a version of 28.1.
+
+To fix this use AX_COMPARE_VERSION to properly compare the version.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/collectd/collectd/pull/4332
+---
+ configure.ac | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86d2378b..1f7a9cdf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4897,13 +4897,16 @@ AC_PATH_PROG([PROTOC], [protoc])
+ have_protoc3="no"
+ if test "x$PROTOC" != "x"; then
+   AC_MSG_CHECKING([for protoc 3.0.0+])
+-  if $PROTOC --version | $EGREP libprotoc.3 >/dev/null; then
+-    protoc3="yes (`$PROTOC --version`)"
+-    have_protoc3="yes"
+-  else
+-    protoc3="no (`$PROTOC --version`)"
+-  fi
+-  AC_MSG_RESULT([$protoc3])
++  AC_SUBST([PROTOC_VERSION], [`$PROTOC --version | cut -d ' ' -f 2`])
++  AX_COMPARE_VERSION([$PROTOC_VERSION],[ge],[3],
++    [
++      have_protoc3="yes"
++      AC_MSG_RESULT([yes ($PROTOC_VERSION)])
++    ],
++    [
++      AC_MSG_RESULT([no ($PROTOC_VERSION)])
++    ]
++  )
+ fi
+ AM_CONDITIONAL([HAVE_PROTOC3], [test "x$have_protoc3" = "xyes"])
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
