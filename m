Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ABEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 09:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A488E848AB;
	Thu, 14 Jul 2022 09:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A488E848AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HP8-Wk5vLm6q; Thu, 14 Jul 2022 09:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD10847D5;
	Thu, 14 Jul 2022 09:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD10847D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A68B1BF33E
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 09:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E65DF60EFA
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 09:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E65DF60EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZY0uYEtXvA4 for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 09:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33D060E05
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33D060E05
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 09:40:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i204-20020a1c3bd5000000b003a2fa488efdso2414090wma.4
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 02:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HZd0juscHya8GaR0o5M6twVXYRqquVzKHKAJkItoRj4=;
 b=uKc0oNXqn5iIWP57uPRWFUIMYXqCCLbLLyxxT9Yl/EF2QNCaW56uKspPrDwMIptdA1
 ztNA+84744n8fQBZgpYYUa7lR8P/Dw48PF46/IAAjL8itP3KL/OlsDlZ2CFIUbr4P2hV
 u0hngmvbEvfQQ8OQ+XKuOb4Zllefwmju7jyLU8nlc7Td5boh+scUpXFDBN4XAiolv28z
 KhBxLFgidwzDi/P7AnfYH7C74RYctWoi6GFqkBZXnGXewJ3VDYt8fz91oA/jNW90jsoy
 DrmA4o0pHF6G3eUR9OSj3um7A1UTa4RWboAv1vSY+3PI7A5rqlRzoB1IZgVD5N+q0pFU
 2/fw==
X-Gm-Message-State: AJIora/Aw3bKoGdptYlFq3CtM8y6xSb3JuFS666GelSbNmIoHbJ5XyAb
 qnQ1DwGJTeBE+hOq9Z5ACJacgaDmIIw=
X-Google-Smtp-Source: AGRyM1v5OYif7EdqNAHpZ3nwn+mZ+v9Mi0ggYXujI6S2BarRFyBh2X53XQI8GIDZ5QMXcNisidi47A==
X-Received: by 2002:a7b:cb41:0:b0:3a2:d6eb:135d with SMTP id
 v1-20020a7bcb41000000b003a2d6eb135dmr15030430wmj.150.1657791599508; 
 Thu, 14 Jul 2022 02:39:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bcb86000000b003a2d6f26babsm1311125wmi.3.2022.07.14.02.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:39:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 11:36:15 +0200
Message-Id: <20220714093615.632188-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HZd0juscHya8GaR0o5M6twVXYRqquVzKHKAJkItoRj4=;
 b=KwmQ7yhe4o1VDN6XrdPxvIhCCP+siSk4bKCTsM+JSdf8spualmywBnNcmmBU/LMie5
 efe0DEO337+ZvqNyOMqsf8tx1stkjPpiet49iAzOVJw3lE2YK6U7qSkuxUgpCWzGQn8k
 tU1d9cIx9+kMWDEEC/m4QgtMvZbK01F3safA+OgoIzKjDvsklVErkuEogRbHbR3B+ZFw
 7p7xyV94zFYk074V9FGuYITsGkByelMNLQB+M8GL5WDnagtFCwdtHrDckSFMMd00WAe6
 bErKR0aBqg3fY6buJrrVssCNOba/YJvwfzg9VhQMUIkNpeM7Nkm3U8Hhved9/23mVBEv
 ShSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KwmQ7yhe
Subject: [Buildroot] [PATCH 1/1] package/ola: fix build with musl 1.2.3
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with musl 1.2.3:

ola/AutoStart.cpp: In function 'ola::network::TCPSocket* ola::client::ConnectToServer(short unsigned int)':
ola/AutoStart.cpp:116:12: error: invalid cast from type 'std::nullptr_t' to type 'char*'
  116 |            reinterpret_cast<char*>(NULL));
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/88be323e64f66433cabc962e719307b5fb6a6177

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-ola-fix-compilation-with-musl-1-2-3.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch

diff --git a/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
new file mode 100644
index 0000000000..f236ef0957
--- /dev/null
+++ b/package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch
@@ -0,0 +1,35 @@
+From eb31017284f9a1c95602a9c06d606df6b558a691 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Thu, 14 Apr 2022 17:39:32 -0700
+Subject: [PATCH] ola: fix compilation with musl 1.2.3
+
+musl 1.2.3 defines NULL as nullptr. cannot use reinterpret_cast with
+nullptr.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+[Retrieved from:
+https://github.com/OpenLightingProject/ola/pull/1773/commits/eb31017284f9a1c95602a9c06d606df6b558a691]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ola/AutoStart.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ola/AutoStart.cpp b/ola/AutoStart.cpp
+index 89fa51f115..4dbe20d317 100644
+--- a/ola/AutoStart.cpp
++++ b/ola/AutoStart.cpp
+@@ -110,11 +110,11 @@ TCPSocket *ConnectToServer(unsigned short port) {
+     // Try to start the server, we pass --daemon (fork into background) and
+     // --syslog (log to syslog).
+     execlp("olad", "olad", "--daemon", "--syslog",
+-#ifdef __FreeBSD__
+-           reinterpret_cast<char*>(0));
++#if __cplusplus >= 201103L
++           nullptr);
+ #else
+            reinterpret_cast<char*>(NULL));
+-#endif  // __FreeBSD__
++#endif  // __cplusplus >= 201103L
+     OLA_WARN << "Failed to exec: " << strerror(errno);
+     _exit(1);
+   }
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
