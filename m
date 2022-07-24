Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1516BC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B68D83F18;
	Sun, 24 Jul 2022 23:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B68D83F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUDYFUiJNdk8; Sun, 24 Jul 2022 23:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A286983EEA;
	Sun, 24 Jul 2022 23:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A286983EEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 106861BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D835D40242
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D835D40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoqML95ejYRc for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:42:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11731400CC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11731400CC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:42:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u12so6949813edd.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0G4sytrBSNIE2VVzn5XfhrpIZzshe1LE81nj4+XLg8=;
 b=cSVqkyBgvAvXaQMksxkJGGt3nmEM4nldwb+qQzOb3wEN3RWzuQIOP0EehbkVF1Ta8S
 WPS8R6hh/mKmzlIv6GYIFf2X3kUCjidyrCsKHaaXn0HALmmyQPJdwaM1L5IhBKQ77ds6
 TDX5XFay+qwdoXfGMrRfM5y30MpqF5E76hF/FMe5qoTbsaAjjF2W3jCKCdEVUa2977uk
 8byIYrYsrw3KnLBOiQA7InjJ3KQuH4DNBQN/4b+St+/ohD4v86sbLKzh92GxfcXQ8VOn
 zSiKvS7xYluDj++M0nm+066awJwwcC94F68OA09usYy6c+BxGwkt6SMhH98gcIBB6LZ0
 hyAg==
X-Gm-Message-State: AJIora8xFgXVGiZAqF+bjGeP/cXfTZbObuS9SVdA732+KLgeLlGWkpHU
 M4lZOTJdUroAHKCl5OXBTxQs/6BkZKCdwvU3
X-Google-Smtp-Source: AGRyM1sy9CexKZxoZt9fkQ6p+dU4uKTHAkCAZ27mwKfL508pLDcyIP/g0doRP3hwvqsV059BtQ1mUg==
X-Received: by 2002:a05:6402:1117:b0:43b:c965:549e with SMTP id
 u23-20020a056402111700b0043bc965549emr10612039edv.366.1658706163057; 
 Sun, 24 Jul 2022 16:42:43 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b00722e5b234basm4664455ejh.179.2022.07.24.16.42.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 16:42:42 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id ez10so17527206ejc.13
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:42:42 -0700 (PDT)
X-Received: by 2002:a17:907:6d86:b0:72b:5ad6:6df1 with SMTP id
 sb6-20020a1709076d8600b0072b5ad66df1mr8399401ejc.264.1658706161993; Sun, 24
 Jul 2022 16:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
 <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
 <20220723222237.7989b5c6@windsurf>
In-Reply-To: <20220723222237.7989b5c6@windsurf>
Date: Sun, 24 Jul 2022 16:42:30 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
Message-ID: <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n0G4sytrBSNIE2VVzn5XfhrpIZzshe1LE81nj4+XLg8=;
 b=Cu8mJ/E4DzVHVtz0USuLNmenAtkot1Fze2sGcVC54CMhFLBT79WIGEHlc+iQyQR+PL
 62spwo5YNvlDOvBwqHSbI+jGEFcCUy4J+Zitmjw6bdQOX30xGnphMa88sSgVhw8tkz44
 uTMS8iKKT9NEpgeWWeaS/nX6SphN5/rtl9tEC0c3sAxsCli/L1+m9dkzJxwzKRjcV/1A
 q4S547dD/4vlmulTNLsNKxWAqCe82uLm6JsdANPfBC/6U1HB45uWmfAwT3ntp1kDS3AZ
 VYTKrUlM3clcs1UuZg7nuhy4GDibba6AKnaNCeXw+lJI4F7U6FA3ovJTY48CxldFWSVT
 +syg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Cu8mJ/E4
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Sat, Jul 23, 2022 at 1:22 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> But I see this:
>
> -# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
> -## explicit
> -# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
> -## explicit
> -# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
> -## explicit
> -# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
> -## explicit
>
> So these lines are really removed.

If you run 'go mod tidy' it removes these lines.

So, I guess they are unnecessary / not needed after the "replace" is added.

Because we're patching vendor/, if you want, you could drop all parts
of the go.mod and go.sum changes besides adding the "replace" line.

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
