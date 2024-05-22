Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860ACC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D414880C1E;
	Wed, 22 May 2024 07:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0loUexPP5hJ; Wed, 22 May 2024 07:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C24380E8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C24380E8A;
	Wed, 22 May 2024 07:03:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4DD1C585A
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42C03820C9
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHYxGg1yEKPB for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90F9181FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F9181FFE
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F9181FFE
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so8868183a12.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361391; x=1716966191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ei6QerQpjg4oD86F8bttymmIhDiYrWLAh9bDB1tVqDM=;
 b=vwnViA0Z2mMTaEMZT7WqAxoYgxmxXRuMptHc4fHDcYHrz7cgpnZEp0/CHvSDbUk6jH
 K4U0ricbPzpzbWklqpR7vyjC29AbOL+D97Q3NUbe2+BCCpV7ozjn2TcuhuQFqv7U590w
 0PLDjRNu3sqpd9R04ZBLqJgJC0pd/467pNVPL1av3E7gpc7j394QFtRniCI0FC9xXKli
 oqahWGahFuntrw0rTZ222T4nUtPlK7cWBkIlPEI+cdzpOmNvWj2hN6FztTZrbu+GMBtR
 EjymRzWsNzwKgrbmTZfoqx+Hh+kLz4pwwJEjaGiljJ0vipSjjGuqw6eeqb8s43oKhh93
 c+0A==
X-Gm-Message-State: AOJu0YzPEPh35r9mkDEtngnC/1EmIXIyjo8r5isz0YudIMCfyPyM1M5/
 Gi18dQ5rqJLXl9bEbzLZODLh4MjMTT1eeOE3wLT6a0YHVLUlNXn0ei5c32yateSSs7tfa47rgrS
 QWwE=
X-Google-Smtp-Source: AGHT+IHjqZMjvf5Es5PL3M+HIQo+DJX18jRiJ1+jPHapZk1ekxhRAfX6ySTFmfn+kzaK4SKwPW/PBQ==
X-Received: by 2002:aa7:c788:0:b0:578:33f1:dafb with SMTP id
 4fb4d7f45d1cf-57833f1defemr588060a12.4.1716361391490; 
 Wed, 22 May 2024 00:03:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:35 +0200
Message-ID: <20240522070238.3282121-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361391; x=1716966191;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ei6QerQpjg4oD86F8bttymmIhDiYrWLAh9bDB1tVqDM=;
 b=R9cCejTyLepyf+WqioITY5GTpAbr1NyUFFgVs3F/xv4dVXZXkGhQn4C++z4NsgvnLc
 BUN+Bj/FWY+qMbfbPUfxRb4NtsK9Fx/Eu10k3mvVUFEDl2D1lSRyWYznqvEYCA6VpJkV
 d71rKE2TOXUVR8Ct2UPGpfuoClVSCCy+O7Pxk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R9cCejTy
Subject: [Buildroot] [PATCH v2 16/18] package/qt5/qt5base: update the
 patches to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../qt5base/0006-Fix-build-on-riscv32.patch    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
index 5561acb9ae04..ff24fbff8305 100644
--- a/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
+++ b/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
@@ -1,7 +1,7 @@
-From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
+From 25a0057e8d7afaab3492e03efb3f85581f1cf9b2 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 27 Aug 2021 16:28:32 +0200
-Subject: Fix build on riscv32
+Subject: [PATCH] Fix build on riscv32
 
 riscv32 fails to build because __NR_futex is not defined on this
 architecture:
@@ -21,15 +21,17 @@ Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
 [Retrieved from:
 https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/corelib/thread/qfutex_p.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
-index 40482b6fc1..037207a5c0 100644
+index f287b752d75f..fd7d09ac8572 100644
 --- a/src/corelib/thread/qfutex_p.h
 +++ b/src/corelib/thread/qfutex_p.h
-@@ -103,6 +103,11 @@ QT_END_NAMESPACE
+@@ -81,6 +81,11 @@ QT_END_NAMESPACE
  // if not defined in linux/futex.h
  #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
  
@@ -38,9 +40,9 @@ index 40482b6fc1..037207a5c0 100644
 +#    define __NR_futex __NR_futex_time64
 +#  endif
 +
- QT_BEGIN_NAMESPACE
- namespace QtLinuxFutex {
-     constexpr inline bool futexAvailable() { return true; }
+ #  if __has_feature(thread_sanitizer) || defined(__SANITIZE_THREAD__)
+ #    include <sanitizer/tsan_interface.h>
+ inline void _q_tsan_acquire(void *addr, void *addr2)
 -- 
-cgit v1.2.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
