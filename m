Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1671C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 20:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD2684741;
	Thu, 26 Oct 2023 20:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DD2684741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovzsKjbN_RxO; Thu, 26 Oct 2023 20:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 781F78473E;
	Thu, 26 Oct 2023 20:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781F78473E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1511BF314
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1330140184
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 20:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1330140184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERiXSYyqj6G3 for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 20:36:38 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB04400FD
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB04400FD
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4083cd39188so9846285e9.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 13:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698352595; x=1698957395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JzpM+s74JoCRrhnHsQjoSDFGhj41p2InyaKYZqPQ+g=;
 b=tYop0OTx5iYDwrzNfzTggfRq+/Kzr8KlyMXl8ViRFgW0hH84dFgiRxvvzmaK5SdfLF
 oqFiiFzq6sFXOTxdGjZTKlvBTbzRH8HW6bD4yq39IMukL0xuTIyZvAvRa5etu2xgnfHL
 +DbV7JERX8E0PJRBtcEjRtjZGaD4Q0Ci5LFmltWl54kiwKhL2MynKhckf4iR1X+sloz6
 GKCT28l+mOoXhgy4638TzMHeeEJJFqiNJ9nBTVecOAHblCaE4JiNOxiEc/tLdmgcmfE0
 gnQ0igRTbGGpKtNd0aTZJUayEYyTsRg7u/hdwfelGkD7WmG/I2+PBvUka3L/1NZgLpK7
 gzDw==
X-Gm-Message-State: AOJu0YyhAaf1HypvoeUEoXelnwGLVguOVjVZgVyb38mVOSoBFjeHk28P
 pvwzbHSnOVo1fJgH93RSKDkLKq4mA9M=
X-Google-Smtp-Source: AGHT+IGPH1Mv0ie1SJWTCyPrtaGAzoDAxNEmC4p3HhZkPKsQ7Rk8usfk+U8jpQHLRLUktGtyY3yIaQ==
X-Received: by 2002:a05:600c:524a:b0:407:8459:2ef9 with SMTP id
 fc10-20020a05600c524a00b0040784592ef9mr767179wmb.21.1698352595241; 
 Thu, 26 Oct 2023 13:36:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b00402ff8d6086sm3418476wmq.18.2023.10.26.13.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 13:36:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 22:36:32 +0200
Message-ID: <20231026203632.6065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698352595; x=1698957395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2JzpM+s74JoCRrhnHsQjoSDFGhj41p2InyaKYZqPQ+g=;
 b=eKnenZEoqZVsfjJt8aUFtwIlfs0Oe8BD2hIVTXefoga35q2rweo0fB3eYO8AoPQdiS
 BdgG6CzyfpC2beI7ArnNn/cjK8Ta1jGilhhsQjGD/f7jWFJswrTFmuJhvgkKr97ds+aK
 xmZk0mdWYt7VX8Bc0CteoLZQHKHxAjF6UtuZJG5zRQ55w0NcgGzNX1UY9Y2FV+PdkZaq
 qnLLaw2geoRt/LJ1R4fbIq1mF1FizvN9L2QsDJgsRRwpKgk6qy7ZcsZnfuH2WQUxP9D2
 UxWBhIkVM1kk9a0/OzbVfyxqKrNNe549ugq6wUiAfMLkP4LAXNkte+8S7z7xry575hPq
 srpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eKnenZEo
Subject: [Buildroot] [PATCH 1/1] package/libmemcached: force CMAKE_BUILD_TYPE
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

Force CMAKE_BUILD_TYPE to Release to avoid the following build failure
with c-icap or php-memcached raised since bump to version 1.1.4 and
switch to cmake-package in commit
7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

Fixes:
 - http://autobuild.buildroot.org/results/bca84915550a72f1dc89c8661cba2545d6bc96ef
 - http://autobuild.buildroot.org/results/b140d225208e7fa44b935a119e74347caf710e55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/libmemcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index bd63d78c97..2c268d4151 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -14,6 +14,10 @@ LIBMEMCACHED_LICENSE = BSD-3-Clause
 LIBMEMCACHED_LICENSE_FILES = LICENSE
 LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
+# Force Release otherwise libraries will be suffixed by -dbg which will raise
+# unexpected build failures with packages that use libmemcached (e.g. c-icap)
+LIBMEMCACHED_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
+
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
 LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=ON
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
