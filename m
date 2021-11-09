Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CDAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B01B61027
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B01B61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A20740391;
	Tue,  9 Nov 2021 17:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vys1y06bfWTf; Tue,  9 Nov 2021 17:24:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD47840290;
	Tue,  9 Nov 2021 17:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0931BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2992040290
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGzAE8cbpLxq for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:24:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 886DE401D2
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:24:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t30so34270855wra.10
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NgGmv6vSF30uV3ZSZi+ZlHajXRLU9HKqWKCbkcGxatc=;
 b=HEYB2UPN0Ld4s3ctZWRO4jeokanX6RiUR+4VLEzD059XMcwrcIe7K7jm119S8na8bg
 tWwTHfU4LAwC0gWRtVR+hrUZ9/VHAO3kiqdGpkZ7QJgyxonyjTZ/DajhMACHJvjxA9JL
 MWo11+6c0ABzj8cUcRmeqlI0RzhfEFDzmjOqHIGrDsn/ErLjE6eme6g/ik5FwoQK6kG0
 7ZEYWhFwAgHOaKulR6RmZdF1OWRzSSYU6RBbMTTmRmK3Z6/Q8X8gM5EN9WNEQGLZfUBK
 5qHnhFfkUdu4JrWPrZ1l3VO8xwHS88SnnLazDDxa5sFCgjFyq+IPy1Bj6AmlgOP4IjhH
 a7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NgGmv6vSF30uV3ZSZi+ZlHajXRLU9HKqWKCbkcGxatc=;
 b=7D8VQJXBaK7kAKDnkt5iQS92qkuVjuKdLKYsycpAb7+Knd5XCTr3rvHojlUlCjsvAv
 HDpd9YD1KCO4VCWunl9F7txRUlkT4uNkY0f30pzb+lNBmuXs+er//x3jTt1qmeQGPosj
 DtKBmJfroC4BcPe+zLTaMEPAu8K8DsD94Xs5o2XCtoJR0REq7iBvHqVlUKr7SEQXMjfB
 ZMpXSoOL3iEBaeh0WAoCefgX+nsUN57dkJGF2/7i3uJXs3lUrtmOazgfqXSoH9HvtmNs
 iFe3YsACz2cqo7Jev1ohkRlWQA8Mp5Re8eG3pwAoGkuDT7sDE57DohahhIuvON/YZoes
 wgLQ==
X-Gm-Message-State: AOAM530tTTP2D8SOBDBzZACvXV/IGVQwh+HiSVUIfSz1y87lhbM/nhEn
 2da83WxiQ6qUq1C1HPdfgHAA8ygOGaE=
X-Google-Smtp-Source: ABdhPJzMEVqdGnM5cI9GokzbUSDY+9ATnowzN3RoK5DynAMPH0+Z8wwY17RwCg5qW0JU6pNe7xPL7g==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr11295036wri.265.1636478641572; 
 Tue, 09 Nov 2021 09:24:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z6sm4583367wmp.1.2021.11.09.09.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:24:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:22:07 +0100
Message-Id: <20211109172207.457200-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: don't override
 dependencies
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override ALSA_LIB_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-lib/alsa-lib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 99c53f9408..3bdde217ce 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -64,13 +64,13 @@ ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python
+ALSA_LIB_DEPENDENCIES += python
 else
 ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python3
+ALSA_LIB_DEPENDENCIES += python3
 endif
 else
 ALSA_LIB_CONF_OPTS += --disable-python
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
