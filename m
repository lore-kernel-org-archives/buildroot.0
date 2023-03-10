Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A9C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8934171D;
	Fri, 10 Mar 2023 21:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8934171D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GvHzCxQrC4i; Fri, 10 Mar 2023 21:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0669D4170F;
	Fri, 10 Mar 2023 21:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0669D4170F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8816B1BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60F1E40275
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 21:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F1E40275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wk82sPsSmvgp for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 21:00:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 101B940265
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 101B940265
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 21:00:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bw19so6199697wrb.13
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 13:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678482027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ymB7nkZcv2hb6zwQNfkzvK1DJU+rIhk2UgNyfyFQAvg=;
 b=S/2pVifVnK8IlF9U41A2pGedOznKQ4vTt/niNzWJSZVx/T5Z11p+8zMPHwIO4cxD93
 7d6HavKDeRp99LBydOYP8dLMYLnOSsWHqBmy60KvpWwwDWz2Vzdn6DyvXsZ2NS1gw9nd
 x+fz0tySlEbhWFKy2keum0bNdu4BZhietT9qZO6kGiEXnNv1XJ7qQHg2jf73OUBFLCRf
 6UkNT8neAblXFutJJC7Zrt7KHH+h8NOiorwt4iu9ii9yNnK7deM48ooAlLV3sL1T1BCa
 xFZctsourFxcPUCMaZJ0ehkLt15VlptWNHt+GY9Xe0HzBq8RyxIWctJcMpUbCx8Z9pOy
 fHWg==
X-Gm-Message-State: AO0yUKVnW3E6z1xwUp55WLVL775QQV9paYLdCnmgnHWsHMUyz5y+kWpj
 8AthXB+C47jp7WU0LqpYuNoQGg==
X-Google-Smtp-Source: AK7set//2E1NOOjEL7l5eKCZvj4yhIMSiU5+b44Iuf27KqVUl3TB/5OcWYJmlbNMequoOZZdAIdUTg==
X-Received: by 2002:a5d:6689:0:b0:2c9:993a:ec2a with SMTP id
 l9-20020a5d6689000000b002c9993aec2amr18864585wru.40.1678482026974; 
 Fri, 10 Mar 2023 13:00:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c567b58e9asm673952wrt.56.2023.03.10.13.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 13:00:26 -0800 (PST)
Message-ID: <a5004618-62cc-23d3-ca26-d7c2f1d225a3@mind.be>
Date: Fri, 10 Mar 2023 22:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230221130554.871679-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221130554.871679-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678482027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ymB7nkZcv2hb6zwQNfkzvK1DJU+rIhk2UgNyfyFQAvg=;
 b=O4G/OU27pyDDLbZZHAIUKLvdOYjN2sG9MY5BPmRxrgzrsJpEW0wrmZ30Nc8PYaVsS2
 c+rKGvoxeFII6xn8KTovBUqWVkuWBAgYkQDU5UsXswcJxkkZh5H24OZ8N+ZlDS1xwQKk
 jJ0RlfHdyYpsp3Zw7RL7VsVNjoNSPoDCmZO9wgf6nFV389f7SdA/MXuNByEFFEl3+k+A
 SL+zhnjeb4ad25b0norPe6GIU/wA4vDqZYUisqR2iSnjFa8Be1siqvyGKyLeGZ4GOoJ0
 xACKok0HvId7vwUADARyFyzvSl7bICg5p6X2m++CTE/FcItHG5spdLYY36V5sl6hF/EX
 rj4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O4G/OU27
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: needs NPTL
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 14:05, Fabrice Fontaine wrote:
> rdma-core unconditionally uses pthread_spin_lock since its addition in
> commit ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 resulting in the
> following build failure:
> 
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sh4-buildroot-linux-uclibc/12.2.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: CMakeFiles/hfi1verbs-rdmav34.dir/verbs.c.o: in function `post_recv':
> verbs.c:(.text+0xc4): undefined reference to `pthread_spin_lock'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a943e03b79c4cc328b7712046ecff09706045f81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rdma-core/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
> index 59f5ef63ae..3360e6873d 100644
> --- a/package/rdma-core/Config.in
> +++ b/package/rdma-core/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_RDMA_CORE
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4  # iproute2
>   	depends on !BR2_STATIC_LIBS # dlopen()
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	select BR2_PACKAGE_IPROUTE2  # runtime
>   	select BR2_PACKAGE_LIBNL
>   	help
> @@ -13,8 +13,8 @@ config BR2_PACKAGE_RDMA_CORE
>   
>   	  https://github.com/linux-rdma/rdma-core
>   
> -comment "rdma-core needs a toolchain w/ headers >= 3.4, threads, dynamic library"
> +comment "rdma-core needs a toolchain w/ headers >= 3.4, NPTL, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
