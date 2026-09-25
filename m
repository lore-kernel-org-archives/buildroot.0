Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32313C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C362D60EAF;
	Fri, 25 Sep 2026 14:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygaz8RRv02VF; Fri, 25 Sep 2026 14:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 89CEF60E8E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347665;
	b=j6Xw3OoNLonL6DIDlo83DA5HfYxRUQbyhLROkiK5AQJSrLcOJW/lCNgp75WyT+3aCngZ
	 Wm3Y12pn8Zn6r8UNcfYAe61MEPYFExCJ9nm6C5JxrqrF8gByFZnBFrFDWIwBqS0+UStpM
	 SFShjn5qjnpn5T1JwFCyVXrDf4N9ToGTgAUjEG2jtmqrV2eAi1xBJ7URR+gMsmS7GVTpI
	 16eHkowtSrL0MLjxLx62PihFyT6TaIJ+v72h4wLLzxYXnWK9B9TLgboFzGrTYHXqzKqdZ
	 GOdeW0xec/Ap1vhN4DI3MN66xeqSfzBVpSm7pO/xkJJfseAMFpSOlmeGsfbcFjDQv2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aJ0+CwLMYFg5QH4IfINj+Sgm6fCSW9PW7JLloz/DY6A=;
	b=Jlud6NzPbvaP3A3SPeko/llnKi0i0+lFevwDk+Khh0CfmmYN1ZyasUgaGJASV1EyJiEY
	 3a0v2u5YmqWkzuG/v0oap8O4rM20lqhWvEcXXwwSDPNtf5yOGtsaq04OcS9JTI6m2h8yi
	 LsAFjHyMjpgI5xc9oNsXc++z3PT5rOQmLOd6Pz73AYf3AOng9/5a4Cl7v4XpjWQlQy2gd
	 LB9gkpwW4ClNRxRPEundnhjK7wZoFeHx0UMRzpPsqyZmNY+teNLk8Rgkj1K44YSux2YkK
	 TcY/UJ9de5L100uWx0sgHrRMCqs+TNEJc/TsF5J8HlRA1SFgiTvL76F5mzMiiu6zK9w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347665;
	bh=aJ0+CwLMYFg5QH4IfINj+Sgm6fCSW9PW7JLloz/DY6A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VThuySAM5mwMqfpuGPZm2Is6wfab02z0EzkPzamRO4KZD2dvougsMz95u7l/UzzIP
	 20GUHzTSnkbnVrDfFst/HIFUPwoaOrEGaMiL8qAL/3ZLAbVmS6t2ztEmuRJII4iAVC
	 pWWln/YHJytEVIjKF+be/Xd25eG9ahNqMUCIkVqdzi2Hfjf7F29Jk3G4Ib+z5XG2fp
	 cVH84dM/BM8CadZhme4XUf2gg3+PVR1iEyvHM5uMgmNe7etiWKyEnnH1bSPwBUSL5u
	 /fBBHdaoVLre+HchKy2O+ECk4sQPL0s3RLqM4b2gzRmjFp07faz2vJQ+2OJosXqvyV
	 p07b5SFu65+Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CEF60E8E;
	Fri, 25 Sep 2026 14:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE3E332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E4F81448
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VscD-D9gI7so for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 08CA8812A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347663;
 b=p4M6/vZrrQtZZvRUG6JyavO5ZCoFTuiOTUy69m59P5uDqyPd37Y3VweaFGnJXk9Gfb8A
 UK/9/SX9X2I8wkLozGoO0fHoStnGP46ANOKeqdTYVT5wTRO+mYuh77sfqbhJcq76wvjLQ
 GpK0UKaOUBekOz8ye0ajJksZ0hWXTgueCrMqiNxDYyKXQEM5FV5zbomqR5XlOZUpHLTir
 eAQJVkjqa6uxFn4MxbZvR724+svttcGUhH9ZUz0U8CxWLhF/oAPCrjFT2CrgDtPvKhqGi
 hKtRtSEDbNElomxgRBhqHsIyq9VzOerlbMhUcJBXe5WIbwq13FgyMqkv2iTiZB0WJeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347663;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pnbz33CsinHFUYaeOzs4Dl4ysxoIQ3cp4Wa0FPZAF6s=;
 b=I+5FyElxEzBVrRoWe3EJ8JWnBZzsErTNMgzikszD3NxAfgenQUu/TN5d1kF/7NILz1+n
 zSPDLYrJQYWd4ot0PEYzXgXXwLHgKncoStay7MhyNn7eqsUnoDsxJpxbYjIbvKgKUHliA
 WHCl2OWzd9PwQWWOyOSd7gwTU0RfeDoPbB+486t3w/kdJD/v5Gp/JcvF9MUG1KCAUQnu9
 0SOUmInuR/5twWKrDEIeCRQQ1jx3tboWxc8cmm95BWA2Wa2iJ+8ei2v81qSDgidYRFK86
 Ov1anckzk/knKWnsFUc97fOEkGxNAYlPvbFmOi9LvFjUnjjE9LaejFrTj3jTw5JDkaw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UnwH5rq7; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08CA8812A4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:43 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso12917885e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347661; x=1790952461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pnbz33CsinHFUYaeOzs4Dl4ysxoIQ3cp4Wa0FPZAF6s=;
 b=S8hyoIe3T0Au+pjjHodGsbcxn/k6ooSiqZl0wUI5OXzV8YbhUJ8tHO0DPVQWMp+IrP
 JjqfCH6OX+DZH+fViuwKlARQvjG2FOmZm2xgS+yPQf1m0TI0/H5JHS2wYbtnrC3rA/NZ
 1svKECr1cIiJAADANFenV80K7d7iHdWtBVVz4mPx1bjL1MDww840EiGctL2fLzGCIhvS
 1tPcq3HNJZFg4nelcyn06ACKPEqxHlvkdv8UFkyJC0UFhLYLecZ3dRpKEhGHy/k/nTE7
 0pO/L+5wHWGW3CyyCFSBc+A9kWLTtiJ6F09rmqXsUJQDY8xn8JmgATu9zDCfqSQHL6f0
 kMWg==
