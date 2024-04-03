Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D635ACD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56AF5417D5;
	Wed,  3 Apr 2024 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c7SGALAMUeh; Wed,  3 Apr 2024 21:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECDD417C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECDD417C6;
	Wed,  3 Apr 2024 21:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A23931BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CC2E60D53
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu84StdinWoL for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73DE06073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73DE06073E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73DE06073E
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3416df43cabso163491f8f.3
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 14:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712178538; x=1712783338;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yzDzTtKSalwuQ9Q9NJ8XcvoDC+f9NUSTT5J5phFhm30=;
 b=hY0Mi7Wa1kd3xAYfdlmj0T8zBhwk/A2uXZEWjtXbwcjTe7GtckAHaTENjFjk1w8pDw
 i0xQS1AozF+u3oGuEwfVyii3M5IrfMHPK1rihzqL4ht3MHcKkvL33jHie1HMs2WZF5ed
 wr8auyupFzLVpOY8C8ZuH1Dt0y6mcv1A8Q5/7ezgSvvn14+r5P3WmRbgRNL6//IUj0Y8
 w+LOUmZ9K7HdowBksJ7jTdnWqcaoIMlbeTdve5eEETL076ne6SAWs0NUgbruwLXy1hXo
 2UITl+eHpdTwon7A2V9wFs/2B0E7qiuEf2r+4ltZKFEdeucmiC/fa94gISx0H7rA9Fiw
 lCFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUK/2WmE8e4yDr/jrYHEzsC/p48pZe7Q/sHcS4AOV3eQ/zAlbPj5T3muDWbFfRxl7lYvZcnhCFGxGGJ1baS8eXByhM5fx6rw==
X-Gm-Message-State: AOJu0YwMp7X2AsBGuLBCcSmyKf9yUbxtTQkruAqoogOpzh2degM+mvtp
 9Nk2KhBgj15wilKJVAwIfB5LCyOO7BLgrvwGuCh+6w0u+6zXhbHedggTrdL/gNA=
X-Google-Smtp-Source: AGHT+IE2qXZ+92Dn3LcuntsCXhfQiKBRAyIodRrx5+/3VITX7odeTb13bmwqQdfawElLOqtI+nterg==
X-Received: by 2002:a05:6000:e45:b0:33e:bfd0:41f9 with SMTP id
 dy5-20020a0560000e4500b0033ebfd041f9mr459153wrb.31.1712178538447; 
 Wed, 03 Apr 2024 14:08:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dq6-20020a0560000cc600b00341c3071c93sm18156097wrb.73.2024.04.03.14.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 14:08:58 -0700 (PDT)
Message-ID: <034c6423-66b4-44b5-ae63-6ecfe1671e87@mind.be>
Date: Wed, 3 Apr 2024 23:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mat Martineau <martineau@kernel.org>, buildroot@buildroot.org
References: <20240120011759.2454452-1-martineau@kernel.org>
 <20240120011759.2454452-3-martineau@kernel.org>
Content-Language: en-GB
In-Reply-To: <20240120011759.2454452-3-martineau@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712178538; x=1712783338; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yzDzTtKSalwuQ9Q9NJ8XcvoDC+f9NUSTT5J5phFhm30=;
 b=gugovgW/E0fDjbQnAz3Wxtm9oTyKrlnaaQzZZBkA/KpfbVG6w6qcVhN1FNrdIfvYCl
 Roj4LZjdnzh5jlzfTxfvx9WoxdyOqnFpNXpe41yt+UMezk1CRXbtCeLe4/IceGEbH+MZ
 Ynb9V8rqsI/Pa7uHcor92TTQgW6whpizRdGp/VCE1j0wtAqfdEcmPkJNcBf4gObyFoPR
 MF8e+5NCBys0O26IjtmtCIqgK3Ve+xao33bfIp+E9L0TTBssYg3x/ep4fjUh62s5xrvB
 +1Cl8iqGDN6NjqbsOdtK7OLH26P0Wx2M7aWRwB9ra780x9dSQyZd+G3FmpDQOF9YQ8AZ
 LYMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gugovgW/
Subject: Re: [Buildroot] [PATCH v7 2/2] package/bpftrace: new package
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
Cc: jugurtha.belkalem@smile.fr, qyousef@layalina.io,
 Qais Yousef <qais.yousef@arm.com>, naveen.mamindlapalli@gmail.com,
 romain.naour@smile.fr, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/01/2024 02:17, Mat Martineau wrote:
