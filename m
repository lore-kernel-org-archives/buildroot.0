Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B2FA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D1AB40439;
	Tue,  1 Nov 2022 07:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1AB40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnwsCBMRo0Un; Tue,  1 Nov 2022 07:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D207400BB;
	Tue,  1 Nov 2022 07:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D207400BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 366601BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08981408FD
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08981408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn2g-tvzK2tc for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:31:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D8E408CC
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4D8E408CC
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 07:31:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j16so22489497lfe.12
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xx9q+aSrNJXM/sk+ZqbPkI7o/CNlgFa+h2imi4yo8aM=;
 b=tnqKq+b2IJClnhv+YRVuONH9Mawla+rZS1i+/Fkf2g1JNvOzJv6akGVw4mfqrFEDro
 9QUNUyd5ySytNJNuc/67NSdo0J2uG8/OX+zdXn/P2iVgFkdJl8B+8Wf5fWpP2PcUc86H
 EFIqOjxpHLzaqjWYyAuIBa2tKm0mg0mvTjE8/lGEaeXgzZux3+OjB6+kRyBxX7yRrK1w
 XK3KKA99zUkWxFo24EMuRjlsOIHy3bsJjr9HEoiL1m9CZ3Bcr81NiqwKI8mj1s1UyEHu
 Y1LrIV7AjBD2yMXFrmGTDE6enAdXlOcY4iw/Zl+/XBKWcnuM3E5AMV4DepXzhhs7C6K+
 v4gw==
X-Gm-Message-State: ACrzQf1h3FkFnTugnowrS9v4eKoE7LJMIJkRwzJZgiN3C5fIFrWqebur
 LUIHKPuZ1ZCgt2JH5Z2nThgGiE7loHAe4A==
X-Google-Smtp-Source: AMsMyM40UmklhSE+LSSdpDTLwoa4f5EhQOvtL5W0kHeE21vhWtDcWqI1Q9RwNxzakJJSQaeo2lcjBA==
X-Received: by 2002:ac2:5d4e:0:b0:4b0:830c:3e08 with SMTP id
 w14-20020ac25d4e000000b004b0830c3e08mr5686072lfd.670.1667287859131; 
 Tue, 01 Nov 2022 00:30:59 -0700 (PDT)
Received: from luthien ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 i15-20020a056512006f00b00498f570aef2sm1572961lfo.209.2022.11.01.00.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 00:30:58 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221031214956.37e0ef12@windsurf>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-4-troglobit@gmail.com>
 <20221031214956.37e0ef12@windsurf>
Date: Tue, 01 Nov 2022 08:30:58 +0100
Message-ID: <871qqnf7wt.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xx9q+aSrNJXM/sk+ZqbPkI7o/CNlgFa+h2imi4yo8aM=;
 b=QHwwZcE1lR5vWzkmmFsPKsc8WGCPqNRRScXx66Y3RWFnXWxsp2EMzs8LHCZySkc5iG
 yRBHWOfGy+7yThfNHajMCSKzvwtGOtHgFZ6EbAWyyYuU87bs5Ja6ODIdbk1iaNa0RK3l
 ER8dvLe/IbPWJYaux9suTNw+2SrP8kv6kpepg+EM4yKdUY3bFtyqMhRJELSPmd/emdi9
 IuggGVZ3HtxnPtllsRX3FmXCxCjsguA4P2dV8bSOV9VxkJv+Kb+E0p5Bl2I0dUPpFdlC
 fz6m0XeiI3r3ttZIPXUYH6b78HPFRFdOFcHLf1y0OFvZsvtRdEgOiWQXMHd8rTZUkQT+
 PZ4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QHwwZcE1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Thomas!

On Mon, Oct 31, 2022 at 21:49, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Mon, 31 Oct 2022 18:46:32 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> +cmd()
>> +{
>> +	start-stop-daemon -q -p "$PIDFILE" -x "$DAEMON" "$@"
>> +	status=$?
>> +	[ $status -eq 0 ] && echo "OK" || echo "FAIL"
>> +
>> +	return $status
>> +}
> I don't think we're using this cmd construct anywhere else in the tree,
> or did I miss some change in our coding style/policy?

I mentioned it in the cover letter, but that information should have
been here in this patch.  Sorry about that.

It all started out with utils/check-package telling me I used $DAEMON
wrong.  While changing that I ended up with a final comment from it
that said I should also "run shellcheck and fix the warnings".

It in turn had several grievances which I took one by one.  In this one
I used the same construct as in package/smcroute/S41smcroute to work
around a warning about using `$?` instead of using an `if cmd; then ...`

>>  start() {
>> -	printf 'Starting %s: ' "$NAME"
>> -	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
>> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
>
> This all looked matching our coding style. Why are you changing this?
>>  case "$1" in
>> -    start|stop|restart)
>> -	"$1"
>> -	;;
>> -    reload)
>> -	restart
>> -	;;
>> -    *)
>> -	echo "Usage: $0 {start|stop|restart|reload}"
>> -	exit 1
>> +	start|stop|restart)
>> +		"$1"
>> +		;;
>> +	reload)
>> +		restart
>> +		;;
>> +	*)
>> +		echo "Usage: $0 {start|stop|restart|reload}"
>> +		exit 1
>
> I'm not sure what is the recommended indentation style in our init
> scripts. Tabs? Spaces?

Shellcheck pointed out this section had four spaces indent instead of
the eight (tab) used for the rest of the script.  Iirc from the "own
code coding style" discussions C and shell script should follow the
same style, but I may very well be wrong here.


Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
