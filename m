Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC9BC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5266129E;
	Thu,  9 May 2024 20:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXcbkc-3Y-HG; Thu,  9 May 2024 20:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C1E612D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C1E612D1;
	Thu,  9 May 2024 20:54:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB55A1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C479A41F3A
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnmlOQ6x77Aj for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A7C141F37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7C141F37
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A7C141F37
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:54:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5591so10575415e9.1
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715288077; x=1715892877;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oliYx0uVMhaonaKQw3wqUt+wysE515Yh8veQW+gKnpc=;
 b=nn7QO+KEHZSC8eUfra5/ACwUE2CcKI5NoyortF01/9+PRGMMdDQmajEJxUIlzH5f2z
 mchbmZOpBzwUvKxd64SYtM+g4hgi6jS8Pv88LzNxJ1Q1Z6Wmq8gDwHrGq0icnUudkFDx
 ONJuT6Jpbqf6jVCa+kl5oS+/U5dxxYOmPck9q1+5XwNX+FTgb2V+LMZiu18rXcULMVek
 fsczV26TQggT1xMymEjS2r+1v7I4D4gDm3AsFBBuBif+CKS1OSQW9l48szKyT0xZE8S2
 G4C0RrRQnzuPsXMrf0Ao+Ek6K6zhvOmT7Yfo0r25oGPZ4t8KBvGbVHAoicO2kfn3v8LI
 KLQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOOtBPoIFbDz+8OckQG2RROZbp1+YO//9Vst6VzygqluEyVRZtqpmJnNisPiUQzp6Gh+m74FNxHMHU/SIXqyLRv3FlwUvTpQ==
X-Gm-Message-State: AOJu0YwBIcSNUxCLyJUenbKmuU+eeQhCnzIGGd6zgKyyBAJYqkyhe6xc
 +BfB1uwq2w4Z7GhayKBa++AFR7Vty8MsdiQPBsgz9OpDsAYCJlGeNyBKUKbooHA=
X-Google-Smtp-Source: AGHT+IEpg8nu/xvX9NKzXY20bTmzkS8mla6hwJftOBDwnuKBedhO4IcjFypy/4OG4WtKvrWnlF1Qxg==
X-Received: by 2002:a05:600c:3548:b0:419:f505:8a7e with SMTP id
 5b1f17b1804b1-41fea931fbamr5701935e9.3.1715288077479; 
 Thu, 09 May 2024 13:54:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee94dasm36615835e9.32.2024.05.09.13.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 13:54:36 -0700 (PDT)
Message-ID: <9e8a2daf-327b-4d22-88a6-fda7b38d4d78@mind.be>
Date: Thu, 9 May 2024 22:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
 <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
 <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
 <20240509184648.5a3719f4@windsurf>
Content-Language: en-GB
In-Reply-To: <20240509184648.5a3719f4@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715288077; x=1715892877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oliYx0uVMhaonaKQw3wqUt+wysE515Yh8veQW+gKnpc=;
 b=aWU/Hj6yVUmkcPiHy2JyMaE9J+J1doN3omH1bL10nK1a6Rp/+WAa5SVp97twXCkPnP
 wjOu61mOhoGwYqEvRdldA0FnkZRbIJb5yZWp1IuY+kYozyeTB3Wd8diXO3WRuicKiVQn
 CMQAjgGN/JZ70bIGfzmASUOWvQ4xXN2EBecPqkY5DD9SVKLRoPym/OQMdKvSWh5zFQmV
 7/hDesL21DkoCbuukDhGx8o472x5zVp0M/nQ8KkJxiKiLlypMD86M+qJReGd7V6R6t8d
 MzrvO00L3BdkA9+C0C6ew0E48ou6wANAA0r/ZToRaMzSkP5vm27gvbLakyBp97Q9BsDa
 yFoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aWU/Hj6y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Vincent Fazio <vfazio@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2024 18:46, Thomas Petazzoni wrote:
> Hello,
> 
> Would be good to get some input from Python experts here. James? Vincent?
> 
> On Sun, 7 Apr 2024 21:58:45 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>>>    If the package _does_ build without setuptools_scm, it means that the
>>> setup.cfg is wrong. So an upstream patch to fix that would be better..
>>
>>  From my understanding, upstream uses setuptools_scm to retrieve version since
>> https://github.com/rawpython/remi/pull/404/commits/f27630721d2bbcfbce515dc2e6be3167f6a06a34
>>
>> So setuptools_scm is not "strictly" needed.
>>
>> I used --skip-dependency-check because it is already done in 6 other
>> packages since commit 8937db8dd595e0988751e5dbb568e870b07b39cc
> 
> But isn't it super crappy to skip the dependency checks? I mean the #1
> issue that Buildroot tries to deal with are dependencies of packages.
> So if we ask them to then skip their dependency checks, how will we
> make sure that all necessary dependencies are installed?
> 
> I understand that setuptools_scm may not be strictly needed, but by
> passing --skip-dependency-check, don't we also skip checking other
> important/mandatory dependencies?

  Theoretically I agree. However, IIUC, the dependencies that are checked are 
usually _runtime_ dependencies anyway, so we don't have it as an actual 
dependency. So I think the dependency checks are probably fairly useless for us.

  Ideally, there would be a way to do a dependency check on our runtime 
dependencies, but that can't possibly be done by anything upstream.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
