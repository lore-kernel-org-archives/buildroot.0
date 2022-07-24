Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFCCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB26A41779;
	Sun, 24 Jul 2022 05:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB26A41779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8q56JDBS1bW; Sun, 24 Jul 2022 05:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E39041729;
	Sun, 24 Jul 2022 05:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E39041729
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2BE1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C0560669
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C0560669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjbXbJHc1OBx for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85746606C0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85746606C0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:25 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10d867a8358so11042631fac.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YS0hXVspsKYyFJoe6Zrc064/SV8OzYr7BO7SCV7xExQ=;
 b=nIxBcEY2XARQSlKq53/wmc3vmAflLuwSY49Pf9eiGPXPJrAi/ei+aS336aNMEBaCcR
 20y5bGOJ1LCnjrvR/TFUnz2Si85uuaI9Zj+0aovJdUGL5tQ+nN/RC5y6UYmY2kjDRJ4A
 1HL9qnGLX+J+FQTm+Fqp+5Z/cSFdG5rimKEsLblx9kvUFHHOuWCCf6F06nzrlxo1q1GN
 k9HKHizRsA1F3js7vI2fXD3qQL2E3SyP/laeXiZEliebqsFgafVM6mhKJ6DU7V6adWWU
 L9+bZO8VKR3hseDm7IUvZrlMbFl81cMaxSSiOHpeKec7XJGl3N+q6kDcA5SKRSmgeKXg
 8lCA==
X-Gm-Message-State: AJIora9PxD9yB5NXs1dR7emyj1KaUhc6cO11Qwl0uwMutHLDB6L6kO7R
 +gn9o0BRsdTdqxvTDx/f3oaOC6mvoMM=
X-Google-Smtp-Source: AGRyM1s4X5y5a2d8hs87oqt4iGgEm/3M96wHnic1Hm/KL133AhWWCemvsIUdnP5WmT4ls9dktbN1Yw==
X-Received: by 2002:a05:6870:6114:b0:10c:6bf:542f with SMTP id
 s20-20020a056870611400b0010c06bf542fmr11053422oae.188.1658641824536; 
 Sat, 23 Jul 2022 22:50:24 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:23 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:48:58 -0300
Message-Id: <20220724054912.2354219-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YS0hXVspsKYyFJoe6Zrc064/SV8OzYr7BO7SCV7xExQ=;
 b=FU/DIdhutK6QNtT2P06b3UiobCB9JnrrSIC95bpc5zoyOjpIfDk8kvlQtIFnwS+M9l
 iY/X83hspCs+BHaMvA6X/6hAvSA2BL6NmvF5VjIzkP70w1thP+sc0mvVjIFv7nWPQB5s
 6DZWhP9fyRzdjZDYRtt1ZuVRYR/Tesd8+f12C2eL6ED+OLwC2WVtucCvHOoazqhSmEl3
 evj2kYDYq+Rx5pbniqmfmuBch7XVvPAiO+EgvZ9p+RcsfdT66ALi6+hf6wkeV8TXxxfF
 0Z3A8aswWmjIsicZziacfG94IUIanN+3aCBdPDPnBSuXdmxTyZhvBxjzZuuHzud36Cxf
 I/Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FU/DIdhu
Subject: [Buildroot] [PATCH 02/16] utils/check-package: improve shellcheck
 reproducibility
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shellcheck is already in use to check SysV init scripts.
Currently its results can be affected by the existence of a
.shellcheckrc file in any parent directory.

For instance, in this example:
(1) /path/.shellcheckrc
(2) /path/to/.shellcheckrc
(3) /path/to/buildroot
the configs from file (1) are ignored and the configs from file (2)
override the default values from the shellcheck binary.
So the config file affects the check-package result for SysV scripts.

Avoid this reproducibility issue by adding an empty config file to the
buildroot topdir.

It can also eventually contain configs (different from default values
from sheelcheck) that we want as a standard to all shell scripts tested
by check-package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .shellcheckrc | 0
 DEVELOPERS    | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 .shellcheckrc

diff --git a/.shellcheckrc b/.shellcheckrc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/DEVELOPERS b/DEVELOPERS
index 00315ffe6f..8b2fdb8f6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2467,6 +2467,7 @@ F:	package/libhttpparser/
 
 N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 F:	.flake8
+F:	.shellcheckrc
 F:	package/atop/
 F:	package/thermald/
 F:	support/testing/infra/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
