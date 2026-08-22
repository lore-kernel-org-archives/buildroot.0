Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F2C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 606CE408AC;
	Sat, 22 Aug 2026 12:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsvaXx9qv7k4; Sat, 22 Aug 2026 12:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401854;
	bh=FMqRUXXkJdmUD8qdudSWWCDSttNTI+oufLrBsLq+VaE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=RjPzYZa9O8XvDgdJNYLp1kYYWt1QJ8w8VbAEk2dZzRjD/7BY1QFwU+YrGvIkMgF4W
	 SDfrI/A7Bl8RcdqgiGRBRZ5C3tQCqPAAiHmJRPzmOIXEJLH+Q3e/KhOc+vMczKqbRb
	 +F4OW9gXvOiBaV/HP7W2xHA5G21QNgfOQTjyVdMlGi7AUQCbRhd9DBEQsmPgIiWZdi
	 Xd29RPRLBPWN27FC2a6oFLBy3GBe921NXHcF4+dUfNbYfYQQoc0Pn43Mc82r7I7YTD
	 ZDcnjlb5npmOVrhUDsG4T6OuGuy2bTwEE6T6YiIjhqWOEJ2tn+Gb/5g0AhBAKLPTPg
	 ljWFnW158BebA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF1CC4081E;
	Sat, 22 Aug 2026 12:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 361642B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27CD14081E
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqqNpFvBwLyV for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA178407FC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c1600d040e4so292854266b.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401849; x=1788006649;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IDfmmST0QK9ZngLTW6toHQhvZP5UcpKjvzW6oPHLzY8=;
 b=WTrx3o0QbKsGtxUYOslisSrEMSD4BHZYxp17tSBdfZWXUeLED/STAo6YmmgRNn/grO
 sYfgypTLJ7Lbrr/MUfCmgCZ9iidjc9gDpRZhurgsAKsthaXsAxZL8jYsC1N3RyEtFRk6
 ET3+R1C5EG7CicXsIBnMEkYHx1bAP20IlpkYgKqAnJRpJOVZh4y79QkYHsWavjbdqa+u
 Crtrng5g4XHESG0eBlfd/wuHVMAF7onTytMFG2h+QBSXGVXt5sCiI33xZclUerBm4e7h
 xU/DYKhjc94uDDGySF2qVob/eBfyrAmlbPslSmzG+Jb7Ud3SamWMgw1m9S8nZ2bsTSay
 zLAA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDPBPt7gp/9gTkJQcYSqoCT8Z/G2TsApIQuyUj4SlBHbkyuKp53wDmx5slGCgtv2lczyxgfrFKlig=@buildroot.org
X-Gm-Message-State: AFuF++nb1BeC+faunjOlePlJVQ571CEKYduzftz6IfRvlkJT6echWP8j
 gxSAgapefWMhRpKI5qVFQE7SyyXJR8DfvnCMq/LG7sL1heF7rGGIXafGwcsVchlMdtw8kldM7fL
 eAE06
X-Gm-Gg: AR+sD12UeFAOBrMxnEs19xRTk/c1v1tjmLDgWZEbeRsX9DOKC66r9ZfI2rpa8iR3D0c
 4j/Pt2+jz+x23Nh0G9Hy016L8IwcERh4N4p+gEWojrQDv0JPb/dRkOI34x+vUu58gzXVV1TijAX
 rV4RIECxY2cxW8f+lmNGun0WyyurGGqTkNEKYmy85si+G3hhdOty4mkuzNYmlgnNluEGNAMneye
 ybs2P+w60cY/f7G0lS2g1/gFfvVbwjLSFTJKteLdMvwN+8LEliXFdtv7E9Pms73pla1Kp4DXaPB
 9ZlAmnhkabo1A/OuQ06SvYr2Wbah0VEA913YQI/CGy8R4gh/vIBGQ6D2s+hFzBtuHr2quS3FTo6
 9Y/qK/p+KFkf09bq9U8qTLZ3ChgyUBY1OZYEvAvwWmtay8ujFhKS8YRVVAs4g2gvyMwZPoE8ITj
 SdMPPFyz2U6fuIv5m2hmplC02t+VqNafpRo+pxF74lJEtBqVqPKUvH4dnonesFHLS/LqwPhHoJU
 DSb1J9LF45tLPJosCRbQzl8g5tQscat++CP0NPb2QcEgYhK
X-Received: by 2002:a17:907:c719:b0:c15:a7b9:2ae1 with SMTP id
 a640c23a62f3a-c246dc5ba9emr1313494066b.6.1787401849395; 
 Sat, 22 Aug 2026 05:30:49 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968665e0sm278355866b.53.2026.08.22.05.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:30:49 -0700 (PDT)
Message-ID: <e0cfd280-a8ec-4da8-b939-0416388e4248@mind.be>
Date: Sat, 22 Aug 2026 14:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260814055052.11891-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260814055052.11891-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/08/26 07:50, Bernd Kuhls wrote:
> https://download.samba.org/pub/rsync/NEWS#3.5.0
>
> Fixes CVE-2026-53802, CVE-2026-53803, CVE-2026-53785, CVE-2026-53784,
> CVE-2026-53793, CVE-2026-53795, CVE-2026-53796, CVE-2026-53797,
> CVE-2026-53799, CVE-2026-53800, CVE-2026-53801, CVE-2026-53783,
> CVE-2026-53786, CVE-2026-53798, CVE-2026-53788, CVE-2026-53789,
> CVE-2026-53791, CVE-2026-53790, CVE-2026-53792, CVE-2026-53794,
> CVE-2026-70461, CVE-2026-70458, CVE-2026-70456, CVE-2026-70457,
> CVE-2026-70459, CVE-2026-70464, CVE-2026-70455, CVE-2026-70453,
> CVE-2026-70452, CVE-2026-70463, CVE-2026-70460, CVE-2026-70462 &
> CVE-2026-70454.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
