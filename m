Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEEDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 15:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 059B28138C;
	Mon, 27 Dec 2021 15:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjTW2W-TWqJT; Mon, 27 Dec 2021 15:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1D98130F;
	Mon, 27 Dec 2021 15:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED9D1BF487
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E51340114
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sonologic.nl
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVMpTzsoYrXb for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 15:52:03 +0000 (UTC)
X-Greylist: delayed 00:27:06 by SQLgrey-1.8.0
Received: from mx1.sonologic.net (mx1.sonologic.nl
 [IPv6:2a01:4f8:121:43cd::1:9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7F9B40102
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 15:52:02 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=[10.1.3.45];
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from [10.1.3.45] (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPSA id 1BRFOrAg026071
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 27 Dec 2021 15:24:54 GMT (envelope-from gmc@sonologic.nl)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sonologic.nl; s=dkim;
 t=1640618694; bh=pJwU+6AiA9sTq9I2UsR0/XIWakVM64s1f9EgbEW7WMU=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=dCLPxergx1Orzosa1L2tcvUDZYJ71ww9PRih8albJMXt5MfJmlc4PY8a4GkeFGqEB
 4m1ydhxRezdb9g32NexniQzHKLPXu4CeP26fEICWAFed/5hf8+9nq0peMyWehgL/OL
 yFmMwXzP8W2dVYfrjDA5YFBd2HHQ0rzKPf2CBmiGw7RXl2VQG6VNfab9JpFprZhaYZ
 ddiC3TENWppk4XtgPMzujcrXTwxGEi+xJRJql+iCwDPzzyAaneHHTXY1hfc9zhMnV2
 D1RlQijNCDjA/Jbpj13fJXhbpZAgtd+eT4XYJQBMoU3lGEAPscOYzua7S7qe0EC7pS
 AIDyMXIBa0Kfg==
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be [10.1.3.45]
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211227152239.2067545-1-fontaine.fabrice@gmail.com>
From: Koen Martens <gmc@sonologic.nl>
Message-ID: <2e9dc909-a88c-44e5-224c-c0a2b7021155@sonologic.nl>
Date: Mon, 27 Dec 2021 16:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227152239.2067545-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Mon, 27 Dec 2021 15:24:54 +0000 (UTC)
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxconsoletools: bump to
 version 1.7.1
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

Hi,

You beat me to it :) With the holidays, I finally had some time to 
update this and was waiting for test-pkg to finish on a number of configs.

Cheers,

Koen

On 27-12-2021 16:22, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
>
> https://sourceforge.net/p/linuxconsole/code/ci/release-1.7.1/tree/NEWS
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/linuxconsoletools/linuxconsoletools.hash | 4 ++--
>   package/linuxconsoletools/linuxconsoletools.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
> index caacf70e45..889f6d1d6c 100644
> --- a/package/linuxconsoletools/linuxconsoletools.hash
> +++ b/package/linuxconsoletools/linuxconsoletools.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256	95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34	linuxconsoletools-1.7.0.tar.bz2
> -sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
> +sha256  bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547  linuxconsoletools-1.7.1.tar.bz2
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
> index f26d874d96..306a5b1fa0 100644
> --- a/package/linuxconsoletools/linuxconsoletools.mk
> +++ b/package/linuxconsoletools/linuxconsoletools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LINUXCONSOLETOOLS_VERSION = 1.7.0
> +LINUXCONSOLETOOLS_VERSION = 1.7.1
>   LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
>   LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
>   LINUXCONSOLETOOLS_LICENSE = GPL-2.0+

-- 
https://www.koenmartens.nl/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
