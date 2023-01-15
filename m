Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A96C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 18:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09CCB40441;
	Sun, 15 Jan 2023 18:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09CCB40441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ydRfA1-ah4E; Sun, 15 Jan 2023 18:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D84840150;
	Sun, 15 Jan 2023 18:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D84840150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFB31BF32A
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 18:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5302F60FAA
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 18:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5302F60FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qX3I3GMzplv for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 18:27:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260EE60FA4
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 260EE60FA4
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 18:27:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so11034128wrc.9
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 10:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFKz0wqg2ayJyGyP6hWBBXCOG0hL9o9iPNHey+M1BD4=;
 b=obhss/dM0jtn5TdOSU5C9PZIr68+NIDZgQJYQ9c6JzGsuwNk+vc6Y3sfCmfPg00w3t
 JS2x5uZ9MuCuZLq9GBcGHSt5JHkU81ffa/OFWTMEKKmTr6LSeZcanJJLX/p9Uo8wI06t
 P/rJ1pGHs45wEtFbW0kjonctChgd1i2+Qa47u0WinYe0wPGkJFwZc2sN+kBvkHqZvD32
 /FCVkd7EQjdbyL3jfD1RAwtt6BZg5Vr8FKKwGdAiGqm1kQvAp7MFNbiIl7A8PMRlqRcF
 1oq6AXRP4HQNn60SCT4yell4jL0a+qo5kYKjHOb62cX/2SVCs3uHR7tI9/xhHiyfjDke
 efog==
X-Gm-Message-State: AFqh2krE3JVi8y/kPRC79U67Y9GDwvMt7v+T9N1mMF7g3c8IIJ88MlvE
 S4Eh1ecsvKLjGRe6dqq1FVdlS2kP1Vo=
X-Google-Smtp-Source: AMrXdXsmDVk6Kiflse3z8kSTF5wKtKc9zUKMONF94o+/mjOMAt/Kb3T2ktQTJ91Huunl8F53N0a2Qw==
X-Received: by 2002:a5d:420e:0:b0:2bd:f367:40bc with SMTP id
 n14-20020a5d420e000000b002bdf36740bcmr4532108wrq.13.1673807246778; 
 Sun, 15 Jan 2023 10:27:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm23898797wrm.52.2023.01.15.10.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 10:27:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 19:27:24 +0100
Message-Id: <20230115182724.377966-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kFKz0wqg2ayJyGyP6hWBBXCOG0hL9o9iPNHey+M1BD4=;
 b=l9YO7IYibsFF4k04pKe4NpOT3bk3XhmJckxEXN2tWYmwkp5ro/AGty1Tgl7+VkA+yk
 Cyg9afjVf5tDYmcfXeSy6U9UzQs/Bv22RdZZlkrZWIuFEga72qlrUSHFqHV9/7VxLtAO
 HYqff2FHdsrYWqVm5/MC0zUI93GNFXA2ryfRPhuLs/dG2x4KEVLrMQuGyFc0VYkAmpiW
 CNA8RNPBxsUOeq3SiSPDQhD+qCrn36LQJIw9KseW0EUJrPefrnQJ8sEwOjEpYgVwX8Md
 4rm63WjCXLlk/LcRm8U5o6pIYACjmbKog/uTFhmrhm4zDBSFC2V6YwpLv+p3H9e4vnqa
 IwJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l9YO7IYi
Subject: [Buildroot] [PATCH 1/1] package/mariadb: fix build with libressl >=
 3.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
/tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
/tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
   68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
      |                                             ^~

Fixes:
 - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mpat.h-fix-build-with-libressl-3.5.0.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch

diff --git a/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch b/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..fd3e6e6607
--- /dev/null
+++ b/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,39 @@
+From 79ed770a37c8669390a58a4485dd8f5565fe2497 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Jan 2023 19:12:05 +0100
+Subject: [PATCH] include/ssl_compat.h: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
+/tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
+/tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
+   68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
+      |                                             ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/MariaDB/server/pull/2435]
+---
+ include/ssl_compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/ssl_compat.h b/include/ssl_compat.h
+index 664f3aac87c..3678e5fa084 100644
+--- a/include/ssl_compat.h
++++ b/include/ssl_compat.h
+@@ -19,7 +19,8 @@
+ /* OpenSSL version specific definitions */
+ #if defined(OPENSSL_VERSION_NUMBER)
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
++	!(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #define HAVE_OPENSSL11 1
+ #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
+ #define ERR_remove_state(X) ERR_clear_error()
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
