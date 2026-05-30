Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27881CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7788411DC;
	Sat, 30 May 2026 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfKnZwIcEgwO; Sat, 30 May 2026 16:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CFD4107E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780158134;
	bh=JXXhhISkwPwZ33VPqAPH0DFbkLDuIjIhQ2KfBvUhVho=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SNnjoD3oF0BcSRRQ5ZCNilJ53j5mPYPjV05cOGU89sB0rtnwFjvCymCG5Oh1kVarn
	 oo77jAtJiql5xEzJCoC74N2ndPkhuBOGePlRYyAC39lRm1W1tiET9JaFlvYt8R941F
	 DeGxZN+wuLulK+lZ9xGAXZqLOGAfTTEOICDrDnBKHlAqkimWLPejClU6sXN2otc92u
	 sFc+INPEb/Uzi1aaX6d8XI02XAa4zpA6rrkgcaMxSQONC3JRaTtSyxxF3//nt5nhzq
	 EAdB0JpvCzBipXbw6xQj5xhBCQDfio8cOU9hvsFOXJJey6ywIGDQPbg6uehbRSJLoe
	 8JD4shxs49sdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CFD4107E;
	Sat, 30 May 2026 16:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D9C12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6515D853AD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtJA_s4Bm-NE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 16:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CCE985379
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCE985379
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CCE985379
 for <buildroot@buildroot.org>; Sat, 30 May 2026 16:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2F57B97C5F9; Sat, 30 May 2026 18:22:09 +0200 (CEST)
Message-ID: <9b48e521-cabd-4b67-8770-2e76b189b405@rnout.be>
Date: Sat, 30 May 2026 18:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>
References: <20260425211641.479665-1-bernd@kuhls.net>
 <20260425211641.479665-4-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260425211641.479665-4-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780158130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XtX/lEtr3UOUp8t/rR4mkBw3W0m9qbpsY8dTGNfswV0=;
 b=QemOqebqTA0WyntSxsQwvG7HBil7j3slHhAtqeV5genux3NbRRxuh6t7e4RzrbIhURtNeF
 N0TJL7IyFHpyAxlo8cPISYjg6p5CaAK99qWIsh7ECUHzXa8vvrALhcr840Wj+e3x4IqtcW
 FLgqIJxYrHHWDXiheds5M9nZN5ZDMQPFR8kVaenby/CsMm8EZdbo/Tf/sZrYtiL3FPjLps
 SOfNVhtoFAEkFjc+eUT/MBvhxEyT7wzGcwSRvHKDU6vNTMbx0f8++5vqIVYWFt8owgLEhJ
 l1h9X3rhsV/e3bxyyuofYY/BrH8W8o9PJqpK9ubDycq8nSUrtBG/MlfgKr0iiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QemOqebq
Subject: Re: [Buildroot] [PATCH 4/8] package/libbpf: fix bpftrace build with
 kernel headers 5.{9, 10}
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2026 23:16, Bernd Kuhls wrote:
> Buildroot added the bpftrace package in 2024 with commit
> 338acb27ff3e07560290085d7c6a2feab633c869
> which initially provided version 0.19.1.

[snip]
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 65061a82bc..cded3734b4 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -18,13 +18,14 @@ define LIBBPF_BUILD_CMDS
>   		-C $(@D)/src
>   endef
>   
> -# bpf/bpf.h installed by libbpf uses bpf_iter_link_info that was added since
> -# kernel 5.9, so we need to update some uapi headers in STAGING_DIR if the
> -# toolchain is build with linux-headers < 5.9.
> -# Otherwise bpf/bpf.h is broken due to out of date linux/bpf.h installed by the
> -# toolchain.
> -# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
> +# bpftrace uses variables from bpf_btf_info that were added since kernel
> +# 5.11, so we need to update some uapi headers in STAGING_DIR if the
> +# toolchain is build with linux-headers < 5.11.
> +# Otherwise bpftrace is broken due to out of date linux/bpf.h installed
> +# by the toolchain.
> +# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=5329722057d41aebc31e391907a501feaa42f7d9
> +# https://github.com/bpftrace/bpftrace/commit/fea31939899db48fa6d28f5ce880bfc39250ec9f
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11),)

  I think changing this based on what is done in bpftrace is just pushing the 
problem forward. I think the proper approach is to use whatever version is in 
libbpf - that way you can be sure it's OK for _all_ users. You can find that in 
CHECKPOINT-COMMIT - currently it's 6.17 and after the bump it becomes 7.1.

  There should also be a comment in there that explains that it should be 
updated based on CHECKPOINT-COMMIT.

  Still, this patch series is progress so I applied 1-6 to master. I marked 7 
and 8 as Changes Requested.

  Regards,
  Arnout

>   LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers UAPIDIR=/usr/include/bpf
>   LIBBPF_POST_INSTALL_STAGING_HOOKS += LIBBPF_FIX_STAGING_PC
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
