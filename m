Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0980EC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8921F41936;
	Sat, 20 Jan 2024 21:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8921F41936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbN9eEhIs8Iw; Sat, 20 Jan 2024 21:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7546418A8;
	Sat, 20 Jan 2024 21:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7546418A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEEEA1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8530A83DDE
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8530A83DDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hV-LWC3fltLS for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:08:57 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B43A83DC1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B43A83DC1
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40eaa9e5be0so104315e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 13:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705784934; x=1706389734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pa2FAM3bh3Bnhso0GNnbcORlRz2Ukye35IJyX6X9gYE=;
 b=abi8kfzTwUWE/yAczBd4yND+qgbQ6gLVZbPnsj0C4d/4qMzq/T+i0H+tJHzv/abhzv
 GZnlJScl+Q98G0I/XGEq7IOlbh1AFiOxSiqVlzgvRv3Taz9uJZ257L53OmGy5eGXNVD2
 PZtVb56MKgDa9MyD38x2Ddmm8EzU16MNFI1DwVF7MdZo++BNUeUF3CPR51SfqM0txef6
 JWZQTTlKZk1fRRdS45T3BuMVHoOju2VeI4tZ1MzyHQepqyfREfftkxZcX8WOXshYbxJ3
 vtjq/hwXhrNNRRMRdPWoP3zn2B8OcnTWRfPgygwWJOKEZwdZl2+RHO7dy5RjyhtucEkv
 9h6A==
X-Gm-Message-State: AOJu0YyXVYLXwSOrAjmPj95isJ5TQ9EEsyyqUMGi8UKob3l354JJ2D/R
 nOpgQ3vBddZiSU5U9LegSsyLhdTZgLxpZlkHxP9VKom32RWBuC79H/P1ZWaE
X-Google-Smtp-Source: AGHT+IFWDkQH7F9bG4bC4EZKm2Ng0gor1s7VaDFQKXqF3w7HJ2UqNHHQCVvPqKJQk5UhYQ9vyfkxuQ==
X-Received: by 2002:a05:600c:28c:b0:40e:4dac:f24f with SMTP id
 12-20020a05600c028c00b0040e4dacf24fmr1023528wmk.199.1705784934221; 
 Sat, 20 Jan 2024 13:08:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c1c1500b0040e9f7308f4sm6080117wms.10.2024.01.20.13.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 13:08:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 22:08:51 +0100
Message-ID: <20240120210851.82987-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705784934; x=1706389734; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pa2FAM3bh3Bnhso0GNnbcORlRz2Ukye35IJyX6X9gYE=;
 b=iL8potitXQq/glPw1cEaqCeKUalAkRrMFh1W9YHGtWQjNUisRkJoUdugxjiNpKHUKs
 8WyitYTuy/WPs1q7t/3jy2ED8yJL03N9Iq1oXoqxRHpYzyY3n/UDDe49KICOLuwAenEy
 7i6C5KTPLfMVzUA04mzTRsB4SB882cSkzPGxY3KttWCf9RZNmDSGd8/xNkJqFCeKn0HA
 HigZh3zV063Wa2SuE0gwGrOG0bz+5gER8xYbfNr9WH62+SF+nCBxrSJaVmdkkR0ck9fO
 WZO1zE6q7YpNt7h5GC6WhP5E4eS72Raa5GDStXLF7rxeRN8fvRKtlJC87xah/ppNcoLx
 tfkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iL8potit
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gunicorn:gunicorn is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/DAF075D2-70F3-4D2A-B7C9-75A7A1C38C83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-gunicorn/python-gunicorn.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index 03ff5a49df..effa93e5ef 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -10,5 +10,7 @@ PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/06/89/acd9879fa6a
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
+PYTHON_GUNICORN_CPE_ID_VENDOR = gunicorn
+PYTHON_GUNICORN_CPE_ID_PRODUCT = gunicorn
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
