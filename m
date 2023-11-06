Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78613C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BEE741F7C;
	Mon,  6 Nov 2023 20:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEE741F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJD1IRA64fw7; Mon,  6 Nov 2023 20:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A30241F4E;
	Mon,  6 Nov 2023 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A30241F4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1251BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450F941F4E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450F941F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2mxL_HcOgJh for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:18:10 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5132841F37
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5132841F37
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so1191947366b.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699301888; x=1699906688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKd0iHTVmVBgoBgcrTnh7KlHnFW5oIhroLPlk+EppHc=;
 b=dJFZpluZc6pMX05vV4UZclJMXYekgV6jVXSyOTAUielBhwktkMg/2kChUGPc6LmgXp
 wSr0kqwxkwj2O5WlzczYmBsb9H6w4clyNbkTyuk3whkNGWdWU2X+i6iKxQMAB/G3CY+x
 6JEEIANTGfgn5VZPvrlx/++xar1oU9z++jvcQZYW7Dy3W//vfDFZNQmjx9VBFBIabyLn
 lkYMrtMc7J/Xvk/c8QfVsjA2YU0H6EC8kK+yH5escNKqr9qOgVtc1meHpsURokVGg/Fy
 M/O8PIy7de5YRzSKFyl83XGvTL+9J8q4rXG+r6pDHMXI3/SVWTXdnTDtf17GtCr3yosK
 BP/w==
X-Gm-Message-State: AOJu0Yza3lVdICeysuPKgmZMzglMvV2dH2rcSFrDpAI7OlrggSVI+2Jh
 xPZnuFdr8MOvYcQ1umQkQ92wD60OuNMcJFNngBU=
X-Google-Smtp-Source: AGHT+IFxqkHnNrkvIIIFOLAhFAKLFSgf4pknpIED5tvGRDEVY5ieGZYS9UKPk66enPmQ5qHzA16vYA==
X-Received: by 2002:a17:906:19c:b0:9ad:8641:e91b with SMTP id
 28-20020a170906019c00b009ad8641e91bmr510841ejb.11.1699301888144; 
 Mon, 06 Nov 2023 12:18:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a170906448b00b009ae69c303aasm210146ejo.137.2023.11.06.12.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 12:18:07 -0800 (PST)
Message-ID: <0f681e5b-2522-462e-9f09-f86694a2d3dc@mind.be>
Date: Mon, 6 Nov 2023 21:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Damien Le Moal <dlemoal@kernel.org>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
 <20231106084314.2458b0c3@windsurf>
In-Reply-To: <20231106084314.2458b0c3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699301888; x=1699906688; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKd0iHTVmVBgoBgcrTnh7KlHnFW5oIhroLPlk+EppHc=;
 b=MhwAnrWhmeS/PwFdfyadqRqILno9SNdg6eK2os+d/Nrdpv7CSkfEin1LuABubQ3sVI
 4l/BbqYu7YIVKdHRodd2LAF+naz66BML4LkP2QXIXcAGoUrP4dZ05WqUJ8WlEXKw+cxq
 raVUf/QkJT9SqTAIzrtkdASsWRusFTuGk3g0LZzWZmMl7+sQeR04L9sfqN/YXskqkPrQ
 uZg+DoLb+yHsyNdLfw6gso8faXVA4pFYmW7FXBxsnyXs0O0XZedOTQrzpXYVophOqKgx
 qfbX06h+wd9/4aSqdmWJ6raqlF1pPRooO39rJ3guxZDj6ZH309Wim4+swzSP+Mq3+xYY
 pf2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MhwAnrWh
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/11/2023 08:43, Thomas Petazzoni via buildroot wrote:
> On Mon, 6 Nov 2023 11:17:41 +0900
> Damien Le Moal <dlemoal@kernel.org> wrote:
> 
>> I received a build failure report (again) for the RISC-V Canaan & Sipeed boards
>> configs. This patch fixes these build failures.
> 
> I need to dig deeper into this. We looked into this issue with Romain,
> and I believe our conclusion is that it was unfortunately more complex
> than this, because in fact BR2_TOOLCHAIN_HAS_LIBATOMIC is not a fully
> accurate representation of whether gcc has libatomic or not.

  Even so, we could apply this already as a first step that fixes many 
configurations, and improve the fix later? Currently there are quite a lot of 
configurations for which we simply can't build a toolchain...

  BTW, Damien, you forgot the Fixes line:

Fixes: 
http://autobuild.buildroot.net/results/98f/98fedf4969c260f73a01b937b9625e66dcd86b3c

(there are about 10 failures per day on various architectures, I don't think we 
need to enumerate them all.)

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
