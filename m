Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2ECC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE2D415FF;
	Mon, 16 Jan 2023 21:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CE2D415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jX2nIHlWuBmu; Mon, 16 Jan 2023 21:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CC04163D;
	Mon, 16 Jan 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48CC04163D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC5711BF20D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F7881F66
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F7881F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRp3GjwyHnpe for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 21:35:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA23681F64
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA23681F64
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 21:35:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hw16so59103095ejc.10
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 13:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5tiVjm2H2lp7tyDLpIGSyvJKhCELIl2oLdtROTILGQ=;
 b=Bexz7k/KuT+XzixnGlAOuh1M1LMwDO37F7TZIS2YQ3ahaMT9bpmPnF4U6FBYReWMa2
 aQEPusVLQyVTZ7kE8fId5ZYcSQA3GsxSsbIznoIsWFVLEAc+gQZdtWEcmep+21hEPIOi
 axCM6kwElrkivfdIycp0Ob26uekB35028ioh1r9V+8Dpxd9vdaS7PbELvJfnLikCbXdq
 c57CHdgW5VvKk6fmZR07j9okX4tnUtADVHI3YNRcTX2XycxWEHEwcB1gTXgTk2AP5CnD
 5r2ZxDO0JVr4TZ/4f7RXGPbjuUhbybsOOAfjKbPPYlq1nwOtgJgjH19SMVC7VvcZSTBB
 hYMA==
X-Gm-Message-State: AFqh2kpDY4NEIZIK534oENOnS8bLy0q8QduWXvcX9sXa3Rm4ZfnYqDK3
 CZA0tVeSkYRv/6eBq4HeDT2wa6UJqdOr6vvgTwo=
X-Google-Smtp-Source: AMrXdXscZasFTGpj88De0L3QwR2tuPfh4VCjw4O6/O1TMSGdkvZuEfZlm4Bw2KbGcV904gaCej+Atg==
X-Received: by 2002:a17:907:a4c1:b0:812:d53e:1084 with SMTP id
 vq1-20020a170907a4c100b00812d53e1084mr15115506ejc.70.1673904940825; 
 Mon, 16 Jan 2023 13:35:40 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007c0b28b85c5sm12243611ejt.138.2023.01.16.13.35.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 13:35:40 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id tz11so6563809ejc.0
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 13:35:39 -0800 (PST)
X-Received: by 2002:a17:907:98b7:b0:84c:feca:c267 with SMTP id
 ju23-20020a17090798b700b0084cfecac267mr47278ejc.261.1673904939552; Mon, 16
 Jan 2023 13:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20230116105032.1890904-1-peter@korsgaard.com>
 <20230116105032.1890904-2-peter@korsgaard.com>
 <CA+h8R2rcBWzvf8bEZt0awr1bfc=5E5uq+LEC7B=h4=g8eU3Adg@mail.gmail.com>
 <87ilh6fbcx.fsf@dell.be.48ers.dk>
In-Reply-To: <87ilh6fbcx.fsf@dell.be.48ers.dk>
Date: Mon, 16 Jan 2023 13:35:28 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rjHifOtVJabUU-CLT6m4VbDq5gkVujz1=wL7NiXKDf3g@mail.gmail.com>
Message-ID: <CA+h8R2rjHifOtVJabUU-CLT6m4VbDq5gkVujz1=wL7NiXKDf3g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z5tiVjm2H2lp7tyDLpIGSyvJKhCELIl2oLdtROTILGQ=;
 b=HJiLMiLbcvLpAJ4VzjJ3q443fEGtgZOkg0MVWZXPltXv6CLn3TJ2kSQtrrpOia30QJ
 l9X/5kROwPcuH91vACz0yzcz+FAfePhsowtDOkZXIo78ErLkzRmfzt6+Pnbig+FxiEM4
 TjBJu9+RGoG+I6VT/HkndpIZY0On0uPSonHd3+aWjKbCniFZT8NyP+lu5p4aNNbP56Ck
 4rDlq8euWOmnC3mTTyykYRfot5ZeRJzh+ZP9c7kigU8UdVuIb6k8Nqj3L9Q6TSk2+Qpg
 iYTh8p3ZeR2YjKE8+GmO7QXB9Gph4AcRF9RwiAFUxas0lgZetyP84t7jwfzhSO1499bc
 cMgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=HJiLMiLb
Subject: Re: [Buildroot] [PATCH 2/2] package/go: explicitly set GOMODCACHE
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Mon, Jan 16, 2023 at 12:55 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Hi Peter,
>  > This reminds me of when GO111MODULE was leaking from the host environment
>  > as well. I wonder if there's any merit to wiping the host environment
>  > variables if br2 reproducible is enabled?
>
> I definately think it is, ideally we want Buildroot to work the same way
> on all hosts - But why only for reproducible builds?
>
> Notice that we do override GO111MODULE= in HOST_GO_COMMON_ENV.

Apologies my wording was a bit ambiguous - we should always drop any
Go related environment variables (you can get a full list with "go
env") from the host environment.

I was additionally saying it might make sense to drop the entire host
environment for all of buildroot, but maybe only if REPRODUCIBLE is
enabled.

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
