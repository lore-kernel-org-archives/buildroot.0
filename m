Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEACCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E973A60645;
	Wed,  3 Apr 2024 19:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHfdu2EzcDoK; Wed,  3 Apr 2024 19:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1152660677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1152660677;
	Wed,  3 Apr 2024 19:42:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8EE1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 181F4402E6
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcC4sNT7o3_g for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BC7B4026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC7B4026A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BC7B4026A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:42:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34372e3db28so86841f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712173372; x=1712778172;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zs0SFvG0MTrrP2pbVK/PTITdK8t4YfpUuW7d0U5FBUA=;
 b=emEHMCEAfDNLMUnGj86lFp8MUpnCzqGKDjy3QDv0alQ6LsXebv+0RBtIJc4h/kJUeJ
 myNaGK0t7FV+sYBCZ2/jFRIPWuyxKsRyLayH3oSXXTmc+lh7YU9JEuXaX3Y0r+mH0MMR
 t+zFiBhkJOWEUPkpZhI1mnCyuSO/sBrzWno7LOMWGrDOajgJSbbTRwiadVkdFg3/fqAa
 a4S2segpssfPMpXJedVv/iV5ZPtSXdr+VwoMhrVGPjji/7A15dLkdBMYwcFLTjJj+GMS
 jYz91sHR054yVJbWT1ypuBHKCalayMP9HBpHFtZTwyXAEwvohBHMCa61n/SM/3iFIrJ7
 tMPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU63kBoM/0jm4ZLxpSdiGz+UnConSLxitL0e3WoriQLljheLN8WPzTNaICjmJ9fXtieFoTlIk4/2TE2ZWhLd0ZDTaFxmzRUA==
X-Gm-Message-State: AOJu0YyuIxWHehqjeHPeu9EU86FEw58cGgCGttAMALM5dtdFd+LflFv/
 +B3WPIJO2C9mp11jytHAuNmAM+87Uo6Ttp1hoX34MEiE7GNUroPzWHgfe5ekG4tUoPWOodd+sTg
 Y
X-Google-Smtp-Source: AGHT+IFyX4ps0ktbchUCuws/iJK8wZzKyjSUdMZ1pyIbpL4/6EN6GDdSCEFok9BKk2xmnlBSvwa/IA==
X-Received: by 2002:adf:e404:0:b0:341:bff9:2e4f with SMTP id
 g4-20020adfe404000000b00341bff92e4fmr304924wrm.44.1712173371624; 
 Wed, 03 Apr 2024 12:42:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b0033e41e1ad93sm18014804wry.57.2024.04.03.12.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 12:42:51 -0700 (PDT)
Message-ID: <dd398d8e-7262-4a4d-aa47-25ec1c3fd092@mind.be>
Date: Wed, 3 Apr 2024 21:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Mayer <bleemayer@gmail.com>, buildroot@buildroot.org
References: <CAB3eKoDnuOTufkdsMMA2CWnq4=Z=CbZKo+qY-ULPw_houqU_CQ@mail.gmail.com>
 <429BA1D7-0EF2-4E96-99B6-1C1BE9F68BB5@gmail.com>
Content-Language: en-GB
In-Reply-To: <429BA1D7-0EF2-4E96-99B6-1C1BE9F68BB5@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712173372; x=1712778172; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zs0SFvG0MTrrP2pbVK/PTITdK8t4YfpUuW7d0U5FBUA=;
 b=BZVoaqDlokhARl2Tq4iC47a8cSC0XDFeCOxxZkK08xS92RaJ5wCdEjGckg1/tNzliP
 PpeqnejCRNo2WatN+tO5o0ofZf1iS2mZqz/5d8rxyZjji191wlra7ZK9MgPRwp8zSySp
 fzARQ43PFVdrL60sU204T1xRYbrvng2Qwumsax7FQAt6vQnuO4DkSglEb+NFZOXKgglo
 RO9jWce3RZONqwj5Ore7KPs3obH5XVh7UJQ1vPR0RZJh8KpS5RbbyO7k+cV+0LJEBB0b
 JANmv33Y3tg8winqm3OTMK/60y62iDfJSpA7w7aYQzhi/QPGqfF9T1JT7LyLGeqO42PR
 Qx2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BZVoaqDl
Subject: Re: [Buildroot] [PATCH v2] package/sbase: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2024 00:54, Brian Mayer wrote:
> My email from brian@myr.sh is being graylisted. So I'm not being able to contribute. Can someone help me debug this? There is no detailed response from your server.

  Are you subscribed to the mailing list with that address?

  Regards,
  Arnout

> 
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
