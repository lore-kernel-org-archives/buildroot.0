Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF4C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 08:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC3F415DC;
	Sun,  6 Nov 2022 08:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC3F415DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RALH9aHC8qKP; Sun,  6 Nov 2022 08:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6961C408F9;
	Sun,  6 Nov 2022 08:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6961C408F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188E71BF3E9
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 08:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 010D960AEB
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 08:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010D960AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rPfkhxJ2PIV for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 08:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4D6760769
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4D6760769
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 08:54:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k19so12056174lji.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 01:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a8Q+bXrbXUny2ZT+uf2Oxl3UTY0EfcsGF6eNRaPn8z8=;
 b=yHabchbn6FETGkAA31tSxxwU5IN7SsfUTKYAQfeDquDgHG5Y00uGIss4F2armWuHxG
 1MRZx6QPF8K2ytK6tOHnHPkYkt/RndrQ1QVW+ARTIvV9Pvj8qdt8F9qJIyKP/KKQJn/3
 iLyRbFJj2NkvQ9Dub2pa2fFo6T8NF0eKZL9lF0pYD+eo1fyjYV0dWuAbr0ZLWkBt31WJ
 jxDqC2AKy9mDGR3FzPYWiL7ekMIwLlHZx4ZIKyKy5y5sNIY5o37CoTl8kTm1sXU/Q6nt
 oFQVLrjhCRJLi/dkhJITQWe9yBiLx0fN1vwBMicQ68RgWv0baQdFPTNf5VWt3vsLCmc3
 wf0g==
X-Gm-Message-State: ACrzQf2D+9xDTXyY8lK1/1ILztImJolf4IZHIFPEh1yKt8FtusmGRMk3
 DhwJZQlwFBBcTRYLrbk5rcDmpSw3OrI=
X-Google-Smtp-Source: AMsMyM6SyJwh+QZXOv41FjX5HPNARJQSZcY5VnkTQywIMKHgTgX9OtcZ3Jxjtlny6BtTmkR/3QJxNg==
X-Received: by 2002:a05:651c:2321:b0:277:b9f:cdbd with SMTP id
 bi33-20020a05651c232100b002770b9fcdbdmr4202543ljb.0.1667724884318; 
 Sun, 06 Nov 2022 01:54:44 -0700 (PDT)
Received: from gimli ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a056512208700b004b18830af7asm612747lfr.54.2022.11.06.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:54:43 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20221105184455.GL3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-4-troglobit@gmail.com>
 <20221031214956.37e0ef12@windsurf> <871qqnf7wt.fsf@gmail.com>
 <20221105184455.GL3918838@scaer>
Date: Sun, 06 Nov 2022 09:54:43 +0100
Message-ID: <868rkojwdo.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=a8Q+bXrbXUny2ZT+uf2Oxl3UTY0EfcsGF6eNRaPn8z8=;
 b=WZcvEvuFpe/WY9EjUH2G1IeN2d0mib5jAaav3vQsna2OmXYd93m+/MhiBKnQJGnLSA
 wpsOSmSNNSZ14ySSXLkMb15ypkP8KOltKlF9aZgStFX2AlEwapxRFmqN+m1JBT0fKYE3
 6S0KddsMbgqtfhPt/VXU8MiRb81LE8q1qJact/Onlz7qDr5TiRS9dTZzbMgc+UauxyaS
 smptrzNgXAZBzE8VLazFJ+/J50mjiZDsCluDO3dHbm2MvsFlMbY4LDNHmdf9DneDRtPJ
 s4BvYOMaAfUpUN2HKAn1WnwiJZdpetj3kwTRYf+Ir+QLCI0ER9oVjKaRVqd7UUevu65s
 eRNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WZcvEvuF
Subject: Re: [Buildroot] [PATCH 3/3] package/ssdp-responder: fix warnings
 from check-package and shellcheck
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 05, 2022 at 19:44, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2022-11-01 08:30 +0100, Joachim Wiberg spake thusly:
>> On Mon, Oct 31, 2022 at 21:49, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>> > On Mon, 31 Oct 2022 18:46:32 +0100 Joachim Wiberg <troglobit@gmail.com> wrote:
>> >> +cmd()
>> >> +{
>> >> [SNIP]
>> >> +}
>> > I don't think we're using this cmd construct anywhere else in the tree,
>> > or did I miss some change in our coding style/policy?
>> 
>> I mentioned it in the cover letter, but that information should have
>> been here in this patch.  Sorry about that.
>> 
>> It all started out with utils/check-package telling me I used $DAEMON
>> wrong.  While changing that I ended up with a final comment from it
>> that said I should also "run shellcheck and fix the warnings".
>> 
>> It in turn had several grievances which I took one by one.  In this one
>> I used the same construct as in package/smcroute/S41smcroute to work
>> around a warning about using `$?` instead of using an `if cmd; then ...`
> We hanve cmd() in only two pacjages so far, smcroute and watchdogd, both
> proided by you, so I can see you are aiming for some consistency! :-)
> However, the majority of our SNNfoo startup scripts do not use this
> cmd() wrapper construct, so I am not a fan of it.
> (I like that it is generic and that we could have in a library of helpers
> shared across our startup script, but IIRC we had a similar discussion a
> long time ago, and decide against it, because it is trivial enough to
> call start-stop-daemon).

OK, I get it.  I was sort of aiming for a rehash of the start() and
stop() helper functions that many other start scripts use.  It's a small
generalization step up from that to reduce duplication and thus avoid
annoying bugs in behavior between stop and start actions.  Anyway ...

> The rest of the changes are however interesting, so could you respin
> with just fixing those, pelase?

Sure thing, I'll send a v2! :-)

> Note: it is acceptable that some shellcheck triggers get forcefully
> disabled.

OK, was a bit unsure about the policy for that. Thanks!

> For example, SC2086 (Double quote to prevent globbing and word
> splitting) must be disabled when expanding $DAEMON_ARGS; this can be
> achieved with:
>
>     # shellcheck source=/dev/null
>     [ -f $CFGFILE ] && . $CFGFILE
>
>     # shellcheck disable=SC2086
>     start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS

Ah, yes that makes sense.  Thank you!

> Basically, the canonical reference for a startup script is
> package/busybox/S01syslogd.

Got it! :)

> Oh, btw, as much as I hate TABs, we do use TABs for indentation...
> https://nightly.buildroot.org/#adding-packages-start-script

Yup, I'll be migrating my scripts to this.  Thanks for the
clarification and the thorough review!

Best regards
 /Joachim
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
