Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4960C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 21:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5240A83E8F;
	Sat, 13 Aug 2022 21:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5240A83E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4Zko3XXWQy7; Sat, 13 Aug 2022 21:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FE683E87;
	Sat, 13 Aug 2022 21:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58FE683E87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 918571BF846
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66A8F83E9B
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A8F83E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EAjyj8XnkiaB for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 21:37:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1067C83E6A
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1067C83E6A
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 21:37:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v10so4103745ljh.9
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 14:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HukWN+URwRc/krvWUFERypzsNdy1ooG+Hjk0Wfzb1lI=;
 b=qoDNv/hXcnle3j6GdJ3UsXPDeiPwtqv0D0IINLsb34AZis7Y/k5k9ZsDm8tmC6e6FZ
 ZlFssfkfo2s1DWhGACNep22qwgF2nBWxCz+LLRjuJohh8AKe/WlK09Chxax4NuOoC8tC
 76cxWKYsIdUMwqNYc35QUdw8CEq2fsGGMGZI+8kaWijqzW6aV1OLwkX1uaqbYWTNHTWD
 lRJcg9lwG2Q8ZlszXM4QLR/0wa/5GJGze8aq9FyVnGiWkY/2fgvDmPeSlY7PEwMdABmJ
 RucJPzWvILJuJGVdsdzxA8DwpN1epDYVTQ1ExX9ExYWDiSwXE/BJn56Fv5G8hQtcQNC6
 K7Ag==
X-Gm-Message-State: ACgBeo22/J+Lk7i8sIQAY8FKe0FfyG3421OAXBeTHs8lMzqXbHDmygR/
 4ruCRRlvzMj7BFeWL+K3udjpGTvxvNo8fV33dMMdB+YL
X-Google-Smtp-Source: AA6agR6HPejd1K2AJ/H0uWUXT0ifPX5GBhRBS3BoOnyoOlxrujuJJuaQoO9of4ik4/csh2XSiZTOzFbI+mrx/IPXQVI=
X-Received: by 2002:a05:651c:454:b0:25f:e1da:8e9c with SMTP id
 g20-20020a05651c045400b0025fe1da8e9cmr2796262ljg.172.1660426621791; Sat, 13
 Aug 2022 14:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
In-Reply-To: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 13 Aug 2022 23:36:27 +0200
Message-ID: <CA+TH9VkvGR70Tyi4--fWok28o_3QiwKvxBHhM2d=hrs5OvqLsg@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HukWN+URwRc/krvWUFERypzsNdy1ooG+Hjk0Wfzb1lI=;
 b=J3mhNdpqvyZ4PJ0atDjLjc7LC8WWABDPwHO+xlUXoxS18Gsen+s69qnjZshBpDF+Mb
 d56ry5eaY029eWX8BNphlL248OhwgP2dPE6uuIOJ6l2AJLIGAqehRGwv6ne1Hf8aT4gH
 rk5T51vUzg20X342uak4pm7pC60US5cIB1CVEEtK+U2eEHQtrCbnbyzteXk+N6PnyzIh
 ulMsAdBx96WTsDKHVXUH0WJSyO97R17zoXRweELGdSZBLP0PnDuwTC+S05ip7f2IM7Io
 g+UhrphulJfadsk6NQ88KVn7kRjBHyXZ2XDIsG4qouEuy9yTI7OuJv92+H0IQhT8HwBK
 Jl8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J3mhNdpq
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: speed up DHCP lease
 acquisition
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Il giorno sab 13 ago 2022 alle ore 22:53 Edgar Bonet
<bonet@grenoble.cnrs.fr> ha scritto:
>
> Commit c343e01ac4908f76520cf9a405ed87650e78dc62 made udhcpc send a
> single DHCP request (instead of 3) before going to the background, thus
> speeding up the boot process if the DHCP lease is not obtained
> immediately. Unfortunately, this can also slow down the acquisition of
> the lease as, after going to the background, udhcpc waits for 20 seconds
> (instead of 3) before retrying.
>
> Speed up the lease acquisition by setting the retry timeout to 3
> seconds.
>
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
> Hello!
>
> While testing 2022.08-rc1 with acmesystems_acqua_a5_512mb_defconfig on a
> real Acqua board (and Ubuntu 20.04 host), I noticed that my board became
> very slow in getting a DHCP lease, which was a fast process on 2022.05.
> Wireshark showed the following DHCP traffic ("<" = received from the
> board, ">" = sent to the board):
>
>     time (s)  packet
>     ---------------------
>     03.24 < DHCP Discover
>     06.24 > DHCP Offer
>     26.28 < DHCP Discover
>     26.28 > DHCP Offer
>     26.28 < DHCP Request
>     26.28 > DHCP ACK
>
> Looking at the log 2022.05..2022.08-rc1, I identified the regression to
> be in commit c343e01ac4908f76520cf9a405ed87650e78dc62. This commit adds
> the option -t1 to the udhcpc command, which makes it go to the
> background after only one try, and has the unfortunate side effect of
> introducing a 20-second delay.
>
> With this patch applied, the lease is acquired much faster:
>
>     03.26 < DHCP Discover
>     06.26 > DHCP Offer
>     09.28 < DHCP Discover
>     09.29 > DHCP Offer
>     09.29 < DHCP Request
>     09.29 > DHCP ACK
>
> Regards,

While I'm ok with this patch, I suggest checking why obtaining the
lease fails on your board on the first try.

The intent of adding -t1 was to speed up the boot process not wasting
time waiting foreground: this can be generically applied to any board:
the network cable could be unplugged and this shouldn't affect the
boot process time.

The patch you propose here instead tries to solve a problem you have
with your board: the board doesn't obtain the lease timely (first try)
and then you want a faster retry.
I think this is not generic enough to be acceptable for all the
boards, you can solve this problem easily on your local busybox
defconfig.

Anyway I'm not against changing the default background retry timeout
if this is not harming other users.

>
> Edgar.
>
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 2409cbcce1..137e44c870 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
>  CONFIG_FEATURE_UDHCP_RFC3397=y
>  CONFIG_FEATURE_UDHCP_8021Q=y
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -A3 -b -R -O search"
>
>  #
>  # Print Utilities
> --
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
