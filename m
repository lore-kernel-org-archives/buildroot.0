Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FDC840158;
	Wed, 29 Dec 2021 08:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfYyexlTcDkn; Wed, 29 Dec 2021 08:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3770E400C7;
	Wed, 29 Dec 2021 08:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1EB1BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BD358130B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwbeopzWq0fq for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7656E812B7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id l3so22985154iol.10
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlqKXgl6HaMiinhTJXatrY4SuZUsehjC0zTBciLWVQY=;
 b=MsHKmsjmyFQQ4KCX9acvbnJhr0MD8GsO5EyulIBSW/DzKz9Lwa/Hv8+Bo4kTgvF81M
 LH/ASNxWmg+yagn4VEEGzONQ6bks4qVEHYiJ5XD9gJBNQtzyYpoXXHz4qujIOhBXM+AK
 vz9J8kc7DYhh3uSwIdmQs7s23al3rEsjSvYnryPbOVrl15OxyYs7kphG52aA/0JDPps4
 MySuC0BuNLvzo2FLaDIaTgaCeR6df1Fu6/0tr/mkp+FW+MFWUDjclIhTn81IpSivmSl3
 px9a+jDxt48bBn/T06AYCibofw4EfkK1/ZLfA8ilTbtqGjQ95ZxFwUkrrfZ50nH1U9Qn
 yNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlqKXgl6HaMiinhTJXatrY4SuZUsehjC0zTBciLWVQY=;
 b=DfJUAU0AEguZXryqvfNRKP2eluiEa6LTPDaUFMvOKyP+oQrvboszycsyVSgXAEDnFc
 A165abqbia7L7GCPkRAPaZIiHLQGqmTt09/j8Qc6nY6wtozC5PaX8OLAPmxozSR03+av
 dg1LRJOqp5Fvq7IHK/z/ADQMRpPF2+sqq4ip8UIEW7x1kxJaf9OMqQcJqnwnxe1XjL2V
 sYoh9twSgaWm66CUqZro5AQEa+KvRiGbxYM6HIzljUv7layxRtpmz8L7C1sPqg15FVYP
 3m+PnIDgEm3TlCArMGizn/xH+FiNPEZQTeGLw1YC7aZy+7EVV6ArHfQ0hWRbD4ur625R
 v6+g==
X-Gm-Message-State: AOAM531pZxiTAFlrjDwqZ4mPcsBNFYE8s5w7pqdh+i+h9Xy00dafv2Ei
 d9UMBKHS8fN1XvLCCMTj3p6DRQySuZ1sZg==
X-Google-Smtp-Source: ABdhPJxKAB4DSyeERa+zyrPYjPcwtsKJoQ4wOhcYLfq841FcItNrVZy4JPIy9C7swCbGHQh3hSfdsQ==
X-Received: by 2002:a6b:7711:: with SMTP id n17mr10915819iom.21.1640767353453; 
 Wed, 29 Dec 2021 00:42:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:21 -0700
Message-Id: <20211229084223.521362-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] package/python-packaging: enable host
 build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required by host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 6b54d2416d..e2fb9b120b 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -10,5 +10,8 @@ PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3a
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
