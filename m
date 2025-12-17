Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E38D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47F383C61;
	Wed, 17 Dec 2025 20:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3Bo1RaXvy3K; Wed, 17 Dec 2025 20:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED0283C65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766004234;
	bh=FHPRRZoFSlCpbfJIPALP1v34AFzR7d1LSKQen5EVJqE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YD0hh1AtHY7wwMBMuqbo28kNtr/vFE7HRWgdFAYYm8vHqTeAT9OoENbl5Y9/T7Aff
	 yr4RkLtz5OW4K8OOVQZwWLv4f2PfhBw9zmUZu0UdaArBoZjUo3qU5FocHrvHgQWSkB
	 zoQtt8Ma5YuKiCWA4VL3q1O8FI/dBTkXI+mVQdzSBa+Y6YjQRRzsUvk222aTh6LP32
	 IJgcIkSYO/hndgz7d5l4CVZG8xutb9bxRJOxFcCKJql7/THhNcl3uaL5TKygwMdUaE
	 EV5WgFzOsneCZhXHOHI6+gCJPYUi7n5jQIrRYN9gEa85ixJcoHlNwF1GWemSFKQHOi
	 NwYET7hyJlXNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED0283C65;
	Wed, 17 Dec 2025 20:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13AC8375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEF3D40F28
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYcZ6k6L1uwT for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA81A40F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA81A40F3D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA81A40F3D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:43:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9268EB0054E;
 Wed, 17 Dec 2025 21:43:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 21:43:45 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 21:43:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mariusz Bialonczyk <manio@skyboo.net>
In-Reply-To: <20251217193954.3771735-1-bernd@kuhls.net>
References: <20251217193954.3771735-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <fbeb9b764c3e7544d6f553d043f9a8db@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766004228;
 bh=wWt8MM26L7PWG6ORDc5StJkCeAqs+4jmYU57KvvxsqI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PHm1aAzFXKCXeA2ykIeYHcLKRs+PlkqBXjoHEwZ1IN5GTX5JB9R5QEMgAMVrVh+dW
 cSxSFzHKehPVSm6fWZBTmCA4ICglc6Fm3GCUF+dwEUgBd3DaO/lSpFc8mXUwZvIsvG
 ImkZkrJZ+tgMKe9DXiDRd2bV6v43XXId/YSmMnGs4Xjj31624Wt3txHNqch22Fb3cy
 jdiV2U+DPXSMWUyiDAfkzYECJiCVbwQKDO3RtSdCq6UmoBITriR5hwvl9dPmaM5ZOR
 XxEpB5i+E4ydvQV8z3cfwKP0af+CJ7QAgv+O90CM8+CnSB08pSBtyvJgG2xLfy2YLr
 TUTLjn4fGS3/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PHm1aAzF
Subject: Re: [Buildroot] [PATCH v2 1/2] package/rust: bump version to 1.92.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch!

On 17/12/2025 20:39, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
> https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
> https://blog.rust-lang.org/2025/10/30/Rust-1.91.0/
> https://blog.rust-lang.org/2025/09/18/Rust-1.90.0/
> https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 9999475c35..f9889e3931 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -6,7 +6,7 @@
> 
>  # When updating this version, check whether 
> support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_VERSION = 1.88.0
> +RUST_VERSION = 1.92.0

This new version is failing in runtime tests. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2220877974

It seems it is changing the package hashes.

Could you have a look please?

>  RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>  RUST_SITE = https://static.rust-lang.org/dist
>  RUST_LICENSE = Apache-2.0 or MIT
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
