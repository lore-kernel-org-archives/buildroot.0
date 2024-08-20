Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F82C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28AFB40474;
	Tue, 20 Aug 2024 21:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9o6t1iG_4Vog; Tue, 20 Aug 2024 21:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D3740B99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8D3740B99;
	Tue, 20 Aug 2024 21:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8B11BF97A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3618C4014E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUEkhdGqn4RE for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EEEB40110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EEEB40110
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EEEB40110
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:26:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECF8913F846;
 Tue, 20 Aug 2024 23:26:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 23:26:33 +0200
Date: Tue, 20 Aug 2024 23:26:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsUKCVcZheIlzo00@landeda>
References: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724189197;
 bh=xgvMpK7YZdg2BNyq1Ha0U14U2ZQzDtXMPH0MADiU8PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PldY43qfQkSA0zkJWQCqFLeSfZOAD/zs/UIySBfCSEqTqag2Cl/j4TWHbGNdyKfLy
 fyh2MoPeLje3PL4Zub4aleUtWTwMVAux64he7va23ztO+YX1VIaNb9Q6qQN74c6v1K
 ZVGYxek7L0fqmd6E6C9HUlubMYQv/PeiU8H3LI8L3sUhQNn2Seq0mm59hT4uCZt26s
 2ClOOqvIRjK9yVsxGXW6Nl+tAgW+rn/g2yswMGwWDlzZI68EJ8MgDAyWXcbBwFq8HP
 0X7hmqlE1f+MlSVVnNMOh087XS8b0i34R/lLJUI5OUjjdZT63caapjpEq7+ND5SOa4
 4lF/zCoJ+GhfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PldY43qf
Subject: Re: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2024-08-20 17:44 +0200, Waldemar Brodkorb spake thusly:
> When starting a container you get:
> # docker run nginx
> docker0: port 1(veth7743781) entered blocking state
> docker0: port 1(veth7743781) entered disabled state
> veth7743781: entered allmulticast mode
> veth7743781: entered promiscuous mode
> docker0: port 1(veth7743781) entered disabled state
> veth7743781 (unregistering): left allmulticast mode
> veth7743781 (unregistering): left promiscuous mode
> docker0: port 1(veth7743781) entered disabled state
> docker: Error response from daemon: failed to create task for
> container: failed to create shim task: OCI runtime create failed:
> error opening file `/proc/self/uid_map`: No such file or directory: unknown.
> 
> Add the missing kernel module to allow starting containers.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/docker-engine/docker-engine.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 268b851520..baec32d79d 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -106,6 +106,7 @@ define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NAMESPACES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)

As far as I can see, this is an optional feature, and is not strictly
required:

    https://github.com/moby/moby/blob/master/contrib/check-config.sh#L235

So I don't think we should forecfully enable it.

Regards,
Yann E. MORIN.

>  	$(call KCONFIG_ENABLE_OPT,CONFIG_UTS_NS)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_IPC_NS)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_PID_NS)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
