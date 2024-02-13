Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B03C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D59E822A6;
	Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xz_i5Y7xxoIr; Tue, 13 Feb 2024 21:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD2268229C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2268229C;
	Tue, 13 Feb 2024 21:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB021BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 947EC4156F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1o8gmZ9TBomW for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25993402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25993402A8
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25993402A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:35 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7c4085a960aso207100739f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858935; x=1708463735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujYSSub9HbQBZBQRLiscxSnxtItE5l4IkHmLsZSwMF0=;
 b=mdhGZ2jMI2fP5cHqCOfxz2h88k8UXk0lYAxLuTQx26oBnFJ+FSvOqV6PuLJvBygY9S
 llabec+nFHBAwYTaXoNFgy/C6EIjdlFVaFF71wdJhvC+Z9Q9/Zu46sN2kHWux+wNC5Qq
 kHemrdXkObaJ6wVG2LZjkpkbVazOyLJUl3PLGbEexJWoeqJe45pYPUe9ORQr/dw1s5YV
 AkoA4WSd+dxCkoKISLmsV3Yd2o2ti9cTrfN9PXKeOs+ilgJH8NpMc1NBQZcYc5uTVvH5
 lw9bwASHjsR2UI3mg7ONBDIgUYigeOdD/9bbDl1PZ0dLBJfcFSaMazRW5b+f1CCcHiTP
 XBYw==
X-Gm-Message-State: AOJu0YwSk63XJ/XIfKGJvw7nIWIp/ktKkMqK//7GHRZ7sKRBXjps4g3G
 2m5gTCzSj7JwJP/jbbEFd0sUB73FixteYVoSTCS5MSCZ89eDDG5uWEmBd6Rcq2YYaA==
X-Google-Smtp-Source: AGHT+IGd18VGadcrfkStyzpNtHTqE3mBArJ+C5vxE1qlKNmWGOc9TeyQY4cpq7VW16E8+R40ooOjQg==
X-Received: by 2002:a5e:a906:0:b0:7c4:57b1:555c with SMTP id
 c6-20020a5ea906000000b007c457b1555cmr997181iod.13.1707858934576; 
 Tue, 13 Feb 2024 13:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJbBXWWVMh+xftsSB+in1guruoZj1jA1tO7zG/EYqpqTAZWtb2Uu/XIqI8dgvOMctf9KzEkmLW/M8nleEiOVThPw5kbgpZNF5okg9mPUeMpWg2g5E83TimjDQJMxVxjY38//2XYIrzVge+qEzHSKaz6bc6uF8EcVBH99kjmon0sgrtWHKhrQXxPeu6hLNUJ/Fu1xHKcXhaFxhqgJjZNMwi4UTne466pHm4AVaogVgVwkE4FEW+jf9hcuxeMUD4+Urj8JNy4/0aOWYdq2URCvClnfwnu5+/tyduTOZBx5xXhmXWnTafxQ7QOF0rbNfvl4CrplA/iaWz9/fhlqhW/yoxV0hbaT0JVxIfXfz3yaI+fKHkIBhsC1iFJIK8H2s6E+6pg6ypI70bH8TeUE65dBfHdCihr2JiY+bnXbGxvvvetmsgQ4j/YVH2hwFSxFhK2QQ+gJncftK3xnJmnxYouSvaBNxRv/gqnpNigd1jRa3qgiA4bek47r90yAyH7rp6ipmAP7mDLOBqnFGVMbs8mzcCmlYLEiyrcaoj5aWj+jYTOzUd8DEbtH+YWwW9DQeFrevSsW7a02QUcnQfhP9uUNQH2XWWhNZObZWKDED/Xiyz9+Ngg3oe4THdU79l7eZ9iLDOR3v8GhzEzMZoqq0/dS8Jisfpdcg85cY4Ck6UaFBOh+pHsytLBGNlRAqKt0H/vGXXy1E0dzDtSHb80rjS6+nXOJqxYn7JOCOhnND3V0MHXbooAlMpqw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:52 -0700
Message-Id: <20240213211512.3918044-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858935; x=1708463735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujYSSub9HbQBZBQRLiscxSnxtItE5l4IkHmLsZSwMF0=;
 b=E02z2B2IN/IwAz762i+40MfNGSMaRxY9ls0uNCJSGNkFmpnyjXibCf2xr8+Yr68vLW
 KGX7useqL8SSagvk5hFS1nsfassmxOLhpuRFM3/JGLrf+MQu30eoUbCiC2XE1lT3cFi+
 sou9n2uXrYcffxSLW80EtmkkINhdAvJ1QyyHr6cdwVJyoame8q8YMyPf2s+tOp7bjDui
 DURagOPCkrVkBiUoclra3hoJA+tKW5waN4ZsQiDzB57xPivOPNaVuxwhRvf8c4qJuFME
 YyDoTr6UnqDM8Bx2xo9Ere7cfdewTJmNoMRMmb5Nj9jkT/8PYwL/yZbVebXD9kbESkke
 ISAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E02z2B2I
Subject: [Buildroot] [PATCH v8 06/26] package/python-aiofiles: migrate to
 hatching pep517 build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with a pep517 frontend we need to use the specified
build backend as opposed to the fallback setuptools build which
only works when not building with a pep517 frontend.

Fixes:
ERROR Backend 'hatchling.build' is not available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 582f7908cd..954647bf76 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -7,8 +7,9 @@
 PYTHON_AIOFILES_VERSION = 23.2.1
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
 PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
-PYTHON_AIOFILES_SETUP_TYPE = setuptools
+PYTHON_AIOFILES_SETUP_TYPE = pep517
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
+PYTHON_AIOFILES_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
