Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A077FC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 18:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C787822F5;
	Tue,  6 Feb 2024 18:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sx-UksyPiS8M; Tue,  6 Feb 2024 18:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 395B582322
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 395B582322;
	Tue,  6 Feb 2024 18:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 692161BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5666460BE1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bnVl9Po97_T for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 18:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2257660675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2257660675
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2257660675
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 18:35:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b4b0a3bddso346962f8f.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 10:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707244540; x=1707849340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl3Y5ugYDQP176nbQpKK+VtzPXYEvTohBnFtbaAj3i0=;
 b=j56tceyD+9+DQp43j4GbNkUM5JgupG/JdN6ROF0ZpcGcBzrIYePQNsLZctBdFEBprI
 lktSqgE4rSLHhjr338+SGHiicaVHgFEZiNRvV0zeVuBqIIJQ5+4/gPD+S5nR6kKcsp+h
 nPo8cbFREkxAT7XgL07dwjHOWh9c6dAKTCZ3d5uYC8Osj2QJIZ2uTlKfgOQ/UgYolAA2
 mSUFvRfcPIaE/P3UxN3uxXpIojbmDnbyJxWBU56yXT7Wmg7ADNZWao8qWMB6Wj+iHF5a
 ZUc1Y+8M0RThO5IYyf89sPbwbKI/azZSKm6zpDr9YUcwH4LmDCyQTyzNtUG8iea6BHFY
 hvGA==
X-Gm-Message-State: AOJu0YwIFu92ZV76BVWQcCCiC/CIFG3Yn0qbttAq8nMTHGEpLyRmIh/N
 0sGzLa7XGlb5G61mk6bsSdJUuHsNXC6zP4ymX2DawUATLp7fGEh58CkyAAwIVj0=
X-Google-Smtp-Source: AGHT+IE4Wxzyp9rs/ICIcdprEVtiY7Fv9/2geH1u9o8ORVKqU4Me4WGp0MFEPrDsWbzdUdIh5OtR0Q==
X-Received: by 2002:adf:f346:0:b0:33b:3275:2721 with SMTP id
 e6-20020adff346000000b0033b32752721mr1816095wrp.40.1707244539667; 
 Tue, 06 Feb 2024 10:35:39 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUfH058HounK9gxwcsywExwmvBdZvDxho8y6ox4VurPjGF5o0rUgdh7SSlTiWmZbEk8tSl9G6atb44jfSpI0i4N5JtV7icIMpFG06aUX2RaGX926aSYTEhKC+ALbq1FEp8iqyaC20NIViaxxtRGllc6xdXg366ftzwxxu/A9iQDu5CHZio4PgjeqpayFJQM5U+VjXa5rwEqWuZnYi8W
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b0033b47ee01f1sm1902325wri.49.2024.02.06.10.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 10:35:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 19:35:36 +0100
Message-ID: <20240206183536.284845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707244540; x=1707849340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl3Y5ugYDQP176nbQpKK+VtzPXYEvTohBnFtbaAj3i0=;
 b=CpFJOd+BeV+0GQqNgkwNkVa8+d2mYAuUPcF1PjybrSEXQDR399JOdd8puQYiaWCYLB
 JSiUGpLKDKJz2RQlRo/bWx3PkRz0u/Z1PCltwwXwPoOJ4e1YY/4hNDDkCYtH+oOKHEiR
 hxXsA3G6aj+0s5d2t5zKuj+dB//OF39rO/UzSWW5T2ChgFJNO9rfnqMnw38/zrGUcWNF
 hNgVKbir/mjVIPQ59NTstCdto5qTvgz/u+1+9AxRWFAzPReB4CXxZMA5cdkRzhJirAOd
 sjONMSnKzhWjYSuytSPvlgmW0QUgd2KJcg4PUTonnAeGdFoWS4afSZ+PuUBhBu/vc7Dv
 81cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CpFJOd+B
Subject: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: add CPE
 variables
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:freeopcua:opcua-asyncio is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/39E826E8-04D1-465F-AA4E-7A41B387D7CE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index a8be2c8722..226b9bbc21 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -10,5 +10,7 @@ PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/bf/c6/3c17b8
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
+PYTHON_OPCUA_ASYNCIO_CPE_ID_VENDOR = freeopcua
+PYTHON_OPCUA_ASYNCIO_CPE_ID_PRODUCT = opcua-asyncio
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
