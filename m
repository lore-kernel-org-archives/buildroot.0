Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E9EC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7985406B1;
	Thu, 12 Jun 2025 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg-FrjAxvfNw; Thu, 12 Jun 2025 19:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B7E408FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B7E408FA;
	Thu, 12 Jun 2025 19:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA8781BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C01D860D4E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q6_oC8RGJDL for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E508960AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E508960AC8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E508960AC8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DEF0F1C1053; Thu, 12 Jun 2025 21:58:29 +0200 (CEST)
Message-ID: <63d44321-ef73-4ef9-afef-9e75ebfa634d@rnout.be>
Date: Thu, 12 Jun 2025 21:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
References: <20250527-fix_gmrender-v1-1-9a66d16c8167@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250527-fix_gmrender-v1-1-9a66d16c8167@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AgTOMxmgjEJPnAggdJ/yvAfjMJmqkdvPhyhRKD4oquA=;
 b=HEXQtDQzxpzb2ogwsjkv1F3cFDgURlymHIW1Qri16vxKcA/XFjPzf+iUNZTrDk705igU6d
 2Os55k8ULbZNrr8z8WxbhLQSk3Z6yvaMad2sF9R144V0ScSnqe5W0lJSzBAbXuZXAG0zm6
 h+RBMXJUES53pCaeagpF3QZ9lS96mu5sGg/af9t9pz6lLo9ga1WKgk+YTatwH4e17nIzqi
 2jRV/RVLbD87FXse0O2qgD5s4fQBC1zqNNXSxCug2NpHMjSUlNUBUtQ8WtqQzh2zHTYjRK
 yJT4ELbx2TWGwgLMU1YKMgT+BzcmYwvndnDT6Jvhgf6iYH5o9PIa9W0klUXkZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HEXQtDQz
Subject: Re: [Buildroot] [PATCH] package/gmrender-resurrect: bump to version
 0.3
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



On 27/05/2025 21:23, Thomas Bonnefille via buildroot wrote:
> Version 0.3 (and 0.2) of gmrender-resurrect bring some bugfixes.
> 
> Fixes:
>      https://autobuild.buildroot.org/results/1e1/1e1e5a494bf1ca5ba920c4e06a1affff4ad61033//
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> As the package is broken on 2025.02 and v0.3 and 0.2 only contains
> bugfixes, I think this patch can be backported to 2025.02

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
>   package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
> index f14abffc3b91b90571520a5f650b777fb30f9dd3..91b9a6c9a16dc378d488298583ae9892afa5c56e 100644
> --- a/package/gmrender-resurrect/gmrender-resurrect.hash
> +++ b/package/gmrender-resurrect/gmrender-resurrect.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  550b07bc6a073176ad7de0efd603663c9875311dfb81ae1075263e3fd6974335  gmrender-resurrect-0.1.tar.gz
> +sha256  dbe0d41b01339a4805fdd0edf914fbc4870dba2eb9c54ad5bf9446ccfd3fa482  gmrender-resurrect-0.3.tar.gz
>   sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
> diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
> index 77ac83ca410ad1521993a1e0d9d3990c4b0f0c32..d5b411f46aa4fa514d8baa54421902bebda1a04a 100644
> --- a/package/gmrender-resurrect/gmrender-resurrect.mk
> +++ b/package/gmrender-resurrect/gmrender-resurrect.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GMRENDER_RESURRECT_VERSION = 0.1
> +GMRENDER_RESURRECT_VERSION = 0.3
>   GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
>   # Original distribution does not have default configure,
>   # so we need to autoreconf:
> 
> ---
> base-commit: 9d92c7e3ff80f8c9a2d05a141b34dfb164e7e81f
> change-id: 20250527-fix_gmrender-18722b0ea768
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
