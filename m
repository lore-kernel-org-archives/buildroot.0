Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28768F43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE1960D5C;
	Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHn58veGkTje; Fri, 17 Apr 2026 08:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0AB160D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416385;
	bh=FQue3PlingfiWO4KKVMpiC2mex1a34n1tB+wXPo1B4M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pAS92zWDEeSQ9+aPBjN4MxirO3X56JwFRpi+DMoieZnn8uaP5FUAdq2qsETHPT4Ug
	 7MajtbkCACVGCC32V5bkb13pVcZZOJX0lDuqMH0KnCosAx4aG5mHkenrHQPtrtPl3E
	 rTSHSFw3ZsY4sHFmyuNf4SEtj8yX6BB6hJW/6Copz24vmyze1jPKddPf6uP6HJRf8x
	 bdrNthEMAtyB6h4qMF377VY9zpFRDwR1HZ5EBIgBRelyllNHpXLC6G90IoAfWGVnXM
	 O7WWDIOgcOHtqJv4k76Q2TfYPVRU61esXE7z/a3WCNEmqDkWdltrOfLpMGEx/6sdL7
	 Ssr3foGt6wauQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AB160D5E;
	Fri, 17 Apr 2026 08:59:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1938259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D6BD60D5E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrZb84V79y7r for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42F3360D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42F3360D5C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42F3360D5C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so2833005e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416380; x=1777021180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wqf5v0YHUKsMWLqLTiVerKQjbsW74yVlIeLsqRp9gHI=;
 b=T2husoGIuVWUjhcu9mxTIP+LqpM6gZz5S0hgFaBskSibo675R6nWz/0NzNJahiLcgR
 O+8ZGemBvsagj/qorHNjL5FY5D9vC27bqb4IsmEtUC9puXcHa1NI0MfJca52TWTN+CFI
 c3C6lMwWIjrhzJG8V/uD7O0OYGFfRN82K+3Z/O5WTPcQNVip78zCY/JOHVB2oiWNEy3D
 saoyArB9xTvd4OKLYzscKfqq7MxF2PaPjvqegvmInC4CPGoz79SAfhHJq4JTZNKT92JT
 8aDL3ewYnMfL0YrB5ILNWs3a5L/+82nFP59t6KVleU4dCQRIULp8H6u0wR7m4QxyBRYc
 su7g==
X-Gm-Message-State: AOJu0YwvzkKuEFpK48Wox5eNxbeOQ3vB6fTIJsE8F0L/BfiWen2AIaCv
 paEF0C4m3todTBhKJQRDnrnBA93koeZ/gmAgXY1Irq9lWQPQReUXUQNBNrKkyZcCm/+lcqY10dy
 S4OpLnqk=
X-Gm-Gg: AeBDievK+/PA9i85Z9cd3/6kqqupZjc2lkKqn8lNrKZfYWsNNXXVt6YS6arTm/Chj+j
 ExOR6IDsoatUfQhTlf8sUToVg/5TKS3xgIIB+sHB3JBpPfWaTh2waosxo/8BF4XKmeB7nfJQc8m
 /cgs17/WrgJd5Rw7hJEMKtf6lnwqCJ9wL+xp7669O5JykXntVNFdD7M+Nhc9nu2UJggybZX9mHG
 B+eyDs/mQ2w1UgwGkrTzJxaarHl/ecpb00U+r1qEz2cxzUqUyqA49agLmlqGUQ8bvyp3s+TTkPX
 lmUn79ELkhJZhBUH48GG4UBhhJYrT4xeSia3NS8w5w8baMpfu9d3kKE47pqiheEy4FfXNemZT9M
 X4ETMiO/ZtRF+9PGcHHJnwYPycAiigXZHrlCWTOHnChDIigZDGrbqwWLdC6vGuUKHIe3zjpkcbG
 G94wv9VAtG1rPldm2FvXKLX+YJ/WgLxeP+IVS26tFCpTb3eWR4AhzKKjf8zEulPoCZeOQZAPqQM
 pwvKhZhg+RT0jsK0+a7QqNFnxD/NAw=
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id
 5b1f17b1804b1-488fb76e4aamr28124735e9.17.1776416379752; 
 Fri, 17 Apr 2026 01:59:39 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:15 +0200
Message-ID: <20260417085936.200528-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416380; x=1777021180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wqf5v0YHUKsMWLqLTiVerKQjbsW74yVlIeLsqRp9gHI=;
 b=nLUr37XaV+A/H6bkocNlxorJVT9+RG0INjEUKGEDOiF4VnVaLbVHosozD2Y77O1vp/
 NGG/Mv0gjjnLKcFc8vM0ejG2IZ0NFq7LASpIUxpUNlpAwJh5c/usDSgaZafE4oI0AYyN
 dkObCnl+lSCxuzwbwIm49pRgfmeAeKuGpUsaU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=nLUr37Xa
