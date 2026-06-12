Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED078CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B9541218;
	Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id garDFhSGjNrD; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D564121E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264276;
	bh=kRfgN3OmrKEFRCI/QdHEnLgoon9YCW61S07nmHYbDlI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZX0JIXya1Pygym3ASwXzZau/ZyKPMSP/jd5Kn6D6cys34+n36+ZoxNA7JIKF9vbmF
	 6ZBv/hA9fSnZXDVs4I6mo8RtXIVIMdxu0ARu2zkEItBYVubwT7lwdK8zwQxvRDy5th
	 UDIFfLWjFkqY+DC/fRXwSoxCZ9tWriGjM90gsZHW1TCvnTHGEn4vh0a/5pO6tXFO3w
	 n38+lVPSl0Q1p1r/tbkwyluC2JqX9nux6kuVpKMMjsDkW1TpOtBpoX90qp5h/bJD0c
	 6Tvlj27BwS8cTwSTmZ6Wj3nYD8yi24H+cZKKiHE8dI/sxASA8xiyWtTCyS7EeBuRnV
	 uHCcXLUuOTzPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D564121E;
	Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D5C9237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33C26832EA
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPIChiGd8KYN for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0433832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0433832FF
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0433832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso8008415e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264273; x=1781869073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5yrWRY0GQp9Ww0F7u7na2rYMbwV1zrOmzcHUkcJ5CnE=;
 b=NSttR2cww5AaKkxUtpdlBJuJHtbhFOhCspHspV6DaDjonkb7yufxGGAyB8lZ36IsyU
 zk8G0xqn3+J61jaiX/DWsG4Yjs3PaCyqQEwUlw/tWjIxHamPfCXSJKcVo1IQsP6y1I5X
 boTp1zgFYtc1dBHETrg9K0RVILpiQf9Vcg87LzxH/hgKzk47zuVTrBGcfI2CR84IQsJb
 f97UZXVNZoCtc7lZtGIeRZQebgY76pXjbUm0G3agOXz9IhdDCR9aSZpPRek8pUw8zKU8
 kOfWOsz58KCH9ANtl3ltwaILJtYtgnCHAZQmZA5w9ZsNUUbLcjiXUKR7ipl9BPFiGmjP
 CFlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3TpGT9L0oBT/XCDVEuI12Pa998NvXXCbD4plqENXLLAcq19wYdVxfO7jqF6HFMVJDYyCUaDPEQ7g=@buildroot.org
X-Gm-Message-State: AOJu0YxN6L0zlmNcG7p3U+pyTzgppXV6g6zQKv/5mvMY26OiiKi7vsNe
 +dnkgAh02828Vj0DjIzhJuNhDie8IIE8M9RcHh9sOkNVTT5KexwdTQ5mIbzuBZVPB+Y=
X-Gm-Gg: Acq92OE6GDg17Kh9DT/lWOt7YBmmyxDB5mRwm5BE0rPe9W0qzvQbGaXlw9z71ba2TBd
 ckiHLt8NBziFNVg4uE64ZNVPju7mpGljZZsi//LaeYyxYg6qNLKs5wstLMoE/7BKmZme9Y0x4dp
 FjFkoHjJL9GB2I/+oDIPxW45cuaz04ffR+26yKZlFtuWF3PvSkClVKliIz/oWETAUvsIMKQiF5e
 yO5ji/YhAn+Wjz9gB2eIH3EtThQ+u4WnPDF93XJkBlaCx73kOQYE8XmGlluFtv64oL50n3Q5KKh
 wiSodYqxLMgAW8q6HTwt9Pq29hxEF2zQJB3vwmniaAYLMl40Hc/lIIIALT9AIj3c8VWN56pyMWb
 J3iAH4mTBbtbDNbo6H1D1USIADqVcn8NjXzyGImcTuC53cNM02tro2+8MK9H7nW9etQ32VnEny6
 q43MLoQeQD//0lCnc=
X-Received: by 2002:a05:600c:3b90:b0:490:b629:286c with SMTP id
 5b1f17b1804b1-490ec4c4d5dmr30336535e9.12.1781264272531; 
 Fri, 12 Jun 2026 04:37:52 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm4505864f8f.15.2026.06.12.04.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:52 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:51 +0200
