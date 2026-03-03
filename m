Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D4FEDEBEC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68171606DC;
	Tue,  3 Mar 2026 20:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AftsglAZf14b; Tue,  3 Mar 2026 20:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E59B606DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568150;
	bh=owATigfkOKaYJf6MsMAK5A4ZL5/lwQaEEQtNkX3YfIE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RbyLo4uk1t9AIYFJuhu+KhAM4qdQ22uPaPKBkSNNnKteNAZYFThLDxLVcACZU+yER
	 EOUwyFYcskwyvtDyXde6kQG/XnQP7Hc/B7FcSupdksciomYLSQHzLLStQOfEQAYwMD
	 GK2V79DuVhqzn5hUfPBCwPDDN9Y2xqEqml7VOQKLX3xf6vE4Zgrnlo7zsFuEMP2lU9
	 MmbbtStAOlSxEuTmzMjpYwADeecREx0s2192fcR1AEjGPTp82c/rmpfwhWxK95qMLS
	 3zR3kVpn7gukoMfp4N3Z8IB37BI48fEUph3lSVURJMiu8P51rKL+uUJF/+A19ap8TQ
	 YD8eMqwTqCG1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E59B606DB;
	Tue,  3 Mar 2026 20:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 924421EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78642407D2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovkJlZOQhewi for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5385A4079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5385A4079D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5385A4079D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A1E6A4C340A;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-3svA;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:46 +0100
Message-ID: <20260303200054.784253-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=gGNmpZLhWSKfbZwy2yI6jWFYDOTSnQYyN9ALGdSYjBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GDNwq+0BiYdjae2wTHyu0uIU1eu1Z5wPzl5cHTzUg5trSXrhvUUAXCUFQYhpcSmyC
 q3mVAoNiAFcB/9BDa2NW7rP6zYUuPtT9Js5bdsX3nCesrweP3c8Y9aJy2frlWT3rKG
 v3JYYH2PPXfVUePr6UqXi6uhiNpXAkgjj4u+b7y+Yfq4Ab+9VONodoKYTHbHwgcC34
 RK4sqTkp8Xs6hLg91+1W/weKRjDBXMyQIn6BIagSdONtIBiC45BqL0kyExzJtrFwGL
 FzA2RO5ofrFaFkblxbNzZS3khqb9whwKYgAH8p5dKHVrGGc/peEmp3kUn3Dwc+AeiS
 g4JOKvWUbXGjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GDNwq+0B
Subject: [Buildroot] [PATCH/next 07/14] package/waffle: fix build with glibc
 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-c11-threads-fix-build-on-c23.patch   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/waffle/0001-c11-threads-fix-build-on-c23.patch

diff --git a/package/waffle/0001-c11-threads-fix-build-on-c23.patch b/package/waffle/0001-c11-threads-fix-build-on-c23.patch
new file mode 100644
index 0000000000..0bed2a6548
--- /dev/null
+++ b/package/waffle/0001-c11-threads-fix-build-on-c23.patch
@@ -0,0 +1,57 @@
+From 6b3c46483844faba4dfe7dd90dc2b0cd06e67158 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Nov 2025 19:20:22 -0800
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Conditionally check if glibc already provided c23 definition via stdlib.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/158
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ third_party/threads/threads.h       | 3 ++-
+ third_party/threads/threads_posix.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/third_party/threads/threads.h b/third_party/threads/threads.h
+index b4db50c..cdc7bea 100644
+--- a/third_party/threads/threads.h
++++ b/third_party/threads/threads.h
+@@ -102,8 +102,9 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+-
++#endif
+ #else
+ #error Not supported on this platform.
+ #endif
+diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
+index bc50825..d93013b 100644
+--- a/third_party/threads/threads_posix.c
++++ b/third_party/threads/threads_posix.c
+@@ -75,11 +75,12 @@ static void *impl_thrd_routine(void *p)
+ 
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ void call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+ 
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
+-- 
+GitLab
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
