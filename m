Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E92EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 18:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52C460F59
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 18:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A52C460F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4069E606DA;
	Sun, 17 Oct 2021 18:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jno6bKdfpn9V; Sun, 17 Oct 2021 18:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883E7606A5;
	Sun, 17 Oct 2021 18:55:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C145B1BF386
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 18:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E7B80F62
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 18:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1ubG43Rmu1R for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 18:55:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9F4180F5E
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 18:55:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 y16-20020a05600c17d000b0030db7a51ee2so4709015wmo.0
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DA3PiMSJMNd6Scs7EzLMf3KX8UnwwpfEHMD2EQhiS9Y=;
 b=H+MurOygugCnClwvrpDOJZfwO4d/erKsYTPOAYa9FoIvDNF9PWm009HH8m8lEyEh3Z
 Ewgtz4AxSrTK2LNqXRLrtRV6+awaRVNHB6YjCWOm8IvC9yj9zY51lPNppyt7G8x69f1M
 Vzr+TpaJ02Gk/iwjaUaCSDFbGhSp2nqlvx/f14CdcPTLndsbbeECQo5W8e5wIhoDvFCK
 k4KVzV53172Qcvg+fF15v7jo3cJXfFbKsz2Fo+83d1UZWQ3DoB/4VEs0lCxadtiU/Mhx
 V9LXEUxPftYS2v7N29sbOiQXAb4lxCdU1PMxAZqcRo3fGEe3TcXEHS+85Yyy8DEMumvE
 UYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DA3PiMSJMNd6Scs7EzLMf3KX8UnwwpfEHMD2EQhiS9Y=;
 b=cLvzLShGyZI5XmqfUODwviOJcRpjGFNNBmkH6QwzvjoM9b33Jv1ZEivLhoy9C2puG/
 RjW6SKxmLr/Yf0J/WQzJdr0yK0L+uqEyLyS9q+hFFKXj38fuVnbEi7wGHBzumyBYIrxy
 lDnMhjd7Cp19GAdVdRSWqoGsZcVHec19heVdzitixLdzm12CGQ1280a/rPa+wUuD+Nzf
 oEF2eEqVcUGH8jXMH3j5AvF4hjUssH09QcJbYu7ZwPr9RCBP3Up0keJhfCaM95WxSgWP
 zeMRmL7Wqs6cx4oFjhnX1AaVn4fB+yQFQaSqnW52HawVshTYMglT8Fttfp100QQLxKm3
 6zSw==
X-Gm-Message-State: AOAM532v682yxXRYreKv4xRHF71er+OFlBEl7jSSd7ibfsV1WlZTeIPm
 Wm33EuUijHam6rC2yPLzxXpW1mmXs5I=
X-Google-Smtp-Source: ABdhPJz8SKvafMLY8RJVVu1U85j/5rNYinbIcsjZhLeZHR5lB/XrV0VzKXqvPDFh/k1XiYttRb4Vcw==
X-Received: by 2002:a05:600c:5128:: with SMTP id
 o40mr39872411wms.91.1634496936446; 
 Sun, 17 Oct 2021 11:55:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n7sm10359531wra.37.2021.10.17.11.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 11:55:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 20:54:15 +0200
Message-Id: <20211017185415.1407474-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix libuuid build
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

Fix the following build failure raised since bump to version 2.37.2 in
commit 27a46793b1a0c6c13c00b07d07bd5743e2c9c7b6 and
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=33b09aebf505acfbbb2137319093fbb9ed7eea7d

libuuid/src/unparse.c:42:73: error: expected ';', ',' or ')' before 'fmt'
 static void uuid_fmt(const uuid_t uuid, char *buf, char const *restrict fmt)
                                                                         ^

Fixes:
 - http://autobuild.buildroot.org/results/b931a34a47e5faf8ae48fce079747dea0db2563a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nclude-c-h-to-cover-restrict-keyword.patch | 30 +++++++++++++++++++
 ...nclude-c-h-to-cover-restrict-keyword.patch | 30 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
 create mode 100644 package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch

diff --git a/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
new file mode 100644
index 0000000000..3b4f510920
--- /dev/null
+++ b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
@@ -0,0 +1,30 @@
+From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 5 Aug 2021 09:46:21 +0200
+Subject: libuuid: include c.h to cover restrict keyword
+
+References: https://github.com/karelzak/util-linux/issues/1405
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libuuid/src/unparse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
+index f9a5e4315..ffeed2ed6 100644
+--- a/libuuid/src/unparse.c
++++ b/libuuid/src/unparse.c
+@@ -33,6 +33,7 @@
+  */
+ 
+ #include <stdio.h>
++#include "c.h"
+ 
+ #include "uuidP.h"
+ 
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
new file mode 100644
index 0000000000..3b4f510920
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
@@ -0,0 +1,30 @@
+From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 5 Aug 2021 09:46:21 +0200
+Subject: libuuid: include c.h to cover restrict keyword
+
+References: https://github.com/karelzak/util-linux/issues/1405
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libuuid/src/unparse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
+index f9a5e4315..ffeed2ed6 100644
+--- a/libuuid/src/unparse.c
++++ b/libuuid/src/unparse.c
+@@ -33,6 +33,7 @@
+  */
+ 
+ #include <stdio.h>
++#include "c.h"
+ 
+ #include "uuidP.h"
+ 
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
