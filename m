Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683CFC4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1847060B95;
	Wed, 30 Nov 2022 07:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1847060B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YroTtcSIFGlj; Wed, 30 Nov 2022 07:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E07660AD4;
	Wed, 30 Nov 2022 07:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E07660AD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DFAF1BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46EAC40BAD
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EAC40BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DO6xAbjRp-H for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EAFF40BB2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EAFF40BB2
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso748775wmp.5
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0c7obeKG3qIzDwCEIfBbystpKvfQp7tyt9I7DR5JFxw=;
 b=ycu3D5XrPJH6654fMZ7wudZCLjIHlCaWeOa84uUrjYCDrQbUuMMzqqJRVJTr9mxJN2
 bsy5ZQFj36MBv9lz+kM8hLu74NjDOJURvgOO5kNXerDYLPnzK8ISCdsawoKUigeiaJo5
 Mf1BdFVAr21IJIK0y37HmH3iq/nYU7YKtYu/HczN1WPtKBH39J8Rj8YBh9hptsXRWpaC
 FrjuxZDNY4Boyc0Z7FIMF/NEqce2sg+ceFN6p2ci2nALQnUtzX1LmvyAfPyUQByHuqaP
 r+3kn6WtSqehZcJdAmk4TQXfkDz5PpYWQqRzvBXl9xGPKq3genKQ5HjwendlOXsZ+Bue
 BPbA==
X-Gm-Message-State: ANoB5pnScKRXWypt3Zg71pM4tobOOC9hSizXu10pOu2DgPUOxY8ZrMUR
 QiYwkqk9LnEhRZ7Wh4sC5Uz4ZYsbx6vlEQ==
X-Google-Smtp-Source: AA0mqf56aVB5g6GPdcudmDppV4rjK+a1r6CLUstObafS8ENVus5gFe2MskEOzSAj6OU4MOLy+3VvDw==
X-Received: by 2002:a05:600c:4f05:b0:3d0:3d33:a629 with SMTP id
 l5-20020a05600c4f0500b003d03d33a629mr20609390wmq.126.1669794908089; 
 Tue, 29 Nov 2022 23:55:08 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:07 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:51 +0100
Message-Id: <20221130075452.2507453-6-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c7obeKG3qIzDwCEIfBbystpKvfQp7tyt9I7DR5JFxw=;
 b=BbDOBMQU9qhUSm/7cROFc2zy1TBK5Vw0FoFKSDf3u7C+n44oRVfuiAAQQBXKNJ3DAe
 fW7pwAzAz+Box3+FSfL5LTaPB9bMw9gH6T2N9Z0CA2l+KvBm6s6/agvVa6dyeN6ubTvW
 rdVEq/9+IgF+rGLLN82/POZ+OzpELXShfKGXLog8r1m4OgcRVNNmQ1Wk0bk6QH7vFg5N
 s23xu9fMh1A1cIX3VGDepsi23SkxCUeNtDRfnhsxQ46gQ8dvqeTsGLs4z6AvrRaqf8H6
 RdKSgh/ViRM5UWyYLeOnLUWfaIQ4lacUopKHmxNNuSr7BIaCojohqzYGh0KemeMqVgMf
 hchg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=BbDOBMQU
Subject: [Buildroot] [PATCH 6/7] package: optee-client: select
 util-linux-libs, libuuid and pkgconf
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to use login methods `TEEC_LOGIN_USER` and `TEEC_LOGIN_GROUP`,
a user space application must initialize the tokens with the SHA1
hashed UUID of the user or group.

Select host-pkgconf, util-linux and libuuid in order to use `libuuid`
and add supporting libraries to optee_client for this type of ACL based
login initialization.

This change is based on commit [1] from Eero Aaltonen, merged in OP-TEE
test build environment.

Link: [1] https://github.com/OP-TEE/build/commit/4a27543494278a5d93e2f44d58e413d90739b08a
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/Config.in       | 3 +++
 package/optee-client/optee-client.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index cc7f176c77..ed7da4edbc 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 54cc112c5c..a671b66662 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -9,6 +9,7 @@ OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
+OPTEE_CLIENT_EXT_DEPENDENCIES = host-pkgconf util-linux-libs
 
 OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
