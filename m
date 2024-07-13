Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7610DC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FF280AF9;
	Sat, 13 Jul 2024 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz4j3fHyMz0C; Sat, 13 Jul 2024 20:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF84281F46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF84281F46;
	Sat, 13 Jul 2024 20:27:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5611BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2623D404E2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsfqLFBoWrUp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FD85404C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FD85404C3
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FD85404C3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:27:47 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso40419371fa.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720902465; x=1721507265;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5+oVJL5cV6BvtzSl9L+kGlFec3hkgA1LleKwF69PmM=;
 b=OJQH06Es3oEMqe7RZFeJLGmJ/tgJ4XBG/o7ZTSMm3U8aJ1TVOBVpq0DmNm9Zw2gdew
 +i7BIPIhq5fUsxhxnB36OcsCtwk6PNeN1pnDtdKW/ncv1Oqh7uYxwQQgDOQUPWMZa58n
 /9nZqt/xuxOttgUPQaniMhyWKlotkC8F0rOndfLPTkLG7g96+7YvkwMNA5VLGqBZ3tJl
 ElQeYMzJyXFfZK42WFRD0hYfjbsJR29e0meCT9Kvsrlk9w36KieK2DlScN18uISpsAov
 GMOhX+t3FdXATVE7W0umsQ+5gu25cKzweLTAKNh/4TgKkvqmU/mxA8PXtwBgiXon9ZkC
 0sfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPfx6hlChdkoIvQGlpxeff/rIQqc5nY4+VDS2wCAOmsuGQTArf5A/MmaGrB6/r9xrQL1f2tS9mi9zW3SIk/ZrhHlUbAAXyLw==
X-Gm-Message-State: AOJu0Yw/sVCL/3eQh2zjRCCaMiNTcU2AmBHGM3EL8Q6dZng3Wbamw7lf
 LkVHPgdWNPlRuz7Sa6bS/PcmbYQrKzTgoE5NO3HH311P/CSPZ83llOqzNcbXnWU=
X-Google-Smtp-Source: AGHT+IF7TvOXPy4xQxC1eLE6Gxd5jg+3Hybk9kS4EP5D8931j+CT9x/VYZ/ZS0VDKHBRkYTybLpZtw==
X-Received: by 2002:a05:6512:3c87:b0:52e:7f87:4e66 with SMTP id
 2adb3069b0e04-52eb99d4c1amr11501687e87.49.1720902464677; 
 Sat, 13 Jul 2024 13:27:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb4a3sm32007625e9.31.2024.07.13.13.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 13:27:44 -0700 (PDT)
Message-ID: <06490ac0-ec0a-4648-a363-5078b875e38a@mind.be>
Date: Sat, 13 Jul 2024 22:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240713122331.298786-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720902465; x=1721507265; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K5+oVJL5cV6BvtzSl9L+kGlFec3hkgA1LleKwF69PmM=;
 b=YNBY6C5UFDc8f5at+JkCd0ADcklDOvXq3Du2wBcPgJwZ8D9reRSjMF+2y0ks5G9T9T
 9ey/4LCN3X7rjTY98VP/Nw2ufPaeGxhCCG66u8N3uqKRvZM26/HmTFEgTxMcpAAy/HrK
 Q/yvHAPc5TpMILuZP+LTCIIMsvDX0CdnYjFVnfVPcivqohs8n24mV0kAvG6kO/mrnEUh
 c+2HW4YGhXsA8TY8Pcn6d6G8EXN+S8xA9M5CWpgoymm0R5chwPTQ9FvclWMBbG9Y/6m4
 NBKRv5u9OgKMiJNcq3AXQdrJYBdKlXk9Lr3Ub7gI9xiw+tK7hop/Q1YSzbj+Xw18jwue
 wOEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YNBY6C5U
