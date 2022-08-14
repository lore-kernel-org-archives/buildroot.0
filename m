Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FB2C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C38640538;
	Sun, 14 Aug 2022 13:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C38640538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1uU6V7tF09k; Sun, 14 Aug 2022 13:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B52D4052B;
	Sun, 14 Aug 2022 13:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B52D4052B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D180A1BF423
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 13:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC96C8194A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 13:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC96C8194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PdmbdNFb-uyV for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 13:33:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4224281836
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4224281836
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 13:33:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D5F5F60137;
 Sun, 14 Aug 2022 15:33:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 15:33:31 +0200
Date: Sun, 14 Aug 2022 15:33:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220814133331.GA2775145@scaer>
References: <20220814033253.575354-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814033253.575354-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660484015;
 bh=K3dvXTvnrndRNkKUYEJQ60FKhonZLiOeOF3Q3WG6wxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7GRUla16gSkmEU0uihZ5xnZWF/0+gSlYASc/TpZgbg7TZEI+FaaEQ7Zt2XPW30ea
 ZRHKammWDs7s0DxW/fsJ7yuaPY+YYx2cDaKmZ1jvus2uTx1ebmUKkhZSDF4kNv7rXV
 DmFMdwXsqvgLnipUU8eatY+Sqr3UcOWGOTNdsYtaEmX2UkqaUC+Gy/UMDrmWnG9j+/
 b5xL4RbddXZ/AX12whyu59ZX23c8i2MZIbNPr/vIyECD9uh0P1skC4PTMH0VKoYrqf
 siFSLUh8VBo/CmtN+oZSoKXIMF7jBYlnyh42yLH0nQXV3RKSXFEctPXAg0eHX6Onqh
 DPWUMntCAvZjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D7GRUla1
Subject: Re: [Buildroot] [PATCH] package/ace: fix build failure due to gcc
 bug 101915
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-08-14 05:32 +0200, Giulio Benetti spake thusly:
> The ace package exhibits gcc bug 101915 when built for the Microblaze
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f8f/f8f8de99abe92175954c370ad99fee43942bcdcc/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/ace/ace.mk | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ace/ace.mk b/package/ace/ace.mk
> index 7299f0d40c..6f381d5da5 100644
> --- a/package/ace/ace.mk
> +++ b/package/ace/ace.mk
> @@ -17,9 +17,18 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
>  # Only compiling ACE libraries (no TAO)
>  ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
>  
> +ACE_CPPFLAGS = $(TARGET_CPPFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
> +ACE_CPPFLAGS += -O0
> +endif
> +
> +# ace requires -std=c++11
> +ACE_CPPFLAGS += -std=c++11

There's no reason to have this unconditional append-assignment, so I
moved is to the initial assignment, above.

>  ACE_MAKE_OPTS = \
>  	ACE_ROOT="$(@D)" \
> -	DEFFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
> +	DEFFLAGS="$(ACE_CPPFLAGS)"

So, I was very surprised to see C++ flags to be passed via CPPFLAGS.
CPPFLAGS contain the C and C++ pre-processor flags, not the C++ flags,
so it looks fishy...

And indeed, ACE's GNUmakefile states that DEFFLAGS are the C++
pre-processor flags.

But we're lucky that the C++ pre=processor flags are appended to the
compile command, so it turns out to be OK.

However, this is very misleading.

So, I've pushed out a follow-up change that adds a little comment to
avoid further head-scratchig in the future...

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  ACE_LIBARIES += ace/SSL
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
