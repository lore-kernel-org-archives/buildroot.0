Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1290C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2BC8210A;
	Wed, 22 May 2024 07:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wuc94CZHCHeL; Wed, 22 May 2024 07:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFCA820FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFCA820FB;
	Wed, 22 May 2024 07:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D861C585E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7417140347
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdhE7gqAkNS4 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BADE40181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BADE40181
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BADE40181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57342829409so1068061a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361382; x=1716966182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Knzh50U2AgYswLEttwi3n/maA4bbST6NeArnVRxdWHw=;
 b=Ua3QYLsz1MA7GDGPTU8ygHIbWrnBYC0kyvASselX9saQnpLekuZBg3WxC/kEbDnMpv
 SB7hQDG1lYCTSM8havMqzGpS0hFczWxN4Gsd3f7fC/ZsFR5bCVtgXV68lzDIgRuwATnw
 M+2GPvao3QJsHdWcRyncADOdRj81c8foBZ2eN1K7ALJcZKBM/pUG/CEUAYLNn0xBxBho
 hOdCoP6bFiqTjjV6v5iselVKpjpyiEd5nUQx4sdZyHtvbBKdBE+sgsFUYJvBMlDF/lxN
 RtaQAAicWrjTAQiQqaf7nJTKkYQfAbTh61O4biN/P9KrdoOX+3Y9JeARZJ8jXVrGX6dE
 qqDQ==
X-Gm-Message-State: AOJu0Yxow6BxyHYFCrarWewTtPU82iRLb6B6+HZ1z0wPHNXGmn6cdmBr
 j3olJutRrJ9af+mjZEQsU5lIaSGYspoMkn4Hn8IepDaTG8NTiVg2SiOqxE5yUWiUTQKn7i0d7iS
 ax2c=
X-Google-Smtp-Source: AGHT+IEQ0ZJVqsn3Gf+x6AU20JCnV+CfpA+E5A064jE378J2S06IIACpOcEvvE7/POU+XT5uN98lJw==
X-Received: by 2002:a50:9f45:0:b0:56b:d013:a67e with SMTP id
 4fb4d7f45d1cf-5783117a404mr1003518a12.18.1716361382083; 
 Wed, 22 May 2024 00:03:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:30 +0200
Message-ID: <20240522070238.3282121-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361382; x=1716966182;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Knzh50U2AgYswLEttwi3n/maA4bbST6NeArnVRxdWHw=;
 b=ZuQfnD+eH81btDtvdCD2D+jcmvLj0X98rD39BRR3OUBNKZIjO8msdT6VdT49hl7qlr
 D39qzBLQfMpdqmHDcuauIqzsRG4HKpSEXn1BmwkgsAQW80Xh8jtLVM0VuQGazml7d9hW
 aeCNLbkqZvP92TVNl2vpdliccWKIIXI9ynYJg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZuQfnD+e
Subject: [Buildroot] [PATCH v2 11/18] package/libnl: update the patch to be
 applied with fuzz 0
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

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...l-workaround-to-the-libc-compat.h-copy.patch | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
index 57d1c8747dea..4c833cfb22bc 100644
--- a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
+++ b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
@@ -1,4 +1,4 @@
-From be07fdbc9658de19304defa7538f219cd3f21ec0 Mon Sep 17 00:00:00 2001
+From 5c984c942e2f9dca4a8380ed782519d9cb0f554d Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Sun, 12 Mar 2017 08:52:20 +0200
 Subject: [PATCH] Add musl workaround to the libc-compat.h copy
@@ -12,26 +12,25 @@ definitions will be needed. See the Buildroot iproute2 patch
 package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
-musl fix must go to the kernel first.
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  include/linux-private/linux/libc-compat.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/linux-private/linux/libc-compat.h b/include/linux-private/linux/libc-compat.h
-index 9bed5b6ae4d9..e2562a819464 100644
+index a1599911e7a9..f6df7193b8b4 100644
 --- a/include/linux-private/linux/libc-compat.h
 +++ b/include/linux-private/linux/libc-compat.h
-@@ -49,7 +49,7 @@
+@@ -50,7 +50,7 @@
  #define _LIBC_COMPAT_H
  
  /* We have included glibc headers... */
 -#if defined(__GLIBC__)
 +#if 1
  
- /* Coordinate with glibc netinet/in.h header. */
- #if defined(_NETINET_IN_H)
+ /* Coordinate with glibc net/if.h header. */
+ #if defined(_NET_IF_H) && defined(__USE_MISC)
 -- 
-2.11.0
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
