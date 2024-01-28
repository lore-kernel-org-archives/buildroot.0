Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AB3C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D548272C;
	Sun, 28 Jan 2024 13:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D548272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zt4vSYaGf-lh; Sun, 28 Jan 2024 13:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFCC82525;
	Sun, 28 Jan 2024 13:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFCC82525
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC7101BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C50AC607B4
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C50AC607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECluuYGPWjac for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECE3360810
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE3360810
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ae6f4fd78so527988f8f.1
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448062; x=1707052862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZpNZE/REp05SBo9HQu/G3U5gFNNLbtAfs+kRPcN+OFo=;
 b=paaDuSmrRrqc2QHgV9bVaXvQ/3/6+oH7xxgoNqu6wXa7fpITbC6RcHtMMoXu/LPyAk
 XhYJ7cH7AFO0a2vcdrnjaDqiV/DsiSDDGaxx7ULNDejPjrGEBuRqwglrSo6ddrQkZWSP
 YP2BXnrjV27MgoN040icSz/EStanOV+c66sNa8b6wz+b80rcHzfCQwpKY9pwkrYDTssN
 q2Mi1Lpz51xHx56div3Frm8FT7ZKTbkAiqaBA0F9yIwy6FcGtSdgPqX4SL0MpWKF5aUm
 EDh/PcyPvlqEE7xsmfgihvEyXfTEiexKs26VzCL32gcpHmm6ljllMj1TbJPLDT8kxBCx
 KBqQ==
X-Gm-Message-State: AOJu0YwbEbGgISkx4zIpWD9tDKF3rzidWbKfJEwCjFP0nDD0Rn2mfsPH
 Yb2sfNuSWkqryqUg7kmyX9iYhVXUKTLe5CxYPWRoGStybD+J8Q8Bwtd2OIqQ
X-Google-Smtp-Source: AGHT+IHA+Zwbz7KvmF3FDS2LuwAxkA4Uox1nIdKPg6109gUea/lTI77sYZSvdlmRgdAW6ea4nRraFw==
X-Received: by 2002:a05:6000:4208:b0:33a:e7b4:7a75 with SMTP id
 en8-20020a056000420800b0033ae7b47a75mr2024550wrb.34.1706448062488; 
 Sun, 28 Jan 2024 05:21:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:56 +0100
Message-ID: <3afcc982685e876ac9b2ae54f86164647040ab85.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448062; x=1707052862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpNZE/REp05SBo9HQu/G3U5gFNNLbtAfs+kRPcN+OFo=;
 b=nsXMeTqMre7DyOB7wK3wUbjQe/fTSVjY91/f88fq8EfgUgsR0urqRlSKxqlx4hqIUR
 f7rJWKzjQREipLT+yIETwZVMXWNxnMvBKrQnszLZeBzhUm/fHqjo7w+ndKrK7pHE/+Cg
 +klqbfPonhQ+0IvRK4pUnYZfGAU0m7WHt5385Tx6sBu0MY/JPSvQptfyh+YL2xm6mXI5
 2KgtWwAUWoMUHXBvbHtfN7T28YFfSD82baRfhTq7XarXIptG51KF7LFSy8EdohlWYZD6
 EWdfa2m/dx2LFjeUtjGEUJOvBVPhkC1NT0R8zWEfl6vt1dvsRHBdC10lsV61vtPwGAVK
 xOcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nsXMeTqM
Subject: [Buildroot] [PATCH 07/10] package/python-ml-dtypes: propagate
 dependencies from numpy, pybind
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ebe47e7605c6 (package/python-ml-dtypes: new package) forgot to
account for all the dependencies from python-pybind and python-numpy,
causing unmet dependencies warnings (unfortunately, not errors), such
as:

    $ KCONFIG_SEED=0x85C244F4 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
      Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=n] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y]
      Selected by [y]:
      - BR2_PACKAGE_PYTHON_ML_DTYPES [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y] && BR2_HOST_GCC_AT_LEAST_9 [=y]

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYBIND
      Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
      Selected by [y]:
      - BR2_PACKAGE_PYTHON_ML_DTYPES [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y] && BR2_HOST_GCC_AT_LEAST_9 [=y]

Propagate the C++ dependency from both numpy and pybind.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/python-ml-dtypes/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 72506896df..b0b67e0a9c 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy, python-pybind
 	select BR2_PACKAGE_PYTHON_NUMPY
 	select BR2_PACKAGE_PYTHON_PYBIND
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