Message-ID: <20260612113751.252126-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530175831.1806461-3-romain.naour@smile.fr>
References: <20260530175831.1806461-3-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264273; x=1781869073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yrWRY0GQp9Ww0F7u7na2rYMbwV1zrOmzcHUkcJ5CnE=;
 b=MfKKYeG+zO8zuzLZKhpyOIrfd21DjdChKIcbCGvGJg6oltEYEMvSfdxfB7npbUDhH7
 SsGt+JrfQM58g5VlsHzRQCh0f1FBzXj3/XOtcRQJBRdsJFplBw5UsIcGjTOtGq2nR0hs
 qT8H1HUQ3ORyLfeYBkEuY2uWmWq3o3xqdqIYPox9S6n+MzyjVjfD3kxKMDkt12TzW17m
 w+pogNhdmAaDqzRE0DZYAk/0SeaGM7FKEK7lcrovyoEQLbF7mM7NXhHM+WN1Ow4Tpq73
 avthNPcrgcPMwN2G2PXE2f42tRlbNDUh9PAXLRJja5H8m1XJ5apbElLJr1BMobGTe/Sn
 bwdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MfKKYeG+
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: use larger runner to
 reduce the CI minute consumed per pipeline
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

In reply of:
> Based on the first pipeline result [1], use larger runner for the
> following tests:
> 
>   tests.fs.test_oci.TestOci.test_run (01:08:15)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_dpdk.TestDPDK.test_run (01:08:36)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_z3.TestZ3.test_run (01:11:41)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_octave.TestOctave.test_run (01:21:57)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_podman.TestPodmanSlirpNftables.test_run (01:21:15)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_podman.TestPodmanSlirpIptables.test_run (01:21:25)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_mariadb.TestMariaDB.test_run (01:26:15)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_podman.TestPodmanIptables.test_run (01:28:51)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_podman.TestPodmanTini.test_run (01:29:08)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_podman.TestPodmanNftables.test_run (01:41:26)
>   saas-linux-small-amd64 -> saas-linux-xlarge-amd64
> 
>   tests.package.test_weston.TestWeston.test_run (01:26:17)
>   saas-linux-large-amd64 -> saas-linux-2xlarge-amd64
> 
>   tests.package.test_python_pyqt5.TestPythonPyQt5.test_run (01:41:33)
>   saas-linux-large-amd64 -> saas-linux-2xlarge-amd64
> 
>   tests.package.test_nodejs.TestNodeJSModuleHostBin.test_run (01:21:06)
>   saas-linux-large-amd64 -> saas-linux-2xlarge-amd64
> 
>   tests.package.test_flutter.TestFlutter.test_run (01:03:05)
>   saas-linux-xlarge-amd64 -> saas-linux-2xlarge-amd64
> 
> For tests long that already use 2xlarge runner tag, we may have to run
> them on Gitlab runners owned by the Buildroot project.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562421098
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/testing/tests/fs/test_oci.py               | 1 +
>  support/testing/tests/package/test_dpdk.py         | 1 +
>  support/testing/tests/package/test_flutter.py      | 2 +-
>  support/testing/tests/package/test_mariadb.py      | 1 +
>  support/testing/tests/package/test_nodejs.py       | 2 +-
>  support/testing/tests/package/test_octave.py       | 1 +
>  support/testing/tests/package/test_podman.py       | 5 +++++
>  support/testing/tests/package/test_python_pyqt5.py | 2 +-
>  support/testing/tests/package/test_weston.py       | 2 +-
>  support/testing/tests/package/test_z3.py           | 1 +
>  10 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
> index 38ed168b62..c2e330c512 100644
> --- a/support/testing/tests/fs/test_oci.py
> +++ b/support/testing/tests/fs/test_oci.py
> @@ -3,6 +3,7 @@ import shutil
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestOci(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
> index 6f55cddee8..0438fe3d4c 100644
> --- a/support/testing/tests/package/test_dpdk.py
> +++ b/support/testing/tests/package/test_dpdk.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestDPDK(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
> index 95cccb529d..30c6a430fa 100644
> --- a/support/testing/tests/package/test_flutter.py
> +++ b/support/testing/tests/package/test_flutter.py
> @@ -5,7 +5,7 @@ import infra.basetest
>  from ..graphics_base import GraphicsBase
>  
>  
> -# gitlab-runner: xlarge
> +# gitlab-runner: 2xlarge
>  class TestFlutter(infra.basetest.BRTest, GraphicsBase):
>      config = f"""
>          BR2_aarch64=y
> diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
> index d40ffdba96..67ae61c3e1 100644
> --- a/support/testing/tests/package/test_mariadb.py
> +++ b/support/testing/tests/package/test_mariadb.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestMariaDB(infra.basetest.BRTest):
>      # We use a specific configuration for:
>      # - using Aarch64, to have more than 256MB memory,
> diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
> index 0e679a0ddd..5f3d41a28c 100644
> --- a/support/testing/tests/package/test_nodejs.py
> +++ b/support/testing/tests/package/test_nodejs.py
> @@ -29,7 +29,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
>          self.assertRunOk("node sample_nodejs_basic.js")
>  
>  
> -# gitlab-runner: large
> +# gitlab-runner: 2xlarge
>  class TestNodeJSModuleHostBin(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
> index 4b269e3af0..5c0b26a5fd 100644
> --- a/support/testing/tests/package/test_octave.py
> +++ b/support/testing/tests/package/test_octave.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestOctave(infra.basetest.BRTest):
>      # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
>      # not include gfortran.
> diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
> index 9d86a06129..bd16bd99ac 100644
> --- a/support/testing/tests/package/test_podman.py
> +++ b/support/testing/tests/package/test_podman.py
> @@ -211,11 +211,13 @@ class PodmanBase(infra.basetest.BRTest):
>          self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
>  
>  
> +# gitlab-runner: xlarge
>  class TestPodmanIptables(PodmanBase):
>      def test_run(self):
>          self.do_test()
>  
>  
> +# gitlab-runner: xlarge
>  class TestPodmanNftables(PodmanBase):
>      config = PodmanBase.config + """
>      BR2_PACKAGE_NFTABLES=y
> @@ -225,6 +227,7 @@ class TestPodmanNftables(PodmanBase):
>          self.do_test()
>  
>  
> +# gitlab-runner: xlarge
>  class TestPodmanTini(PodmanBase):
>      config = PodmanBase.config + """
>      BR2_PACKAGE_PODMAN_INIT_TINI=y
> @@ -234,6 +237,7 @@ class TestPodmanTini(PodmanBase):
>          self.do_test()
>  
>  
> +# gitlab-runner: xlarge
>  class TestPodmanSlirpIptables(PodmanBase):
>      config = PodmanBase.config + """
>      BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
> @@ -243,6 +247,7 @@ class TestPodmanSlirpIptables(PodmanBase):
>          self.do_test()
>  
>  
> +# gitlab-runner: xlarge
>  class TestPodmanSlirpNftables(PodmanBase):
>      config = PodmanBase.config + """
>      BR2_PACKAGE_NFTABLES=y
> diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
> index fd933ba560..571012ed7c 100644
> --- a/support/testing/tests/package/test_python_pyqt5.py
> +++ b/support/testing/tests/package/test_python_pyqt5.py
> @@ -3,7 +3,7 @@ import os
>  import infra.basetest
>  
>  
> -# gitlab-runner: large
> +# gitlab-runner: 2xlarge
>  class TestPythonPyQt5(infra.basetest.BRTest):
>      # We use a specific configuration for:
>      # - using Aarch64, to have more than 256MB memory,
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index 1b25d5ac5e..c8b243a6a7 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -5,7 +5,7 @@ import infra.basetest
>  from ..graphics_base import GraphicsBase
>  
>  
> -# gitlab-runner: large
> +# gitlab-runner: 2xlarge
>  class TestWeston(infra.basetest.BRTest, GraphicsBase):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
> index 30794a250b..851dcfab1a 100644
> --- a/support/testing/tests/package/test_z3.py
> +++ b/support/testing/tests/package/test_z3.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestZ3(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
