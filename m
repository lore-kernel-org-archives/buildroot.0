Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A9810854B5
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 23:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B762F82416;
	Sat, 14 Mar 2026 23:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTZOqld9waaQ; Sat, 14 Mar 2026 23:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E96823AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773530612;
	bh=w7vRzWwFDuwG8i5CeYfzLr8Zffush6e3MhdJwmCILB8=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9kwlBbcIAY/B6J97y+6UD/sWQwBdTDrzSgPdzKybk7MRsk2TzH74qiBfnjekuqhy
	 MGZurHHi4l37JT420vi38o8gs620DoTwusVASgmG1LSF9DIYxF4acct/wKb6jexlPL
	 Iputo8Jw66Pj30eoG7l3zmjOQD0Ij9aTyodV595bTLN5adoqgU9ffq9qGOC4QrHoUT
	 OyH+YJd+teIPHtzWwQDAd4hlo9cq6+2ZEcr3SWQaeNUb1/AOorWtGWBM4o50msibDu
	 Dawgp+knUNnYKulPkan2aGN3t3BxEHrsL3QPxtRj2C+agXd8B9160p8CFKrWGErK7W
	 nuDlnfEP49hmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E96823AB;
	Sat, 14 Mar 2026 23:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 439831B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3595A823AB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVFYlwN5XLD7 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 23:23:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=stephan@asklandd.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42ADD82356
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42ADD82356
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42ADD82356
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:23:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-661b16ac011so5835524a12.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773530608; x=1774135408;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CJEUX80Z5cP9lMtJ3GnF9ofvMeUptYns2BvhjyBYTGE=;
 b=YjPRhECqdowIZfADTTSBz6OZm2yrepJgvY3asNIjiVUOIb38jNnbuMqkxioxVgh/J8
 Nh35c6vvaB3If6Em3HdTRlpWasuVsNtRmwFKRhLnyehNmjRVKvCT62ANw2s7y9xN/IV1
 Az3No8Z8bfv1BG0kGmNNTX0sTp5lFvf4As9p8yENgNbROZh7YEk1w6FakIyxLn5NJCk+
 oKj20yKwZyaRk8a5HbqGYV336lGvFlldzf+ec9D5jF7m8jFaU9DKkKL15/6oWHiuX6NA
 2kFK4aHOrF+W1iNWTtc76seLTguGBbK55dH90tlWL3kwTH8uqe0EfRJ1y5TNapMPvtvk
 ScQg==
X-Gm-Message-State: AOJu0Yx19XXRp2wLewj9Zycm0fIvzK++lH+BCUMfJMKpFZG53kIeNQsY
 EmiltLnJCf8SWPSPgKYuHQq79wMJxKnnJ5Bbv0g1bRrleHY/rJGaQGNpFnMrJruHcIGYxOPDWaH
 C/TDR
X-Gm-Gg: ATEYQzxBT+T1Hq9Y6ONKkA/bOemPqrcsFl0LPxg8aGEonIDCGv0QQ5rb/waYuc86Rr4
 nCO8vZc7obiycw5OOev+yNg327jytgWCYl4lPSBQx5A3Y/2BhQ056TIouSf9DfAZqRSIN+NYE2F
 O/YzBTIKM0SHEW3DnBOg5gxW7rRVtcHAevvvdePvBFPXHQbBdH3Ky2pzCm+F8BRuZGIZWnQ58/0
 mnt7TwHsNoB0/wI88euLB+X72mjOVwcjCnb9d5DgebvCHFJROhKmABR3NqFwtOYNVHSxk8AFBQI
 ZhfrYrPt9hNEfS6H/0CJRcCzL0L6VoETZc4tExLkcb9Rh+bDi7pFC/kZWecZM/wnUcBy/8GjhUq
 9QvP/S2nsskV+axzNl5XTtHyimszJWaHdpirj3n1GFk+4WF0IB2N2QuKBpIh448b0nzd4cEejJw
 xfjWt68faT7vy5swJ66WjYNDIY6mVLux0ah9+4ZQ2AE/UWKGB2G1LFZAtUo2GU4K0=
X-Received: by 2002:a05:6402:4303:b0:650:883a:8896 with SMTP id
 4fb4d7f45d1cf-663bac180b0mr5268691a12.29.1773530607505; 
 Sat, 14 Mar 2026 16:23:27 -0700 (PDT)
Received: from [10.0.0.102] (85.184.166.47.static.dhcp.aura-net.dk.
 [85.184.166.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6634fbb9e32sm3216616a12.1.2026.03.14.16.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2026 16:23:26 -0700 (PDT)
Message-ID: <669812ad-8e46-4073-8387-45fb3d3aa861@asklandd.dk>
Date: Sun, 15 Mar 2026 00:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260314230709.2917642-1-stephan@asklandd.dk>
Content-Language: en-US, da
From: Stephan Henningsen <stephan@asklandd.dk>
In-Reply-To: <20260314230709.2917642-1-stephan@asklandd.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20230601.gappssmtp.com; s=20230601; t=1773530608; x=1774135408;
 darn=buildroot.org; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJEUX80Z5cP9lMtJ3GnF9ofvMeUptYns2BvhjyBYTGE=;
 b=Q8k4TH4E+aaUtprHttsHgJQPchEwk5gesKOHDro06Rv4BZL9ILq7F1MUuq48+BhFjc
 0jPgtIATp91iAJGNk8RU68sIoGMV0Cyt00msRSG/GCRX2RF2n5pV6kdjo1IfeZR8ybMR
 7XxZ8yQiRmF+QOa3Uy21mwfoZPMhZsKcQ73CIrw5MmUUIiamuAyZxmBrOAmZ1kYCbAz2
 sUNVvZZRRCXtdXnl/nosAtNG8gzj+q2QiDvVoWieLQaMXnzAEb22gBKAfCAf6XBEzqQG
 K3XkjI0TdEka6dDn2W1WqJ59rug0tksBed3Cs4qv0p7ZtPdtYwtrh/ebyzQ9QgZYyrMu
 lmHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=asklandd.dk
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20230601.gappssmtp.com
 header.i=@asklandd-dk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Q8k4TH4E
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: add patch to use
 correct fs search path
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
Content-Type: multipart/mixed; boundary="===============6290633388758373411=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============6290633388758373411==
Content-Type: multipart/alternative;
 boundary="------------u5TVcZ0jo62JR2tMfOw3lfAy"
Content-Language: en-US, da

This is a multi-part message in MIME format.
--------------u5TVcZ0jo62JR2tMfOw3lfAy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please disregard this patch.
I'll be submitting something very similar but slightly more elegant, I 
think.

On 15.03.2026 00.07, stephan@asklandd.dk wrote:
> The patch changes the default search path defined by FS_PATHS_DEFAULT
> in configure.ac

-- 
Stephan

--------------u5TVcZ0jo62JR2tMfOw3lfAy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Please disregard this patch.<br>
      I'll be submitting something very similar but slightly more
      elegant, I think.</p>
    <div class="moz-cite-prefix">On 15.03.2026 00.07,
      <a class="moz-txt-link-abbreviated" href="mailto:stephan@asklandd.dk">stephan@asklandd.dk</a> wrote:<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:20260314230709.2917642-1-stephan@asklandd.dk">
      <pre class="moz-quote-pre" wrap="">The patch changes the default search path defined by FS_PATHS_DEFAULT
in configure.ac</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Stephan</pre>
  </body>
</html>

--------------u5TVcZ0jo62JR2tMfOw3lfAy--

--===============6290633388758373411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6290633388758373411==--
