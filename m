Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D58C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283148542F;
	Sun, 12 Dec 2021 15:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPRcTzX5w__Z; Sun, 12 Dec 2021 15:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FE685422;
	Sun, 12 Dec 2021 15:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5811BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 092D760E87
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SB-DnnfN-t6L for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:11:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9074E60A8E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:11:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so44085275edd.13
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+qT0zTkbYorJKujMEKJg5hOyF1F3kiYbcITjSKunJBU=;
 b=KxzhzhhOyw6cXR2OxUhFV9wSe4wc3TTdGYCfxILLZmBYJ6mtpUn+42XNRb3FVu6fSo
 hKT2Fr0JQkoOFiD7fS/D7xGsVKtxBemRhHRCJzPdY0GiVI4GRjITmtjumVm5aoUzKxOq
 NX5Re5wrN56UsgqLmdRxvIltrNHGBG6ZScG91tXbe6qv//EL5NSA9Y+yL4TSm1QbvpzU
 1Wdcx8ZgCoIXZQiLwBIzpUtt8pJsLIGltB9Io2t1GirhAkTIAfFj8BwlxMUzGT7AobcT
 zf/Oc+2aBM2Au1lNIA4Xdc3WoN7rMMNcChSGThp3QW5y+C7/JMBqkN125YVU0JxHtugj
 t8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+qT0zTkbYorJKujMEKJg5hOyF1F3kiYbcITjSKunJBU=;
 b=PWdvzD9BMHj5lh6FqDSXMEN8lcYB6NWHUzXkh0EThk14lp/qZDMijQ6r9zbz03nq0n
 EMLl07+YCTXredmf4qvbg3btbDJ09l9OrajqjaS1NiiBAQEK7eW0tS/KN9GQylzvnAKN
 1PZnCQXz+Cy/aDO78JgEnh4wihjxHAYDg0Nq5tP+5+eXNfagibkAp2f5v1l5Jy6Uvig+
 nbNAM90+sQfG2JoQ3f4/4F88QbKkjK33CQ/giia7k3yByVAtyGq7UAIa+W6veVVlWhNI
 QremAnOAZnslQwFNaqeQQnJDjydDIx/ROEWApdF0qAoNhhbbX5Uy98xYbJ37tLRywJ1Q
 gZTg==
X-Gm-Message-State: AOAM533ft+9hf2uZ2SQa+IiTxI+RKNyR8yumo8/qilP6LdoT7hQASoyG
 428lcQzBSFWRXi90Kib7Q3uQJ+h6tBxuzQ==
X-Google-Smtp-Source: ABdhPJyuGhkxpnVdDNyQwHruZbn5jSM/oqjOYlyGjev4iTzcrX2+sEKjBY129P67+O5gyhOUGEgrmg==
X-Received: by 2002:a17:906:8a62:: with SMTP id
 hy2mr37014436ejc.347.1639321873842; 
 Sun, 12 Dec 2021 07:11:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u10sm4726835edo.16.2021.12.12.07.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:11:13 -0800 (PST)
Message-ID: <2d06257f-8acc-6876-e892-1626c29fa8a4@mind.be>
Date: Sun, 12 Dec 2021 16:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211213632.537666-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211213632.537666-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump to version 0.103.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2021 22:36, Fabrice Fontaine wrote:
> ClamAV 0.103.4 is a critical patch release:
> https://blog.clamav.net/2021/11/clamav-01034-and-01041-patch-releases.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/clamav/clamav.hash | 2 +-
>   package/clamav/clamav.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index a2ed115d24..d68b04af76 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  9f6e3d18449f3d1a3992771d696685249dfa12736fe2b2929858f2c7d8276ae9  clamav-0.103.3.tar.gz
> +sha256  def0ad15500fa6aff81d8e68b9f83aa75ee5b607a01335c1d26dbcc959932f85  clamav-0.103.4.tar.gz
>   sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
>   sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
>   sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 63af111da5..94b589b975 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CLAMAV_VERSION = 0.103.3
> +CLAMAV_VERSION = 0.103.4
>   CLAMAV_SITE = https://www.clamav.net/downloads/production
>   CLAMAV_LICENSE = GPL-2.0
>   CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
