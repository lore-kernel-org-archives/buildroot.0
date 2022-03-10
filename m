Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2946AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 954EB40B4E;
	Thu, 10 Mar 2022 11:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBFTIWSvAppe; Thu, 10 Mar 2022 11:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E53040B50;
	Thu, 10 Mar 2022 11:42:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B70F1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5598471E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78X-G_YnPuQN for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:42:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC0C84393
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:42:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso5263615wms.1
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyB49VWfO0Qb4BFGnVVXSiIe0FqD1z5s08pZadAhdOY=;
 b=RrI0WFQFEdMRfzxdQfGKTr6FUBfCKWrjb7fWNZ6FsV1kwMI6jVs6NCesp6YnJ3uR8K
 spTLUOH+npuJfQUCApD1749s6l3rzrC2CiFJZYHzQUHEZZusIF7syoAtACp+Hk7205+w
 Ls/dHhy6OQkS/PuJU5j/bHjN/+aLPStAmEh7E7hMQr40qLIT/EVJd+jhhNRaMpJbjCC/
 8hdAEdz5Si/clpsRd4mnjGF3Q6njYfR4NBcinhIPLJfaOz47pVjCMWZOjM+or3h6RUoa
 UfrQAY+nxceFwTeUNRnE1t4L16TPzSkAaJpil0hQPbqjMtONuY5ilHrBzYjPemNVkCVv
 BgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyB49VWfO0Qb4BFGnVVXSiIe0FqD1z5s08pZadAhdOY=;
 b=s4aKD2wdKlkB7r/5VCFyfPpmOpjkZqM1CykP9ixgkXgDUPuotjJRvyHUUUF8rRszAB
 rP4Bn0tYmrQhKmJWf1sVZhjeedmcCOhw21Q8GHmpvQkbBuhriZDw/meZh6xEs1zQuQIk
 LOZMvZ7kBhNZZ5lhuymZo+JPiYYWAbAPocw2qIeiwdPmA/T7EhN8w2ZHgXftHthYi1rc
 JHXSpq09b/jZRAECLe3vP836hG2uQr2hqA7HlG3tJWeX3iMN05qSsRDPgolriFgxz1Zu
 Lo78kH80dftCqDTe4BoS9dDwRo5+hol3P/s4DOVxZpGULCACulqaM+F26MbhJ/Q/176I
 R/SA==
X-Gm-Message-State: AOAM533Ebg2Yi3Q4CGyMYoIdHtRzF8pGaVEqBJgnZmPerN2FWmzubW8a
 HYeYJWvPfpaLC5eHBPGQ6bGtHuegVuU=
X-Google-Smtp-Source: ABdhPJwtwIMeVDr2iEfAY0NxGxAo0RxRelmm4c/5Otap8aFKAAuV8OTq/PKYIxN7kb+CWFDs8C8PAg==
X-Received: by 2002:a05:600c:2e07:b0:387:aeab:93da with SMTP id
 o7-20020a05600c2e0700b00387aeab93damr3229147wmf.186.1646912527571; 
 Thu, 10 Mar 2022 03:42:07 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff0c2000000b001f1fa284a32sm4028463wro.115.2022.03.10.03.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:42:07 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:42:01 +0100
Message-Id: <20220310114201.919946-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nano: bump to version 6.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 80529437d..69ebc27b7 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v6/nano-6.0.tar.xz.asc
+# https://www.nano-editor.org/dist/v6/nano-6.2.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2  nano-6.0.tar.xz
+sha256  2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3  nano-6.2.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 30db3249e..e3ecbab56 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 6
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
