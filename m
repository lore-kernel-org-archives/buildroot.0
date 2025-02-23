Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDF1C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 23:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B667F60600;
	Sun, 23 Feb 2025 23:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9sDlEEVTiqb; Sun, 23 Feb 2025 23:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE0A606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE0A606A7;
	Sun, 23 Feb 2025 23:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79EA1943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 23:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E50A811BE
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 23:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAduTiEYoGZf for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 23:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58B48810EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B48810EC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58B48810EC
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 23:02:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5574B13F854;
 Mon, 24 Feb 2025 00:02:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Feb 2025 00:02:27 +0100
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 00:02:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <0b81afc88de83cff85611098eb06873eed0b997e.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
 <0b81afc88de83cff85611098eb06873eed0b997e.1740345268.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <997d02c49eeb32e2443f7226f92abd62@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740351749;
 bh=wthCIZGpV8bPROOoGE8yOJStvRl0UTnvOtWJJntbm0I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FR0wkkSD97XGX7VE4SYqmzM2Me01Y9WDTtemQVOwVwLgCZABqHt8IZsyrzfT5fhi/
 HtbQN4ll4TCJzwQn+LDTXcYeamZiIJUmRVbKxCCbEHyGIFKOwuouGLjlWG0/u89LCO
 R5VQURqFv08sSYc+TID6SklPrY+2IqKmRuhxfFK+M49kB5FOSUz1MqXrPsUiqDin54
 SlcTgPS0geCVLnvPflXQ2bWgnhikMeQYMdYin6JMoFLxhL7TCcP+tj3xjztwPOGCLT
 px5JXAikQNsVQ9Dp5A8RqhSfgj+EKklRMHECaRP+4KLk9UYbkhS7P0SlJDTyg3IXt7
 CICwnotaH6s8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FR0wkkSD
Subject: Re: [Buildroot] [PATCH 8/8] package/podman: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 23/02/2025 22:14, Yann E. MORIN wrote:
> Podman is a container manager not unlike Docker, but is daemon-less.

[...]

> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> new file mode 100644
> index 0000000000..a04ce92f11
> --- /dev/null
> +++ b/package/podman/podman.mk
> @@ -0,0 +1,109 @@
> +################################################################################
> +#
> +# podman
> +#
> +################################################################################
> +
> +PODMAN_VERSION = v5.4.0
> +PODMAN_SITE = https://github.com/containers/podman
> +PODMAN_SITE_METHOD = git

I have the same comment as for netavark:
I noticed the license information are missing for this
package. I'm thinking to _LICENSE, _LICENSE_FILES and
license hash.

See:
https://github.com/containers/podman/blob/v5.4.0/LICENSE

Could you add those info please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
