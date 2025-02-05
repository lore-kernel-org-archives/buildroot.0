Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE7C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6193141457;
	Wed,  5 Feb 2025 14:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi52BKlnNuLK; Wed,  5 Feb 2025 14:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF5A4134B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF5A4134B;
	Wed,  5 Feb 2025 14:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D98CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB4D24134B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OR8yBKob-ddR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 810394131A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 810394131A
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 810394131A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:08:01 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3d01dc5a7f6so11533275ab.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738764480; x=1739369280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kSCzvFQpXcTgXKAylM7gwbQXsDIBzhx9R95oGGCQHps=;
 b=JvE8bSV4Ob47PTomNCwc4g5x5wCWifDpXn1C8VK0BnY3L93xRMKIOlazh2bn3KeTov
 ui9SLFYLrqa0RN9RB6MymekgrBdacWyL5TphwvNEmqhACqbVfVDMESTz2J9xEzS/mAfS
 Qhhw2u7latdmduJOwd5CUUzo/IWgw539HNirraXdqvPzhZq1x6OF1uwYNcUebgmEzRCu
 Oy33hEOu97hKzho2SrjJ9P/K9ahCRNcl/vJn2F2QA6TI7BLANQ27D5zWDkKf9DNThvqs
 YondTKSILN3zF9rB/IZjS4+xwAYAg/bDjGDItgI1XNZY0SnYbhLyy+piPhSP8pDdSadT
 uhdQ==
X-Gm-Message-State: AOJu0YxNonB/KEAVmw6C4zNL/OEdWitN6Xgpogr/AObkYqyDOvEaSuBK
 Yc9Ksqk3e6ZdoXdZVHAsdruV3oBZZPyHYPHIpazebyeNEdlobNBwLp5lzKrN
X-Gm-Gg: ASbGncta416f3OK7IDOZsgeU/ZPC8rXC6Tb8Bx5s5BxkUQfQZEu85/tvWIgOCkDRMga
 86qPzgAmVScIbc6dUQfrm0by50/p8/gJsRFCNfqji4n3elMrFi7H7JBNX7zIEfmhkkqAwhBRbMT
 UA6k4MDFcjcQXf85EVwAg6OMgbR7Qq/PME+x0MQUBB6St42W3zlrQS3L+EdCBM6XakZeSUrVg6+
 Dhv4r9vLoOwTwbtLRWvpsstbTUlTz3pOzG9PvBXrDyJSYMLOr0F1vsJVrkcIHKY0AkU4xAXyNG4
 fu8W0ciHhkQ5vMwXBDk1fulhk+/tsv/VRIIG00naysNg5cbwsLnUN8RWdj4gB0dpFA==
X-Google-Smtp-Source: AGHT+IGA1OnXAmy38YiYCrHHjrGK79gsR9WIo6Txtyeboc7g8JyDK2WG6+MqTbLj+3N0YezaaJ55AA==
X-Received: by 2002:a05:6e02:2163:b0:3d0:4700:db0f with SMTP id
 e9e14a558f8ab-3d04f45ca01mr30677545ab.12.1738764480133; 
 Wed, 05 Feb 2025 06:08:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec746c0f5fsm3196856173.113.2025.02.05.06.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:07:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  5 Feb 2025 07:07:40 -0700
Message-Id: <20250205140740.3085885-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738764480; x=1739369280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kSCzvFQpXcTgXKAylM7gwbQXsDIBzhx9R95oGGCQHps=;
 b=SrZd2wSsIK6VgB57Mfl39eyCNqX/hDn9/19kZqTDnPIqB1uyVO7XyOylP89FOWyPOY
 OG0EbB9QkH82t5KzqBeknCHr+xULC/y1eskTlMDKFaKMrhtaovMR8YaYwnVWP46XA1OQ
 51eK9nZYszjbWSUznMcWV4sdtV4HMnDsT/SEO0CF+p0Oxzl7X//Cx9DBriGiLLjMLt/T
 smXClWqOgTSNu4VZUTiPATeetLmYakVYgyPKz2ugyhGl5f4oc6B44OELptl9vh9IEV1h
 tNuSfkjHETSb6b/EOz1yRQVmdMFJ4/KCvpNv8rZcgUjbW/azZuBkNhb2oIhFzVdLeWoT
 WZJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SrZd2wSs
Subject: [Buildroot] [PATCH 1/1] package/ola: fix protoc version checking
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

Backport patches fixing protoc version checking.

Fixes:
checking protoc version... expr: syntax error: unexpected argument '2'
configure: error: protoc version too old libprotoc 28.1 < 2.3.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-protoc-version-checking-since-v20.x.patch | 35 +++++++++++++++++++
 ...rectly-match-multi-digit-major-versi.patch | 28 +++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
 create mode 100644 package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch

diff --git a/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
new file mode 100644
index 0000000000..ee98c5569d
--- /dev/null
+++ b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
@@ -0,0 +1,35 @@
+From d4414feefd95adf9c91d7eaf1e94380296c35f7a Mon Sep 17 00:00:00 2001
+From: Peter Newman <peternewman@users.noreply.github.com>
+Date: Fri, 7 Jul 2023 15:57:35 +0100
+Subject: [PATCH] Fix protoc version checking, since v20.x (cherry picked from
+ commit 2e55aa88756718d8ab4a4c8fde97d620542c2c98)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/OpenLightingProject/ola/commit/d4414feefd95adf9c91d7eaf1e94380296c35f7a
+---
+ config/ola.m4 | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/config/ola.m4 b/config/ola.m4
+index f838ab70a..51b6c825c 100644
+--- a/config/ola.m4
++++ b/config/ola.m4
+@@ -44,7 +44,14 @@ if test -z "$PROTOC" ; then
+   AC_MSG_ERROR([cannot find 'protoc' program]);
+ elif test -n "$1" ; then
+   AC_MSG_CHECKING([protoc version])
+-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
++  # Since v20.x we only get effectively the minor and patch versions out of protoc.
++  # Treat them as major and minor and everything should keep working indefinitely.
++  # See https://protobuf.dev/support/version-support/
++  # So we've got either of these:
++  # libprotoc 2.4.1
++  # libprotoc 23.3
++  # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
+   [required=$1]
+   [required_major=`echo $required | sed 's/[^0-9].*//'`]
+   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
+-- 
+2.34.1
+
diff --git a/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
new file mode 100644
index 0000000000..cee2c7eb43
--- /dev/null
+++ b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
@@ -0,0 +1,28 @@
+From 546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d Mon Sep 17 00:00:00 2001
+From: Peter Newman <peternewman@users.noreply.github.com>
+Date: Fri, 7 Jul 2023 16:14:21 +0100
+Subject: [PATCH] Protoc check - correctly match multi-digit major versions
+ (cherry picked from commit 69a2946622cdfce54cb6ed7f2210df2be0ec5576)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/OpenLightingProject/ola/commit/546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d
+---
+ config/ola.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/ola.m4 b/config/ola.m4
+index 51b6c825c..eacee5d94 100644
+--- a/config/ola.m4
++++ b/config/ola.m4
+@@ -51,7 +51,7 @@ elif test -n "$1" ; then
+   # libprotoc 2.4.1
+   # libprotoc 23.3
+   # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
+-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/[^0-9]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
+   [required=$1]
+   [required_major=`echo $required | sed 's/[^0-9].*//'`]
+   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
