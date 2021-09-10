Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56484C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:02:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AACB600AA
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AACB600AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5075F4029B;
	Fri, 10 Sep 2021 14:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pL6a6vejNIAn; Fri, 10 Sep 2021 14:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F34C40209;
	Fri, 10 Sep 2021 14:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17B281BF489
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0497281A3B
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 083k0PidWOmH for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:02:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA118818EC
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:02:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id n27so4480335eja.5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnVQtjPhyaARGk4KB+GueY/aM4vaKgpdSuo67RbEFa8=;
 b=SIUwFtp2Lf65etCsWkADy3Z4MbNeNU5jJQAnXntT65/W7CCSTwNFLpfDLBqE3kA7Fm
 WLIhcM/2vn9/mf4h/nOJ2AnXfLHUaBUIbdOUa80Mq1KvcmzGcoKYpYDu09hqD6TJoD32
 4R2n8m+9VXWinSS4eo6abxAmHCbzdCQuWh2Xj31Msy1IdInJshQT9Uj37khRozSOxsJ0
 /aenEOIAF7t+pRZEqBrJLon20DYVQsV9VFdvuyjxVSkn0gP7bOXz3Hh73L6NO505JcpS
 yua23Bag2OUXtnAmGHHwfMQZ8EOTS/zLQHCbarXaoLzJfU/8YA4BkjI0kVXK8cb78E+t
 gqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xnVQtjPhyaARGk4KB+GueY/aM4vaKgpdSuo67RbEFa8=;
 b=5XqzcOP+uIIGj0BALQLXvXBv6GifIXyVgYxyLMuKicMKsJ3g0D4tfQgvpuvU9KrsAS
 SubczV6AxbBPVqhksIvYtb85lbhcQ4mXNP3bmwkPq/XvdYuoFT9ZWfEkYgBnsEpdktQ6
 JEXZ+YI19V/cAqam6/8BlwAqS82ZNXYCgemJF0BC+hKkVlG5X/8RVCoxjqR3zrcriayN
 hEdMVZ1SMmlKlq9Rz3GnvDwsjxQWnPdLDho5NDdoeOdMQUMXNThwMCJxvrVlgrlbkYjv
 Hdu8ykHc1C7FV/nPnItYBtUY5nAhVK+XBPHOjTgMvr6/OPTCPg3k368EudgU/wLpaY1O
 cDUQ==
X-Gm-Message-State: AOAM532UzIJEGQ7My0LjwLgPb4sfpjcnqIwwK93ZCyMu9d1huZDUoEZw
 E5bn8N4vKh2GLVDHMy4HsPVvdz8O+PA=
X-Google-Smtp-Source: ABdhPJx7T+TDQ5R0wd3n01DVIMYtfnQkAdxvHHlxRHvGuIAfQ+TZXuGqR17ghC44fYS9JkCGjRQ+jQ==
X-Received: by 2002:a17:906:5045:: with SMTP id
 e5mr9957035ejk.239.1631282565239; 
 Fri, 10 Sep 2021 07:02:45 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d3sm2505019ejw.18.2021.09.10.07.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:02:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mOh75-0006yd-0V; Fri, 10 Sep 2021 16:02:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 16:02:40 +0200
Message-Id: <20210910140241.26771-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/haproxy: security bump to version 2.4.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fixes the following security issues:

- CVE-2021-40346: An integer overflow exists in HAProxy 2.0 through 2.5 in
  the htx_add_header() can be exploited to perform an HTTP request smuggling
  attack, allowing an attacker to bypass all configured http-request HAProxy
  ACLs and possibly other ACLs.

For more details, see the advisory:
https://www.mail-archive.com/haproxy@formilux.org/msg41114.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 9edf5def08..3ad5e4ebe8 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.3.tar.gz.sha256
-sha256  ce479380be5464faa881dcd829618931b60130ffeb01c88bc2bf95e230046405  haproxy-2.4.3.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.4.tar.gz.sha256
+sha256  116b7329cebee5dab8ba47ad70feeabd0c91680d9ef68c28e41c34869920d1fe  haproxy-2.4.4.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 85d4fa7e8d..91cb71eb7c 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).3
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
