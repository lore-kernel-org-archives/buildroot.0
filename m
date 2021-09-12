Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49B6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:53:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651766101B
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 651766101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27D64400C5;
	Sun, 12 Sep 2021 15:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzJkBK3f3sIX; Sun, 12 Sep 2021 15:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3010740173;
	Sun, 12 Sep 2021 15:53:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6427B1BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51EDE826A4
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDMeKlj036vA for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 15:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6047082684
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 15:53:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc3c:8ee4:eb9c:c13b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8A2A02003DC;
 Sun, 12 Sep 2021 17:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631462002;
 bh=C6mK0JZWod4XnJk/4fjQ5KSMBumsOfFiw9/qmSIDBZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UvwqwUK73zRWXxGtvHe3LCk3y5PnSr2ri49kJ/soelOyQsFJW9i12C5vcHY5xez3y
 P18AtxRg0W2wBQgGArGcAlZ7hnVlxF7KLstoTvLKKVVHtTqnJ3eSQkMNeM3wtGV6H8
 VJZRiOrSm/OTju4AF8zdrcKDHEeqxAZiunk7A9L9p65b+EJ3w2vxyJS6Z/NrnvUFZT
 wTzu2nsXjohxUe49Xl5DEvI8KiIfsEqngmyg2dN6J3+N1T8EMeYaog+9jqSJAoNCeG
 hDrStMGy0TC3eAZ/fJZ0DcHAKsYbttzVdRkapIG1s9FRSa0HpggVV1ZnqxtONNNZby
 t1dmcNIja8eMA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Sep 2021 17:53:18 +0200
Date: Sun, 12 Sep 2021 17:53:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210912155318.GK1053080@scaer>
References: <20210912153632.84285-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912153632.84285-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/boost: anotate patches
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Michael, Al,

On 2021-09-12 17:36 +0200, Michael Nosthoff via buildroot spake thusly:
> * add changelog and Signed-off-by to patches
> * use correct name for patch 0002
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...n-of-boost_math_no_atomic_int-on-the-command-line.patch} | 6 ++++++
>  ...no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch | 5 +++++
>  2 files changed, 11 insertions(+)
>  rename package/boost/{0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch => 0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch} (91%)
> 
> diff --git a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> similarity index 91%
> rename from package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> rename to package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> index 121355d71e..d7cbf7b95f 100644
> --- a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
> +++ b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> @@ -4,6 +4,12 @@ Date: Wed, 1 Sep 2021 18:54:54 +0100
>  Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
>   line. Allows us to test/emulate platforms with no atomic integers.
>  
> +[buildroot@heine.tech:
> +  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
> +  - alter path to match boost release
> +]
> +Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> +

Spurious empty line, fixed.

Otherwise: exactly how I like them to be formatted, thanks! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ---
>   boost/math/tools/atomic.hpp | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> diff --git a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> index 77f1217a3a..7e324e310c 100644
> --- a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> +++ b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> @@ -6,6 +6,11 @@ Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
>   bernoulli features are to be used in a no-atomics environment. Fixes
>   https://github.com/boostorg/math/issues/673.
>  
> +[buildroot@heine.tech:
> +  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
> +  - alter path to match boost release
> +]
> +Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>  ---
>   .../detail/bernoulli_details.hpp                 | 10 +++++++---
>   libs/math/test/Jamfile.v2                        |  3 +++
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
