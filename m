Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C0FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA4D61074
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBA4D61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E9CA40111;
	Wed,  6 Oct 2021 19:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVzp3Y16zCBv; Wed,  6 Oct 2021 19:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78B840243;
	Wed,  6 Oct 2021 19:29:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A88641BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9889784109
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTXpM7e_zSUW for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:29:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBA6B84100
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:29:03 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v18so13926381edc.11
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g9pGCqwX/Eegy5R87CEThUFmztkf3pqn7K2sVMZXX84=;
 b=cURDwdhrAHFvSXa/yPDx52FJvWjafH+T1HCW/azO1sRf3p7EP11sk7Gj7IzseDl16D
 hJJImG8vebZZi/E+Wr7IWmluoSkWTidaACK+KG+CUFDOqHqKTrRSGSEmco24FNJtUkwy
 ZsBo6oSz8JbhJcKRhumi1ALUdutlFsrbRBW5ZhhEDg9IFKjw6L9EGu9N6F/EeimTBoDO
 hptJPKUiDO3eU3O458J+VBWFPG83xYNBxtQ5dJcj/SCyMh2O5O6XD30lR3+/h1TuEiKI
 Tr2/Am6nOnZIm38dIIYOG8ba3FLN6DdU7VNTQ6Q2KIcE2UZ17gTuiP+COEMyww7p4DZi
 +fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g9pGCqwX/Eegy5R87CEThUFmztkf3pqn7K2sVMZXX84=;
 b=bSIjUnYxubfsN+nfgKJoGejJzjaC29HmtcS2Q9okfw1OSiYr2I5ZvZg7Es7PL8+zMK
 TKRoWT3AKaIBIVt18HWxe1qWCI0Vl8I5DF+dQ0egnwayogf0TQSDeMefHM+Rm9VfoxZa
 6vWWu839emosVP0AuVve7RdUuTl/LNdmZrUHWZgRK6tq7WV+NV3jU9UxdapnQ0ssdMg2
 Ugdt6W1v/H9ul2Bi+ExP+mYbDNbB41qpcj9+yZVA4rSSjKwidacIBa1RpvyLC+dOiFen
 udQuu7IvkNaCdhBQu+Aj64Sjav93UhHElIM3UZ4O5ao0QHTJ36rtsbXgNEiWf8aKgEpz
 l7RA==
X-Gm-Message-State: AOAM530mQ4h65F/lJf3Qrvi+LvCvz1gyp064ThvVLK4YlCnouZUFE7cg
 DTlDYW6kTZNKXdpbALXPWx4mMWytNUpWS926
X-Google-Smtp-Source: ABdhPJy+izOJceji3H+FQQQS00UGj4r9uPtl1/0/GtlJ/crocDfAgu6KAOYoXc0pUdWU3bMwquPw0g==
X-Received: by 2002:a17:906:2dc9:: with SMTP id h9mr4345eji.431.1633548542048; 
 Wed, 06 Oct 2021 12:29:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z19sm2769288ejp.97.2021.10.06.12.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:29:01 -0700 (PDT)
Message-ID: <806f32e5-c087-a47f-c3e8-aa3f672cc601@mind.be>
Date: Wed, 6 Oct 2021 21:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20210928094323.2566981-1-troglobit@gmail.com>
 <20210928094323.2566981-3-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928094323.2566981-3-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/smcroute: cross check PID with
 process name in stop action
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/09/2021 11:43, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>   package/smcroute/S41smcroute | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
> index bdc0f87645..3bef3bcd85 100755
> --- a/package/smcroute/S41smcroute
> +++ b/package/smcroute/S41smcroute
> @@ -4,12 +4,11 @@ NAME="smcroute"
>   DAEMON="smcrouted"
>   PIDFILE="/var/run/$NAME.pid"
>   
> -# shellcheck source=/dev/null

  There's no reason to remove this shellcheck exception, right?

>   [ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
>   
>   cmd()
>   {
> -    start-stop-daemon -q -p "$PIDFILE" "$@"
> +    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
>       status=$?
>       if [ $status -eq 0 ]; then
>   	echo "OK"
> @@ -22,8 +21,7 @@ cmd()
>   case "$1" in
>       start)
>   	printf 'Starting %s: ' "$DAEMON"
> -	# shellcheck disable=SC2086 # we need the word splitting

  Nor here.

  Applied both to master with those two fixed, thanks.

  Regards,
  Arnout

> -	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
> +	cmd -S -- $SMCROUTED_ARGS
>   	;;
>   
>       stop)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
