Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7DEE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 432306070A;
	Wed, 31 Dec 2025 19:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8z4_bQIUrUrA; Wed, 31 Dec 2025 19:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64EA160762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767207992;
	bh=r0GBvxHVY1bN2VTZq882XrFm8cEyv8qHmBIwGtfpF5k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cR5TtEkIIpGIUkkQk87tG1mphLWdUNGYg1zlnyNLB2ayxgKQIqsL29VIjJ1wP5Ku5
	 l1Q5zr36N/MTh+dK1g9xWzyqiQOzDKwUijBkY3/o0CcvjkOBq1hdJwGqvHjse9lIWQ
	 MwxL790i7RO5jedbRFMXQs+FlPgvpd2V5UCpdnPHhF4oFTMEgcF8+5SmHTi+37hUd7
	 fSqR4qv9iwS6OjxtRT/cSN/Cmrk6eOV+dCMRYNu4BKArUPthgwEvR614Tua9BkBoT2
	 /vF5XyBWE+lVhxXZHtITeU6Q5Kqa3Ka7k9Fj8hJY1IXfrOb795HJO10BCX9OWzCxXK
	 WWk7xq2OdXZPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64EA160762;
	Wed, 31 Dec 2025 19:06:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67D6AD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599BA4007D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PB4KebUKMWE for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B7494007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B7494007C
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B7494007C
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:29 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7c765f41346so4795101a34.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767207988; x=1767812788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sz0pH71cEMyjchML7Pjc00iP3qLbo9ShPoahU9QRpv8=;
 b=LJS+2f+/0whyCwynhmM+ImNDLxs60oqOzia9yIQt06fszV9W3NXUtTnTJYhyu6A6Gg
 v5GMpvSFzQrfFB4tw08Iyj7u+L/moO2XHaUrg7m0XkwWXHNMY++0YaqS7IrCd4bbSbTG
 XZhAEG4HvyCLL0y2DaN4oZyepdn7Eeqv8diBNUM6knBhaNiEu2CkmVdI8iVjM5+Zz87/
 NOwhUHaSQ7+OqEiGzdkHmSAwh/zAVV4bel/wi4aoJivxRfoMtSOE2tyPo9M0hz5qMN02
 Aj4bWT7Cj+7y4H90cW3VsMyEfNxVeUPBTBQCip+NGtuSCesvLCqZJ0vx0vHZoIybIcAh
 Kwxg==
X-Gm-Message-State: AOJu0YyLPTIS/8l3YQfwBnYR4WLbm0rTn/DYHKNDVGEVFuoe7VYv8haC
 TEme8kkE/xgWPPQxKJOJWcWCitMJazg4s/NBZTfJLcMmXPoyzhgM0YChVJySQSLAILo=
X-Gm-Gg: AY/fxX70ajsTMp918krGu7ema+SlnCULFFJ0nJ1d9e5OyR+K7nFd7jRAWKvFdan1QwE
 5aOoNEQl6j75PgTGjtDROoO1Gz/d9MdgjFt1reUttiCQkhxoqJR2yT6PfZR4dYqCjQu01j4D4/t
 vdZJ0fyypl0TBVbEfl0aSoJ2cHotsdqsciptUXlepYNjuqCSQPxKyqZYTJJkwUmEnqYivs5kMpH
 pS4mbLHGUyKHxTTn9wbgG7ohhejMeFvq7zfBpfg5rtLeJfz1nv6IKYCwsMR1dAre/DqOtbCXhND
 9rDwkjfD5OKVUG5SZ0CfVs8zJrZKv+1+Qcc3JzMatKhMFz9C5rVis7GveGYLFeSHU2vTDbkVeID
 Cgtglp6oJ8qopDHRieL2Ta+JlCrmvTx8jQIMxsxuWzZfsqQRiE9c8jPATTCCArXYtpQNGDuwZ6v
 GizUnJYhyA+rsSqbvs9TAHLsVqZrGFUsptCBWMVsWKQQ4nnWE5c0kleFE6mCVQ44zgQJHt71Hgw
 ouCOGCUesKM6NBgmtDmbZuJysWTlaNEBT06zutZWPh3otyv/5fzDGU=
X-Google-Smtp-Source: AGHT+IHV0sko/Nm33FQKp20eSQnIPEwwcwlXvEhxZALMnFMjPJVhMVmnXLQI7OwexGnD+jlIjTdVEA==
X-Received: by 2002:a05:6808:4fca:b0:455:daf0:9999 with SMTP id
 5614622812f47-457b200e4d4mr13240122b6e.50.1767207987986; 
 Wed, 31 Dec 2025 11:06:27 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-459d35531a2sm5340579b6e.14.2025.12.31.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:06:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:06:24 -0700
Message-ID: <20251231190624.3980084-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231190624.3980084-1-james.hilliard1@gmail.com>
References: <20251231190624.3980084-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767207988; x=1767812788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sz0pH71cEMyjchML7Pjc00iP3qLbo9ShPoahU9QRpv8=;
 b=CSRXA6IVAgEzuLPUsHZgdd4UEPdvSzJFohxLnkTYCasckR/h78Nd5kfMR0cLfuKNEN
 i22vt2YvLifw7DAJmqyIcvOYQNLghdrrJ311Qb957Gje35LQkPr4VBiSkKrysHQjKKBO
 KbwkHGVnC7h3eebkqKOp2vzJz2wLbeVKPvptHLukl8OVFFFZLB/dnxvpMYSyTebQQzJv
 Af05dM+tKVSpbKSEL0ACZRK71E+VLzLF9j9zN1CT2eNEPmrBSb67Xst1H0TTvwnZKbyd
 r8e5ISnyuxjdLQZJdA4ow3TFBOfbIzxNanWjDgbdBwDOPT3aYvqH7jNQYzQQbbWuXRum
 r7BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CSRXA6IV
Subject: [Buildroot] [PATCH 2/2] package/python-tempora: bump to version
 5.8.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to move to license generator migration:
https://github.com/jaraco/tempora/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/tempora/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new host-python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 15bdaaf783..71c42cd298 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  ca7fb7c9523fb5232b734a19dae05c6a  tempora-5.8.0.tar.gz
-sha256  1e9606e65a3f2063460961d68515dee07bdaca0859305a8d3e6604168175fef1  tempora-5.8.0.tar.gz
+md5  208d59bfe14a913199d3e284c56f195c  tempora-5.8.1.tar.gz
+sha256  abb5d9ec790cc5e4f9431778029ba3e3d9ba9bd50cb306dad824824b2b362dcd  tempora-5.8.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 3b6c644b53..facd72a999 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.8.0
+PYTHON_TEMPORA_VERSION = 5.8.1
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c3/f2/bbd6d2178791eaf8bac06857cb0ee39840e69f7b64ecb0c414bf8f46daff
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/24/64/a255efe5edd367d12b770b3514194efdc1c97e5ed6ce6e8105d834750dfc
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-PYTHON_TEMPORA_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_TEMPORA_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
