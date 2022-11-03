Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6838A6105D;
	Thu,  3 Nov 2022 21:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6838A6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbqDH0RbNM4O; Thu,  3 Nov 2022 21:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F34261046;
	Thu,  3 Nov 2022 21:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F34261046
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5141BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12FE74180F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FE74180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzQd3bweabrM for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84844180B
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E84844180B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:07:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b2so2408102iof.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PNGV6+Sx72HMjh3X8gwxDjkX2BrgLua4DZ09s2lhev4=;
 b=Nf0QF0s1GWfl76bvFxDOZoz/+P434ENrmsSeSZrFv0OWmld1Asj8RBMENkJfDmaFIp
 oZ19ORgRTEggTgMW+9C1RGWkrsQPyATk1g3VTQe37rUbppOBCitl5XEmaywNVXcw5OPB
 v7X3NbdAmMOf9MhyWIMswFPjG4flHR7mCAN82yWbtkDBgdlanfPky/raFsn5dbjA7f85
 EcqFhWxTiQhsFs75cbmzA3cdvVNKqbBqIh8EQvjZ+Z34QwDW77OhyaBfYYAdVKiQfOv5
 c/363DhMjWVevtMpdswQq+xWH0TUfpHkpAm9KcAg0sYISDjoagc2jC4zAmuPwCYRT1nG
 fNMw==
X-Gm-Message-State: ACrzQf2D+Dph1I4nX6xg/ZJs54/pKiiQMgGwJHDSEVVZgsh+cKy1NhO+
 lm7Xlyff0PdN+6gmG2H72SqtsjD1ADsTbvXl
X-Google-Smtp-Source: AMsMyM74Uw9NOUTZs9efwRMbGwLYD4AJAbK0m4h+b0AP51s6fonYAiBYp2pamin839NVfnqsuQOIeA==
X-Received: by 2002:a05:6602:2dc7:b0:6a5:14e5:d709 with SMTP id
 l7-20020a0566022dc700b006a514e5d709mr19492864iow.54.1667509642660; 
 Thu, 03 Nov 2022 14:07:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a0566022dce00b006afe1d84207sm751692iow.25.2022.11.03.14.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:07:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:07:18 -0600
Message-Id: <20221103210719.3477688-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103210719.3477688-1-james.hilliard1@gmail.com>
References: <20221103210719.3477688-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNGV6+Sx72HMjh3X8gwxDjkX2BrgLua4DZ09s2lhev4=;
 b=fn7xn8A/hNhPGjxHfz5K6VcJUl4RSlU1N5nlb5tW0dsUB1+okXll0H2+/NZ1L3COdU
 7w1ZFpIYeVnPAr59AbIjOv+v9ZcMDClfy27X7NUCko8OAXnzHi5EyTurMk762PCAUR5c
 fzJlbfseTobUlu1HWX0R3Drcxp394/YJ7pHlpF30hF+uLWyRNh06dqxNDiLBG3yjCjZ+
 9GurvHJ9SH31/G52TaGiKAXw9ykRnPDSUTnWR9zz/+OytFwd9rLGmVTdjVdnW3SXnM3J
 8zAOfZ9RESCFfSoq4tDqfdefJpXGausNtXMc6BA4zO1m1my/ra+9zAs2qecCt4sMMdvY
 YIJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fn7xn8A/
Subject: [Buildroot] [PATCH 2/3] package/python-babel: enable host python
 package
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is required by the latest version of python-wtforms.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index a503a139f9..25e74e4c56 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -10,5 +10,7 @@ PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/17/e6/ec9aa6ac3d00c3
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
+HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
