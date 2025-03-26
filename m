Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3472EC36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 08:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E6284074;
	Wed, 26 Mar 2025 08:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imcOgyDi7cd7; Wed, 26 Mar 2025 08:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F231084079
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F231084079;
	Wed, 26 Mar 2025 08:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E80D31B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA16341A1B
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dToHift04K1B for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 08:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A36941994
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A36941994
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A36941994
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:03:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso43802435e9.0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 01:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742976192; x=1743580992;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4NX9c0VtzgbRMTK2kcb8Hf0uR+q5qsdVLZwQZSnqCQ=;
 b=hpgLiYuvnl5hZPQXOwN3GOf9mDbTm9eCrz8+vw9WMr2CQnMg8yjEn31jp9TFQivaef
 hMCzn0wRc5UulP7MWGT/v1Ckh/XZNI1wAGgh0PcueE0FlpeTygdE8VGWy5//3CNODstM
 YFXQunjrpLBGHSIapoqpdp4nAmL/TGMrm3TMEeKeM49EOXlJwWHhVp+iO39J9aCy+tqv
 1BWjMqtpu6LMdfgZUAICnvZ7y+ipYk+YQenzc/PdK+bjF8sj4SzD5xGgleRTf8jUzfRp
 my9zcfVeYznmOBUmD5ORMCdkc2tEELTEc3AmkQuX/M8zBWxsa5Bh5xKtkcFOXIF6eIfC
 /Nug==
X-Gm-Message-State: AOJu0Ywjb5yz86Z3BDGoO8HltbsnRUECdO8jYem2dEU/bVA89uIyAJ08
 YGrNtNbStSmgTIOi+UVcj0kTE0BTNo6j8/eEqtoYPcl4anFeILjyynbbVEBML2E=
X-Gm-Gg: ASbGncvEFLGGvDm+jpT51pHhsG2Ar2loybTVR7HU4SSopXbJc+SF7UFf3fda14ZjFsD
 4+9IGA9at5Dd4kX+teSkxPFaCpINjW4wMzr16jdm7TLE/T0nCM2115IXe6LxvVDeIRIXagiZRHu
 vHZTrQWoMZW7au/ztJuMP6TQYJxFqo5TL73GOHg+G0QBHbSjrBpN7Ezn2yNjs/lBI+l7iC0l3aR
 gy54F3w3COofKePOWJkQIRInpyFqvsitgaDkrtuzGnnJJTSXfoYbYqaPIhsnW6Z3bZGZp2NM31e
 3BI8BCvEC7DfAz7fVGFvnNvn/Tj7cyvX+clFiYb3W8G31leCzBt5uuqg97zbLBZvdpkjRdyYHiC
 mfF3bqwtIVoZuFynzPHgeQA4W107C2sopuP2tSti5QoVYaApMJLe/vDxj3dwrEIUfYigAI8U/9L
 I=
X-Google-Smtp-Source: AGHT+IFs9r9Hvfsc0ipWe0+8mKmvR9DJqGkJtm08rQuDbECyewWEcotogeY04XTODQpJZKvx0mHoSQ==
X-Received: by 2002:a05:600c:4e12:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-43d509e654fmr199290815e9.5.1742976192022; 
 Wed, 26 Mar 2025 01:03:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9ec84sm171897515e9.26.2025.03.26.01.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:03:11 -0700 (PDT)
Message-ID: <18402322-8391-4e71-9421-f49d24be2601@mind.be>
Date: Wed, 26 Mar 2025 09:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
References: <67e37f34.170a0220.9d5a7.2eb0@mx.google.com>
Content-Language: en-GB
Cc: buildroot@buildroot.org
In-Reply-To: <67e37f34.170a0220.9d5a7.2eb0@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742976192; x=1743580992; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y4NX9c0VtzgbRMTK2kcb8Hf0uR+q5qsdVLZwQZSnqCQ=;
 b=Fsn36Rbv5FUJcAanrWx6vgF6+EphzXT/ilb23hXEw/0m0yfMNI+0BA34Q3ZoTY6Sc/
 Uv1BhJoB2QPzc70qaCl5CUjn6xy53YE1hiLaNlJRJPpaHcY7wkWMwMiXeVNMykTcIxfn
 QjG7vs+K+0/q74/fqxIidTCsURRDkjbAG3kTXAljpww3Djls8eoM1P7pGsV/gjn2aM4I
 oCxom0NjjjNIrNJ9zYZWufWQX4Te/xVNIGTWusjT00AdDYmFMrbd1tLsJy60uD5qOILt
 vu9Szgu9qGpWfM7GeDA+le5Crgi2/+MGg9GcbLycXBuKWlxrMvUZOcrQsWmc2Nja2g6u
 bJWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fsn36Rbv
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-03-25
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 26/03/2025 05:14, Buildroot Notifications wrote:
>               host-cmake-3.31.5 | 69
>      host-gcc-bare-metal-14.2.0 | 13
>       host-ncurses-6.4-20230603 | 10
>         host-gcc-initial-13.3.0 | 8
>              host-ccache-4.11.2 | 5

  These are all on your asahi-mini. It seems it is no longer able to produce 
valid static libraries with its host compiler. Could you take a look?

[ 90%] Linking CXX executable ../bin/cmake
../Utilities/cmcppdap/libcmcppdap.a: file not recognized: file format not recognized
collect2: error: ld returned 1 exit status


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
