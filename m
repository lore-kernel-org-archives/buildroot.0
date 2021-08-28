Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB837C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:57:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684E2608FB
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 684E2608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 205594012E;
	Sat, 28 Aug 2021 13:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flY8_z80WjYn; Sat, 28 Aug 2021 13:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41C784015D;
	Sat, 28 Aug 2021 13:57:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772CD1BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F334015D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_XC9F5im0zl for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:57:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 390384012E
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:57:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso6249483wmi.5
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpfm/7qbImrxtRsC5UYnqcpyaKE1NEKrlQgGOao2LtE=;
 b=OocD8yYEWw2UxnA1TmJTco8ghQdvMOpwjrCUlAxIJMNdn7UrmRsDlGYU/385AjQvWs
 b5w0Ghb5lxiRBqAb6Rop1z6vF5N8TS4adFJUA0kYRgGaeAkO1f+wPJm8k46UWQrO7+nS
 nADWFTxO+Wtzcndpn5mVqjb3NN9+05LHExjHHwk6d4+Q6ks5E7oVM4Iul3t0V55sBPwt
 QqOdvjByPyTs7zdRAPiHtBWHbBZVR1EEBStZR5wNS48Yx8jCd9AckfHRtf4i6cj9Rqlu
 87Zg02Zz3PYIVyWyFxE0tJVO86Y157hMy+fdrRdKatXEST3/GqFtSM2JjDItu+P/UxuT
 yCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dpfm/7qbImrxtRsC5UYnqcpyaKE1NEKrlQgGOao2LtE=;
 b=rIZ+825Pur4UMN4iqfT3dlkUUhysMsuXXHbMNONDwGOaeOn81voFo8ii1ugFdMrr1i
 WSPlcY6Va/+sC+o1JVz8ngYFK73Y1gnsJ2c+xLqrIDnp8AEc6hQpOArmbM8wUHSsuhU6
 ZfIHMVSW+GyOO7DXLSbjaauBv+nYBYmpPkqflKXj0sNO65RVTlbz/agyGqEg/SBfpgFE
 OCyYka3yThWmA0Eh7BvWfMadgDVUHVQ63b5s4hndJtMEwuvCEFMHEQ5bFtwtNGiVcuzq
 jF/RYoULrQkGmkN5TblfD7Isarp4Hy6AgIhjQQPAvxkC1xaiir3rfy5vVsCw77HwDvjP
 AUBw==
X-Gm-Message-State: AOAM530baIvrKOhXGt8/yza/UQ/s3APHcu4tIKRgWWtSl1Rd3HiTJwm0
 FgaoEq687R5r4v5w+VoRQXaRb6A4cjxm4w==
X-Google-Smtp-Source: ABdhPJy1SMZanOKiZ6ba7fHWqQo4BLXLfm/x50p78OCRI+ux6h7Bh36naf4r39IIx/6zDKjA8fSaNA==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr24813983wmj.151.1630159027521; 
 Sat, 28 Aug 2021 06:57:07 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id w1sm13589648wmc.19.2021.08.28.06.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 06:57:07 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20210828130847.461996-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fc83d0b8-928f-6cab-de86-7a58a4114445@mind.be>
Date: Sat, 28 Aug 2021 15:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828130847.461996-1-yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/fakedate: avoid recursion if not
 first in the PATH
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 28/08/2021 15:08, Yann E. MORIN wrote:
> With BR2_REPRODUCIBLE, our 'fakedate' wrapper script will end up in
> host/bin/date. Currently, it iterates over all the 'date' found in PATH,
> until it finds one that is not the script itself, in an attempt to avoid
> infinite recursion by calling itself again and again.
> 
> This heuristic works OK in Buildroot, because host/bin/ is first in the
> PATH, and so that means the first entry in the PATH is skipped.
> 
> However, this is going to fail as soon as our wrapper is not the first
> in the PATH. Indeed, in that situation, the current heuristic will stop
> on the first 'date' in the PATH, as it is not the script itself, and
> since our script was executed, that probably means the first 'date' was
> itself a wrapper that ended up calling us. So, calling it again will
> eventually trickle to calling us again, and thus creating the loop our
> heuristic was made to avoid.
> 
> This situation currently does not occur in Buildroot, because host/bin/
> is first, *and* we have no package that provide their own 'date' wrapper
> during their build steps.
> 
> But when we generate an SDK with BR2_REPRODUCIBLE, then our wrapper
> script will be in sdk/bin/, and there is no longer any guarantee this
> comes first in the PATH, thus opening the possibility that another
> buildsystem based on our SDK, but which has its own 'date' wrapper, will
> trigger this infinite recursion.
> 
> We fix that by iterating, in reverse order, over all the 'date' we can
> find in PATH, and when we find ourselves, then we know the one we found
> in the iteration just before is the one that we should call.
> 
> 'which -a' is old enough that we can expect it to be always available;
> it has been present at least since Debian Squeeze, released 2011.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/fakedate/fakedate | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> index a64d9b9cdf..9bef113357 100755
> --- a/package/fakedate/fakedate
> +++ b/package/fakedate/fakedate
> @@ -19,15 +19,13 @@
>  #
>  
>  DATE_BIN=false
> -# Do not call `date' directly since it will produce an infinite recursion.
> -# Instead, find path of true `date' binary.
> -for P in `echo $PATH | tr ':' ' '`; do
> -    if [ -x "$P/date" ]; then
> -        if ! [ "$P/date" -ef "$0" ]; then
> -            DATE_BIN="$P/date"
> -            break;
> -        fi
> +# Do not call any 'date' before us in the PATH, or that would create
> +# an infinite recursion.
> +for date in $(which -a date |tac); do
> +    if [ "${date}" -ef "$0" ]; then
> +        break
>      fi
> +    DATE_BIN="${date}"
>  done
>  
>  if [ -n "$SOURCE_DATE_EPOCH" ]; then
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
