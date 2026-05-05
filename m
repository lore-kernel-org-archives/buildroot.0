Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CDCD342F
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19032812FD;
	Tue,  5 May 2026 10:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kASkxikh-HoP; Tue,  5 May 2026 10:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7988811F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777975822;
	bh=M96GqmBfqcbaMOpOJQLHVBqkb7rdN/6qdGRoPey0wVM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sNmJDJX0ts724wtLAfidFPqih5z2p2wSO+aeM1d7W10kKWQdfRPv80TqyK/j3InCm
	 QbRW3KaXDjUzTC5rjxZN57LoQVuYgIp6yTQzcqc1IE70ontnqqyyfpnzuhJjvCYYLU
	 unip1Rj6d0gCWEJ8U6EH2hpbHdj7M1rUhu7SySWwUZWZhL7u+yTBo3DuDi6WwB/P5V
	 77lKykovmyRC0JqXBjFwo3Xw0rMbITDEExLV5Fuq7b2g8W0BBYLu0EOC86xdDUYEzh
	 l+3XkG0i0ummNwgPOl68DW7UftUJLha7leeIgEuMetzBsZM20lzBz69MjcKqmVRfFt
	 dwsB1J94c9pBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7988811F6;
	Tue,  5 May 2026 10:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7B72DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0412340232
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyzxLX0j2uyb for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB8FE40231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB8FE40231
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB8FE40231
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:10:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48374014a77so59721765e9.3
 for <buildroot@buildroot.org>; Tue, 05 May 2026 03:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975818; x=1778580618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F8IYsc8M63XEzcllpTRIQht9sFdA3K6YzwZFermIJcs=;
 b=GzJDonxmRC5NFkvIxHLPlXzHHbpDXnmfabTDGCSjgaE/EFnBGPNONwc6rYt73Z1996
 sGU7OhnluhKyawTjJ7IVSbgRe+aMCLdztkiaCguTSEr3JR9zuujVB5bjKRMkUEom6m2b
 N0npudzVf3SoThnD55NXuI+O35OvbuRAA/O3vO0fuoi3Edagaecx70iU6gBBYa9R8psS
 GnjdDAAfWTARZw30ERKi1uzFHN2eG5xR2yfAEUWSyygEZGDMHPWe3tDF3I2/FKZCaeuz
 6IiO8oWkpKLMmm6TBKagRwTcvw6XDjcYcNs9a8On+etvHGAxJs+ZpR652abAjrqVq4z1
 I78w==
X-Gm-Message-State: AOJu0Ywe0iuyGW76v2WuKY5wZoTp4MXVIIZUGUAjvlFUNCKZYcuczIFW
 6EkdDuubPDA3Ny3/3YsDg8eyEuVFdZ9LCoXDV2RNo3WbK4UViyX+AxKaMmPQgtzySRk=
X-Gm-Gg: AeBDiescjTk31d9V60k86pG7gMJX7GDMcFC2OzYtd9Pb3Efw2GCQhtrH1RLKd8Y7QUX
 rhAZKKEbq/Z9GLXpuytA64l0DPS8Z48jZNeP96pASdWDaXl5axH1Js6qeZuJJsrNKUV39a4gCuG
 0rmKh6+mGoSXlnbBoyw1IkHu3z3zcq8UXQlpbhjsaOl1hJayS0zBOjgyVd3GbDyZnJpKKcAfNdF
 pjp9ZCep+Tz0cv9sjF1chcbN5WMHK0OjqLYOt15UMCu9e2kM/X5xudgxd9dRn2Z6Vjd8T9ohpHD
 NHnsILpAUXjFmPZwuTLPhMqu4wKacwoHRgLec5z95yhBB52TbTRMsDjYkG9I9Yl0JmTiX2DhtXL
 W+7H6kRBtST54bY0ZHkyg16grKdd5VaSG8eza3X8/bWAHrivdWaVa6/lKmMMjikDgdvP7e0DNk8
 sbgKWmWF1BGDvMxfoe/p28J+Kyimz0qxvI0QSA5+pRZclsj1kNtYI9wZN3aUvmaJN3gS2rLQ/tt
 wmeiGbsdmjdj2+fSJMiTUOYBeY=
