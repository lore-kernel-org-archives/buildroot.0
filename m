Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB84C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F99C60D51;
	Wed,  9 Aug 2023 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F99C60D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBjRIBi_Dnsn; Wed,  9 Aug 2023 20:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68DFA60D79;
	Wed,  9 Aug 2023 20:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68DFA60D79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 476171BF969
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2057A60BA8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2057A60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phsT7H0xuijF for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:31:17 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD30A60D51
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD30A60D51
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so35109366b.2
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 13:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691613075; x=1692217875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=liprsCcxPDqk1JButYg9vMBY2RmgXgAE+s+6MQXPTGw=;
 b=CuC4icYrKlO8LR/3Tl3eOrPKhxVRVXhYY7JY2NDsQOh8rTDhlKCWa24wiO48hxUZk8
 20Db/4iM3vVVdDhxqxifelRwvjboKdl8Rvh7XQGpS8LgHluAkcLKiQEIGF4O0c5kb6Q/
 +QPaDMrWVi76APBoqqiLzPDseUVTmpOpWO7ztY7FU2oT3hUZWCFiE52eVLy8k0AwA1hM
 j5xuryN3ieo1yl6UOE0QLfF4IAqLxrqc93ehVMHvxQ7l/rmw5a+RCWyx3UFYmlFKifo+
 M+zoYcSJDZRkUVJK1NCLMNpiqts6Hmnb/NzMtuZpEMCsywBus50TfCxaRlI12efLQv9Y
 hvpw==
X-Gm-Message-State: AOJu0YxbT67dVDogcjDTQtGE5eEgXQdM21T3GRUcXLM0cdbOX4JBhbu/
 lKqEApkrFM/Nyxd7nQbIEbI4rA==
X-Google-Smtp-Source: AGHT+IHu9HAyrW7pH1V1g7kUCz3rEgl1xuTfBA6aD4UZSBEP6d15tqQeeSeArba3EYIZ6DnheLeeHg==
X-Received: by 2002:a17:907:7807:b0:99b:65fa:fc2b with SMTP id
 la7-20020a170907780700b0099b65fafc2bmr130488ejc.35.1691613074744; 
 Wed, 09 Aug 2023 13:31:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:dd61:254f:5a09:dc06?
 (ptr-9fplejq6xo58kteed52.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:dd61:254f:5a09:dc06])
 by smtp.gmail.com with ESMTPSA id
 bv26-20020a170906b1da00b009926928d486sm8418600ejb.35.2023.08.09.13.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 13:31:14 -0700 (PDT)
Message-ID: <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
Date: Wed, 9 Aug 2023 22:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
In-Reply-To: <20230801161956.00715a06@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691613075; x=1692217875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=liprsCcxPDqk1JButYg9vMBY2RmgXgAE+s+6MQXPTGw=;
 b=M5oQ5Gg5Iia51RrgkhsNtvOlOaYauLLtd2G2SFagut22xEjJ4Zvb+7UbDJA2JXjvBq
 CP+8iMFBq1k+UGzMpRcUmogOQ+G475WLYW4ZfNGp8O09SpsGdVmzmvsHcj3zLwUE4SxJ
 mILFz0qwZa3uHMOBpnEIcXwcdn7bTwJeSAEF+7BVFZbVn1U3/VQxRNXRmbpjP6SKZ6el
 +gBywiIontyOx/9iBzRiGROWijNPdOM4NtL4pfG+7EElklA2wgHmVvzkrViC9mNt1ctT
 TjsSgwOFZ9ZpViI/GZPcfHevl92tWzl56TsE7kRNJxwq2JKuhKYcGHysWuqk5m/WhSNg
 Y8UQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M5oQ5Gg5
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/08/2023 16:19, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
> 
> On Tue, 1 Aug 2023 16:13:03 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> 
>>> Wow, thanks for working on this! Is the storing of 200k files workable,
>>> or do we need to consider some other option like a local sqlite
>>> database or something?
>>
>>  From testing on my system I can say that it seems to be workable.
>> Generating pkg-stats for all packages takes roughly the same time
>>
>> old: ./support/scripts/pkg-stats --html old.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   252,39s user 45,10s system 100% cpu 4:54,85 total
>> new: ./support/scripts/pkg-stats --html new.html --nvd-path dl/buildroot-nvd/ --disable url,upstream,cpe   250,04s user 46,24s system 100% cpu 4:53,72 total
> 
> Nice!
> 
> I see you have --disable cpe. Is the CPE database unchanged on the NVD
> side?

  Using the CPE database is actually useless. I think we should drop it.

  It actually doesn't matter at all if a CPE entry (including the version) is 
found in the CPE database. If there's a CVE for it, then the entry will exist. 
But usually, the CVE will have a version range. In that case, we anyway match 
the version range without caring at all if the specific version exists in the 
CPE database or not.

  So, I think we should just construct a CPE string and match it against the 
CVEs, without consulting the CPE database at all.

  It _does_ make sense to do a lookup in the CPE database for the CPE string, 
but with * as the version part. This allows us to validate if the 
vendor/project/etc. are set correctly. But that's something we can do in 
individual API calls for each package, like we do for release-monitoring.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
