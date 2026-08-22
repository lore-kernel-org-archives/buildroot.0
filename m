Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387BFC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C62640928;
	Sat, 22 Aug 2026 12:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3Li4ulWgkTw; Sat, 22 Aug 2026 12:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402390;
	bh=jISYz6mQng+cyQyuOP/CaT+C/2EOCje0qz3/Yfo4B1A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CVxGdrLYL5Yva2NvNiBFhnX7kfqbgI1FI5KZ/+jsSRBfYy8+GBZSe+XzajJ1Vdl7U
	 MR1Zm5hoIaVR23kvPvzj3EcOAv5EO9uisXK3Uq8yaYkH84wnK92ObUPPu5fVIacuY2
	 99jBEQmRmpfKKkFiaJMKXVAm2Q/I26S1Wt7hXDO4CC2MVDkgDrjE+rTXQzmH8e4zVI
	 4VBpY/RR/J90b1C9s25dHKXUaWuQDNZOI6F7l2kq34yznO2aYLfaywpk8wzsY6ikW/
	 nXp3NNdkX5X5ezAPjJQepJAjeYLXYrD4MUYPEvRaJ3uwYaXMfvGekYqu02oJFP9bAm
	 u25Tb4FgQlC3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58491408F7;
	Sat, 22 Aug 2026 12:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F04DE2B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E1980EFC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-3rR7_F9qyT for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B95B080EF9
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:39:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6a17211b9ecso5259900a12.2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402385; x=1788007185;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V6p/cUdHsu9AjipfHJ4UWj8BMrlE39h69Jotml9+oBQ=;
 b=qchqrLTPZHsv32mqwMBHwf8qeCjrXRQ7mtEBmKPkuWdSpFvm4nrn2z8mnIjFNiVtFM
 I3Sk65M8z6RgpGEsIZMHwkTPjoyS5y42qh8XC1CzWnDqo8w4GLQlli8t10nEzL8tSZPh
 kOOUSQmO5g7esc3f3gZ6qwfLB6vggvIY4ZBvoaOAYx2ODjrUaTW0AUkl7x+yVBlT/ITX
 qhRVRRVe0L5429sfl3HuWkvLIXGaXqQbnCB3pwrQxUwDT1FNTKHvAqgW5LoRreo+Iu/y
 7k/MzwpTNDILYdZKPqL+r+Sb7Tu5UwpWegIvpKUha/MSM4r/WPIa2rh59dDMWgiIIG11
 6Y5A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro9aqFJ+peKTv0F8v/obfXxjGtxqjNExhCCm9zzS1N3cwSqTGIRDMyvI3t5+2KYGmqAt0x9BV9GvW8=@buildroot.org
X-Gm-Message-State: AFuF++mbPV722u3hZJ+VeLIUpNAhohZJ1sYjqQZ18rqug9zwf1KUSj1a
 UU3CsL/r1jEOU/NDDIoymwCv/PJ23KiJPkrnns0r2Wk0PvXyGf88Ef8mRyNo0XCIzXvkyhWMPUy
 yNALm
X-Gm-Gg: AR+sD13tt8BNdtnOtoym1BzQsQQ6bIcIELKMhcfMQKtDluTKlGkDXhB+VdYaZ8WAhBa
 lJb0rZh1ogM1JT0/io29DZUcefxpou4+CeU38NVjJR9uRXK0Gwp8BBFZHsJyV1dpxALXqGuYlsW
 kvw7QIAT7U7aiZek2VBUpmuEdnxe8r2P8rNUPHpjeOU+Dyq5TjL+jN13Tsk3bYcZRdH0+rf6/ZD
 Lwj3gXK/oAzX5twPpS8b+qePKUxugTb4Rx4N10uuLDUiOfmDFNk4mw1ULWwHuj77OFa55eEpxKH
 hbanDVW5osbuP/tb23K/D20nTKDAK6n6DPQ13JLabhhnvBwNmaji/YvihKeEoZ7FClTz1wMInp5
 uIrmJPrLccG5DDfTwbkjWKZfIC7yCmZun36A8MoIjA6bMxFmd75JSKH9O3cqCMXwZ1nBFVcG1kF
 HoAXX/TjgEF9e5ABzk9BxMBFlbCGnOVd2Sk/2yh90kTsWxV5sTtXmsnOft9r78qs9D3k1tWmQms
 ds0dM6ZjMn2E0fT4yeBeLA+8aokQcNuUGeMUk/vcY7nHOZR
X-Received: by 2002:a17:907:a892:b0:c16:5cf0:3aff with SMTP id
 a640c23a62f3a-c246a62afb5mr1321949666b.18.1787402385226; 
 Sat, 22 Aug 2026 05:39:45 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249629926dsm259683266b.24.2026.08.22.05.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:39:44 -0700 (PDT)
Message-ID: <0732adad-be52-4a94-94f6-e9fd6c8f55eb@mind.be>
Date: Sat, 22 Aug 2026 14:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260816075345.1844714-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260816075345.1844714-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 10.5p1
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

On 16/08/26 09:53, Bernd Kuhls wrote:
> https://www.openssh.org/releasenotes.html#10.5p1
>
> Changes since OpenSSH 10.4
> ==========================
>
> This release contains a number of security fixes and small bugfixes.
>
> Security
> ========
>
>   * ssh-agent(1): fix an interaction between agent locking and the
>     session-bind@openssh.com extension that is used to identify
>     forwarded agents. These binding requests were refused when the
>     agent was locked, with the result that operations that were
>     intended to be limited to local use only could be performed
>     remotely, including the ability to add PKCS#11 tokens and make
>     use of keys that had destination restrictions applied.
>     Reported by sn0x-sharma
>
>   * ssh(1): avoid potential realloc use-after-free in the client if a
>     remote forwarding is added via the local session multiplexing
>     socket while a remote forwarding open request is pending with the
>     server. Report and fix from Brian Mingus of Cognatory
>
>   * sshd(8): make the authorized_keys "restrict" keyword apply
>     correctly to tunnel forwarding too (which is administratively
>     disabled by default). Reported by Erichen, Institute of Computing
>     Technology, Chinese Academy of Sciences
> [...]
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
