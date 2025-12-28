Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197EAE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE7A8096A;
	Sun, 28 Dec 2025 23:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4bnY1a5OXgM; Sun, 28 Dec 2025 23:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE1B80979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766964361;
	bh=9jOxkvtrM0h2P2rdSJKurqUP00fDnXggqIx26YJQXbg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k8KKnWBrZgAci7nX0Fc6XQERRfx/1iOt5avbLXAjUkdPfgGgRf9CN4OP4hh5KQHNN
	 4Di61+qjWcV+yh+YsCK6NGg19qdF16GLYXQngSCYUVP8D55mf7i0jO5rduIz6O+o29
	 GyAqPzPX0eudbuSBR5YemKjrkWn1Cn9foT+nrdd2raTOuFNoC5jKeevWm48EJzTl54
	 08d+ep6E2TtO42pPP8X+S+w46yDWKy5irtj/BiAoML0sn1J+jk4By9Od0nu5zd3D2Z
	 m8Ve+c9CaHsrK+UmYrlIq9mlJszYR+km7XB3RP0CLK7cvQBJfcmB46kWsDAphnVf6K
	 Sm+HAQ1mJGznA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE1B80979;
	Sun, 28 Dec 2025 23:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9248B1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E487402DB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5n6SLdJF3dYO for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 558A6402D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558A6402D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 558A6402D9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:25:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 302E413F89A;
 Mon, 29 Dec 2025 00:25:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 00:25:53 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 00:25:53 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20251227194400.1108440-1-giulio.benetti@benettiengineering.com>
References: <20251227194400.1108440-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <500fe026dc7e732e4c924ff46526fe70@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766964355;
 bh=xWlGa+8pQScxDsECKa8BAjYTFcnxP+jbPWxnjIOnzpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tpcluzWFr9+cAoCtf3i41Cexq9VcGHI+1Y5OkvhkWLTqyiMKDqY98KZIcpZLNeQPl
 NhukrPEZ8UV+P98Ck2xMdmsDi5UWCd/vL0eSEQs+uw0acMLV64MG17Yg0+besEsikD
 BO5I8a31l8l8s4AcKckk6bFRsg2l6WboAcCr3bNO+xorsMQHpcXlANvAE+S9Ibdir2
 7RCC6CxIyyWEnDzi7D98fjuKYnXn+ejKzEcSHnKsl68u3dJ3A5f+YPUnSjkafQcKfS
 UZNl8emHqiSoNPOMhwJ32Zxvku5M8csEKre49BaPN0DhyZQmuq/XQCx7povysQZmsl
 1xHYgOvX7q1Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tpcluzWF
Subject: Re: [Buildroot] [PATCH v2] package/dash: fix build failure due to
 wchar
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

Hi Giulio,

Thanks for the updated patch.

On 27/12/2025 20:44, Giulio Benetti wrote:
> Since commit [1] package dash requires wchar so let's depend on it to
> fix build failure.
> 
> [1]:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360
> 
> Fixes:
> https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fixed commit log and Config.in comment as suggested by Edgar Bonet
> ---
>  package/dash/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/dash/Config.in b/package/dash/Config.in
> index b816ac7837..3573a40aa3 100644
> --- a/package/dash/Config.in
> +++ b/package/dash/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
>  	bool "dash"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on BR2_USE_WCHAR

The dash package is selected here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/system/Config.in#L417
So this new dependency should also be propagated there.

This introduce a new problem:
Dash is currently the default shell when Busybox is not selected.
See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/system/Config.in#L402

This creates a new corner case: which shell should we select by default
when Busybox is not selected and the toolchain does not support wchar.

We could, for example, switch to another shell supporting that case
(e.g. Bash), or force Busybox shell in that specific case. I would
be happy to have suggestions from other maintainers/users on that
topic.

>  	help
>  	  DASH is a POSIX-compliant implementation of /bin/sh that
>  	  aims to be as small as possible. It does this without
> @@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
>  	  for most tasks.
> 
>  	  http://gondor.apana.org.au/~herbert/dash
> +
> +comment "dash needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on !BR2_USE_WCHAR
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