X-Gm-Message-State: AFuF++lqMPv4q/gn9+9bnQNt17anjkxDqtlHDMRQgI023Sdh89BUvVDd
 rAJG4gXWtsHdx/6cT1dPRMOSgmjcfsihJD1cCC4Pqb+xRXy5hqlVCieh77rbUwAmb8/fZj0pcXd
 majPF3PMrOA==
X-Gm-Gg: AYBFou0tco51WdXp6sRHSPpKAMcWfJtMpTIWJIawkYVZ3uc47lRREpQKNOgUib8ETcF
 xN3QvlqSHK0gA28U79ca+qMnD/HHT0PfAXGRIe35NkNfsEv3q3muQ9PPQkqXxc0IfzZVhzErYrZ
 ambd1cFVJAkBHoB4IER3knMIEzki3iWCLBwfSY+U/g00ME/pXjdKPYa57b2LRDHzJ5QruwRzyA9
 rXn5huS5qxowsKjEgX96+dp8yE1703J8ibaUm4eNxEjdaAGMkMQ6hghf+qg8qA4uIaCDWe8Eynr
 g2QEsEgLILMAzx4qL7wOzy+yNjVWcLymeesSyiQ6elnxJtCRIbqkGVJmZuSs1sskTAgU1iOto7o
 upexmV7M0bBRUEOAFgWQRoS1Kykw0jECT4xAn7BqzW+CcVQ5Oixs9T73PGRc5/b4PwwATvQz3k2
 ho3egyVoYEYUceDa1GVMC4iqebJdIGVIVRXFmtKRrWUMqYvK9cYVhms3KmHaEfiSSzWPKBDJke9
 qZfJalwTCVpgsV6Jdhk+kQiH78Y9lTxMc0ZFyIXnA==
X-Received: by 2002:a05:600c:3e06:b0:49f:f099:6f9b with SMTP id
 5b1f17b1804b1-49ff0997088mr43488935e9.13.1790347661140; 
 Fri, 25 Sep 2026 07:47:41 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff044422asm63498815e9.2.2026.09.25.07.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:40 -0700 (PDT)
To: buildroot@buildroot.org,
	Fengwei Tan <tfx2001@outlook.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:37 +0200
