Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE0E40B63;
	Thu,  3 Nov 2022 18:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE0E40B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENqPltx86oiy; Thu,  3 Nov 2022 18:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD7D8404C9;
	Thu,  3 Nov 2022 18:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7D8404C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A02B1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 028CA404C9
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 028CA404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXmXNprXQjo8 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:50:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA7D403B7
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CA7D403B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:50:39 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r81so2135269iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4kBted6nY6jTnmsGQ5bjrBavLOMMDittHziQuzH6c8o=;
 b=HTn8CdykV0KAPXvRhU2E2RvORNe3Zl/BwkZBtCzTwxqn8AeGeIzynNqALIgqeEae9O
 7nLcAxrKEVsBaDvPcFjTjQVJXIoNW952Xz2vHpGcI/NSZyafd7OrtfrpXmKfcFJPFFxa
 z0OqG3vLp1PMzAZwUatD9VeHkX+OKcZvF3hXmqRoz6hehKpgZuA4NpaNfNz6PwRux4/J
 st1mrZIKmJg0bOzHDTbTG/hmlPJBC1A9rSDWYDXY8T97zpyPm34n2ZTfyC9ORLO4qg1p
 LqCC5YaoRWKuj0nMqoyb0DDWxudS0a7XjmdkoevNA++G0R/uWn55MWlJ5uSk2ly+GAfm
 hl6Q==
X-Gm-Message-State: ACrzQf2nmFQ+sflWuxNV0X+6IRbFZ1YU+n3f0F1xVEQu9HBOToWDu9Sq
 mzavmyOi4/gWHrWm+vgNU64/5J7rgCyZxagF
X-Google-Smtp-Source: AMsMyM6wnFZzO6ruiszcuNuV2IQZOLMIu6XkQQ3bvkL518sGZ+gmbepGqRK/Hf9CoIf1BHWqhm7jOA==
X-Received: by 2002:a05:6602:2bec:b0:6c0:e5d2:b924 with SMTP id
 d12-20020a0566022bec00b006c0e5d2b924mr10583060ioy.143.1667501438766; 
 Thu, 03 Nov 2022 11:50:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v15-20020a02b08f000000b00375966aa90esm437997jah.161.2022.11.03.11.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:50:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:50:36 -0600
Message-Id: <20221103185036.2469293-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4kBted6nY6jTnmsGQ5bjrBavLOMMDittHziQuzH6c8o=;
 b=NCVo7NbyEhREAnEJpKG7TJlgaiExSoo81af/uai20KcBg1G/sHfU2zfCTagrxSaD0p
 T+46eqfsphs9GVdcWLJIe+F69vruhl64KkaUZVheGPIqJ00/LJbtragEAbsmmh+3hiny
 bntNkyXO4yF1nv9Idtvt4ak8za6CrTYPMi+re/4wz+TQPg2ZZJq22u5Ip0yB4EInj23w
 Iq100kVzW2M/Qj/EqH8I4gGC0kSE/DpJ7UOb7piW/Ba373rO89wpWy/xuD3HAT7k9e6y
 aWE1uGXxXg/HxaKxU7h/Fg56hDNZ3orssMVoDWeR5UpNXL8wFYWwrw060KPLGG9cItPQ
 s9tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NCVo7Nby
Subject: [Buildroot] [PATCH 1/1] package/python-requests-oauthlib: bump to
 version 1.3.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-requests-oauthlib/python-requests-oauthlib.hash    | 4 ++--
 package/python-requests-oauthlib/python-requests-oauthlib.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
index d33cabfefc..08c19ab1f6 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.hash
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-oauthlib/json
-md5  1ebcd55f1b1b9281940b4bc33010e2ba  requests-oauthlib-1.3.0.tar.gz
-sha256  b4261601a71fd721a8bd6d7aa1cc1d6a8a93b4a9f5e96626f8e4d91e8beeaa6a  requests-oauthlib-1.3.0.tar.gz
+md5  c4f3b4ecdb72a56a13675e5a3302852a  requests-oauthlib-1.3.1.tar.gz
+sha256  75beac4a47881eeb94d5ea5d6ad31ef88856affe2332b9aafb52c6452ccf0d7a  requests-oauthlib-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index 9fe5b186b0..cdd334fb9a 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.3.0
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.3.1
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/23/eb/68fc8fa86e0f5789832f275c8289257d8dc44dbe93fce7ff819112b9df8f
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/95/52/531ef197b426646f26b53815a7d2a67cb7a331ef098bb276db26a68ac49f
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