Subject: [Buildroot] [PATCH v1 00/21] support/testing: bump kernels to 6.18
 and fix associated failures
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series updates the kernel version used in several runtime tests (LXC, ISO9660, Docker, etc.)
from 4.x and 5.x to 6.18. This bump is necessary to ensure our test suite remains relevant with
modern toolchains and kernel features.

The transition to kernel 6.18 introduced several build and runtime regressions in the test
infrastructure, which are addressed in this series.

All modifications were tested locally with the updated kernel version, and the affected tests 
now pass successfully except for the tests.package.test_podman test wich is failing due to
the bump of the toolchain. More details here : [1]

[1]: https://lore.kernel.org/buildroot/20260417085703.200145-1-dowan.gullient@smile.fr/

Dowan Gullient (21):
  Revert "package/python-setuptools: bump to version 82.0.0"
  support/testing: test_grub :  Kernel update bump to last LTS (6.18)
  support/testing: test_file_capabilities : Kernel version bump LTS
    (6.18)
  support/testing: test_f2fs : Kernel version bump LTS (6.18)
  support/testing : test_iso9660 : Bump kernel version to last LTS
    (6.18)
  support/testing : test_docker_compose : Bump kernel version to last
    LTS (6.18)
  support/testing : test_glxinfo : Bump kernel version to last LTS
    (6.18)
  support/testing : test_clang : ump kernel version to last LTS (6.18)
  support/testing : test_edk2 : Bump kernel version to last LTS (6.18)
  support/testing : test_oci : Bump kernel version to last LTS (6.18)
  support/testing : test_systemd_selinux : Bump kernel version to last
    LTS (6.18)
  support/testing : test_dtbocfg : Bump kernel version to last LTS
    (6.18)
  support/testing : test_libjxl : Bump kernel version to last LTS (6.18)
  support/testing : test_lxc : Bump kernel version to last LTS (6.18)
  support/testing : test_octave : Bump kernel version to last LTS (6.18)
  support/testing : test_systemd : Bump kernel version to last LTS
    (6.18)
  support/testing : test_openjdk : Bump kernel version to last LTS
    (6.18)
  support/testing : test_fluidsynth : Bump kernel version to last LTS
    (6.18)
  support/testing : test_distribution_registry : Bump kernel version to
    last LTS (6.18)
  support/testing : test_rdma_core : Bump kernel version to last LTS
    (6.18)
  support/testing : test_aarch64_64k : Bump kernel version to last LTS
    (6.18)

 package/openjdk/openjdk.hash                  |  2 +-
 package/openjdk/openjdk.mk                    |  4 +--
 .../python-setuptools/python-setuptools.hash  |  4 +--
 .../python-setuptools/python-setuptools.mk    |  4 +--
 .../testing/conf/docker-compose-kernel.config | 26 +++++++++----------
 .../conf/minimal-x86-qemu-kernel.config       |  4 +++
 support/testing/tests/boot/test_edk2.py       |  2 +-
 support/testing/tests/boot/test_grub.py       |  9 ++++---
 .../tests/core/test_file_capabilities.py      |  2 +-
 support/testing/tests/fs/test_f2fs.py         |  2 +-
 support/testing/tests/fs/test_iso9660.py      |  2 +-
 support/testing/tests/fs/test_oci.py          |  2 +-
 support/testing/tests/init/test_systemd.py    |  4 +--
 .../tests/init/test_systemd_selinux.py        |  2 +-
 support/testing/tests/package/test_clang.py   |  2 +-
 .../package/test_distribution_registry.py     |  4 +--
 .../tests/package/test_docker_compose.py      | 12 ++++++---
 support/testing/tests/package/test_dtbocfg.py |  2 +-
 .../testing/tests/package/test_fluidsynth.py  |  2 +-
 support/testing/tests/package/test_glxinfo.py |  2 +-
 support/testing/tests/package/test_libjxl.py  |  2 +-
 support/testing/tests/package/test_lxc.py     |  4 +--
 support/testing/tests/package/test_octave.py  |  2 +-
 support/testing/tests/package/test_openjdk.py |  6 ++++-
 .../testing/tests/package/test_rdma_core.py   |  2 +-
 .../tests/toolchain/test_aarch64_64k.py       |  4 +--
 26 files changed, 62 insertions(+), 51 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
