Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517C0C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED560404F9;
	Wed, 27 Jul 2022 11:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED560404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blPOIZVL9_JE; Wed, 27 Jul 2022 11:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E4D5404FC;
	Wed, 27 Jul 2022 11:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4D5404FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7261BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32AF3403CC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32AF3403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Arek6NeC8cOs for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBA940457
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BBA940457
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b26so23704810wrc.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hCGqWkje01h2oBN6Gl28Qq2tf8XKuoz65I/sjijAIQU=;
 b=hgaxdwkuLJbTAPDJaJEcIJ5Cbr4xppenPqVHdixi4/zdMrmiFSu/RxVFu+TP3z+UfW
 /xUMuaYU4Ob0mQkQ6ARSNCj/xZv9EaqEY8WIPmbzGtud1fbDJZ9AwALP0yaWi2rddwHK
 paWkAmVTZKTZ/fp6OqECtoiLI1vP9EA2AHYmR2FvIJkGK9kEsuA0RfVlqRslZp5moYAo
 Soca7KSTGdQAFgWSm1Ov2BNLZfAamHbnrWXfJKwD/86rAG8yZcVHd4w9mwcSV/1N4X93
 wFMr4y3HJ0BUfxFGVMoiWTIxwuM6fDHudEP+Nln/UBJrSxKJQOz4+6C+7FeH8CqI2bFS
 mj6w==
X-Gm-Message-State: AJIora+oTdv2J2HRRU3C58N0HiSJTXeBv8YSj5WJpJWqMAqXGMVrKPtM
 3CdFL9OHdgNvL4FUNcyu45j33A==
X-Google-Smtp-Source: AGRyM1vM4MsxXfNoSm24bAqZh7TDNPrNQz5sroU2hMMKvL+40Tj962mP2tm8GhQ6dEI5OhH202h2PA==
X-Received: by 2002:a5d:5a17:0:b0:21e:80ba:f5ef with SMTP id
 bq23-20020a5d5a17000000b0021e80baf5efmr10966151wrb.643.1658920107641; 
 Wed, 27 Jul 2022 04:08:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adff5cc000000b0021baf5e590dsm773175wrp.71.2022.07.27.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:27 -0700 (PDT)
Message-ID: <d5a7d96d-8206-f965-c146-0ca9ccd40939@mind.be>
Date: Wed, 27 Jul 2022 10:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lang Daniel <d.lang@abatec.at>
References: <VI1P190MB0493383AF3C4D4BA08C5CDC09FCE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20220726233127.1ceaeee9@windsurf>
 <VI1P190MB04938F3268FC60B09BB31E5C9F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20220727091331.00d0280f@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220727091331.00d0280f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hCGqWkje01h2oBN6Gl28Qq2tf8XKuoz65I/sjijAIQU=;
 b=SmVPTJM8WPjPWx3IDxR5/lOgPZYE0bMjyQujlbt0kT4BSqwGAzegsI/Ml9xEgs/cdu
 g2CaLfUJzuucHtrouPtXPWXCmkpz6Vo+nA6jIIWIEblbNSHQ+ONf9lFhpjnMxMP3nOMx
 wDkygkrWsMQXQY5w1krn7n93Z4JAwAOHGXxrSdfChS9+nLRwnpvc9zYXYpkc5gCN3aPt
 +MLg6wlGjI3mbHEvPZnyT+n570NqfwOsR/tiEIsiDDq8yHFeLwM2H9qyPfPR+HwouMtu
 w+wAY2PuTf/0SB1DIt3sf61JU521SJBLRBhwtZWKZgniG/UICmRcVXyC7aBq1mxVDwxm
 wRYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SmVPTJM8
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: handle white spaces in
 sysroot path
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2022 09:13, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
> 
> On Wed, 27 Jul 2022 06:36:14 +0000
> Lang Daniel <d.lang@abatec.at> wrote:
> 
>> I came across this problem while using paho-mqtt-c with a staging path
>> that doesn't contain spaces, but the package creates
>> "$(STAGING_DIR)/usr/share/doc/Eclipse Paho C/" - which contains
>> spaces. When changing/updating the external toolchain that we use,
>> the subsequent build failed:
> 
> Aaah! Thanks for the extra information, makes sense. I think it would
> be good to fix this maho-mqtt-c package to not use paths with spaces,
> though.

  I don't think we need to do that. Paths with spaces happen. It shouldn't be a 
problem to have them in target or staging.

  Regards,
  Arnout

> 
> Thanks again!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
