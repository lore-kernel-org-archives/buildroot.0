Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43DC4167B
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 13:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04951400DD;
	Thu, 29 Dec 2022 13:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04951400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9d21Bo4g1Iu; Thu, 29 Dec 2022 13:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4676F40147;
	Thu, 29 Dec 2022 13:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4676F40147
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5481BF2C0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 13:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029FF60D61
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 13:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 029FF60D61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCGl_CL-_3qZ for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 13:51:41 +0000 (UTC)
X-Greylist: delayed 00:15:37 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FCC60D50
Received: from mx1.sonologic.net (mx1.sonologic.nl
 [IPv6:2a01:4f8:121:43cd::1:9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81FCC60D50
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 13:51:40 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=[10.1.3.42];
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from [10.1.3.42] (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPSA id 2BTDZxbU076109
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 29 Dec 2022 13:36:00 GMT (envelope-from gmc@sonologic.nl)
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be [10.1.3.42]
Message-ID: <189a295b-c984-9580-ced2-b8c0b34d3210@sonologic.nl>
Date: Thu, 29 Dec 2022 14:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Joel Carlson <joelsoncarl@gmail.com>, buildroot@buildroot.org
References: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
From: Koen Martens <gmc@sonologic.nl>
Organization: Sonologic
In-Reply-To: <20221228230326.3799157-1-JoelsonCarl@gmail.com>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Thu, 29 Dec 2022 13:36:01 +0000 (UTC)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=sonologic.nl; s=dkim; 
 t=1672320961; bh=uBDDVhLebRDXsn75fIfxWMGxyMTjqmaUpzEjeP3GMEs=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=S6Xl7E05jTleB1THfDKE2jVrWfobaV1ViGPQppAlAsCOj3KhvRUNHDOBCBz40WhzS
 t58BNCGX4MKgj3e2MRI+QEiEtbexxNK02ceZKT4aJdHy6DgQDnSwTSMVPxmcHArgYY
 LQv+ZE6jff649T3LyoelFKRwGn3T7HVQIyoyK5/9DqIpbbOotcTSoiHXIuy91oHI4I
 v0d02uFHl+9KFy4gZFu+PMshp2vBorHTiGcQpAKsT2oDIga0TtXBLlN/9GeGg602wQ
 eubWwQ0+A6rOQG3oMG30GEBCde3mfH7+WkjrmZVsNstLIuIxVWZFkco16q7fBcIr0J
 dN4lIBvX53wzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sonologic.nl header.i=@sonologic.nl
 header.a=rsa-sha256 header.s=dkim header.b=S6Xl7E05
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.3
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

Hey Joel,

Cool. Did you manage to get it to compile on all platforms? I tried a 
while ago to bump the version, but sadly ran into compilation failures 
on a handful of platforms, which is why I never submitted a patch. I 
didn't have the time to figure out why it failed, what would be needed 
to make it pass or how to patch the configuration requirements to not 
show up on the affected platforms.

I guess we'll find out soon enough, when I start getting mails from the 
automated build system that it's failing (or not). Just in case, I 
currently and in the near future do not have the time to diagnose any 
failures that might result from bumping the version. Hope that if they 
do fail, you can have a look.

It's probably best if I remove myself as a maintainer for this package, 
perhaps you'd like to take over?

Apologies,

Koen

On 29-12-2022 00:03, Joel Carlson wrote:
> The 0.10 line offers minor improvements and bug fixes.
>
> The previous security bump from 0.9.1 to 0.9.2 fixed CVE-2022-46149,
> which was also present in 0.10.2, but is fixed within 0.10.3.
>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
>   package/capnproto/capnproto.hash | 2 +-
>   package/capnproto/capnproto.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
> index c3233e7c8b..0faf69d069 100644
> --- a/package/capnproto/capnproto.hash
> +++ b/package/capnproto/capnproto.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
> +sha256  e07446f56043c983e009038e69d18ff86a2924909f0b518ccf47eccf5ac03919  capnproto-0.10.3.tar.gz
>   sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 23f128455a..84acf5fc65 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CAPNPROTO_VERSION = 0.9.2
> +CAPNPROTO_VERSION = 0.10.3
>   CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
>   CAPNPROTO_LICENSE = MIT
>   CAPNPROTO_LICENSE_FILES = LICENSE

-- 
Software architecture & engineering: https://www.sonologic.se/
Sci-fi: https://www.koenmartens.nl/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
