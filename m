Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B61AC761A6
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4031941C7F;
	Tue, 28 Mar 2023 19:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4031941C7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5bOrWBE_V-D; Tue, 28 Mar 2023 19:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8797940439;
	Tue, 28 Mar 2023 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8797940439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7780D1BF23C
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5C140439
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5C140439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9s6rh3MH3kEB for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:37:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2012040147
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2012040147
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:37:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 79BFA5FF67;
 Tue, 28 Mar 2023 21:37:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 21:37:33 +0200
Date: Tue, 28 Mar 2023 21:37:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230328193733.GA3204460@scaer>
References: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680032256;
 bh=zU+Hjs0ChKghgJimrXJfVZyqfr+IAzYHxRTGiJNYMDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZyJleASQHXRnz+XCBw3VkL6gQzgYQdPewSxzDFyCoysXgL0WRSHzvce9BbY5JAT1T
 caBvW7LtYLk65D/knPNyUoNKD1PKFoln2UUz5fM38DTqHFLAFg8KBnYRCUydfED0Eq
 qX1Edx/wemUHR6ZiT89ARhvvxBY7IHg5bq/zZ2hZWRivuCv+f17w0/ugGXadmYu6kl
 gIFUYXq+j1D3UfXITYPcy8NPWkWWu7liuQvq0LBpzma0KijX2tidVJr/DD1tNJdoEU
 5apZzI1JjtORaBkCk16QkPddBgJOd25Mz8forgbBaBBmP7Pqe6Y65x8Z7TFxOoTFSY
 tJsi+xCRyIt2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZyJleASQ
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: ditch
 redundant -f 'rm' flag
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-03-27 16:11 +0200, Luca Ceresoli spake thusly:
> The value of the RM variable in make is 'rm -f', thus the additional -f is
> redundant.

I've added a pointer to the documentation:
    https://www.gnu.org/software/make/manual/make.html#index-RM

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-tools/linux-tool-perf.mk.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index dda63cccecb4..5431c78152c5 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -166,8 +166,8 @@ endef
>  # target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
>  ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
>  define PERF_INSTALL_REMOVE_SCRIPTS
> -	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
> -	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
> +	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/scripts/
> +	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/tests/
>  endef
>  endif
>  
> -- 
> 2.34.1
> 

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
