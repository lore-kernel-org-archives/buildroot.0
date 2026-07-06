Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159B7C44501
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 10:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0A8608E2;
	Mon,  6 Jul 2026 10:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSXi2gkxYLnO; Mon,  6 Jul 2026 10:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1AF608DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783332190;
	bh=kX4zJcKGMmlAXhlNn+gLCqv0KYK70hw3QBodDP20ffk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RkFDZxL23N/uEt4UdzNm0TtMREJdeQNpLmvOPaxgZSZpG8vHD9BMfRYeEyPmP4N//
	 MSwWxxaxiEmitExHtpQKURt2TlxIOMIaHwpqsngcmcItdlFa8hsxXUTMYJpg4KSFqU
	 89I3Yt1EBp0Sw1pA3bimhO0eAAQGHTHYqQrui+PV7vSkj4OYIOhMte3WaggMBx+k2/
	 9VbW062jP+qUkRbKHilr2YIznuJmeqi0K//QqFr/Yfn5G5/L1dXfLs/0Qi60kJkeH7
	 oAQWppMSK2ztjZA+lBmVUfSKkz0kDDVza1IWSSfUnmQrzV5QVXgZv49z9jMi2RvXyX
	 c2rBRlL0lCrmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1AF608DB;
	Mon,  6 Jul 2026 10:03:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64AA52A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5651540A7D
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46shP-H62isx for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 10:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60C3140A86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C3140A86
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C3140A86
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so20361095e9.1
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783332184; x=1783936984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+u1fKCOO3FrVZ9ypQ7nxCbyWUjrzj43IEnUreUKkP/E=;
 b=FD5zNurvuMe1zinpxFd2Tk7TkrrRwqdYrfpqGml59A54IzIZSGFqgQSrf6WcxmDW6t
 n97zejKfsN/YvmvwgsDcZB0gzd3WHn5IcXNAdT8/REI0SkUkcJecEUElAVgsWweM/n9f
 fw++FtqVTfZT2GAKas0X5ghLCdM7V2UfCEOXb6egcqmI5eQGXEaganhNk2XVjKooH5tg
 e7qNVA7RHzdSHrme6rfsrbDN3lC0IakHrkwATRlse99nBScEDMnudYF40Mqqa3ZWhKUO
 7BqLFjvpdg6ROlGW2MM9mjSkVKVhobCPUi2uj8g5IpMB1o6oV2+rUmHQewQk3RE2tltT
 8OEg==
X-Gm-Message-State: AOJu0YwECYZdAXQcA5HBn+/CLnlG065xPR7AzmLV1bgiiuey2RyGB2vD
 EV78MjeiXufJOaQCQP1K5t0TXxzJ5tyHfyKL75QPFDaozJIfEpq30TTEoDtQNg8Gz81kOjoy6Ec
 u6ngtLBE=
X-Gm-Gg: AfdE7ckfDblAD0vKSeGj8XNiKvDHMSjvTTlJkLrNe2ykGGy6L6eF+x+Nh1iXqs2wD1L
 C2S5bvkO3RtYpB+ClvzbfEUiC83gm1EN5cZnfgfMbV40e9lngj52Y0UTe3W1oBvkaLNVHmsg157
 rN7ZJPKhXRaumZv12i6JNKNjA5DdhL9SRWmfpE3D1I5AhA7XYIOgvCzmQtitsYv3bvdHIdnCVkI
 dX1MozHPxXblgbw9fvfN9da+yVnWDycbHt9ra9L8smkX/JBC19gRjXvnmnWOBF/q+gIgQhhDUiY
 vf4CjUpYko0GMh3U6vSS7ilx1cRVQLOoFzSFRifHn7P3+Eh3eX6Uh4/tU6pv9io3IPlny2NjbdO
 8Ap9bB6Wss92q1FhynlYZsnc8I9dgc3iRd7u3QNVXAmcYnFSP0K4ts7kf2Pp2XtBk1JTVaLr4zd
 yeCa7JnQ==
X-Received: by 2002:a05:600c:1f8f:b0:492:7142:f46e with SMTP id
 5b1f17b1804b1-493d11cecabmr116023725e9.2.1783332184182; 
 Mon, 06 Jul 2026 03:03:04 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdb566csm260586845e9.7.2026.07.06.03.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:03:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  6 Jul 2026 12:03:01 +0200
Message-ID: <20260706100301.60854-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706100301.60854-1-thomas.perale@mind.be>
References: <20260706100301.60854-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783332184; x=1783936984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+u1fKCOO3FrVZ9ypQ7nxCbyWUjrzj43IEnUreUKkP/E=;
 b=NEkQ1scNCkCth3ej1mMfSNcClL7l/Z3JSBwFikm+9HXgk92P3aPZOsibgj7r/4R/RZ
 zmh6i4y3SM0dkCjWNyo8zmOhKWx2Nlwrwi8N12lr1dVEJVTK2jRG3ZIBPY5IHuTXAeh7
 tyrVTG1fDvOd0wtBz1yrHvfQ6zhBbs312fo9iXA2Tjv9eqN/vHfyKQoP/RhnF06h9FFZ
 zpyVZVJVwa2n2scBxbu5YezRgoOCG/kj5FRHgu6wxedS0F4xcSdR98MjpsDPfJGgioC4
 NuAjOpUqeuPasWxZBroAW8kcnyssaKgOH+/cG0+/y/TFHi6EQPtSc3xc6FwGE3K267lp
 bKbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NEkQ1scN
Subject: [Buildroot] [PATCH 3/3] package/python-web2py: fix CPE_ID_VERSION
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45158

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-web2py/python-web2py.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 5b473698a6..68847a2385 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.1.1
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
+PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
@@ -12,6 +13,7 @@ PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
 PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
+PYTHON_WEB2PY_CPE_ID_VERSION = $(PYTHON_WEB2PY_VERSION_UPSTREAM)
 PYTHON_WEB2PY_DEPENDENCIES = host-python3 python3 \
 	host-python-pydal host-python-yatl
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
