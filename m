Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E75E74900
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B551D404CC;
	Tue, 23 Dec 2025 22:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNuaH7vtA-9d; Tue, 23 Dec 2025 22:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FDF404E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528057;
	bh=lshItE2KkSylS6lPpwOvNkmVgZ2B16hLqQ+OKZPDHbU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HKa7HBC/T+Jdl1k9SdI+unNbBXhtY8w9Fy86IWsu6T63sGEcGxq3+rT49dhyhMVl8
	 +jpxaDd9Sp8H8V1fR1n1NLemKV4S9uWWx1mFp/wdqELaEGsNigv+nx9vKihp1OygI8
	 MzICeM3/ypC3hHWdtGd5XbAYbpk2fM/tq94ZR10zNnTp9Fe+xYsB+gMuapwKlk5BAj
	 kxB5Tlno2R5naLfnQW/AVfYT/Nef1BEW4t9x6u9Fo0pwV57DoYRojh7e6qDr2j4Q/h
	 YPYmh7HRx8to+HcM+44uuqcpJ40vMip4HxXKTYrPEQnqJTBaTgxSzvRDmQlHtqvuUI
	 d3bT4qvwDPJhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FDF404E4;
	Tue, 23 Dec 2025 22:14:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B896119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D0C81194
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIZTxaCrourf for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FE6481193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE6481193
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FE6481193
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C0F511A23BC;
 Tue, 23 Dec 2025 22:14:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F04360716;
 Tue, 23 Dec 2025 22:14:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C7B410AB04C2; Tue, 23 Dec 2025 23:14:08 +0100 (CET)
Date: Tue, 23 Dec 2025 23:14:07 +0100
To: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, Alistair Francis
 <alistair@alistair23.me>, Wilfred Mallawa <wilfred.opensource@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20251223231407.68c506ea@windsurf>
In-Reply-To: <20241118025944.1068363-2-wilfred.mallawa@wdc.com>
References: <20241118025944.1068363-2-wilfred.mallawa@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766528051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=c1+4yJ53ytxnwkHX1Njw4hOYdDNdYdfVeIVjx7uxIRE=;
 b=DzCtatFWF8TXydCx8SggdHBCNlPBwBPmFNVUGN8j/jpzMvJ52392YuXYBJqnKJvuhwzxaA
 2ml7X65dxDpj9LxJm4x2F+7lQuWU3HEpjiLtzlf276S3p5Hk/7+EvRLivDUm7+nry8PHap
 4b6MXcBJZ5kkF5ejH0S1JAsrBlIKdcQ7GhW62QPSh4weuEEkXGvr/7eSp9urfOOZNMNzSS
 OtXUuq+pwFBcxmdN4/LVTakG+uv7A+/TCD8rg5t5FJgRR5ES8MImKidonJIcDpDSrjL39u
 RRXXHZvI+u8ST+nie99RL0R9wH6zHBrbTvFTWmSe569vI4Q3wvUARdBfT3V7bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=DzCtatFW
Subject: Re: [Buildroot] [PATCH v5 1/1] package/spdm-utils: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Sorry for the very slow feedback. I have some very minor comments below
(which I had fixed locally). But unfortunately the build fails for me.

Take this defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_SPDM_UTILS=y

And build it under our Docker container:

./utils/docker-run make

The build will fail with:

  = note: /home/thomas/buildroot/sdpm/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/14.3.0/../../../../aarch64-buildroot-
linux-gnu/bin/ld: /home/thomas/buildroot/sdpm/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib//libcryptlib_openssl.a(x509.c.o): undefined re
ference to symbol '__stack_chk_guard@@GLIBC_2.17'
          /home/thomas/buildroot/sdpm/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/14.3.0/../../../../aarch64-buildroot-
linux-gnu/bin/ld: /home/thomas/buildroot/sdpm/output/host/aarch64-buildroot-linux-gnu/sysroot/lib/ld-linux-aarch64.so.1: error adding symbols: DSO m
issing from command line
          collect2: error: ld returned 1 exit status

This seems to be a disagreement on -fstack-protector usage, like
spdm-utils forcing it or something like that (I didn't investigate).

Also, when I read
https://github.com/westerndigitalcorporation/spdm-utils, it seems to
imply that installing the cbor-diag Ruby gem is needed, but I don't see
where you're handling this in your package.

See the (very very) minor comments below.

On Mon, 18 Nov 2024 12:59:45 +1000
Wilfred Mallawa via buildroot <buildroot@buildroot.org> wrote:

> 	- Drop the ruby/gem dependency entirely as`spdm-utils` v0.7.1 makes it
> 	  optional.

Ah? So the documentation is no longer accurate? Then is host-ruby still
needed as a dependency?


> +SPDM_UTILS_ALIAS_CERTS = \
> +		openssl.cnf \
> +		slot0/immutable.der \
> +		slot0/device.cert.der \
> +		slot0/device.der \
> +		slot0/device.key \
> +		slot0/bundle_responder.certchain.der

One tab for indentation.

> +
> +# Used to generate SPDM Alias certificate model certificates,
> +# required by `setup_certs.sh`
> +SPDM_UTILS_GENERIC_CERTS = \
> +		slot0/param.pem \
> +		slot0/end_requester.req \
> +		slot0/end_requester.key \
> +		slot0/end_responder.key \
> +		slot0/end_responder.req

Ditto.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
