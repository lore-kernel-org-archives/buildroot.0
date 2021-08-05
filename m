Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57110C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:29:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E644C60F22
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E644C60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F6D83A82;
	Thu,  5 Aug 2021 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdXByFwAfDk1; Thu,  5 Aug 2021 20:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0007F83868;
	Thu,  5 Aug 2021 20:29:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83EA31BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 730C740288
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybRif3jYv0Yt for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83F0040230
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:29:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id hs10so11709042ejc.0
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJ+zwrR61L7zUQZS6BMpb+Cv0Bs5HKghFkugsNOVCEU=;
 b=A2XtErH5jKZNr+kitIS7qfcD5mDegM3cc1otw1secyNxee3p2n4g/qZYWFsIgzW1nx
 e4nOz58lRrH8Lrz791ixAWGsSy9b5x5dPFiAiVv78VKR6ohzCYmb3R4yjms5uB8P1s1l
 xSmqgnIABT77nhCxvTarmCBqH2TyT3Zgkav3EHcmVpGHGU0NmwcMIJYGFaxCUlarz+z1
 3uI5Uu+cVErwEf/7598asvtXUxhniSQwIC4JbYNtCA7sziNI5CZ8HreIOgyMtsrA7+bs
 l3TkNLcP+FPwojPLlX0Vr6+c9HsjbXOKMG8jq+1eXx/fcjAlcpnBlLphJZRPeARyni8i
 h37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lJ+zwrR61L7zUQZS6BMpb+Cv0Bs5HKghFkugsNOVCEU=;
 b=KCKHIYYXjr2k+H8c/tJeS6Yi8Uo5jayVaLhgDMxeGkMyJi4W9blumXGjZndc8+723h
 tDnT2tiIbcqiC/1uohJTFXRWO4+ezPUpFbgbDAtHUW/BFvqtxfoSI7bQTIb+Quu62goM
 5M6BWul48azxhBQe/AkWsYnlY7mrRnSlFjrT2nvghrMsvon0LQj+PfO0xWMcpT1lYYZA
 iaxZv4JX85bxg+8EqXVU5Cm0JHIRDYcyhBcFCgeHUH59kLlSla6aJlBBWs3ed92Ni6Dq
 YlF23A4eceHNBPdPiLEBm/KOTWRhwZNhAjiy7bQERGqesr4qQlb2a+K3J9MnQCx9JAwg
 kxTw==
X-Gm-Message-State: AOAM531Gt+s9Jw6QgnYScz49alD7uxVKfVX5aoNrzD2IxNlJLlDTPrpH
 InvZ8cqD63ZXzS8TpQcQapGf5A==
X-Google-Smtp-Source: ABdhPJzLIC4AT7MZ/eERCN03twpvs1pcON2AkjxXd/RICv4GGD1pezvSzE7SMV2bWDxoMOhrrFhGJA==
X-Received: by 2002:a17:906:a890:: with SMTP id
 ha16mr6820580ejb.73.1628195389725; 
 Thu, 05 Aug 2021 13:29:49 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id p18sm2792239edu.8.2021.08.05.13.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:29:49 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: Robert Hancock <robert.hancock@calian.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
 <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be>
Organization: Essensium/Mind
Message-ID: <ea3f35ea-249e-d18a-b650-05c94573e7aa@mind.be>
Date: Thu, 5 Aug 2021 22:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] Serious time jump bug found in gpsd 3.20+
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
Cc: "bernd.kuhls@t-online.de" <bernd.kuhls@t-online.de>,
 Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 22:26, Arnout Vandecappelle wrote:
> 
> 
> On 05/08/2021 22:09, Robert Hancock via buildroot wrote:
>> A heads up to the Buildroot community about a significant bug that has been
>> found in versions 3.20 and newer of the gpsd package, and which is fixed in
>> version 3.23 (not yet released, supposed to be shortly):
>>
>> https://gitlab.com/gpsd/gpsd/-/issues/144
>>
>> This will cause the calculated GPS time (and NTP time, if synchronizing to it)
>> to jump from 2021 back to 2002 when GPS week 2180 arrives on October 24, 2021,
>> with potentially disastrous results for applications depending on accurate time
>> keeping.
>>
>> A patch has now been added to the gpsd repository to fix it (note that the
>> commit message incorrectly refers to 2020 rather than 2021 as pointed out by a
>> commenter): 
>> https://gitlab.com/gpsd/gpsd/-/commit/7f30d88d04dc62b8bd6265ad1d09d72d220f97f6
>>
>> I am not sure if the best solution for Buildroot is to just update the package
>> when released, or apply the specific patch to fix the issue? Currently
>> Buildroot master is on 3.21 and the 2021.02.x LTS branch is on 3.20, both of
>> which are affected.
> 
>  For master, I think we can still afford to update to 3.23.
> 
>  For 2021.05.x and 2021.02.x, we'll need to backport the patch. Unless if Peter
> thinks that in this case (since upstream's policy is "always update to latest")
> it's OK to just bump it there as well?

 Forget about bumping the stable branches - the bump to 3.21 deprecates some
options, and we can't do that on the stable branches.


 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
