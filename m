Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB97BC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 16:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A87614D1;
	Mon,  7 Jul 2025 16:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUW-l6vQcm-B; Mon,  7 Jul 2025 16:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC926148C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC926148C;
	Mon,  7 Jul 2025 16:36:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A241BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF9E417C5
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n51OqUls70CZ for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 16:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CEE641610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CEE641610
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CEE641610
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:36:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-454aaade1fbso38193695e9.3
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 09:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751906163; x=1752510963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5E7en4+ZWn9FQ2IUqNmblmGfUcQPjYJG0SyqZdd0w0M=;
 b=B06vezOA431LfBaPCjSsnWkurJcUKT1uG/1kBV/fLQbmxGpWFSoBUBS1rdl/TsqS49
 gyPNc50fVoF+Se8eYgKiB4diLzqPt4oVwmaV3RlL6ZkYoJjpqhzBba8HWj7ijBzh2q0i
 Wz4LyIhHJz71GSJgL6OZDcSjSG8lfewwTLZUOVnBSfIkjp3cWUuF/5JU2IgMaL75qVvc
 zLNLrT5+AhNwg5IcFOOBaiSQqO6CcxGOqsRd2ePHdSsGxU0mSSdaehTIipqQrxSPtxB8
 CMZ5ozdVa0Stugvv0y+kMphVNab8CNRalulb1HPcLgDu3mFbp1tF1+6dtzlrcc81pc1g
 HZ4g==
X-Gm-Message-State: AOJu0Yxh+CM+LjQW5ngMvtviafdPVuyu7ImCd5UjSVqLHCP097qxBSEe
 AKXs71IwSG9f/6dGWgJxF/kX1HH5gsMceNfJ05Q4MNNClZy3J3IQxLp10foEGWimRVS6oqY7mIz
 SAy9w
X-Gm-Gg: ASbGnctFtb7FFl8TYclNGN5+FvpUWoUtLDWqExURWP2qWL2pwMxeo3gWOgp7HX8XwRv
 cJjen7wboMyVqnII2JSqJ7ijO1OHqPcePs7GJCSRnUWsx7VhknlQ+tygjS1eZmgNoPNTJ0d2uoN
 IDR9U3hJNjXTt8iT3wYhWeTdNXlc9e1+IX+i3Z3MXOQZs60qdjUvNpCuPWhSsit8zOhisyJKOWZ
 4zs8Sl7lDjgPGtUWmzj92h8dlPGng5/OMCVg/i7g/DHuB3thPDi4NKLbGiFYaCmhGgANkLCupOn
 dV/6MFeCoCXHrpPAX6ViRTr3TXDLP++5pHysALhQAowyENGzhXz1pw9FVf2p3GnI89d6RJaqEfQ
 VOuKRW5HHTA==
X-Google-Smtp-Source: AGHT+IHwgbdZTwbr9Q8896gWjy4oM2wVtgJ0A6Gbhowcwfs2kF/jhrxI6VaATPgV+TvLx2gLQ1H39w==
X-Received: by 2002:a05:600c:3555:b0:453:8f6:6383 with SMTP id
 5b1f17b1804b1-454b4e850ffmr141769595e9.15.1751906162644; 
 Mon, 07 Jul 2025 09:36:02 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b9651dsm10903745f8f.65.2025.07.07.09.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 09:36:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Jul 2025 18:36:00 +0200
Message-ID: <20250707163600.1332626-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751906163; x=1752510963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5E7en4+ZWn9FQ2IUqNmblmGfUcQPjYJG0SyqZdd0w0M=;
 b=Z4p2qlqiL8iVSsew+jYXYCtU2xJo9yL6zaEWWC1hreRsRpvZtiLNEZvEvxPhmtRo9f
 +HkP5URPxLb5iYPcxjcQwu/OPW0XhvFkVOMu9Oqka0ErDVOA6qQCpAFcHuh9A2wxLXxd
 GHbYn63+ObThlBNZbqPqEWk2qG+zUpguvGVcEKu+WuHxUOcfinP0sglFEEQhRpuQVEt4
 fd1zQY2U5nG0t8U61lbzb4GoWWN63YMv/rcd1lhsfgQl1N42uqoUXTudJXo3QFOlmCoU
 62DNVlG/uanCwhWAu+zMBQrXxu/8a3OWmZG7DizOxRXqpo9WUnXyytu+GaQNGKHwdPOO
 GQPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z4p2qlqi
Subject: [Buildroot] [PATCH] package/libiec61850: fix build w/ mbedtls v3.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the mbedtls bump to v3.6 [1] the libiec61850 package is failling
on the autobuilder with the following error:

```
[  2%] Building C object hal/CMakeFiles/hal.dir/tls/mbedtls/tls_mbedtls.c.o
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c: In function 'compareCertificates':
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:17: error: 'mbedtls_x509_crt' has no member named 'sig'
  122 |         if (crt1->sig.len == crt2->sig.len)
      |                 ^~
/workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:34: error: 'mbedtls_x509_crt' has no member named 'sig'
  122 |         if (crt1->sig.len == crt2->sig.len)
      |                                  ^~
...
```

The logic to support mbedtls v3 is already present on the version
present in buildroot.
This patch ensures that the CMake build uses the mbedtls headers and
libraries provided by buildroot rather than the bundled copy.

By setting the following variable the mbedtls v3.6 is correctly found
during the configuration of the package.

```
Found mbedtls 3.6 -> can compile HAL with TLS 1.3 support
```

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1

Fixes: https://autobuild.buildroot.org/results/5fc/5fca384510d2fb9dd1d01736dee34b53339d62ff/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libiec61850/libiec61850.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 92b27dc5c2..2bf98f1f3d 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -15,6 +15,9 @@ LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBIEC61850_DEPENDENCIES += mbedtls
 LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=ON
+LIBIEC61850_CONF_OPTS += \
+	-DCONFIG_EXTERNAL_MBEDTLS_DYNLIB_PATH=$(STAGING_DIR)/usr/lib \
+	-DCONFIG_EXTERNAL_MBEDTLS_INCLUDE_PATH=$(STAGING_DIR)/usr/include
 else
 LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=OFF
 endif
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