> From: Qais Yousef <qais.yousef@arm.com>
> 
> bpftrace is a high-level tracing language for Linux enhanced Berkeley
> Packet Filter (eBPF) available in recent Linux kernels (4.1 and later).
> 
> Only tested on x86_64.
> 
> v7 changes:
>   - Ported to current buildroot release
>   - Update to bpftrace 0.19.1
>   - Add libcereal dependency
>   - Use new configure option for USE_SYSTEM_BPF_BCC
>   - Update dependencies
>   - Use BUILD_SHARED_LIBS=OFF instead of patching cmake files
>   - Don't install tool docs in target filesystem
>   - Propagate config dependencies

  This shouldn't be in the commit message, it should be below the --- line.

> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Cc: Qais Yousef <qyousef@layalina.io>
> Signed-off-by: Mat Martineau <martineau@kernel.org>
> 
> squashme: bpftrace: more review fixups

  And this shouldn't be there :-)

  I applied both to master with this fixed up and a few more things.

[snip]
> diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> new file mode 100644
> index 000000000000..e8afa37b6e63
> --- /dev/null
> +++ b/package/bpftrace/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_x86_64
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +
> +config BR2_PACKAGE_BPFTRACE
> +	bool "bpftrace"
> +	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc

  This is already in BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS so removed.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # bcc
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libbpf

  This is considered an arch dependency so moved to the beginning of the 
dependencies list, and repeated in the comment.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
> +	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
> +	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
> +	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
> +	depends on BR2_USE_MMU # bcc -> python3

  This is also an arch dependency.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3
> +	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
> +	select BR2_PACKAGE_BCC
> +	select BR2_PACKAGE_LIBBPF
> +	select BR2_PACKAGE_CEREAL
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_XZ
> +	# LLVM RTTI mendatory: https://github.com/iovisor/bpftrace/issues/1156
> +	select BR2_PACKAGE_LLVM_RTTI
> +	select BR2_PACKAGE_LLVM

  I ordered all selects alphabetically.

> +	help
> +	  bpftrace is a high-level tracing language for Linux enhanced
> +	  Berkeley Packet Filter (eBPF) available in recent Linux
> +	  kernels (4.x).
> +
> +	  bpftrace uses LLVM as a backend to compile scripts to
> +	  BPF-bytecode and makes use of BCC for interacting with the
> +	  Linux BPF system, as well as existing Linux tracing
> +	  capabilities: kernel dynamic tracing (kprobes), user-level
> +	  dynamic tracing (uprobes), and tracepoints. The bpftrace
> +	  language is inspired by awk and C, and predecessor tracers
> +	  such as DTrace and SystemTap.
> +
> +	  It's highly recommended to NOT strip bpftrace binary.
> +	  To do so, add "bpftrace" to BR2_STRIP_EXCLUDE_FILES.
> +	  See:
> +	    https://bugzilla.redhat.com/show_bug.cgi?id=1865787
> +
> +	  https://www.github.com/iovisor/bpftrace
> +
> +comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

  This should have been BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS. In addition, as 
mentioned, the SYNC_4 and MMU dependencies are missing.

> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7

  host GCC 7 and kernel headers 4.13 dependencies are missing here.

> diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
> new file mode 100644
> index 000000000000..c2ecc927da35
> --- /dev/null
> +++ b/package/bpftrace/bpftrace.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256  b520340f28ce4d6f2fb2355f1675b6801ff8498ed9e8bff14abbbf6baff5a08e  bpftrace-0.19.1.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> new file mode 100644
> index 000000000000..072cee4ae72e
> --- /dev/null
> +++ b/package/bpftrace/bpftrace.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# bpftrace
> +#
> +################################################################################
> +
> +BPFTRACE_VERSION = 0.19.1
> +BPFTRACE_SITE = $(call github,iovisor,bpftrace,v$(BPFTRACE_VERSION))
> +BPFTRACE_LICENSE = Apache-2.0
> +BPFTRACE_LICENSE_FILES = LICENSE
> +BPFTRACE_DEPENDENCIES = host-bison host-flex bcc libbpf cereal bzip2 xz elfutils llvm

  I ordered these alphabetically, and changed to one per line.

> +
> +# libbfd, libopcodes
> +ifeq ($(BR2_PACKAGE_BINUTILS),y)
> +BPFTRACE_DEPENDENCIES += binutils
> +endif
> +
> +BPFTRACE_CONF_OPTS += -DENABLE_MAN:BOOL=OFF \
> +	-DUSE_SYSTEM_BPF_BCC:BOOL=ON \
> +	-DBUILD_SHARED_LIBS:BOOL=OFF \
> +	-DBUILD_TESTING:BOOL=OFF \
> +	-DINSTALL_TOOL_DOCS:BOOL=OFF

  I ordered these alphabetically as well.

  Regards,
  Arnout

> +
> +$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
