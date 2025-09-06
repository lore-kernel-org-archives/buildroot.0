Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A7DCA1002
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FDA83B75;
	Sat,  6 Sep 2025 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQv0Rj9Eh9VL; Sat,  6 Sep 2025 21:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5983F83F35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5983F83F35;
	Sat,  6 Sep 2025 21:19:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9579CA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9EF40592
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAZb5pH9AHki for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 21:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CFE640169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CFE640169
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CFE640169
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 21:19:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso2086095f8f.0
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 14:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757193543; x=1757798343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ZEEnZiAfy5u0CLxIGwYKiTSGs6t2FdeNDf7pfNirz8=;
 b=UkubLQq5a3RQ/zCAKb6OPFjIfCtTVXNyJEU8cbP193HX+Pxpr8aH6dNwVfLSlprLGP
 aEm8/CcHZsrhLG4BIvCQ6WgGgt2/NlUmJlkJgIC+8k6+71gZV7B4TIpulmrLQEk2+OaP
 /Si0BQ8nKGPBWDLEOR+Y6Huu2Daa7Q62zTsHOuL+302wLPDkMxme9qGl5oQXLBmvKdbs
 eUVKm1qnxgHlOHGV2skCpd0vGgY25XIKE2baFSKr9jqW2P/KX/oPZodhBPhx2P45p90z
 VkOJZOEBwrAttC3/brwk3o/h/Y+HMniNQEPKULd5uonqonrfM+HGSgQcqzkB7t+5CcYq
 /74g==
X-Gm-Message-State: AOJu0YyepKGybTjS3VBCBQ9KYzOpkniYgLSHV0TAQEoGxs7GvA8xfs31
 j7EP0JEmDE9BIOh+TefRTNbrkeAzrIE+iEFq7Hyfkcq9pvJqSw4IjNtPCR6OEfWMVsx9O65K6VR
 bU1VDi+da/w==
X-Gm-Gg: ASbGncthizLv+bo5TOxXAHnq00xWZ4L8wx/bg7DzQnbKwq/9FdzGpX6QqAA0zXC/UBo
 NFFlmBsOO8eIKIeB+HeBPU70ZtWtHPS4P2LM6Zy86h3FjapLBOf0nGyso4uRDntWHfbNHK44tGW
 h5mTjkCX34/rI5lQWkVUW1zIsqHDPr7y1Bjcs1p6nuPTdvXJ8CcweR1WWvb5rf4ximt08nuGPM4
 mCd7j9v7flm4wxMkYs/t2WykPBWRgs+66C1rCP4HIXQ3+TfRIjGT20TIW1b3ney1z4bjqtgGZ5i
 f51Dgt4NSJqwJizzyXWkBjcO/Lesy8qnYBALRKJcx6GNkg6fOn8210uMdGRgvqRy45sK0hidgyC
 9yV5gjuLhURAemIdRvjWrD0Sbfe2sVAfaI8T7y832xh3Le9YZkct1IOWky9dSxh1zXMyF/DHJrM
 uuIIB38hAMRSKwA5fs9/iW
X-Google-Smtp-Source: AGHT+IHhi0fyU0QR1/Y70UY4JXOdJfGasgwtK57creH75LMRWJ1eO+3yvxyM7plXbWSioew+xmhsig==
X-Received: by 2002:a05:6000:1449:b0:3e3:b6ef:7243 with SMTP id
 ffacd0b85a97d-3e643556a10mr2048229f8f.51.1757193543236; 
 Sat, 06 Sep 2025 14:19:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e21e4c0e6fsm9426730f8f.17.2025.09.06.14.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 14:19:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  6 Sep 2025 23:19:00 +0200
Message-ID: <20250906211900.648495-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757193543; x=1757798343; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZEEnZiAfy5u0CLxIGwYKiTSGs6t2FdeNDf7pfNirz8=;
 b=0N+RKOup07in//hNyfFk0tuD2lz/luQ2rTDIma7td5dQ7zZoIMasvnb3h2J+3uOUPC
 lnL2v7vFMOD0xqqiMjp7eiZ5RGha4Q3mVE1j0mnY9xl1JhRn+16+L3y72Yh9Li21JUH3
 Ynl2RXxPdo85tEhuiEGJ015jwLmS9rYJ3MI/A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0N+RKOup
Subject: [Buildroot] [PATCH] support/testing: test_hardening: update
 toolchain to aarch64 for checksec tests
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestRelroPartial is broken since the last checksec update to 2.7.1 [1]
(Buildroot 2024.08) due to a relro check fix [2] that doesn't work for
powerpc architecture where .got.plt doesn't exist for some reasons
(that's why the expected result "full" is replaced by "Partial").

From [3]:

  if ${readelf} -d "${1}/exe" 2> /dev/null | grep -q 'BIND_NOW' || ! ${readelf} -l "${1}/exe" 2> /dev/null | grep -q '\.got\.plt'; then
    echo_message '\033[32mFull RELRO   \033[m   ' 'Full RELRO,' ' relro="full"' '"relro":"full",'
  else
    echo_message '\033[33mPartial RELRO\033[m   ' 'Partial RELRO,' ' relro="partial"' '"relro":"partial",'

checksec tool is problably tested upstream on more common architectures
like x86_64 or aarch64 than powerpc64 e5500. This may explain why
checksec broke on powerpc64 e5500 target.

Also, the Booltin powerpc64-e5500--glibc--stable-2018.02-2 toolchain
used by test_hardening tests was not updated since the hardening tests
were introduced back in 2018.11 release.

So, switch to the current Bootling aarch64 stable toolchain
(currently Bootlin aarch64 glibc stable 2025.08-1).

Checked that all 6 hardening tests pass with this new toolchain:

  tests.core.test_hardening.TestFortifyConserv
  tests.core.test_hardening.TestFortifyNone
  tests.core.test_hardening.TestRelro
  tests.core.test_hardening.TestRelroPartial
  tests.core.test_hardening.TestSspNone
  tests.core.test_hardening.TestSspStrong

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176773995 (TestRelroPartial)

[1] 61505649746cb4d0dd57e35ff6139b7925bab72d
[2] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900
[3] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900#diff-9e8d1b28dfaf1c704560ac51a5613b70d70de2dcd84e87b9fa20f28811e6484aL1491

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/core/test_hardening.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index e9d30f3a38..2daafbd883 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -7,16 +7,10 @@ import infra.basetest
 class TestHardeningBase(infra.basetest.BRTest):
     config = \
         """
-        BR2_powerpc64=y
-        BR2_powerpc_e5500=y
+        BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
         BR2_PACKAGE_LIGHTTPD=y
         BR2_PACKAGE_HOST_CHECKSEC=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
