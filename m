Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A6EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87D2B41121;
	Thu, 21 Apr 2022 21:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qIg8UExTi8m; Thu, 21 Apr 2022 21:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C5144108F;
	Thu, 21 Apr 2022 21:01:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54F931BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4164760F89
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrjGOenVB1iC for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:01:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E74A60EC1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:01:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b19so8270614wrh.11
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6w+jpD6XXQoThu+kow3J6PgmijYpyWqqy/tN3K1JSj8=;
 b=clNJUT4Gw3TImOX0ijmA0725wniEfUDwkC0nhvr84y9Rp2SDwoU9e9r4sJG1tSv4Ec
 /gZuEhr+mJ1cv22q026P3ogOvkGQGwK4sQzQznNcUpJfHq0oRZv0r5A8p42hcfbdN8YT
 VaO12hfqawaJOJiaSoAigdQ/lzj64yooxHxZQVQ+ChuweuKThsRILWk1+PCWE3MEmEwm
 evHOthNQV/qv/0eS7hsfIDBCbBTVBiTUBhq1h86FUKd38lMc30qzz4lclvdocMSLrBQv
 Gf+K7QJh2G93/QIfSivN7eemmD2Lw9DYo2+P5n7CMjcOR/kqKVmDbANDm/7ERbT3qv9h
 ginA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6w+jpD6XXQoThu+kow3J6PgmijYpyWqqy/tN3K1JSj8=;
 b=zOWUrt9EyqNMzvQJe7lVqDiWXvQLiIpY8pfqU+OS9QvKe1UeFEUpMSuvQDDwe68ujn
 MVLustCgNBmjxzVZdKKihAb8tH3bPLqWIWPF2vLqsIwoAtT590jy9EFk7DkBSYsrhKo8
 IzMzVZzqb7U3CmUgfNM2zXj/8EV4y7JELGiGFfix+FtprVE5MrMn4ZbQkQr228/6CX/x
 E4/QteCoWPBKDBiNFdy/oFxeGV2NHNjNq8HBRI28dKro5oLz9SDP2v62XHGBbOZQH6Un
 zdiMKxKFeLMjcy5JnciKXatB5DQ30QF4ShLpUQPFBYfzzwIQGn9zj6SKVBaF1ZHu9WXT
 8fFw==
X-Gm-Message-State: AOAM5326tj3b9I+a0ltsfjFdtksoQoTVWR+8T+GBuDyxUA5tAwQyjQnz
 NFwNrEDcDGxhTu6LYScHkzBfpQ==
X-Google-Smtp-Source: ABdhPJyl3lvmu9k2rqyOgGDK9L78QPq5SGWkzWMLMNSLUToQuXxM3A33DTQcFI8qbgCWl21rBN0HyA==
X-Received: by 2002:a5d:4311:0:b0:205:f26b:fb98 with SMTP id
 h17-20020a5d4311000000b00205f26bfb98mr1150025wrq.202.1650574909348; 
 Thu, 21 Apr 2022 14:01:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d4529000000b00207a5b7f613sm86460wra.69.2022.04.21.14.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:01:48 -0700 (PDT)
Message-ID: <2504049d-28e8-065d-c59a-87881825fe74@mind.be>
Date: Thu, 21 Apr 2022 23:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20220418162045.3408-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418162045.3408-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.1
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



On 18/04/2022 18:20, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks. I also updated the hash file to two spaces 
(check-package).

  Regards,
  Arnout

> ---
> Tested:
> 
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: OK
>                              sourcery-arm [6/6]: OK
> 
> 
>   package/coreutils/coreutils.hash | 2 +-
>   package/coreutils/coreutils.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
> index 758a6341a3..9f3434e58f 100644
> --- a/package/coreutils/coreutils.hash
> +++ b/package/coreutils/coreutils.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256 ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce  coreutils-9.0.tar.xz
> +sha256 61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423  coreutils-9.1.tar.xz
>   # Locally computed
>   sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 438b7910eb..931859b0ac 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -COREUTILS_VERSION = 9.0
> +COREUTILS_VERSION = 9.1
>   COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
>   COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
>   COREUTILS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
