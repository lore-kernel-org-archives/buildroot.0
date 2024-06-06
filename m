Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F81C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BFC841935;
	Thu,  6 Jun 2024 19:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NMBQqIJUePz; Thu,  6 Jun 2024 19:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E7641943
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E7641943;
	Thu,  6 Jun 2024 19:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2385C1BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1062941938
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugiOWG8kN7f2 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C753E4179F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C753E4179F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C753E4179F
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso765780f8f.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702833; x=1718307633;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7A3fsUDUzaiwvQ2xhpUc9PLUEGpADGNWTE88e6bpOjo=;
 b=S1K0Drc9RPu6yMWBXEEkSiPH69/EnDZ/dTXlCpAPnqoS5eSBK1ZyToc/nViFatlO3m
 eLMOq+kOqYewCosIvSgAWC3OsCtmqhABIzZbs3D8l5JPzkuSKEinKanPLabq3WNE07S/
 4FXyeq3+AoynHhNEgM7Eh9qwttysaIPQ+1RYJ8+GQc6/7WcRUt41MntDP4necszWXQXn
 bMyTX2TkfW63n43l9WLTNSZAZVssaRWYzHN3qeAVKZNPxeNS3DMkUnLJvI7MdSllgbNw
 n/DBqKNZ6ebQuyT/bZd0aoOCTVS/rsZF1vVCexfr0EUceD2tOul9dHNEb8KPBPr2AYeU
 0DKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcW0KJogCrq1q2wiMU2bvl7IWbU5nRd/weXj13NHTVNq56UNl1Dkh7gVjfcW1n2TRUWyEg2Y6sOarlWN+B3hwbapJXl5gYwA==
X-Gm-Message-State: AOJu0Yy2khsIwHWShA2CSE5LA1F89S9A+mlaPfVnFkdBvHvR8X1vQSqE
 m2lt+P5jNRqL4tJB+1xFooPypsZKpHCzA4FIGIqDLUQta0dImpBKXvJFJXgE8Ls=
X-Google-Smtp-Source: AGHT+IETuqHCqxLE0vL4/hNip8u2cPu0xJV3zQ6Vav0qAMK883g5VVUtfcY+1FAw/78SeoBbZxgL/g==
X-Received: by 2002:a5d:474f:0:b0:350:2ba9:ca03 with SMTP id
 ffacd0b85a97d-35ef0dc98a9mr3241326f8f.23.1717702832597; 
 Thu, 06 Jun 2024 12:40:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fd1b56sm2316383f8f.112.2024.06.06.12.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:32 -0700 (PDT)
Message-ID: <9eab66d8-061e-4f8a-8bcf-0f05a7e840d9@mind.be>
Date: Thu, 6 Jun 2024 21:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
References: <20240514202337.3934490-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20240514202337.3934490-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702833; x=1718307633; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7A3fsUDUzaiwvQ2xhpUc9PLUEGpADGNWTE88e6bpOjo=;
 b=B8ZtitiIHKLz4npegrC4GuxVb9E+cI99F2dQnb17Bqr7mG2kFG5yHSt8agj2tBLs1z
 8KMGU1zLIx2/pd83ccsSrv02/+dd8aHRnQWGfaxiCqEGNbO9ZbdC6dg1FPxp8gcuAnru
 ZWYNpiNqZYKRh8yfrD+kCIZhjcmH4gWBZFPyXAhb4fPIotsHa0X9J7Ho9Ye7ePlIQVos
 2Y7msxDeRanj43yU19zy2GZ5Gh8d3GrPXDjFJTZ53u+Gii0SKD41gYiMRZKKDkclkN5Q
 OkO/hOm0s9/gZSABtHiQMX0bGh4nCBRZBttR26HJz9MuWSTrCtM7+g4rJe7XAh2mTcHp
 9yLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B8ZtitiI
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: fix build for the
 bootlin-riscv32-glibc toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2024 22:23, Thomas Devoogdt wrote:
> Seen while using the ./utils/test-pkg utility.
> 
> /home/thomas/br-test-pkg/bootlin-riscv32-glibc/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: crypto/legacy-dso-riscvcap.o: in function `OPENSSL_cpuid_setup':
> riscvcap.c:(.text.startup+0x190): undefined reference to `riscv_vlen_asm'
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Superseded by the bump to 3.3.1.

  This was another annoying example of the patch still applying due to the fuzz 
factor, but fortunately I was very well awake today :-)

  Regards,
  Arnout

> ---
>   ...Implement-riscv_vlen_asm-for-riscv32.patch | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch
> 
> diff --git a/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch b/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch
> new file mode 100644
> index 0000000000..5de3221172
> --- /dev/null
> +++ b/package/libopenssl/0004-Implement-riscv_vlen_asm-for-riscv32.patch
> @@ -0,0 +1,50 @@
> +From 84f1acab51e159366b8cf97635ed97f8f0b6564a Mon Sep 17 00:00:00 2001
> +From: Hongren Zheng <i@zenithal.me>
> +Date: Fri, 26 Apr 2024 06:03:43 +0000
> +Subject: [PATCH] Implement riscv_vlen_asm for riscv32
> +
> +riscvcap.c: undefined reference to 'riscv_vlen_asm'
> +
> +Reviewed-by: Paul Dale <ppzgs1@gmail.com>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/24270)
> +
> +/home/thomas/br-test-pkg/bootlin-riscv32-glibc/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: crypto/legacy-dso-riscvcap.o: in function `OPENSSL_cpuid_setup':
> +riscvcap.c:(.text.startup+0x190): undefined reference to `riscv_vlen_asm'
> +
> +Upstream: https://github.com/openssl/openssl/commit/87314d24c4f025df1ebf47dc527cc8a96bef354a
> +Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> +---
> + crypto/riscv32cpuid.pl | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/crypto/riscv32cpuid.pl b/crypto/riscv32cpuid.pl
> +index 20694e7de7..ac1c043ec9 100644
> +--- a/crypto/riscv32cpuid.pl
> ++++ b/crypto/riscv32cpuid.pl
> +@@ -84,5 +84,22 @@ OPENSSL_cleanse:
> + ___
> + }
> +
> ++{
> ++my ($ret) = ('a0');
> ++$code .= <<___;
> ++################################################################################
> ++# size_t riscv_vlen_asm(void)
> ++# Return VLEN (i.e. the length of a vector register in bits).
> ++.p2align 3
> ++.globl riscv_vlen_asm
> ++.type riscv_vlen_asm,\@function
> ++riscv_vlen_asm:
> ++    csrr $ret, vlenb
> ++    slli $ret, $ret, 3
> ++    ret
> ++.size riscv_vlen_asm,.-riscv_vlen_asm
> ++___
> ++}
> ++
> + print $code;
> + close STDOUT or die "error closing STDOUT: $!";
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
