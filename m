Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAB1C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D547A803B7;
	Thu,  7 Aug 2025 18:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akgQ_PlpgV0Q; Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4BF980D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BF980D72;
	Thu,  7 Aug 2025 18:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B351C10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A59E960642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6M2yYf7jo3l for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C44416063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44416063E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C44416063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so1015157f8f.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591042; x=1755195842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZSf5tAnquKQG3VNrCRGgtsKOtHeje1Mp52x1mdqii4=;
 b=m339HSLUixbZ+UT+zXzyCRuOmG3c74kpBdcpy+ZxjI3zmqSeXpJHMTfnN5VdiEovlx
 JWEU7CagUEtzNfIPikTOGtJ1UhN5LeGtNtNBOrixQM54+J+FcTQ5pmrevld61LiYImQM
 AZPEIw1Um7nNua1Ji56P+1GhO3P1/HKDe9Qbjaqw/MLkRbnyklpncPrGlOHhSjmEjmux
 kbigsVoXHrL82ZtzeGysThto50tbRerKgCMZ4fhzK9USxiTVc1DP8eur2bkHvY5ahCQ2
 McnMxQt2BzGd0Hxt33YZDFah0iI0kFCbu8IhN7fp6b0M10imEuXGlDKd6Y9dk6XkRF0/
 xVDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgm4MySf5cQlxq4j4VgHMdAjOHjC+8Z/wMA83gIsE2j2OEvD8OEiHiZPbalg/nWLyC2yVoGcxG7Q=@buildroot.org
X-Gm-Message-State: AOJu0YzDUuw9wTy3BCIZYiPKCAuL+h5u/C/FA7YoHYpLINW1QpCLKAsx
 BY9fvN4K/OF5bx81Nf6bN0ZcTAfJpzahbVy0SUsmaZycdf6bjqwudn5T3nOvTPXnZsiO9m/lO7J
 uI0Gz
X-Gm-Gg: ASbGncsEb37R3FcXzkTKP2uq8E/spUTKyXBr5va2l8sAnerE8vkTruRGwH5KyjMcOlC
 n0BS69kWB+1MMRKzvPY7lyDdoN6tvJ2FWbCZQgzsyEzwTxf8mcR4rY9A7I3UTzCNZUwXCEZTTtS
 IWgWelqAt0xvQ3HQG+k+2DdBn7QsajXglT+UMjSvjmC1Mp2mVrZSkqzEh6nVc430at5h0WKTJTz
 YIZ2ZAiiK1DuE3q2hqj48TbGuDLyAHOLS047w+H/X+MJxy5AUmVT9Y0K0Qn0W6pN/DeBLQZcTqs
 YVPyA1SdsXUehmPG5HH7tPL8erzcpD4J6tgPP7Css2TuviPCbqlMVDBXy/Gkr4lzzkBuWQzPO8G
 rInSxaJu/CqmFrQ==
X-Google-Smtp-Source: AGHT+IGxsL30FcJgaED2UNrQhgEXyQKFminXVsw0VjzR20WFHrzbrFejPiQ3o621x9HsJO9ysvXaLw==
X-Received: by 2002:a5d:64e9:0:b0:3b7:7377:84c5 with SMTP id
 ffacd0b85a97d-3b9009054aemr251105f8f.0.1754591041842; 
 Thu, 07 Aug 2025 11:24:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfd10sm375313145e9.21.2025.08.07.11.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:01 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:01 +0200
Message-ID: <20250807182401.724176-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
References: <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591042; x=1755195842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZSf5tAnquKQG3VNrCRGgtsKOtHeje1Mp52x1mdqii4=;
 b=BI27IEySPHbCZrz/YwayLxADyYoSs07no0O0pR1jTEGooHemkPuUda33e/Xpd8/5aX
 QswvGrfr4+2Ev1uC5x8guUgtXiHpPQzp67iKQtub3EIogff6g51dSlJ8yiNUEFAQnq8E
 pUovcc40DNpkIrINwIHwQArlA8qoHFUgABI2qiXSdKzlKTrEdMee0oug+sfgyHnN9GIo
 8Nn9OpSzfjEku1/lsqHK9gzG868GPd3MkQw4cT48HP8J+USyWPVLmv/Ny4D1AjKF5w/e
 k/EoVwRSFWUBpO83BlIceFLMAsjiyILO+sVhL8/VPpiR+kWQSp5phzHcylUcDEaIlfU+
 jPpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BI27IEyS
Subject: Re: [Buildroot] [PATCH 01/13] support/testing: add a crun-based
 runtime test for docker-compoe
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
> Via the docker-compose runtime test,m we can exercise the full suite of
> the docker-related packages: docker-compose, of course, but also
> docker-engine, which in turn allows exercising containerd. The latter
> by defualt uses runc as the container runtime, but can alternatively use
> crun.
> 
> Extend the docker-compose runtime test with a variant that enables crun.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../tests/package/test_docker_compose.py       | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
> index 16027c9c3a..6a8f6f4010 100644
> --- a/support/testing/tests/package/test_docker_compose.py
> +++ b/support/testing/tests/package/test_docker_compose.py
> @@ -3,7 +3,7 @@ import os
>  import infra.basetest
>  
>  
> -class TestDockerCompose(infra.basetest.BRTest):
> +class BaseTestDockerCompose(infra.basetest.BRTest):
>      scripts = ["conf/docker-compose.yml",
>                 "tests/package/sample_python_docker.py"]
>      config = \
> @@ -53,7 +53,7 @@ class TestDockerCompose(infra.basetest.BRTest):
>      def python_docker_test(self):
>          self.assertRunOk('python3 ./sample_python_docker.py', 120)
>  
> -    def test_run(self):
> +    def do_test(self):
>          kernel = os.path.join(self.builddir, "images", "bzImage")
>          rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
>          self.emulator.boot(arch="x86_64",
> @@ -70,3 +70,17 @@ class TestDockerCompose(infra.basetest.BRTest):
>          self.docker_test()
>          self.docker_compose_test()
>          self.python_docker_test()
> +
> +
> +class TestDockerComposeRunc(BaseTestDockerCompose):
> +    def test_run(self):
> +        self.do_test()
> +
> +
> +class TestDockerComposeCrun(BaseTestDockerCompose):
> +    config = BaseTestDockerCompose.config + """
> +        BR2_PACKAGE_CRUN=y
> +        """
> +
> +    def test_run(self):
> +        self.do_test()
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
