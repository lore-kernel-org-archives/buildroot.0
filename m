Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5062AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB1661251;
	Sun, 12 Dec 2021 12:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okTlw65md-P1; Sun, 12 Dec 2021 12:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2881761B45;
	Sun, 12 Dec 2021 12:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D58521BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D26CF41E40
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8_BgO9ZZTCf for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:16:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14A5041CA7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:16:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x15so44535092edv.1
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2uS9xQO8rCM7q79ct0GjEcLRBjidVCQg5epsCF1ut8w=;
 b=SwYmrFv4Zsb9xmfiJc744oQiuNEtR3Pp6UDszfyfxivoVJFvrhk4VMeOuV0U6YR2lG
 o8Joe7CG05FKnzKB056FmTcab9JMGXJKQy46HQ1Z+dASxvswQ1LkchixHMr906CAihUv
 TaB1n6xvZ87E0yI1iWa9qtPYIrB9OsR2OzvehhU+4p0Bu7AThcn3kXoDMFSa1gQkVcip
 LcAyH+km/JiisPmA4du5ycNiMhN7YRlsqDFlqISC+j5QdnjCZmhRigXE4w1dmceQ0Zbm
 0/m4hddpmQZfnic1pfVn2uML2meg62OKbkZu82KEtOsHG/1/g02d8uOXIIxSj/AxJMsl
 k3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2uS9xQO8rCM7q79ct0GjEcLRBjidVCQg5epsCF1ut8w=;
 b=wQvLB/2m/Sxrgw4ftP3++P4oyxFRNmTrQVyzkTxcGc8xvD5mMaRXVEyd/XposbVAU/
 BvKX/uLy7RL1qMbjyR+BG6Kc5YY6nej9qHgSDg+Q2ttzHnW71PEjaMbH3NToim7de+oX
 4R/c/HkgKzgtwiVYWUd/zOJZ96CZN3FMQKpkL0nb1kuGmnQLEcnEOBt436j62eSsWBhw
 Ksc/8tApZ/p94Shqu+fLsDfrGXbzjlfPV7vIyj0PtqEabP6jyx1m1nSSCcOrSGzd00U2
 vAFwfQa0Y31kUaGjgytQykNWcnT5SYNFh9OGR5E1hCyxiloC3zl2FiiHXd5RRPz/Ml1N
 5M7g==
X-Gm-Message-State: AOAM533wwXIoyss4kFOru/OExboU8g6Eg/WKMWVgkFk0OjFNoZQjYoLF
 b9svnlLkZHvY2Bi2YDXBYszoPobUkwyhJA==
X-Google-Smtp-Source: ABdhPJw7Rj2sminhZXcv86cLccxoHzVaaJHFl46BmCpNdxmYzipMtxpnAgMnlQWGgkuHxueAS1XbOg==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr37749267ejc.85.1639311394318; 
 Sun, 12 Dec 2021 04:16:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id my2sm4317657ejc.109.2021.12.12.04.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:16:34 -0800 (PST)
Message-ID: <ceb8d0af-acdd-e6ca-0b1b-98a08522ad2b@mind.be>
Date: Sun, 12 Dec 2021 13:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20211207121623.910124-1-marcus.folkesson@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207121623.910124-1-marcus.folkesson@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2021.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 13:16, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libostree/libostree.hash | 2 +-
>   package/libostree/libostree.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
> index 1f8a02994e..e81deb82a6 100644
> --- a/package/libostree/libostree.hash
> +++ b/package/libostree/libostree.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  b45a32ded72c9fb6d2ab508adeae0306e4e2bb348db152f3d1b3708375829e1f  libostree-2021.5.tar.xz
> +sha256  e80631cb1363d4734fe9d0c91f69a68be3848166d6e0481db19ce44a9cb4f531  libostree-2021.6.tar.xz
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 4f79885d20..a6b09f95e5 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOSTREE_VERSION = 2021.5
> +LIBOSTREE_VERSION = 2021.6
>   LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
>   LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
