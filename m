Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E0EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8598C61286;
	Sun, 25 Jun 2023 19:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8598C61286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KL3i5oVDKFPn; Sun, 25 Jun 2023 19:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B210D6125C;
	Sun, 25 Jun 2023 19:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B210D6125C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0211F1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D01516125C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D01516125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GV181cnAByh8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:34:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975DE61244
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 975DE61244
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:34:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-988b204ce5fso317388666b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721648; x=1690313648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILpnsOw7uNgtT1ogDwRR8TR6loKDk7XymJJw9je+pnM=;
 b=lanjty95y5g9Tqf/RCSNShbtCj0cjWz9pocJRQSrmu4g0cnOccBTM17XAcX4ZTMGRX
 /DV9PD0XfQ6uWGE5vfeRvi0HpjB2OcDzYGkvZM6Lc27Cnu+QlhvHzo3uxivnuzeUr9Xh
 gEajKhbfEk/u5EvKb+l+tjJQzdtpOyO6/fSm/jfP9cMaTbkrW8A5iWYFviCHDZ6iS6Un
 FPzr6u+bMWm5yXQ4aUg7PZ5/7YeN1ESZF7bsvNO6jRgxxXiTNQ1bD7kEY3Qn1TElnT0+
 ONPbOsQDoT+r7nf7yMPuwFvccMZ1xCIoxCUPlW6PQIcOgrNqctaNcEt5GfVSEx4/5ZX7
 QbMA==
X-Gm-Message-State: AC+VfDzCw0LWb5evkbcNgu7y53uxKFCWP8kTa7SZ4sM9KUxz+fYeEJds
 dT8HEq2fjlKK2BPDp1zTTpQBturhqYpYo04HZtM=
X-Google-Smtp-Source: ACHHUZ4PKy/N4iWRE79l/8KiaedureilNQ8YIcGZjYBNdTkditnpnfi3Tti3tV2x/EiKHVGJCjtSGw==
X-Received: by 2002:a17:906:da83:b0:982:ab8d:1e08 with SMTP id
 xh3-20020a170906da8300b00982ab8d1e08mr25112280ejb.59.1687721647699; 
 Sun, 25 Jun 2023 12:34:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a1709061b4e00b0098880feae36sm2385202ejg.153.2023.06.25.12.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:34:07 -0700 (PDT)
Message-ID: <5508df57-8aec-ed78-061d-aa1477d20b66@mind.be>
Date: Sun, 25 Jun 2023 21:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230622051703.2543-1-bernd@kuhls.net>
 <727a340c-9b87-eb4d-8291-5b97a256d9b1@mind.be> <87r0pzny4u.fsf@48ers.dk>
In-Reply-To: <87r0pzny4u.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721648; x=1690313648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ILpnsOw7uNgtT1ogDwRR8TR6loKDk7XymJJw9je+pnM=;
 b=g7sVUQEVnXHmNCv/KOO+Acg3nLlXq25YMPuQFRnIkLfwco4Lz3+0ieqe8hAlPHjcFa
 LvNdyFpTDY8lBTzo2/O/n1q9NcSq0CpD779d6Sut454Yv4gmEgA65Ux3ARZsMb3kNnwP
 arHJ+GF28Ohv1rtn85oJ+xDETDx/riuMcpHC14N2RnuL6yJ/rcsxYh4T9bEKu7ScW2to
 tT4hdEr4LnQ9XnUb/uYeEN4170eW4fb+h865WRbBLLHdsRPtldsliDUc7Db00PfSMYeq
 6Fq66N2k3u2WXkdyEImhfbt1WoUWdzu3glwkzNKtaLVpPKAgC1zYfjXxl+R1PzDeI//O
 3GkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g7sVUQEV
Subject: Re: [Buildroot] [PATCH v2 1/2] package/raptor: security bump
 version to 2.0.16
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 21:24, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>   > On 22/06/2023 07:17, Bernd Kuhls wrote:
>   >> This version included the patches removed by this commit, no new CVEs
>   >> were fixed.
> 
>   >  So, I guess we shouldn't call it a "security bump" then? AFAIU the
>   >  only reason to call it security bump is to flag to Peter that it
>   > should be backported to stable.
> 
> 
> And that is even not necessary. I do look at all commits getting applied
> to master to (try to) decide if something should be backported, E.G. if
> it is a (security) bugfix and also applies to the version in LTS.

  Oh. I saw you sometimes change the subject line to include "security bump" 
when the submitter forgets to...

  Regards,
  Arnout

> 
> If you already had a look at think it should be backported, then just
> state that in the commit message (E.G. fixes foo since the bump to
> version x.y.z in commit sha1).
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
