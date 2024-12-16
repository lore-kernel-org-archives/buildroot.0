Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8643E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AA8408C7;
	Mon, 16 Dec 2024 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PG4zDh1qvD0; Mon, 16 Dec 2024 20:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBFA408D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBFA408D4;
	Mon, 16 Dec 2024 20:24:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB5DBE3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F6D81F12
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yAXJUqHB58y for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 20:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 280E881EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280E881EE4
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 280E881EE4
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:24:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so2384357f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734380644; x=1734985444;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVRn8vsvrU2zs4SfkhPo0+3ZUFGBAVbmqK2uHi44ndI=;
 b=neUXvYfSZ/otpwjBGwtmHPbemXCIooecJTPx8j4Y+6aX44s7OVauYwdBh07W/Qys3V
 h5W9f3rSQ1RAXgUr3neabvN/8jhb0om+enICnBDFUbZsfBvQYXK6oMbRkqa/x7ye/zOB
 n4ZBgvJwMzJZFITzh4P/5juyiLLaKfvIYdYdJQt4ywaO3bMHqkde1JptRhzEeLk47j3c
 Hyn/8uEx0vPDe0+UQT4N0neFV1AQjjm5fNR5mFAWniKoV3ytK3PGryqKacgmQDv2a8Xt
 25+TTezOrHJa+FW18DVFValWat7q34C2vlpYmX6BNc7mQDIwY7SnCc0VSqMFej5HPBaG
 qUOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMlAC6RVokMGF0rQzOGKKb2uRBdIEJ5t6AnRnZHZbuJ98BssgqdoVOKGUZjyWW5QWLsZZO8eDrcSA=@buildroot.org
X-Gm-Message-State: AOJu0Yx3zT0c/6EoDECZs7fFiF62UUST9L+rFloZvBwuKpCD3BVKal06
 OQ3QtEFUemsokbcTtaAiiadiev7M554XmQWG6EInCpFOX+8fLHU7rCDhN/opkv0KiSgS+VU0HtR
 6
X-Gm-Gg: ASbGncvS3kMy2luC38aPpOgfvkj6L28G+IYerUY1/akE0YSTXvWdtClqssrbrp+M8Pc
 MNRmhsmZ47mJc5DVR2SovHaQCebsz4+CJWzUEacZ7vROXPTnTjsEaCyudtP9ajke1fX0JeAFqSp
 C0KvQelnk7aAvlcPsWZ/bSocc8d5WhQBcMqc4JKlpwvCK1f7/1E1uA73zWc/BiFqjJGCwJXQVEp
 5ufofg07Dj3UYhAPoB6xIV6PeM+LcIvxzKF14KTHWbsvXd4+/ZBGvdGaIRcx2IXq83L/CfiIias
 VEkyq1kwcdWJkqBRPqo8h2cPk6TBRYYGqOsfuteGvCFKXQmHn6uqHRmvEZLysi4/gwnA14z5/cn
 cUWmD4FX1Ltk=
X-Google-Smtp-Source: AGHT+IFgDeXN+8AqGX02rmkVbQOy1nmWruyErW0TvB85rp4fTz0qAw4gPfn5GVM23nJ8uNs90R4d/A==
X-Received: by 2002:a05:6000:1fa2:b0:386:3357:2d9d with SMTP id
 ffacd0b85a97d-3888e0f2de1mr10881963f8f.36.1734380644114; 
 Mon, 16 Dec 2024 12:24:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012112sm9183512f8f.11.2024.12.16.12.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 12:24:03 -0800 (PST)
Message-ID: <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
Date: Mon, 16 Dec 2024 21:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrey Nechypurenko <andreynech@gmail.com>,
 buildroot <buildroot@buildroot.org>
References: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1734380644; x=1734985444; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wVRn8vsvrU2zs4SfkhPo0+3ZUFGBAVbmqK2uHi44ndI=;
 b=YQyadsNd4n+6N5x5MPLBM4LNtAMHHnJqDeeRu1EKYii/TE73MiGo25UsMhh3q4f47P
 NPkBdgMpmezXa5meWS+XuN/VCkDPeC4NEr/GmzTSkmavL47fI0iZL8Wcnc1hudWeUcZ/
 A65U1RIrTK5Td4vcDD7ChxDe4tW8/q/0amrw472CV7BtZqEkfBM8I1S5ZWMkJn1KSCq6
 Id1J39clgtamhHqhz1ql+kBP4MD0G8+fJ9vvZTy62CLfi/xHuUs6WGSiLMf+MM/uGo1+
 rSzIgr5rxzT/g55Err4C5n84col1qp0ub7KOUqZYr8z6QzhHjUUMSOITTOsTrZBo/mTM
 q2BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YQyadsNd
Subject: Re: [Buildroot] Problem compiling grpc package with BR 2024.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2024 14:24, Andrey Nechypurenko wrote:
> Hi Buildrooters,
> 
> I am trying to move our project from the older Buildroot version to
> 2024.11 and facing a problem compiling the grpc package. As far as I
> can tell, it is caused by incompatibility with the version of Abseil
> library (missing absl::StrXXX functions, etc.).
> 
> It looks like 2024.08 does not have this problem. So my question is if
> someone else is facing this issue and if there is a solution for it?

  You're not the only one, it also happens in the autobuilders[1].

  It might be fixed with a version bump. Can you try to apply the existing 
version bump patch[2] and see if that helps?

  Regards,
  Arnout

[1] http://autobuild.buildroot.net/?reason=grpc%25
[2] 
https://patchwork.ozlabs.org/project/buildroot/patch/20241107191634.378670-3-james.hilliard1@gmail.com/




> 
> Thank you,
> Andrey.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
