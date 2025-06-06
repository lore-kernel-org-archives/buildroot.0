Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE1AC5B549
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 07:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D054606D7;
	Fri,  6 Jun 2025 07:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp6KMB4k0rIf; Fri,  6 Jun 2025 07:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499DE60738
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499DE60738;
	Fri,  6 Jun 2025 07:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F24441A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1ED240143
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5E1fuVaBIRH for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 07:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFBEA40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFBEA40042
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFBEA40042
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1363666f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 00:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193325; x=1749798125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fag83ivDIG4U8zZQNKuP7A1geXbNxpxVACazJP6q5jM=;
 b=AFknxUDH08968BmshZjyaBsMf2I7W84sQS19yJdIjDcGSaIZoGqNCHEEFajUvTaiwZ
 c9D1uuYz7xJ+en8ITyC8mQEEGmTI+RW+fPF6QxncvPNBk37ZyxTFavSsHI4QjoxcBJde
 HJVHcml/CFD155jdTZMwie/FuSGsycr2PVv/FImFPs6FL7oQNMVBWxU4AorVrk9YR5kC
 pFqx692OqkFtq8sWR74BIVDChkDeiBKMWy4L50v7LKQk9V97uuMKqZdUeq9jieIrj9p3
 9wTqsXVrGRYI2Dloq7uiziOz7Mji3lcEi8h22EH0rzbOw3T2BUCHmRfxp2c+ktT+RHxy
 uPEw==
X-Gm-Message-State: AOJu0YyVNFCzgX7Ume6u8cXjQTtVwQoF/4U1uVYgh2uNUSagqDpxq33F
 V9L3KEddoI6ZGfo7liA/EP0JPQbH93FqCZBtMI3VBpfyxl2vPNYXisyVgN3GlLBwpBj6uFstB+8
 yGeAF
X-Gm-Gg: ASbGncs9hCCihcQeH4uqUqBYFgk/Qr77VzgsHw5lQC3IjYGkck2T/jG1OJ8ODuCLEPE
 VfR+Aj/4dmuLgB+l1SQ1Wd1hx2uGQWKu/rE+xbAy/GVWTMstbFKkVLG6aX+rf1J+0KrY9KyeanX
 fQ1eHk6SiRRlZzLhQ/ARVEwWi3QgMI2jSQWLNW4P5E9U+l3HaPl/n9A1ljJY0n5/mE0gjghJgI+
 W0+EXgsQoT99f3ppaHPSL1bKzYQZAmughtG689/0pQyYVYHcunx15s8rJzh7EsqK7ie5zdKojSE
 zIbRiovg5x0/EtgWsCthA0XNPgQeXa6oD7moLwX43qGhgQoiBK0T66hQwKEInGYGONE2UcepIWz
 d4ujbs1MUdTwc8/P69hz20VKzoebOGeley9pMML8I4jW6VG5i9jDjQWey
X-Google-Smtp-Source: AGHT+IEbRlGczUMmG6zjNVK00o53sBXh1epjFLvuORe0Jcuu46ijzQD0iVtpKhfFn0lxUsTNkfZtHw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id
 ffacd0b85a97d-3a531ce677bmr1716346f8f.48.1749193324830; 
 Fri, 06 Jun 2025 00:02:04 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm1035353f8f.7.2025.06.06.00.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:02:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  6 Jun 2025 09:01:47 +0200
Message-ID: <20250606070152.396438-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749193325; x=1749798125; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fag83ivDIG4U8zZQNKuP7A1geXbNxpxVACazJP6q5jM=;
 b=AG+iYfkDPjWRwfOaVjFB3nPwzRFvB5eGyx4y8O649nd6aEGM2GYn248OPX0bf2xFrM
 TwZ2uVz+pZ0BPgEPDSiZldiE+8VqUe3Mht/f8KtQC4oAH1awezMkw2Lc+hWL6/HWeRoc
 z/VEDSM2/mrFWd2vlBfKwXWh02f6o/O+u25Gg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=AG+iYfkD
Subject: [Buildroot] [PATCH/NEXT 0/5] RustiCL support
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Until now OpenCL support in Buildroot has been limited by the absence
of a modern, upstream-maintained OpenCL implementation that integrates
cleanly with Mesa and Gallium-based drives. The old clover backend
in Mesa is deprecated and will be removed in Mesa 25.2. [1]

RustiCL is a new implementation of openCL written entirely in Rust and 
integrated directly into Mesa. This brings OpenCL to a much broader set of
hardware in Buildroot.

By introducing RustiCL, Buildroot gains:

 - A modern OpenCL implementation maintained in Mesa.
 - The ability to run OpenCL applications on supported GPUs and even in 
   software using llvmpipe

This opens the door to GPU computing. For example, OpenCV can be built
with openCL support to benefit from GPU acceleration in real-time image
analysis, object detection... Also any other parallel workloads using buildroot.

This feature has been tested for now on a Khadas vim 3 with an ARM G52 MP4 GPU
that is well detected using panfrost driver. 

We also add a runtime test using clinfo to test rusticl using llvmpipe driver on 
Qemu. 

OpenCL headers are installed by opencl-headers package only while using RustiCL.
In other cases, such as when using proprietary drivers, the vendors typically provide
their own headers, wich means there is no conflict with opencl-headers package as this 
package is only used when opencl-icd-loader is selected, which in turn is only for RustiCL.

Note: At the time of this submission, a fix for Mesa 25 is still not merged yet. 
      Once it is, this series will likely conflict with it.
      The goal of this v1 is to collect feedback and suggestions.
      A v2 will be sent afterward, rebased on to of the updated Mesa fix and 
      with any conflicts resolved [2]

[1] https://gitlab.freedesktop.org/mesa/mesa/-/commit/5844dea31620f36c41ac738e17fefd57084b2dbb#feedf4d0444f717d7227468a9529c2cf9740b6fd
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20250601204529.787544-2-bernd@kuhls.net/

Best regards, 
Mehdi

El Mehdi YOUNES (5):
  package/opencl-clhpp: bump version to latest
  package/opencl-headers: new package
  package/opencl-icd-loader: new package
  package/mesa3d: add RustiCL support
  support/testing: add runtime test for Rusticl

 package/Config.in                             |  2 +
 package/mesa3d/Config.in                      | 37 +++++++++++--
 package/mesa3d/mesa3d.mk                      | 22 +++++++-
 package/opencl-clhpp/opencl-clhpp.hash        |  2 +-
 package/opencl-clhpp/opencl-clhpp.mk          |  7 ++-
 package/opencl-headers/Config.in              |  6 +++
 package/opencl-headers/opencl-headers.hash    |  3 ++
 package/opencl-headers/opencl-headers.mk      | 26 +++++++++
 package/opencl-icd-loader/Config.in           | 12 +++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 ++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 22 ++++++++
 support/testing/tests/package/test_rusticl.py | 53 +++++++++++++++++++
 12 files changed, 188 insertions(+), 7 deletions(-)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk
 create mode 100644 support/testing/tests/package/test_rusticl.py

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