Subject: Re: [Buildroot] [PATCH 0/4] package/ccache: bump version
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/07/2024 14:23, Heiko Thiery wrote:
> ---- 8< ----
> /tmp/ccmQFw5y.s: Assembler messages:
> /tmp/ccmQFw5y.s:89386: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89400: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89464: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89518: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:89525: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:123938: Error: unsupported instruction `vmovdqu'
> /tmp/ccmQFw5y.s:123953: Error: unsupported instruction `vmovdqu'
> make[4]: *** [src/third_party/blake3/CMakeFiles/blake3.dir/build.make:160: src/third_party/blake3/CMakeFiles/blake3.dir/blake3_avx512.c.o] Error 1
> make[3]: *** [CMakeFiles/Makefile2:406: src/third_party/blake3/CMakeFiles/blake3.dir/all] Error 2
> ---- 8< ----
> 
> To solve the problem above I started bumping the ccache package to
> 4.10.1. While doing this I observed the problem that ccache tries to
> download xxhash by its own and fails.
> 
> ---- 8< ----
> -- Downloading...
>     dst='/srv/storage/hthiery/buildroot-2/output/build/host-ccache-4.10.1/_deps/xxhash-subbuild/xxhash-populate-prefix/src/v0.8.2.tar.gz'
>     timeout='none'
>     inactivity timeout='none'
> -- Using src='https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz'
> CMake Error at xxhash-subbuild/xxhash-populate-prefix/src/xxhash-populate-stamp/download-xxhash-populate.cmake:170 (message):
>    Each download failed!
> 
>      error: downloading 'https://github.com/Cyan4973/xxhash/archive/refs/tags/v0.8.2.tar.gz' failed
>            status_code: 1
>            status_string: "Unsupported protocol"
>            log:
>            --- LOG BEGIN ---
>            Protocol "https" not supported or disabled in libcurl
>    Closing connection
>            --- LOG END ---
> ---- 8< ----
> 
> So I added support for the host package of xxhash and added this to
> the ccache dependencies.
> 
> In addition the bundled blake3 version seems not to build correctly on
> all machines. See the first error about 'unsupported instruction'.

  Maybe that was also due to the CMAKE_ASM_COMPILER mistake? BTW you should have 
included that fix as part of this series, otherwise the blake3 package wouldn't 
have built. Fortunately I remembered (this time) :-)

  Applied to master, thanks. One change that I'll comment separately.

  Regards,
  Arnout


> Therefore the new host package for blake3 is introduced.
> 
> 
> v2:
>      - change subject (fixed naming from ccmake to ccache)
> 
> v3:
>      - fix legal-info for ccache and blake3
> 
> v4
>      - requested changes by Arnout, see history of patches for details
> 
> Heiko Thiery (4):
>    package/blake3: add new host package
>    package/xxhash: add host support
>    package/ccache: bump version to 4.10.1
>    package/pkg-generic.mk: add variable to skip ccache dependency
> 
>   DEVELOPERS                   |  1 +
>   package/blake3/blake3.hash   |  3 +++
>   package/blake3/blake3.mk     | 22 ++++++++++++++++++++++
>   package/ccache/ccache.hash   |  4 ++--
>   package/ccache/ccache.mk     | 31 +++++++++++++++++++++----------
>   package/cmake/cmake.mk       |  3 +++
>   package/fakedate/fakedate.mk |  3 +++
>   package/hiredis/hiredis.mk   |  3 +++
>   package/lzip/lzip.mk         |  3 +++
>   package/pkg-generic.mk       | 13 +++++++------
>   package/pkgconf/pkgconf.mk   |  3 +++
>   package/skeleton/skeleton.mk |  3 +++
>   package/tar/tar.mk           |  3 +++
>   package/xxhash/xxhash.mk     | 16 ++++++++++++++++
>   package/xz/xz.mk             |  3 +++
>   package/zstd/zstd.mk         |  3 +++
>   16 files changed, 99 insertions(+), 18 deletions(-)
>   create mode 100644 package/blake3/blake3.hash
>   create mode 100644 package/blake3/blake3.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
