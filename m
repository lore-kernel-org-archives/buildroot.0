Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB13CD343C
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAD8409C8;
	Tue,  5 May 2026 10:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sfCBrBvXoYP; Tue,  5 May 2026 10:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C346409BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777975567;
	bh=3Eh/tEYS/2d5v3fHgUEZl+rtJaWezlBb29ZOtA9jkz8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=d4wHcw2ErAARvYlEoZLjroUjh/RVoQYJ0wqqN6i6IgWgboynzrUzyIWwK5VDX+Oxu
	 J+01HvOroPzNoN00pY75ToHNUOpZdC2Mqsvw+7PTaTfbNWLP8+UPnSwCV7HPeDpJJJ
	 0Y37TVhg9actU+p/eEYaf5ndvhhfBbSUQ4zqVvC7dC3fsNgOTAIMFdo9EEJ663H0UU
	 1P/ryAFHgTsfdbOyLE51LISTmbL5k4mBzd3BhrL9TVbyfSXS6fTTi4RQ1XkyPU7pzv
	 clGwqowpt71FzIS6cjJfvhTkpEs/GGMVBTcbjnx+AK99AzlAAySUOcBVcznpqUfjWD
	 eC+IL2IL/SBEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C346409BE;
	Tue,  5 May 2026 10:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD292A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B233812C0
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pqxe_3IEwCQ for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A439812BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A439812BE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A439812BE
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-449e96a8a80so2962791f8f.3
 for <buildroot@buildroot.org>; Tue, 05 May 2026 03:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975562; x=1778580362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih64rdC9FIGFYNNXjve6hTbsVDIImPZ4ppwWzVXxErg=;
 b=R61Zxx7RYWN1dEe7m5SELqRg+GXJlahqGOZLjGoj2eaBpkY6Ii3VBirWRNLiR/uZUU
 iHkmAvHNU6Fn/+J/OUIadmBXAqwhv1d27nCdEBCKPyWfZRriedc8HfMGn+/8N3rhq2wq
 7jNIg9IBsFsvcYwBwaq3PjNFXqJt0ayadnSFQYLo6UTTGuj8zn+xYy6vWyNIWwYmlv4P
 hpCbJGQAFGvv9NYMHlY5yy717Ow1xncuV7KuM+Wn7N1IDRItlGFWu4WdiVWQknuDEwUq
 p1Xr7v+vd6kKKkt2H/WV0tIVmOTAEP73djNK35iqYc7DnQ7sGCfOQE0ReRWauKCNHV/t
 x8/Q==
X-Gm-Message-State: AOJu0Yyi4KgSBVTm3K+JWXYTfOdaC8ezyf+r/POWduYGIA2/U8Y8yr1q
 8pLD7GXfcUTuEGM/RKgfOcfYkwNXTQPoNj2EveqNTJg9bPPUknnWro5OcbpZsvDosGWs+garSiB
 ld3c0wG0=
X-Gm-Gg: AeBDievqpgGHaxjTtKIdtuRHRHqgZIwWiD+91LELvXTKKICLZtCiCnfYtxfNLjNKNZm
 q8y6tRETf7Ysbs18paYjt8qAlk6C/1gQXNuXhrKtBKJI4oHchDUeSUvP88cxdXU8/DgXtLgYLSx
 DxN13eCa2ixfQnKeuHLAAExSnCxj7fVKdau2JFjaVfsWkGnsPC18DU7qKU2hz/Gc0cdWAz9ToY6
 u5xmP4BlCZJOUVwu+E4gQVZbUs9NnCaz60e6EbnnSSM3HKsyKu5jm/zLvsnru5BKnP9N7EmEoE7
 F+rbcbyKiBV5srd1RSALjQlVWeS3ijyNleHYXp/xJzN0BLDpiNJihovG+ivfjuCUxqgdBoEbCTV
 zQSb5T95+smAv3kRaHVw9X7+f6AyKu6bG70sTXNLM599t3Me/iknnw6lK+5f3ZV7aniWM+xS5hW
 yVUzoYItwxMTBLHZrFMpb5hJr1C43gLbt70m+22atcFFso8B0ydZyTfGuDyQB7pm2/jiZOEnx5B
 0Rm9suLTna3YXmleHD4Srdi3KqkFZdhlxfBmg4cnA==
X-Received: by 2002:a05:6000:1ac6:b0:43c:f66e:f24 with SMTP id
 ffacd0b85a97d-45006240072mr4013561f8f.35.1777975562232; 
 Tue, 05 May 2026 03:06:02 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505285e765sm3259221f8f.10.2026.05.05.03.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:06:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue,  5 May 2026 12:05:51 +0200
Message-ID: <20260505100553.4100688-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1777975562; x=1778580362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ih64rdC9FIGFYNNXjve6hTbsVDIImPZ4ppwWzVXxErg=;
 b=AYUj5YHMIoK5c5EOBoJXctSAmC7oWURzbKgpeFFslZJhDifmQIQdqwfAVBz/IhhklT
 /H8UeeG0chGTAeEJksildR+bYueyH+gCAZeD1Lzk/8QIdEs4Opu5cSptLQKOngv1c9Rt
 yOJ70Gbb3oWO21i6AWikoyJ1b8I/zXUK1FCSc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=AYUj5YHM
Subject: [Buildroot] [PATCH v2 0/2] support/testing: test_podman.py : fix
 build failure due to regressions
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

This serie fixes the build failure of Podman tests caused by the bump to the AArch64 15.2.rel1 
toolchain (including newer glibc and GCC 15) which introduced a regression in the build process of
host-protobuf v34.0, which is a dependency for Podman tests (header inclusion and inlining rules
enforced by GCC 15).

It also bumps the kernel to 6.18.21 to match the new configuration and adds a fragment to fix iptables 
"Protocol not supported" error when running Podman tests.

Dowan Gullient (1):
  support/testing: test_podman.py : Build failure due to bump of
    toolchain

Julien Olivain (1):
  package/libabseil-cpp: add patch to fix build with gcc <= 12

 ...SL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 +++++++++++++++++++
 support/testing/tests/package/test_podman.py  |  5 +-
 .../package/test_podman/linux-podman.fragment | 36 ++++++++++++
 3 files changed, 94 insertions(+), 2 deletions(-)
 create mode 100644 package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
 create mode 100644 support/testing/tests/package/test_podman/linux-podman.fragment

-- 
2.43.0

---
v1 -> v2:
  - Included Julien Olivain's toolchain fix (originally from 
    https://patchwork.ozlabs.org/project/buildroot/patch/20260427201606.896700-1-ju.o@free.fr/)
  - Added linux-podman.fragment to fix iptables "Protocol not supported"
  - Bumped kernel to 6.18.21 to match the new configuration
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
