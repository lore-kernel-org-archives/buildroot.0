Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3BBEED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC428112B;
	Thu,  1 Jan 2026 17:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEhENZBancR7; Thu,  1 Jan 2026 17:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A22080E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290208;
	bh=qZYAbUKLkqjDatmvamA+OyNqShijqpuiQGuURbiPfjI=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJf3WPsUyCa3GdsrS8JWnobny/45v4mjEhlyqPv6rKR0RpCB3itV3i4ZpJIoEuV7m
	 j952kkL/wdPwINU1gVSi3FilUnkbCQeMe17u5xzMLmwcQbckhNdHCod1M/7eoEJcYQ
	 +fJgcYSZw/EDO+Vr37CGSnL2V4Vcq67OD9v9H5KI9otZmsfjsioEEwjrx6V7qKQae6
	 dSyUh7az0SZjSqRGum+LE2jPqhEwJ/qVxMqdVamX8RvKnemNHCE+JGAkS0pnWan4/6
	 KHfAU8IACR15S9Z6EEOajwwDHlrJUAkS14yw1EuNt+9iJ6Z7BqkcIiYGJS2adwXg+L
	 cAac5rF2ct7VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A22080E67;
	Thu,  1 Jan 2026 17:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9801819D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B4C440445
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTvZKjKV9qQ1 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA8AE4040C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA8AE4040C
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA8AE4040C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:56:45 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2a0b4320665so178443445ad.1
 for <buildroot@buildroot.org>; Thu, 01 Jan 2026 09:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767290205; x=1767895005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kp8IUeU3TtLNNBgIy0Guex6lprZ711HrZY9O88qGRLk=;
 b=YRqxrmnOXSXnl1122kg1Z6JB4a3DSVpULG4x2FR1v0yg3ppppSRdqqKtEcTX6YBxrq
 rAhtk5Rk/WJkxgcF577NWoXdb1vXPMDDoPg3zJupaM/MX6sOF4BhuwzxWZ8Xa+MTa/nS
 giCI4RwwGiUSJQNja7+NSHmvNADj8Yh80Fm9CuewjW78wZVhECe1gkrM5/W/5u8v4j8n
 t7iRglGuXftKyrGhrfm/1xfTYOEaB4l0480q2kM3CzyoyhoBFJz5dj/4ceSiPElQLSLz
 rIJAUK8TBZCqi3uQ8NbbQoN+0lHgzRINALJLMYzljiGeniWq2dMvoPpROzN93kvnnQoM
 XyUw==
X-Gm-Message-State: AOJu0YzW0gZbqhAjgr1RrMZlc/l1Q+Lx81PMzGvFzV/X4XYlONYIHylX
 QaZVvYJYeCPwnRyBggeVGjgEcM37YAYOh2kkgBYj7F9Kl7n5kMhg13v+EobLAg==
X-Gm-Gg: AY/fxX6evF5Sarp7MNI9j6fIWujKEqaA9BR5O1VHV9rF/3Jte6pVe1na72i8V+N/2rQ
 YanbWobDu72/qvIZPCYyj/lYOKL2lxnWFIEMM8AfgydnMmKIrJyDxgNeU428uVXQLBByjWxp3su
 5RSvMEYPdJhxzrSnd1bo4/kqroU0lxtM42CfPSTNpBRBVBUrMD/imouotUnFjFPIeVWTRjQLu04
 7CfEwSQJUSK5c/ebiR7eSXo5ZdBnmrrhfAixDNZhBHyvMVvFKqMdW+fncgjwEOfuknBJdS8xKeQ
 sZJ9g3XIRTwoWfz55WrObBfP0aPnMd111wcf6h1DYgx5hwjT08jCK7aHvEmiL2X6hYynsfW+Y25
 nCVGEY5fkqZVOueGvLZ3QROQ1xAonzTO6ebyve10owjUHCke2ammkzoUP1Kv82Nt/d0MsiN1aGt
 q4p7ZI1gcaGAezWcpSj38T7/8x7Y0sa2Wa4hp5zfUiJlXs2MN+EwGsz4KEbtyWVcU=
X-Google-Smtp-Source: AGHT+IGhSqeLEQoJP6nE564YqTit5mvkGNX2ovRiH3+9ZNZLWXGJUDQtFy7r6nVrbcuJ9V/g1dW5fQ==
X-Received: by 2002:a05:701b:2419:b0:119:e56c:1899 with SMTP id
 a92af1059eb24-121722aa633mr25915180c88.1.1767290204888; 
 Thu, 01 Jan 2026 09:56:44 -0800 (PST)
Received: from ?IPV6:2607:b80:2c1:810:9630:593e:74b6:5bda?
 ([2607:b80:2c1:810:9630:593e:74b6:5bda])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217253c058sm151011587c88.11.2026.01.01.09.56.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jan 2026 09:56:44 -0800 (PST)
Message-ID: <be0e78c7-77eb-489e-92ef-d506eefb19de@gmail.com>
Date: Thu, 1 Jan 2026 10:56:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250829074509.77782-1-thomas.perale@mind.be>
 <20260101183709.2dcdedcb@windsurf>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <20260101183709.2dcdedcb@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767290205; x=1767895005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kp8IUeU3TtLNNBgIy0Guex6lprZ711HrZY9O88qGRLk=;
 b=KAfZO93T9z81Z1p4mNI4ygNSfLKA61lbJB0kylYqzUZo+FEDPqMv4kdRfWmi8xNOOm
 gV7YVOiNM0uYAtISF8Iy5HMKyrO8AHgjbqYLxrm8W7Eu50isDN+n+d8IQdG7w2QzDXVN
 t/f6Y9jYldWev3eaS0teviwrYuEtBr/6SAcmEgvCq8UUYyZnJxG3RxekCA0uk207PAnV
 TOcyh6dIpMTiFIx1CiseetS2dAxGpVNf4WZWOa1B/5Zqy/swZ0Vam/fFiW79MUSuKbWA
 cC3q6tR9vY9Umz/3ZhUy6CaT+ttfi8GOAXofBpHtdtJEcJiknt8RzVJpcMZpqCl6DOTB
 hIJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KAfZO93T
Subject: Re: [Buildroot] [PATCH v2 1/2] package/softether: fix various build
 errors
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The first commit fixes build errors in the package and then next commit 
removes the package? Not advocating for keeping the package, just looks 
puzzling.

Lance

On 1/1/2026 10:37 AM, Thomas Petazzoni via buildroot wrote:
> On Fri, 29 Aug 2025 09:45:06 +0200
> Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
>
>> This patch add several upstream patches that fix build error we are
>> experiencing on the autobuilder related to host-gcc15 and gcc14.
> Thanks, I've applied both patches!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
