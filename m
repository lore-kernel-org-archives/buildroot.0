Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C2FC636CC
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 01:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD2E4023D;
	Tue, 14 Feb 2023 01:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD2E4023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIZOi_nsm9Zf; Tue, 14 Feb 2023 01:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE8B40A82;
	Tue, 14 Feb 2023 01:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE8B40A82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 396CF1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 01:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1344581DEE
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 01:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1344581DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1LRExBTtQKc for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 01:32:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1914081DEC
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1914081DEC
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 01:32:29 +0000 (UTC)
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56]
 helo=[192.168.1.80])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRkAZ-009XP4-35; Tue, 14 Feb 2023 01:31:44 +0000
Message-ID: <22dce104-b4e5-6e61-7174-28ab0e11b679@infradead.org>
Date: Mon, 13 Feb 2023 17:32:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230213200604.2539630-1-yann.morin.1998@free.fr>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230213200604.2539630-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=kMVU4BSP3I2u2nI6bag1ogtyskM18QoWqtJu3r/1oVY=; b=koBf2ki9R+F+MukAtPzfZtHtdI
 LuW9JVr8l34Lit2QwFJi0gNsKPn0FFIty71e46MqamoxUO2qB4l4hikxlYkXMav84ngXh7uTUBtdw
 AasgCMQZMRZU3C3FnLiPjUu86+rQDHUZrcAjgRAiV31zgwqV2R4puD7rWgRI5v3ikV69rcL2zlpBx
 ujzHAEfppKyxohIbj6r45XTuyzh9Jbq0R4BCTlefMIHK7jL698DcR+Ha0chJ9XR+rO0R3ewL0HWER
 niD8NNG9kKFuBiQzjF9ePTYqEJZmSOySMLO4Lr2XeE2KcE+HdupR7pbpOisEBsvYzSNwHPy5bGvaC
 JfdD984g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=koBf2ki9
Subject: Re: [Buildroot] [PATCH] package/flannel: use the github helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/13/23 12:06, Yann E. MORIN wrote:
> Currently, flannel uses an ad-hoc github URL and a version-only tarball
> name, even though we already had the github helper (introduced in 2013)
> when flannel was introduced (in 2016).
> 
> Switch to the github helper, which allows us to get a properly named
> tarball.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Geoff Levand <geoff@infradead.org>
> ---
>  package/flannel/flannel.hash | 2 +-
>  package/flannel/flannel.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
> index 6a0223a20f..bafc453097 100644
> --- a/package/flannel/flannel.hash
> +++ b/package/flannel/flannel.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  v0.14.0.tar.gz
> +sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index 231cf90dfd..b4e2b2f777 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  FLANNEL_VERSION = 0.14.0
> -FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
> -FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
> +FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
>  
>  FLANNEL_LICENSE = Apache-2.0
>  FLANNEL_LICENSE_FILES = LICENSE

Looks good.  Thanks for working it out.

Acked-by: Geoff Levand <geoff@infradead.org>




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
