Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA120E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CCA881F7C;
	Sun,  1 Oct 2023 09:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CCA881F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LY7YYVLQGVCM; Sun,  1 Oct 2023 09:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D221E81F6C;
	Sun,  1 Oct 2023 09:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D221E81F6C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0275E1BF5A6
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE6E402C0
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE6E402C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKgA0yicO_IS for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:19:52 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABFF94028B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFF94028B
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-79fe612beabso266350539f.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 02:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696151991; x=1696756791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65hXgXMp9AHuQmzHkiT20nTb++MW0bzvdS1NZmst2Uo=;
 b=wuPxiKlBbztsvB2JmKMKHgvp8kPUzY0h1CM2xus7TgMvqTuvSKPKEC2OFQXyOG9Lve
 0Xt3VVrZviVJ1VT5h5z9LOzxW5NS7QD0gjycK/2tge7eX+EHlr0NqQmjHTHcehT+dreE
 TgZFdJ+MRKkhYpLUUwjdygsxva8+MEph9K5+51d4wFmRMPiGhBSuv/N9dl+Gep/YMFhx
 j2TxJ5mKEK5Lv7rLDCPvy/Y52vFa7x98AYzjuFde0pozaXo7gVNErXQzWZx7/J/xAkVe
 ztrNJrbVrQKt8l5pffngxxvcU2jp3hN1Ed1FEB+/WLuQ5YMjEkGzpJPaf8WFUqjxU1bL
 mpJQ==
X-Gm-Message-State: AOJu0YyZ2ozLeFh9jK5TmB7gRy+LHWrITe7dgqk0W/R160mamiS3yFVL
 w1TLcpOwE8bDZtCCPVEZHUpjDTrQtdAd4Q==
X-Google-Smtp-Source: AGHT+IES/vJbeuae4m9O4e+aywE25652fm0+p+SXQ4VgKtUAoo0hurwBJkSYNeJu2ddi051niGLIfQ==
X-Received: by 2002:a6b:d002:0:b0:79f:c9ad:19ce with SMTP id
 x2-20020a6bd002000000b0079fc9ad19cemr8417602ioa.15.1696151991250; 
 Sun, 01 Oct 2023 02:19:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 g2-20020a05663811c200b0042ff466c9bdsm6287565jas.127.2023.10.01.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 02:19:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 03:19:43 -0600
Message-Id: <20231001091943.1772441-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696151991; x=1696756791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=65hXgXMp9AHuQmzHkiT20nTb++MW0bzvdS1NZmst2Uo=;
 b=V89HrM+HQXAc5exsXy/pmYVcDIDS9tQwFjaByaIOT/85oHyguCFiS6DnIsaBji7ZgY
 YIqQZtXKQReRXKPze5gclf3EXuO9BxZsBAljmeSbmyZek7WjgsIGUlSrAbohxRIT9dVc
 mNQBqmsphnQjxzwwFiVzwXz5iG2qG1tKJMn5Eq9feuj8T5HU2UZJt2milj0jU4h9Nsun
 Mj36ozRJHyNpw6vpl8R08ZjE52Ie+ulKJsmv/q7vE+/bepw6Gj0yCSoEUgex3FISP2n1
 lbFeZguaGwDdbgBheroAXaK9H0CqcQSUf269Z4UnuiAUPeuz7Qvc3tD1uJFBftjYV0o4
 8caA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V89HrM+H
Subject: [Buildroot] [PATCH 1/1] package/python-pyxb: switch from distutils
 to setuptools
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyxb/python-pyxb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
index 6af10b51e7..8015bc874a 100644
--- a/package/python-pyxb/python-pyxb.mk
+++ b/package/python-pyxb/python-pyxb.mk
@@ -9,6 +9,6 @@ PYTHON_PYXB_SOURCE = PyXB-$(PYTHON_PYXB_VERSION).tar.gz
 PYTHON_PYXB_SITE = https://pypi.python.org/packages/e3/09/4fdb190ea2b7cb43d6d3e745276ee69f4d6181be70fcbfda7df3c5f72f0e
 PYTHON_PYXB_LICENSE = Apache-2.0
 PYTHON_PYXB_LICENSE_FILES = LICENSE
-PYTHON_PYXB_SETUP_TYPE = distutils
+PYTHON_PYXB_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
