Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA29C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB2340ED6;
	Fri, 14 Aug 2026 14:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uj_NwAOwUqrX; Fri, 14 Aug 2026 14:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A7840EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717230;
	bh=i5439u8GRuNQZw9S6ECBZs0lhq4mvbIk4JL6n6HGX0M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=s7fTBHOhfNQVAqptGuy65jWjDDgBWYKnWXf1UotHmqz1ZBe9atqL21hzXw7LKCp58
	 qxw9eUaTuvR3gPT2i1KnNmPW6mt9M+jQ2f5fL9bZ4d4f/Bm3G64bhcw85MYhzCYr/x
	 WdIgKNgm7zdZ2IsLHKw4lgqNIRELVkcXy2qpdrYpxqJN5cxUMIj45W2+61j7LIK62K
	 8S3n0CiA4XDsmVHQkjYGfjk5aw4uTiaqY/hSmX/r55tAfqN7t4dOw+5vNHiD76uiOG
	 Uz8KLxKe61atmr+AjmB9vcPgA6wjuOvm1fMRHQk5VRT/Yd78lX4M5Kmz6PNO2Ydil2
	 gzrEY9oGEz6uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A7840EE0;
	Fri, 14 Aug 2026 14:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AC723F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 149804011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7wkDnA6LQnd for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E74C8400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74C8400A4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E74C8400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:20:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so517337f8f.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717225; x=1787322025;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4+gkaumIt7Up2feuuaTyQI7wCVO5fhkL4fz6E3phW/I=;
 b=r4ncy/lZBs/jhafwMDeNBPtrNukrao4XyOYEtFXbP9KvYeRnAQEvM9trzsB4Wrl9I5
 pNE9YDM65Nzo9bvTpTXqhjjoqKcvxQgY0zguwWHh6RipWQTnPDNzj/Bf+TOCOIp8Rgw3
 b29mLQopKg59WUv4Z9r4EfCuySyOGKacD1i93yawpR3SMO3/+LAOYcx/uda2JENTBhjr
 HwQaAK7IaPeR39uO4rD+JqvEVu0VdLEcW7PNs6ejLy2SGEg22P2DlgwbfwgfcmNr0kcm
 JRQGNgfhKklO/dlzQFphkudHxiU/OLcR9fvi8iK0lrD26Z8yhEJYxTOQr+4Vfcmaf2Ny
 zU2w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1aAnrU4ZK4jWJBR777TVz5QqKqQJ1AQ6ZxCQopoWjRaVhkqSdqkcSqodnuV3994SsJNk5AbNUvUE=@buildroot.org
X-Gm-Message-State: AOJu0YwRYFBpj1b/+8Xpz5ssLaukSDJVUQQarT7I/J/Tg0tjL17CZ6ZR
 dzdCQ9vrlTfUqLqYMaDJorB68IVfEf9czOoIz6ITmjf0h1MdrJdJJanbdqKafkEdU4RzzT1K/um
 Q+zxBvVw=
X-Gm-Gg: AR+sD13+t8Ipjmjag7IlB+JYS7eOWRm4+ENG1iWBTEAdJpTVXN6pLPp9zc+Ds1X5Vqi
 CnCc8fW0T7R96QvadSxLjJeC4y37UCVjynfIt8iXATN+9Tt+XsybxFF8M0y393cN08SNIhq3zyy
 OnalG71FMOwoIonXcXrE7md+cmTvR6BW3q3QUM4NmOVcVrhzsc1GXFBQMkBmeywn+SGrOlNw6vS
 CRqOSerDgoPrjYWghe50UKDvWJRaLPVrHOVeWISvW8HuOjxrEYlUj9zX/WTEoy/l16R9fUTy+YG
 a8Bh+ljupQY+8Tw/7gQN1DDml9qmAm6+3ZLxHjsUTlAeLJQsxl/TnPUIhxpCedTHmNczZOiuxj9
 aqJhNGNqqld2iIELv3rYu80JIJ6xBRGZrJ1lC/ldvBl6+MdzONDfdhty1hOrM/s4+F9LCD9AxcD
 HublUsJnjPmgDOgbOpYlRu7OCBCUeXL1E/Brn8wwrTNiu84E9a3ZxnAsKv6iXgPQ1iE5G2j8rVl
 6Hxxn4wmGD+AKOyFK0YQnC0UdY1BNHKP7PZNhrAAaKnXYTb
X-Received: by 2002:a05:6000:98c:b0:47f:93b6:8d06 with SMTP id
 ffacd0b85a97d-48160698172mr11085786f8f.0.1786717224650; 
 Fri, 14 Aug 2026 07:20:24 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c0a75sm9132953f8f.25.2026.08.14.07.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:20:24 -0700 (PDT)
Message-ID: <da53b73b-22e4-4e26-bdde-41fdb7ff4030@mind.be>
Date: Fri, 14 Aug 2026 16:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Franciszek Stachura <fbstachura@gmail.com>, buildroot@buildroot.org
References: <20260704133118.1245367-2-fbstachura@gmail.com>
Content-Language: en-US
In-Reply-To: <20260704133118.1245367-2-fbstachura@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.43
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

On 4/07/26 15:31, Franciszek Stachura wrote:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1643
>> More likely critical security fixes and less critical bugfixes.
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
