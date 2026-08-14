Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2374C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9283D80B19;
	Fri, 14 Aug 2026 14:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCyzkSPkOANq; Fri, 14 Aug 2026 14:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4DE80C43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717517;
	bh=0SDar3CAXNsoc03CnC4wI2CuJzQYfU9JlY7V9B7lo/A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c9Jt2/Yox0IwzSqT/3dHmEYSmRqMnUAwEbT9KgzeicyYn+p576BvXAmuxF50ACVWW
	 UAd5h3uJhFEJwtv/yR/86U/ZINanOppCwJT361W0mQe5Eo1qYtftBsqaK7oLdgSTIq
	 VTWzWrNhwut5ogURWK9AbxZjVV+dU2yqcUAl/f60pRfqn0pi+WxDHNg9DWVYEP+T+z
	 tVgl4dgf0vfnZJrk/X9w1WYyM6ZblcsZxf0yQlK2eKIhmrWatdRrsiwPXb/3UVvabj
	 ocdqbLNQJghQzlKFwsS3PDXLOoUYaOkrmqZMRpAPUuSB2VYJXP0RgrvhDJbCapjYlv
	 f0swoCcrWBmUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4DE80C43;
	Fri, 14 Aug 2026 14:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 136003A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0540780C43
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIj-m8Pa9ckW for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23F4D80B19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F4D80B19
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23F4D80B19
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso7994045e9.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717514; x=1787322314;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+kyZyW11BRLaXspivBsDToxdR9JDQBjwB3Ow8r/VNrk=;
 b=V2siuLBQh/B9EY/Z/vWpRM6IVyIpkpu0qbfyUkMIDBlmRNTuDlI76ZvC1zRuPGKvkK
 VAhA9ekbfIVkQtLLlHxMMyXYJzuTMwsI8PsQ4BXHLWHGhti5cRMIFNIo9/NYKnC8DtDx
 V6TfWpvC3RLAuW5SQo8aCfyU9Lp5FPpVBbOmDOMzOCdyqfDzDuEzWsr1jC9jNWvecL5n
 v1Piw+gwXiuA8Yo+wozBQBNfl3hULf5mInC8OiqSWmaind6i99w8Ykf86GQ9TBeyFq3U
 ikxDV0N+4vqacXmrR407VBdNgVhMyNYtiBvDwDa+UZ3YLxcJap+/BhXtmgun77zOmDho
 bP7A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp3Ln8LewbITo/xTDKAE9mbS8ejXskr3okppyPH6TxL3hm58Kg6LSIwJIASZsBf8t/UmXNOPeN35OM=@buildroot.org
X-Gm-Message-State: AOJu0YwyzVc0tXV8sny001KMdDP6P2x+TpvIItvjEyBlu1o8YxcopCZX
 ZZK207kkMlqftJgIOiPJvewef/8juSkRlSvBMDR8843oahWDedkQVcCJjPfKbqMyY2c=
X-Gm-Gg: AR+sD13CxQdbkijvgshndqc8V1JrfycgsXlMpXxmN20D7Xuq4DXDgqVFEIo7veIDqdt
 Z7IyfODoq0C0Ess6q7gqCEKYgolMllR9ohkZV1R/REvUKtRCeRw5tAPwe+nkbxbST9q2ZnvrRbC
 OsxGz0JxOKRHBNA2/Fk3MriPZdhxY8yv0qCc9g2FIRtRC7htSdw0QUZgd4KwyMKWRY9vz4Az+mC
 SvEemBN/RABtI9TM7Oc6HRjz1YOP6kOokG8XmrWcAmkIJdjvFdVqdxojQldvxu0Q1sdu0PZAH14
 JE/wfBkvty+FZp4qa9HomHr2v+lNvLYAqoRJ3zUps6puU1XbRtmjOdvO3GML871a6dtPALAYEww
 WMfVIkNAxERH2xjBnggCDftJo02VRfFnLso7KpL8InlWPT4pM+6A8ZMb0kmMOlBWDtUgk32dFzB
 c6SHDNL73eItl6xbomD3HN4xv0SHBsX6yKiksOQ3MvSHbUO1eFsObYul6/njSt0cH4GY9cAuTHb
 mUwGQM24RWEo66fOkSgRxha0SLZQljXMKZ2F2QRZ6jzjScG
X-Received: by 2002:a05:600c:5691:b0:499:4e47:eaf2 with SMTP id
 5b1f17b1804b1-4998794ce4bmr61389625e9.6.1786717514137; 
 Fri, 14 Aug 2026 07:25:14 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988adfbd5sm59107835e9.1.2026.08.14.07.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:25:12 -0700 (PDT)
Message-ID: <cd16d3b1-8a1a-49ff-a1ee-1466721df2f6@mind.be>
Date: Fri, 14 Aug 2026 16:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
References: <20260809103605.907605-1-bernd@kuhls.net>
 <20260809103605.907605-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260809103605.907605-2-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 2/2] package/syslog-ng: security bump
 version to 4.12.0
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

On 9/08/26 12:36, Bernd Kuhls wrote:
> https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.12.0/NEWS.md
>
> Fixes CVE-2026-39879.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
