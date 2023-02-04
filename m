Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50169C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 13:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF19440136;
	Sat,  4 Feb 2023 13:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF19440136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KTexNt8fadL; Sat,  4 Feb 2023 13:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113084020B;
	Sat,  4 Feb 2023 13:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113084020B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA2E71BF362
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 13:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB264020B
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB264020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwfE9kFxMRmf for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 13:47:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB1040136
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB1040136
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 13:47:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p26so22458662ejx.13
 for <buildroot@buildroot.org>; Sat, 04 Feb 2023 05:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZQdmWsMZI0GtFoBdhfBLC+mTFslMYlQR4KlIV18mE0=;
 b=X4AwT2K3bpG9rc77usoZTb2jYpLKAq7+3gmp+oto71btO6MBbb6G+wfzOevJLjr258
 lVYurA/ckj03vHutnGm5zH039qacLZnpkmg0eRw1cJSN4i4/8GHAQAN7bECk4VnAJg2X
 SLA8Z0gDiPGB7x7xZMUTlVJ4PcyGrOOrC8t82ode+vUqSb26w2JEfAUf6u7H0PT+rRbj
 MVukJT35vbcPUzgolEb7+CO7ejniXptcGboOjEbddTCHvRV8lw73dHRGsIN19QQ+Chnk
 3auP+xr4GyZ54+jD8tRFVMkcJ75/SzTpzSSq15hNq8cWG+muJ/jfvsZ0J2re1vDJOJEK
 io/A==
X-Gm-Message-State: AO0yUKU5qZ8HhH+G32JmA2K/1jTiaiVvPkiyuJyWvmQOBEtlwt2dttaC
 znXemMY72oJuHE86a9LbSQLvbNXr3PY=
X-Google-Smtp-Source: AK7set/lBmtU74Oue/+ogbTOw6tMB6N4PV2VbdqD82CfqtjtR2HEuvHH5lDvXNXspH4/BQ9hM9I8Ew==
X-Received: by 2002:a17:906:9ca:b0:872:14ea:1a7b with SMTP id
 r10-20020a17090609ca00b0087214ea1a7bmr14359400eje.13.1675518451256; 
 Sat, 04 Feb 2023 05:47:31 -0800 (PST)
Received: from osv.localdomain ([89.175.180.246])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b0088478517830sm2821584ejo.83.2023.02.04.05.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:47:30 -0800 (PST)
From: Sergey Organov <sorganov@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Feb 2023 16:47:09 +0300
Message-Id: <20230204134709.4160596-1-sorganov@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sZQdmWsMZI0GtFoBdhfBLC+mTFslMYlQR4KlIV18mE0=;
 b=JeFYEDzQ71fEHqiFsNHVY2jJo5KDPf+GY30CJWdZ51i+cA0B3ElX+RgOdw8glsmhGn
 hgnA80iHV/VbwKghJuolTKfBGmHOHqP26Gc1QzngX7l3SSgbXe6IX1GNvzNU0v0qNuPg
 0PFO+QhTL19cFIexs4q7fidZFkuKFcDiiA4smEYix7aFmJWHzRSwvCD4rpc53njPNf9f
 y/brD4dmNknMnYkE4o4OS+8YK8V/USQNHCrLbA3MA+EO+WABjkh1M2yGC+1xKcXXi+qj
 +j6l8f5XdxUIItIovuGYfYo5IDgYeOb4S6j0VCi3apS04lZ2HFvHLg5rbccAvR0B2Yqe
 rkvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JeFYEDzQ
Subject: [Buildroot] [PATCH] package/openvpn: get rid of -e in S60openvpn
 shebang
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
Cc: Sergey Organov <sorganov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The -e switch makes the script terminate on error from
start-stop-daemon, rendering unreachable the code that checks the exit
status.

There is no need in the -e switch in the first place either, as the
script takes care of errors handling.

Signed-off-by: Sergey Organov <sorganov@gmail.com>
---
 package/openvpn/S60openvpn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
index f097cf11ec..00156c80db 100644
--- a/package/openvpn/S60openvpn
+++ b/package/openvpn/S60openvpn
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/sh
 #
 # Original version by Robert Leslie
 # <rob@mars.org>, edited by iwj and cs

base-commit: c7ea83dd2df315ba4f492a9ef6b24152ba4cc4f3
-- 
2.30.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
