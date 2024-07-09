Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C9C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B43240CE7;
	Tue,  9 Jul 2024 10:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPQ6lJ5LPcsq; Tue,  9 Jul 2024 10:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BEE140D33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEE140D33;
	Tue,  9 Jul 2024 10:13:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD621BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09AB980E44
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DA2Tzwukd08k for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7A0F80D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A0F80D86
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7A0F80D86
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:13:13 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-78006198aeeso196018a12.1
 for <buildroot@buildroot.org>; Tue, 09 Jul 2024 03:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720519993; x=1721124793;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5ljVBWeGN5YAK2Jf5Au94FpAFyxtcng20MJm+ujOfE=;
 b=CsV8nQlIXp5pwnyFGgJMACEGYY8zqq2r4StBfFKezoIieTxyKDbYOO/7zajgS6VDUX
 VfNTteUrTl+xYqOOlkZ8YwTp62UrrGkYt2N9YEheiK6ieYIAqRQR/jMZGBjdiw0ZrGV3
 kvixnTZVrjTdvOBOdlroxaSczh43PRoShOhwznhGFFamanj7ynYMN/OXvIWKkWSxVL6B
 13RCgwgQP3NEl9DC3D1/u2gNsOnzecF6SRgPiNcGNSGQFDgqdzW5eaZcs6zy1cv/ql8n
 gZDCcbsBTuHHsuK8hJIcF+vsloZnVvLDu+CeZc2imi0gVWRGLCQSjV1r5VyXt8ye3W74
 llTg==
X-Gm-Message-State: AOJu0Yxh5QZb5Hj4hyfs8iEjkHe++t+9cknV1rczQw/WcPH4SE2MOAoV
 QywYB1q7gljxmzTzWB9s4VhNc4H+atcBSqBu2w6FVouGeQlVhJIzO5jJ0RN2/2k=
X-Google-Smtp-Source: AGHT+IHELQmf3x5QW46I5Nclh+oR6dnftwC0Cb7n1hnRPzDwAQRIQ/2hMs5jkUTb8zDS9IJSiPAycQ==
X-Received: by 2002:a05:6a20:3c90:b0:1c1:2336:ae0 with SMTP id
 adf61e73a8af0-1c298bf6f50mr2908494637.5.1720519992840; 
 Tue, 09 Jul 2024 03:13:12 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438c7099sm1411304b3a.84.2024.07.09.03.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 03:13:12 -0700 (PDT)
Message-ID: <a11a2bc2-cc24-421d-8333-2f0b622368b4@mind.be>
Date: Tue, 9 Jul 2024 12:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de> <20240708231151.2606b9ff@windsurf>
 <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
 <20240709113704.65a5c956@windsurf>
Content-Language: en-GB
In-Reply-To: <20240709113704.65a5c956@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720519993; x=1721124793; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N5ljVBWeGN5YAK2Jf5Au94FpAFyxtcng20MJm+ujOfE=;
 b=ZfVnLc4La2qxHOBunh6W2fsPAv8il4t6p2nW6OKgT6VqvtnTV6HSKqw3KSMR5V11Dd
 IP+Fb7miw+Cl9kisG94gRtjNDknEOaL0T8qTjHS+cVQ2Y8LHIjAwfPUbM3WDfbcU/Jls
 uvBbCXcmkWHex7H23ia1Btf05aPipLlMVXsbV70I2PcsbqpJa3W1tlmWJxS3kICzFjBX
 zsMqu9AFxxLr1Cx4Os/kAsD4JSJ4cp2W4/Z8v8fg7RTWVeAMQtdLibVmQKpUVsnry11+
 cQOWrzMPU5UW2CRPxLEkmZHJ7k18lhq9zYPP0MD5yq4sXvyXfE+65L3e8ibj+kzABLZi
 YCkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZfVnLc4L
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/07/2024 11:37, Thomas Petazzoni wrote:
> On Tue, 9 Jul 2024 10:38:13 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
> 
>>> I understand the wish to document this, but I'm not sure an
>>> "Integration principles" is the right place. Shouldn't we document that
>>> in a section where we document the expectations in terms of init
>>> scripts instead?
>>
>> Arnout explicitly requested I put it there in this mail:
>> https://lore.kernel.org/buildroot/6d02d2d5-e71e-45b3-a447-e81521085e7a@mind.be/
> 
> Ah crap :-)
> 
>> I'm happy to respin and put it elsewhere, but I'd like to avoid a back
>> and forth between two maintainers telling me different things, so I'd
>> appreciate if you could find an agreement before I do.
> 
> You're absolutely right obviously.
> 
> I don't have a strong opinion, but I think
> section https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script
> makes more sense, as it's actually close to where it matters. Arnout?

  The init scripts are just an example here, the principle applies more in 
general. It also applies to e.g. ifupdown scripts, or even systemd unit files 
(e.g. if a systemd unit file needs some ExecStartPre command). That's why I 
thought that the start script was not the most appropriate place.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
