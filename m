Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C92C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 17:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C401781396;
	Tue, 30 Apr 2024 17:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqLmu9KC9WP1; Tue, 30 Apr 2024 17:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D06B28139F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D06B28139F;
	Tue, 30 Apr 2024 17:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73E511BF34B
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 17:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C67D406AA
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 17:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujkFmMMp5GJz for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 17:57:00 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB1EF4069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1EF4069F
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB1EF4069F
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 17:56:59 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2b27eec1eb1so797406a91.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 10:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714499818; x=1715104618;
 h=content-transfer-encoding:in-reply-to:content-language:from:subject
 :references:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhfYTQ6V5ZLHhdT+TdHcub0ftIC0VRFXLRtSk7nvTwI=;
 b=PAB3+lsgRtFIkRscslmmxVeeSRHgzHpW1Y6Wv7VfVvAVm4rcbEbiGVKAcmqrbWXUUH
 CBdfIEl04GLAYpzCyy2xpDnQ/NbfIK3kb5m3yZDNOT42J3veSNip39lSnFMzjldX/OZq
 rPEqlt23/1tmYuuEhrVRaw5ThzVZGztwjfbyBAf5hKVJ0oiHtG1ZK+gtncPPx3OxoEwv
 DcqtXo4yqC7LM2/dil7K1hyyVs39BPDGcvQFT+Ijv/irZHkxF6/HdLwUxcPM3eD/L0Qo
 JLB0o1UG6dN9/1EQ4uRiLpjlsfSgRbmqe7tMB4fOF5r13sl7BMDO7XrUBnqNCnLl8/K4
 HpLw==
X-Gm-Message-State: AOJu0Ywy+Y8j4iUPrV0+mazTQUQ7SuDAJu2vlHXHZxiCrwtePHItISW0
 xKcRg/pbVqMBFrSu5NLCxD/5tCsjMCM9YIqeWSateTtM0oR6se6dtxySUJkrWsMcqC0pjWpeaXR
 9
X-Google-Smtp-Source: AGHT+IGIdZc40wNkyfzAimEsODqmLur/i2GQKdnA9rCGRNQtEVCbzcLMAV/rMf5Mthfc0BzDP2LB+w==
X-Received: by 2002:a17:90b:788:b0:2ad:a7b1:2d0 with SMTP id
 l8-20020a17090b078800b002ada7b102d0mr207104pjz.17.1714499818144; 
 Tue, 30 Apr 2024 10:56:58 -0700 (PDT)
Received: from [192.168.2.93] ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 em6-20020a17090b014600b002b16d9ab430sm4849013pjb.3.2024.04.30.10.56.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 10:56:57 -0700 (PDT)
Message-ID: <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
Date: Tue, 30 Apr 2024 14:56:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20220917205253.3737d1c6@windsurf>
From: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Language: en-US
In-Reply-To: <20220917205253.3737d1c6@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1714499818; x=1715104618;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from:subject
 :references:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhfYTQ6V5ZLHhdT+TdHcub0ftIC0VRFXLRtSk7nvTwI=;
 b=ckrKAhrrGGT8eNn5ZA7Jiw1MynN8F3ODf2Gj+KyxM0fMKcohEZqSF5iMDAKz4fAoOv
 yua3AAC3M5QMQq/VIij0js7KJicpu9UediF8mgVSrX2pF2CyM1/ctxrR1dOcEgZlOxdD
 UXSle28Q0OrU8mgPe41fqmjk5nApjSUwDfz3RooygcUrvrM/66oKzbvw+n2F5IBfOzA1
 oxsFL94/BqAaK6UZlghgBUZDNqwmd3kUM/flJWjCydE9nSNmMXX9u7Uvdlp8S4wqNH/B
 z4uYSTK+znnQKqwTAXHbaszEVvJyQ4m8V14hEgvNSZcDLhwxAoDFU59r/rip/F/cML8e
 +ULg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ckrKAhrr
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry to necrobump, but such a feature would be handy when using 
FOO_DL_OPTS to ensure http authentication.

Tokens, usernames or passwords will be leaked to the fallback server in 
case of failure of the primary source. This could be some source of 
vulnerability

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
