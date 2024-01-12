Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC39FC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 22:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD6B4048D;
	Fri, 12 Jan 2024 22:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BD6B4048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfFCf4LJZkmj; Fri, 12 Jan 2024 22:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BE340474;
	Fri, 12 Jan 2024 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68BE340474
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF95E1BF228
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 22:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1B736FBB5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 22:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B736FBB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kh4mbR-S5hZr for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 22:19:22 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C0160E73
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 22:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C0160E73
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso5784049f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 14:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705097960; x=1705702760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rw3ieOGTN84JE+9a6pmE0b4ZcjBevQBmpStzgXyKh2M=;
 b=fqHWXJumgxz105G2wwUITLzFXXhRtLmiD6xeq7KXfuIyxDsoCUUt1jojjpcosvcvY+
 rjcx+RH6gX4ogMBOUiEnHaI6qxKtyGzR52ig0DOl98FsvXky7mE05IHxdVRRQilZdWNs
 A2gO48MZUpOr0DyB58e4LcfeZR61hRP85E7Wk1Lf78Qd/jWgT82ExGqjmHheeGeHdj/2
 Gz2cVTmQWTrMI7Sc6fifGVPJlU7osXX4elK8fPuSnOipneFGlec8+c6mqTibrax21iBj
 2Zyi2jEaf/9pXfRbrKcWVHgEbbMOn2MNCcd3SnChQFMl41TBrLK3XjhTiQV8LGj+U0dn
 SZiA==
X-Gm-Message-State: AOJu0YyoVhKDd0+RNJ2+5cCWny474QhWQD9cvzwQKXuIo9vXS0UVmDcc
 SB2UGVxlCdg2FaUaUwcGUOYzH8Dm62o=
X-Google-Smtp-Source: AGHT+IEdpmbM5oWYfOuJcXO7yZijiVlqy0IXBpkgHJ5xnInbop1GGTE/ml+ea8xe3tN/e4gSgCtXAg==
X-Received: by 2002:adf:f8c3:0:b0:337:3a52:9aca with SMTP id
 f3-20020adff8c3000000b003373a529acamr941247wrq.136.1705097960264; 
 Fri, 12 Jan 2024 14:19:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d424d000000b0033725783839sm4959901wrr.110.2024.01.12.14.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 14:19:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 23:19:10 +0100
Message-ID: <20240112221910.14778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705097960; x=1705702760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rw3ieOGTN84JE+9a6pmE0b4ZcjBevQBmpStzgXyKh2M=;
 b=hnc7upjpibUX1WtwX8NZ6W3Rbf9LuDA+kTVmZlFHVvaXDv232fKJ9ikwqD6tBo4pth
 IjPnwHt4LVxnvH6ucY2gdOoiX+pWEQz96j3Geb+9J0RLpkgsyJnPahg8Aag2dV8jIy7Y
 3GLyrCyaNm2x5Y0J3/XeAoTN5HETz5REgHL96OcER5op9cx050q0K26ysizwZeS6FmIM
 N84pBdV1FfjWNbnTlojUnXEV7kQ+jRK5Vt0Lf/0TclfosZ1x+wXWVyghGW6r4GqLqJ6m
 i0Jw4anvP2XhGOIUS+iOoir1yEytNlIwrWHpq/Qie1zjUNZbgM5tYhERzEe/6zkL5Pmw
 KzpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hnc7upjp
Subject: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: needs C++
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ebe47e7605c6cde295e209d80690508cfd11ba61 forgot to add C++
dependency resulting in the following build failure:

../output-1/build/python-numpy-1.25.0/meson.build:1:0: ERROR: Unable to detect GNU compiler type:

Fixes:
 - http://autobuild.buildroot.org/results/6f3532598355732b289730fc751e9aebdab4b0e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ml-dtypes/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 72506896df..91aaf72dd6 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ML_DTYPES
 	bool "python-ml-dtypes"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # python-pybind, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
@@ -11,3 +12,9 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	  dtype extensions used in machine learning libraries.
 
 	  https://github.com/jax-ml/ml_dtypes
+
+comment "python-ml-dtypes needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
