Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2038C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADFF60D5F;
	Tue, 26 Dec 2023 16:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADFF60D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyDqgcCXK0H2; Tue, 26 Dec 2023 16:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2FB660E44;
	Tue, 26 Dec 2023 16:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2FB660E44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 995E51BF300
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6C840530
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E6C840530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASAl17fb0tbj for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:55:26 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EE4240182
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE4240182
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so44103765e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703609724; x=1704214524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSy1L0tc/NhxlxBLQjGYpcUyI80vo1CfMQk8jl4nk94=;
 b=eY01rCS6Xkt1Qmrf7KtPz4Ihd1g1H9Hu2fQ/Cp6CvufFIebA7nzXcQqoFa8RL3oyiU
 uMMgNJ620F4rmDUZr5FAblT3SQQxYLrAcLJB03yl1PJffMGjyVwP9GQCm+mw8PrGpeh8
 7ZM8dD7ZepXTLTCDsXvzdKieHU4O5uoVbiuWFvFrIiJvmFw2sB2wnNvaloIfR3hjOtRh
 dk3OZ2XIJ6HWPNq2MuulkGqypUMX3orqYmUf5jEX7qB6Rte1CkW1oQLg3G4NH1ayaovc
 4KCtDI4lnJ12HmzBQO/ZzwgQcoTCALtMvQlaTw0rZQr1zi8+L2u2UxGsVkQjsVX8mVfh
 VikA==
X-Gm-Message-State: AOJu0Yz10D9ox9FPzKQs2cTImAPbEVFq/YM/ByeZQOMcebUKB01UiV3a
 Xmc9IEKk8LghMUkK3Ug3QemtJ4SFIg4=
X-Google-Smtp-Source: AGHT+IGwqRO5dPfmKAqlvpuxNsYrLkaF31vd3IHyDqY7urfnNUuDJY1UWjImGUYsmsXkkd4jzoWDUQ==
X-Received: by 2002:a05:600c:4ed1:b0:40d:5776:85d with SMTP id
 g17-20020a05600c4ed100b0040d5776085dmr1639918wmq.122.1703609723724; 
 Tue, 26 Dec 2023 08:55:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0040d4e1393dcsm13742373wmo.20.2023.12.26.08.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:55:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:55:20 +0100
Message-ID: <20231226165520.806663-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226165520.806663-1-fontaine.fabrice@gmail.com>
References: <20231226165520.806663-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703609724; x=1704214524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSy1L0tc/NhxlxBLQjGYpcUyI80vo1CfMQk8jl4nk94=;
 b=aqqB87ZbIZ5H3iEbZH2BtKGOKKh9oAP7Kz5/zvqdRR3fG0zjFLK0KXlsLtKMIZXrnG
 z0AWX9yOmfg0e/I5GK6WbpLwbSUEPYC2qd8gQ5lBc741ZPfFkZPQkrBH1misrEluq/2u
 I6wuId0Gw7/D2UtZvHrF2jHmGrG9yy4HpG5pqxOm+BRAkxEOW2esx3UD8z5jNDCxaDmX
 +SJUwJBFceJ3rOcR5OUKj3kuoMzlrE+ZpVUdFtZduXAblWGm4d9p1XNa98SSCuWzUEIj
 DK/JedSjJoPqi4UIjrwp4RKbocyvYKrDVDeGb2iSxj55cvCsWi0Nqi7fiXLhUM1TrYsZ
 9Yaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aqqB87Zb
Subject: [Buildroot] [PATCH 2/2] package/libcap-ng: bump to version 0.8.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python2 support has been dropped with
https://github.com/stevegrubb/libcap-ng/commit/868a82672a398aec96eba60e73b9a8e8892c4d4a

https://github.com/stevegrubb/libcap-ng/blob/v0.8.4/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d4590dd739..bb4280368d 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d  libcap-ng-0.8.3.tar.gz
+sha256  68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a  libcap-ng-0.8.4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index c33460d951..5e3ca20029 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.3
+LIBCAP_NG_VERSION = 0.8.4
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
@@ -12,10 +12,10 @@ LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-LIBCAP_NG_CONF_OPTS = --without-python --without-python3
+LIBCAP_NG_CONF_OPTS = --without-python3
 
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-HOST_LIBCAP_NG_CONF_OPTS = --without-python --without-python3
+HOST_LIBCAP_NG_CONF_OPTS = --without-python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
