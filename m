Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55416C25B79
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0639282090;
	Wed, 22 May 2024 07:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7jjc0bJDKrS; Wed, 22 May 2024 07:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5DB82052
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5DB82052;
	Wed, 22 May 2024 07:02:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6179D1C5858
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B06D60A76
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsmp7-Bz93LD for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C501260872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C501260872
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C501260872
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-572b37afd73so10934855a12.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361368; x=1716966168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxOzfEtNFxb7Y2jjlOwycso6YiCuLv/lueVKvE9abck=;
 b=qaqFisjoV3t1UKtphWHWjt2z2sq7PRtlN/+IQQRC0qZWhkA97zlzbKXLgT+bZ5yeFu
 X9pNPgQd9lGVzaw/ko7T8e8lD1tY+4DbaKxcIJblhYpJbsUXFnvTyy6c4QEUmBaz++e1
 7XXSksSLNe49DJmKItO0YWbjp7xnPAoIdRV9+3zfU2K8xf9r8T0M4U4yoUbXu9ku6LZj
 SZBv4yh3QYlRt7njgON037/dsVASBqGhzqdN17LcMIDW95yADoojttTT1p0qq3lYAewC
 gZBYY0DNkwurByecjNj7v+C85mWQequ6gyMGzTqmoHq2wUv5nTHZmBctFlLLb/ztBPTR
 IOuw==
X-Gm-Message-State: AOJu0YyXkWrJ30zzSdFqUBKlSQPj8wR3ymUNJVgIk7pfDcqSotCXM4fn
 TUu3iYzddjd10nEmMZFD+t+WopFC0XxYmwhHN3Sfy9E/RkEyRHf115ZfjBFA4r3EN0FjLOl6n86
 C7cQ=
X-Google-Smtp-Source: AGHT+IFDtWvlK8s9ppEBc1MDLX+qMPqH2RVyK/sW+NDBvN61YKomMUscyjWsu/Yw3wvDdvZcftTIWg==
X-Received: by 2002:a50:d6c9:0:b0:575:17ce:adc3 with SMTP id
 4fb4d7f45d1cf-57832a69e33mr568007a12.22.1716361368607; 
 Wed, 22 May 2024 00:02:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:22 +0200
Message-ID: <20240522070238.3282121-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361368; x=1716966168;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxOzfEtNFxb7Y2jjlOwycso6YiCuLv/lueVKvE9abck=;
 b=WJONhxxWS68Axs2zpazKJEYLv60z5uBBWL2LTdkYMqlcfRc4piFrddCUkCOZxYvJF0
 ahuFXMBJsk7N6rfeVgGkrv0CwBxPb5eQNa3bBs9IC0XAuwxVzBADhh3259HrtxEMUXBK
 6/1Lv6aJk2ukJ9fxMqFGx6DwKvDlYEUGyB8xk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WJONhxxW
Subject: [Buildroot] [PATCH v2 03/18] boot/syslinux: update the patches to
 be applied with fuzz 0
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

This commit allows the syslinux patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../syslinux/0015-efi-main.c-include-efisetjmp.h.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
index 2fd61ecbc8fe..15adfc49f33c 100644
--- a/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
+++ b/boot/syslinux/0015-efi-main.c-include-efisetjmp.h.patch
@@ -1,4 +1,4 @@
-From 7d68fa68cd9f2987bd85339f3391913a8b0e58c7 Mon Sep 17 00:00:00 2001
+From 26979f738518404b1d3dc9ecdcf4fa5811412c49 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 24 Mar 2020 10:21:27 +0100
 Subject: [PATCH] efi/main.c: include <efisetjmp.h>
@@ -38,13 +38,15 @@ This is due to gnu-efi commit 486ba3c3bdd147b7d98159b9e650be60bce0f027
 So we act as specified, and include <efisetjmp.h> from efi/main.c.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: https://www.syslinux.org/archives/2020-March/026621.html
 ---
  efi/main.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/efi/main.c b/efi/main.c
-index 6a748412..e924cfb1 100644
+index 71d31a5c1f13..7dc7bca7aeba 100644
 --- a/efi/main.c
 +++ b/efi/main.c
 @@ -12,6 +12,7 @@
@@ -54,7 +56,7 @@ index 6a748412..e924cfb1 100644
 +#include <efisetjmp.h>
  #include "fio.h"
  #include "version.h"
- #include "efi_pxe.h"
+ 
 -- 
-2.25.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