X-Received: by 2002:a05:600c:4204:b0:485:3cf3:1010 with SMTP id
 5b1f17b1804b1-48d0640f5dfmr77116665e9.2.1777975817839; 
 Tue, 05 May 2026 03:10:17 -0700 (PDT)
Received: from [10.5.90.6]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed6b89sm387627905e9.1.2026.05.05.03.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:10:17 -0700 (PDT)
Message-ID: <29057165-7222-444f-87b5-731fd99e94d2@smile.fr>
Date: Tue, 5 May 2026 12:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20260417085703.200145-1-dowan.gullient@smile.fr>
 <274c342f312f0005dc418c2bb5e64a9c@free.fr>
Content-Language: en-US
In-Reply-To: <274c342f312f0005dc418c2bb5e64a9c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1777975818; x=1778580618; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F8IYsc8M63XEzcllpTRIQht9sFdA3K6YzwZFermIJcs=;
 b=z+5WSmyn2SxEvopWif1yoP2ESgUAnAW/6vobYJ/01OizZOsui0eLcdiCa3zd8sQIp/
 M0lOmiP6Mw3uFChVe5NJcqMlEdV7ylhZJIICF+RJAweYDL2lUBh0yMkmgu/zmx2VSzrZ
 F4jZfigXjwRoUSP95HmxM09m4oAoYr52W4RX4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=z+5WSmyn
Subject: Re: [Buildroot] [RFC] support/testing: test_podman.py : Build
 failure due to bump of toolchain
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
From: dowan gullient via buildroot <buildroot@buildroot.org>
Reply-To: dowan gullient <dowan.gullient@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien, thanks for your answer, I tested your patch and yes, it's 
fixing the toolchain errors.

I sent a v2 including your patch and added a fragment to the podman test 
to fix new errors that appeared due to the bump of the kernel version 
this time.

Best regards,

Dowan.

On 4/27/26 22:22, Julien Olivain wrote:
> Hi Dowan,
>
> On 17/04/2026 10:57, Dowan Gullient via buildroot wrote:
>> The recent update to the AArch64 15.2.rel1 toolchain (including newer
>> glibc and GCC 15) has introduced a regression in the build process of
>> host-protobuf v34.0, which is a dependency for Podman tests.
>>
>> The issue manifests as "incomplete type" errors and "missing 
>> definitions"
>> during the compilation of several generated files (such as type.pb.cc,
>> timestamp.pb.cc, and any.cc) [1].
>>
>> This is caused in particular by the stricter header inclusion and 
>> inlining rules
>> enforced by GCC 15, which expose missing explicit includes in the
>> Protobuf 34.0 source code, so it appears to rely
>> on legacy implicit inclusions that are no longer provided by the
>> latest toolchains.
>>
>> This failure prevents all test classes from the podman test from
>> completing, as the host requirements cannot be built.
>>
>> The DCMAKE_CXX_STANDARD=17 option was added to the protobuf Makefile 
>> but the
>> issue still persists. What would be needed to fix this issue ?
>
> With the patch I proposed in:
> https://patchwork.ozlabs.org/project/buildroot/patch/20260427201606.896700-1-ju.o@free.fr/ 
>
> I am able to run the podman tests.
>
> Could you confirm it is fixing the test on your side (and reply with a 
> Tested-by)?
> If so, I believe this CMAKE_CXX_STANDARD=17 is not needed.
> In that case, could you send a v2 removing it?
>
>> Thanks for your help. Sincerely.
>>
>> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215942
>>
>> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
>
> Best regards,
>
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
