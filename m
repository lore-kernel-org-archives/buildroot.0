Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5539FC76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 13:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28BD41D5F;
	Tue, 11 Apr 2023 13:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28BD41D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLjC8XQ0qV5u; Tue, 11 Apr 2023 13:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC85140917;
	Tue, 11 Apr 2023 13:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC85140917
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9AF1C3BC3
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E93AE82139
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93AE82139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCdzyCgN5Wdu for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 13:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDED381F8F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDED381F8F
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 13:01:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o18so7481943wro.12
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 06:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681218104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TKGZyOWC822m6u99bF9b4oeUNsNSlVuDkxv12MeJ/XM=;
 b=ajK50Chc708iu7GOAQcFEev92au38A2ICDCDuoN4fEgCF05izebJumgPjwN8zh7L+1
 BHb25rUj2baXUEdne6cTYk/zXtadsBKmQcam7WIcoMZ2OuhsAiD5zsx6F7ojh3cow1km
 dc6Ow+aY+3UXYbPCVaroG+R8jLC0KPA70zdtJgzErpn05V0Gl+fDX+ArRaR+pbBHqs8v
 2ldMBAq2bQanY6GNIyQOSmqRk7ru/H4Fwy1vYRGxQPv/xj7f67c5vExyeLCEyNqtn50H
 EYWRFktAnyjAobHGtcdiwQ0iUwL3W6va+ne9QBGPc2HZ7WWPAeqfwdWvT0Ith7ehV8K7
 zzhg==
X-Gm-Message-State: AAQBX9c3nmg+p2/veq5uVwTbrajA6O7oOnWiNpJFW8DuzotzHe6LiDJA
 J2MhrN8Hgj5B7c8jIPAV1YjzdA==
X-Google-Smtp-Source: AKy350aaGYpLIWPG3B0TPHWNyNZQ8xHM6Q6uq+4L0dBcNZSZLhw8OW1/gZop+nPoilt1VOGUVfXDWQ==
X-Received: by 2002:adf:eac8:0:b0:2f2:6312:a814 with SMTP id
 o8-20020adfeac8000000b002f26312a814mr3690486wrn.56.1681218103697; 
 Tue, 11 Apr 2023 06:01:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c92e125sm14520644wrw.46.2023.04.11.06.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 06:01:43 -0700 (PDT)
Message-ID: <f45690e2-1ed1-5019-3bc9-da0704785a3c@mind.be>
Date: Tue, 11 Apr 2023 15:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
 <877cuisixk.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <877cuisixk.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681218104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TKGZyOWC822m6u99bF9b4oeUNsNSlVuDkxv12MeJ/XM=;
 b=Y52wkAmJhpa27x6q7ggLRmHKsWrS/V6kgo3p7CjGREHh8i3ZHtiAIsBFyKZ24k6Hrx
 tUbKTPCJezUNWdmB5446Fi4nUptjBkkf/ai2lk7I3EaysTZt1L7tYG8YaDt9VxUBnVOq
 YKkImXj//TiG0PDhJn4O3jpYVEeu6Bx+VLQePTM/vUMTXfSW+8/+gaUoL9tgvHB1jA6k
 g2QhaCZcu7X6qJ73jfwo+hcZXxA6BPJ+aDHRfmCGAI/WAt2X4J8aaChaiJsErUrggexN
 PaCPwXQd+aA+GnRB8GUgZs58JhsKyToJmA8JglHxvks/7dswxW3WPgyIDQR4IE0i8ieA
 UC7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y52wkAmJ
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/04/2023 14:27, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>   > On 07/04/2023 16:19, Oleg Lyovin wrote:
>   >> GNU make package from the host machine may be too old,
>   >> so use the one built by buildroot.
>   >> Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
> 
>   >  Applied both to master, after reworking the commit messages to
>   >  reflect that this was introduced in Linux 6.2.
> 
> Thanks. Maybe time has come to also require make >= 3.82 globally in
> Buildroot?  It was released almost 10 years ago by now:
> 
> https://lists.gnu.org/archive/html/info-gnu/2010-07/msg00023.html

  The only reason to do that is to avoid needing to make such changes in the 
future for packages that require make >= 3.82, right? That would only help for 
Linux - u-boot and glibc require make >= 4.0. For ti-k3-r5-loader the commit 
message doesn't specify what the minimum version is, but I can imagine it's also 
4.0. And I expect in the future the minimum is going to be more likely to be 4.0 
than 3.82.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
