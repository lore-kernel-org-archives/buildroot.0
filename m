Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90C2C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A72CE82119;
	Wed, 22 May 2024 07:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysm3LKApPo00; Wed, 22 May 2024 07:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2999E8211D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2999E8211D;
	Wed, 22 May 2024 07:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1301C5877
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448C5820E9
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89CjQH5quOpS for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F5A781FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5A781FFE
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F5A781FFE
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-574bf7ab218so10336842a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361393; x=1716966193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lkt3OF7B9EwuhGCRNfvrayxVwa/19F0EY27ZYZTwD/0=;
 b=OLV1iwjPS5ybmbzrNEc76OrUU9xKzc7A49RLXqhm45ls8MjelGnSJYAEiho4yRX74D
 spbo/K1wpNOa/BTkv3ilEZXeLcTivdOACrxmpz/jC40wrG0J7chCaHcBiNUUJnP+Y5HL
 qGdKGVXJCPUW3wjI/DUkv6WOvk0XB/h7bIT7WVtVo6RVhUgVi033gZwsUc3U3oD0yOsH
 UuZ5LF4GlUyRdTGN2tqYM/KgtPiyBjWn3b+VwWecH8PnUfJSnHHi/wnw7zUSV1oHeP9e
 TB+QRvbegQyaTVrfbEZ7okQgdSEqriDbdH+8dfAmJAKruUcwGvHBdMQxdTQBBKRmGOBZ
 5GwA==
X-Gm-Message-State: AOJu0YzqboAgsFKz09JeKmPpGdvVlGzyFVlulcPrR+3/clNmgkwS2uSn
 EsgSRdIUMOcitV3g/sp1v1p3069uhSZI2xOM4F+PfuagsF3uR09PkAzZ/fhN0wqck2s6SPtgTna
 u7LU=
X-Google-Smtp-Source: AGHT+IH0jrzeIVkXZM2GDWzkBWxzLzuyOiP6DuwCrBvyBcGeCe55TBEavkjC0ALC5Nwef0I9F5JaTg==
X-Received: by 2002:a50:cc95:0:b0:572:7d75:a715 with SMTP id
 4fb4d7f45d1cf-57832c5b30cmr599333a12.28.1716361393177; 
 Wed, 22 May 2024 00:03:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:36 +0200
Message-ID: <20240522070238.3282121-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361393; x=1716966193;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lkt3OF7B9EwuhGCRNfvrayxVwa/19F0EY27ZYZTwD/0=;
 b=H6brM5c7Sp3H2KkZ8Zjnr9mwI3dz2nYHZ6hHEVF4qF9WhWbQHqcmTJaCcAxNUWRw1B
 GhpD82vyPSRqxspVIyJCDFhExzaB9hgCZjnfnatjnMlpSMUvOXoSoV9YQKCsIVmQMGsS
 P2+rVtqWuVvYtR/TKsMPJuGZnQUd1vtCvSo/s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=H6brM5c7
Subject: [Buildroot] [PATCH v2 17/18] package/vboot-utils: update the
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
 .../0005-include-sys-sysmacros.h-for-major.patch     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
index 5d76428eb69c..3ab201fc3a2d 100644
--- a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
+++ b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
@@ -1,4 +1,4 @@
-From 435fbcee218b37a87368e2b22fa33366875d458c Mon Sep 17 00:00:00 2001
+From 0495287f062a0cef989e02e0aee4f4329ab155b0 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@chromium.org>
 Date: Tue, 19 Apr 2016 13:58:49 -0400
 Subject: [PATCH] include sys/sysmacros.h for major()
@@ -17,13 +17,15 @@ Commit-Ready: Mike Frysinger <vapier@chromium.org>
 Tested-by: Mike Frysinger <vapier@chromium.org>
 Reviewed-by: Bill Richardson <wfrichar@google.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  cgpt/cgpt_wrapper.c               | 1 +
  futility/dump_kernel_config_lib.c | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index dcfaab9c..1716cdde 100644
+index 4d07aadac72d..6fbfb235ba7b 100644
 --- a/cgpt/cgpt_wrapper.c
 +++ b/cgpt/cgpt_wrapper.c
 @@ -18,6 +18,7 @@
@@ -35,17 +37,17 @@ index dcfaab9c..1716cdde 100644
  #include <unistd.h>
  
 diff --git a/futility/dump_kernel_config_lib.c b/futility/dump_kernel_config_lib.c
-index 4fe990c3..abf37ae1 100644
+index c2d59433ba71..448a2f6a831f 100644
 --- a/futility/dump_kernel_config_lib.c
 +++ b/futility/dump_kernel_config_lib.c
 @@ -10,6 +10,7 @@
- #include <string.h>
  #include <sys/mman.h>
+ #include <sys/fcntl.h>
  #include <sys/stat.h>
 +#include <sys/sysmacros.h>
  #include <sys/types.h>
  #include <unistd.h>
  
 -- 
-2.17.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
