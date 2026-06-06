Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D87CD8C8C
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 13:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1727A84817;
	Sat,  6 Jun 2026 13:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8RXT5R2qAdt; Sat,  6 Jun 2026 13:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 388D284818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780751720;
	bh=hzFOZycw7hWhe390y1Ax5Kq1gE5W1lmPYrLjF2XYQUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Asb8Iv/1U4ewtcBtgXeeVHaGXodg84zFzbjj28h1Wrl74LlqagA5aFgKJEBq07I4U
	 3yXJm6G/qvp53eHjmYDN93qOb8I0YyZwk/aY1atqFPdv7wWwJAkI7VlP//5rxD/usG
	 yMdDeZXTTxS2KSMcrfCeBQcTstz5NVc9udvu0W8omt4ib0nfYQlE498Rr1Cxa/kKZ/
	 9WtD62dOaXySw95i5oXIq4NDPeBPk+LUOFK5+6JeLcOWVPpu2065rx4oOMHHOFH8U1
	 x8gaOot3oVPGfKyutZmb4cpSbe99gyvzFA2R0jlT9fv7yzYAwv5Xt4IuFhzzosPuWA
	 Ae2aKp0MZK+yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 388D284818;
	Sat,  6 Jun 2026 13:15:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AC32EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 730D2615D1
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zsz8KBA8cKKS for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 13:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E03E6113D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E03E6113D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E03E6113D
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:15:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490aebf33e9so15507375e9.3
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780751716; x=1781356516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAVJM1THzUNnUEEA0B+MJWrM84ymNjSK0kAvOxo9e+M=;
 b=k25x28wDQmU8IkDEkTL4kqVUm+IpxE6i6+1S+C3cW+H+ZybGFR3THGM8hh9ApKenJr
 vhCRFHmbpW5p3AWaxryGTl31OS5IXuqdNXNNx6Op1LPK1zz5Uoxqu0QkPKooJSYYhaeM
 scTCaq5DIakoOe5V8oKCZjCafuW5XaO49u0sGYtx0wbe56QG8J9AYIRqaaH04l5WhxWB
 CCjqVE/TGn/OeWXv5/kz3tY/2PdRL+mQBg5F0pl/Ad1/TraEu61WbqQNvKvdqfFZGlbx
 Mfqgs+9O9NurtG49BxhCk+h+09xD0h1Zx9oeU8woRbfxtg86TdYyqptOFh06urvTIgf+
 8UWg==
X-Gm-Message-State: AOJu0YxO9emVdFSlNNnjh3yvahQh55kHaKMEarG6yN+OZPAi7Djvldj/
 ZVo3miP335Sbf3TtR+paEUII1Akj7dJ2Sccng/AmyvqNRsEy09WqAjmvLiUfOYJw6/g/SlphQ1k
 q/0yb
X-Gm-Gg: Acq92OH4d9VuaH4eHIdSaTrA2J+vpw+0tAignc6KyD3dsEcwPnn4b6jIdi2BWiquY5j
 0+tE9+bEsU9V8P91H2RLgZP4U2edCRFFx15SqbYaaNB4aIzj60v5kq5LU5VbWH5xNLwq54jMBJ7
 vgHAJD+mBcs0U6/tj5bHrcztVJTpuZncgST2TFKJx3itK7rGMCIjMVoidAcvUnXTG/7mErVTWaq
 9wxBEWArQ+5nQoutbVc5IF7e5zfn3R8yWZFCX/tu7zlw3vCv1tFgtPe1i89B2sIHXqW/E/Yy5m2
 h1b5Ph8LUM9OnJ2iLv3aYKVeNP1ra46GFRWuiOZ/wKfWdYmJGOx/8o+q1d+vaVrJwdXC2b5E7in
 bMfNYLSMcwgQsQ+FfMkasII9n27mU1mgTek5xphycgxSxwmJ7urW6ZkmZ5Czs7R0uqbwbVITwk3
 zJX6DQ8fXfFaMGLPVgMlnA9hvKPfxl3rfCOxmDuHFgsedMHLqMNRfYLQY4T7rZq3PeSvRm7L8QI
 daURR4++XNKwrOUp2q4MHYIelaCRd/AfuIF
X-Received: by 2002:a05:600c:34d2:b0:490:bbc4:76a6 with SMTP id
 5b1f17b1804b1-490c25eea30mr142182525e9.21.1780751715671; 
 Sat, 06 Jun 2026 06:15:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2cbb4cbsm95883075e9.0.2026.06.06.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 06:15:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  6 Jun 2026 15:15:13 +0200
Message-ID: <20260606131513.3871975-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780751716; x=1781356516; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RAVJM1THzUNnUEEA0B+MJWrM84ymNjSK0kAvOxo9e+M=;
 b=RwBR8V+JyT5M6uPUkdbZ5UgWhXIwUL9SwcXGj6MTz/+ElF42vad4RexYp905vkv7Vj
 KVLRJ9E2/UTN2nTBfZVlzNytmIPW8OFTW4S5mdBfs7B8cNwYlhifDuxEo4Ult2feDDYC
 CjLwsmpn78JjtZDUHobzoph5PLms2AqpbzuuU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RwBR8V+J
Subject: [Buildroot] [PATCHv2] package/runc: needs user namespace support
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the runc security bump to version 1.3.5 [1], the TestOci fail due
to missing user namespace support in the kernel:

  proc/self/setgroups: no such file or directory

Like for the docker-engine package, a script check-config.sh is
provided to check any missing kernel support.

  # ./check-config.sh
  info: no config specified, searching for kernel config ...
  info: reading kernel config from /proc/config.gz ...

  Generally Necessary:
  - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
  - CONFIG_NAMESPACES: enabled
  - CONFIG_NET_NS: enabled
  - CONFIG_PID_NS: enabled
  - CONFIG_IPC_NS: enabled
  - CONFIG_UTS_NS: enabled
  [..]

  Optional Features:
  - CONFIG_USER_NS: missing
  [..]

While "User Namespaces" is listed as an optional feature, it is
required to support rootless containers.

At least make sure that CONFIG_USER_NS is enabled for TestOci.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14696525946 (TestOci)

[1] e013e2df84fb36985261d7b3c6e6af06afd40f93

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
v2: - fix commit log about USER_NS.
    - Use a kconfig fragment instead of enabling CONFIG_USER_NS from
      runc package.
---
 support/testing/tests/fs/test_oci.py                 | 1 +
 support/testing/tests/fs/test_oci/linux-oci.fragment | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 support/testing/tests/fs/test_oci/linux-oci.fragment

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index c2e330c512..a6e96cfae4 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -15,6 +15,7 @@ class TestOci(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/tests/fs/test_oci/linux-oci.fragment"
         BR2_PACKAGE_CGROUPFS_MOUNT=y
         BR2_PACKAGE_CONTAINERD=y
         BR2_TARGET_ROOTFS_EXT2=y
diff --git a/support/testing/tests/fs/test_oci/linux-oci.fragment b/support/testing/tests/fs/test_oci/linux-oci.fragment
new file mode 100644
index 0000000000..416bd53ce9
--- /dev/null
+++ b/support/testing/tests/fs/test_oci/linux-oci.fragment
@@ -0,0 +1 @@
+CONFIG_USER_NS=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