Message-ID: <20260925144739.4101511-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <SY8P300MB0041A241A227D8AC8B1C8488B5BD2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] support/testing: add FLAT stack size
 test case
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add an infrastructure test case to verify that the per-package
> <PKG>_FLAT_STACKSIZE variable correctly configures the stack size in the
> generated FLAT binary header.
> 
> Signed-off-by: Fengwei Tan <tfx2001@outlook.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> As we discussed in [1], this patch adds a simple test case to verify
> that $(PKG)_FLAT_STACKSIZE works as expected.
> 
> I have also pushed this patch to GitLab CI, and the test job passed
> successfully [2].
> 
> [1] https://lore.kernel.org/buildroot/SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM/
> [2] https://gitlab.com/tfx2001/buildroot/-/jobs/16053520032
> 
> Changes in v2:
> - No code changes. Settled on the FLAT header inspection approach as a
>   lightweight solution, since no feedback was received on the RFC version
> - Link to RFC: https://lore.kernel.org/buildroot/SY8P300MB0041166E9B5D56A3796BD3D6F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM/
> ---
>  DEVELOPERS                                         |  3 +++
>  .../core/br2-external/flat-stacksize/Config.in     |  1 +
>  .../core/br2-external/flat-stacksize/external.desc |  1 +
>  .../core/br2-external/flat-stacksize/external.mk   |  1 +
>  .../package/flat-stacksize-test/Config.in          |  7 ++++++
>  .../package/flat-stacksize-test/Makefile           | 15 ++++++++++++
>  .../flat-stacksize-test/flat-stacksize-test.mk     | 22 ++++++++++++++++++
>  .../package/flat-stacksize-test/main.c             |  3 +++
>  support/testing/tests/core/test_flat_stacksize.py  | 27 ++++++++++++++++++++++
>  9 files changed, 80 insertions(+)
> 
> 
> ---
> base-commit: 9a1c11c9971b454b3b38c4eb111ac5e42a15cf1c
> change-id: 20260912-flat-stacksize-test-793fe88e43bb
> 
> Best regards,
> --  
> Fengwei Tan <tfx2001@outlook.com>
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 97eb2d9cac..ed59f11309 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1124,6 +1124,9 @@ F:	configs/freescale_imx6ullevk_defconfig
>  N:	Falco Hyfing <hyfinglists@gmail.com>
>  F:	package/python-pymodbus/
>  
> +N:	Fengwei Tan <tfx2001@outlook.com>
> +F:	support/testing/tests/core/test_flat_stacksize.py
> +
>  N:	Fiona Klute <fiona.klute@gmx.de>
>  F:	package/*/S*
>  F:	package/panel-mipi-dbi-firmware/
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
> new file mode 100644
> index 0000000000..cdb4e9f057
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
> @@ -0,0 +1 @@
> +source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.desc b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
> new file mode 100644
> index 0000000000..f9c1a745e0
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
> @@ -0,0 +1 @@
> +name: FLAT_STACKSIZE
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.mk b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
> new file mode 100644
> index 0000000000..82900bf036
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard $(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/*/*.mk))
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
> new file mode 100644
> index 0000000000..67cf9964f5
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FLAT_STACKSIZE_TEST
> +	bool "flat-stacksize-test"
> +	depends on BR2_BINFMT_FLAT && !BR2_USE_MMU
> +	help
> +	  Package for testing the $(PKG)_FLAT_STACKSIZE variable, which
> +	  defines the stack size of an application built into the
> +	  FLAT binary format.
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
> new file mode 100644
> index 0000000000..dc7681bf56
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
> @@ -0,0 +1,15 @@
> +O ?= $(CURDIR)
> +
> +CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
> +
> +TARGET := $(CANONICAL_O)/flat_stacksize_test
> +
> +all: $(TARGET)
> +
> +$(TARGET): main.c
> +	$(CC) $(CFLAGS) -o $@ main.c
> +
> +clean:
> +	rm -f $(TARGET)
> +
> +.PHONY: all clean
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
> new file mode 100644
> index 0000000000..64695ad2dc
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# flat-stacksize-test
> +#
> +################################################################################
> +
> +# Define a stack size that is different from the default FLAT
> +# stack size (4096 bytes).
> +FLAT_STACKSIZE_TEST_FLAT_STACKSIZE = 8192
> +
> +define FLAT_STACKSIZE_TEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) \
> +		-C $(FLAT_STACKSIZE_TEST_PKGDIR) O=$(@D) \
> +		$(TARGET_CONFIGURE_OPTS)
> +endef
> +
> +define FLAT_STACKSIZE_TEST_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/flat_stacksize_test \
> +		$(TARGET_DIR)/usr/bin/flat_stacksize_test
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
> new file mode 100644
> index 0000000000..9b6bdc2ec2
> --- /dev/null
> +++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
> @@ -0,0 +1,3 @@
> +int main(void) {
> +    return 0;
> +}
> diff --git a/support/testing/tests/core/test_flat_stacksize.py b/support/testing/tests/core/test_flat_stacksize.py
> new file mode 100644
> index 0000000000..ab41fadbc8
> --- /dev/null
> +++ b/support/testing/tests/core/test_flat_stacksize.py
> @@ -0,0 +1,27 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestFlatStackSize(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/core/br2-external/flat-stacksize")]
> +    config = """
> +        BR2_arm=y
> +        BR2_cortex_m4=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_FLAT_STACKSIZE_TEST=y
> +        """
> +
> +    def test_run(self):
> +        binary = os.path.join(
> +            self.builddir, "target", "usr", "bin", "flat_stacksize_test"
> +        )
> +        self.assertTrue(os.path.exists(binary))
> +
> +        # Check the FLAT binary header really carries the stack size
> +        # declared by the package (8192 = 0x2000).
> +        out = infra.run_cmd_on_host(self.builddir, ["arm-linux-flthdr", binary])
> +        self.assertIn("Stack Size:   0x2000\n", out)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
