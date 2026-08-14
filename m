Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29606C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD92D40D88;
	Fri, 14 Aug 2026 14:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgnHene5MYb5; Fri, 14 Aug 2026 14:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D382E407AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716987;
	bh=nB2zoJjgAiLZkyEfjX/AaqxV6UwadsryYvuZsfSIzhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EppVLLITicsWnhw8t/ma+lLvHmdoCiaVRvBxCWay2vTuRm1MvcXT5/kAvSULMtG2H
	 pMUuGK8HroSVbBHzf0hWVD87TLgqiCa15nwOhMXQK0z6hiwknjMr2WD461lohf1c+C
	 BfzUA6zqzCE3Qk7CBKtRUMsj8f/VW53aOOvoCjj7OvSXqSfLc80eHsxUoVs5dWO5zN
	 F1M4Fc+R583f3zQJHzfKMhZpLlOZFRMfU1QYcqVmvuh8wuF+ckfMdM4rWFrCDWWBDQ
	 AQDiXaRmNdqIBTgrayzA5cjSqyk+Ir8ygXhrAsfGpCyEyLRLTubFutbk6p7sYd7yv6
	 kKQT2E0ZxOJSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D382E407AD;
	Fri, 14 Aug 2026 14:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6115F3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52904812F4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBn_G8HOQo5x for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C3D4811B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3D4811B6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3D4811B6
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:16:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47db714766aso1309559f8f.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716983; x=1787321783;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZXE7d7rcmZlrh/F1CjS4+tVT4uF9ASScFxOmemlJn7M=;
 b=Oe0W3q6RPZi+ChRQm8au91c1BQZxXEzjojulqMFRXkxbTwNj6NTcAUaliJdI+8IbL/
 M84Og1Shuv/ocIHdDpXtYDqnKHTFQ+O9q9KXO20O5XuVIWPy+CdXCxYR/u27lJ/fjneR
 UpgTl2vJ5WLZ2zI42TPqE4QqK1H1pmIxOBWXgqonTZXtFaST9buWYmoWgzQ/ketatp0r
 G6jEsnfF21JC1YiYIkFtMo++0Hw/aEuijmHV0MHS+H8+JxDPebpv1dnEQxbkfR+L9t5S
 WJjE9UnC1U0AjKDSoLW3/5CWQfl5U0/eQp182hozlM9lSrRZXNZZrKfDcGic2G3BdkQd
 G5AQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqIakDs/isLeQJ8mMgZKImRRlTGACTOM6J7pFiyHINpS2s370mKVkl2o1STs8SuidZl3YYFlvQebXE=@buildroot.org
X-Gm-Message-State: AOJu0Yyt6ONsl8l1CUA8LISb41Yewgesyk86ShhvdQDEqWNzxcqhEzQA
 JyorveM5Io95JcZtBalEwwl8YpbgZdNKVRPMA5bPgDs2JHDKORjt9/zLJ4Yd3XaxX0k=
X-Gm-Gg: AR+sD10WIMfQAo3IMw9P8gJeYKwpJpy34prpEUBDexyRgcRzN4axsGxzci2m0DBdfu/
 dyxVE+tjfvD80iPWRrBUW951v6N1rNYOtoYnGNVGdhYzg/BUQkkqvaRWzzpSzBq9KSLQKN8N+/g
 4TdCEUMLdNf1ahM2rvrEHNRx22KAZHxWFbHbTOYl649rsywlp73UBxrxG40Ee6yPsN5mQnLoZ7a
 o6f2tHiotiRQt4MAyTNINaS5PQZXZX7wsrYTZPI/A+w/alOQc7k+syML4ecAQBnJE28R/8Wfaoy
 8kO7+NdoFAgoRd4RXAAllST8B3nwdfJzhvjdD67tfVCbooLecptcDwR0kVxkEz0ew1IQWjnSTN5
 IV1TP6/nZo/RMyl9hFklc3myIUVLICeCRcbNz8Lmh0zDIXN/GuZnumYd1N5WjPCW7pV55aqLd4j
 303vfSx3t4ZVGCguBjaJUxq3PCRbqsytpQSCERZ5hTz4FwmiZAQdH0GL8qtUqfHqNySXrpuqieS
 QkhK44E7tlwdOUoBri1DH4BU8wjpOBjieuJEBZerSTex+u1
X-Received: by 2002:a05:600c:3e10:b0:495:5d6d:9cc1 with SMTP id
 5b1f17b1804b1-4998bd6f986mr10671155e9.0.1786716983251; 
 Fri, 14 Aug 2026 07:16:23 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm36728215e9.0.2026.08.14.07.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:16:23 -0700 (PDT)
Message-ID: <83d9c984-8a69-4a9f-bfee-94a1ec5433f2@mind.be>
Date: Fri, 14 Aug 2026 16:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260808103632.3547378-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260808103632.3547378-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/{glibc,
 localedef}: move to Gitlab mirror repo
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

On 8/08/26 12:36, Bernd Kuhls wrote:
> Downloading from sourceware.org/git/glibc.git causes many 429 errors
> these days so we switch to the upstream Gitlab mirror:
> https://sourceware.org/glibc/wiki/GlibcGit#Fetching_The_Repository
>
> Fixes:
> https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
> https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
> https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
> https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
> https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
> https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
> https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
