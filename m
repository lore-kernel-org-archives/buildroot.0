Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9167C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A140040E20;
	Fri, 14 Aug 2026 14:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXytCfCuKv3n; Fri, 14 Aug 2026 14:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A227440DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716526;
	bh=cpJzFcyvTXwUFXnf1qzmUGfrubYwC49w3mlhqDWFtbU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iXsPOYf6ANCh1NyS6OYM3X0YRl1nte4IrSoYvSakD0ZAUHl6MrIekglUMevnYQ+DO
	 ZqB5vVAk6zc1UTvd53pE0eG8ziNNI5Ix8w29zOOP2aBduVlFGJogRt05G1pPVGCbvY
	 9JLT7aMnVtseyfc/tM4YB7SEqr9rxpC7sIVA4LJl6+5rf3dSuo3hctCyN0AyyhyTV0
	 AwK/BN+pgs7aUWKhXtMm6ZX5mB90d14rcU2GGVVeOtA7K+wXNH6Y7vj13eNXaLCj5w
	 TRLzJVexWn6fFjhSICqZAcZMYuB7M+NARVJhl8pX0i+QsH8aJI7m/C9upisWnqZvrd
	 2fa49kCYm+CJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A227440DF9;
	Fri, 14 Aug 2026 14:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7D23DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1539E40DF9
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivG5geT00NdO for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAE0F40DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE0F40DF4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAE0F40DF4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:08:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso10421215e9.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716523; x=1787321323;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+QuW9kwNe/Q48YLRc98QI9pjuP9jH//Mcs5eLsyfitM=;
 b=mYFzYfkV0HxCzT149lVUXh8Qx//8H7pxZr9mV9twaBVU3yvDGypewtae6eutIdb8GN
 E/abj6cYfPXS3XxVrF/OsJ2UrsORtg+MFJqXxU4qNeF15LWvqGQbipA0s+l4eHQxqv/d
 3hD9TSVed1Tjr+bUiRYf73auxCCluBzVw6pmbEDioQi7jCnEyN8ooLfcfRCdxVtXOZBI
 RJlqQKA3YhTGmfrMqv0lTuucmfBNYHOuEP6+Is+cg9PJuG/ocWqRA6o2lXdTPXepgSCS
 ioQpTEzT1N3mevpjz0/Vviwij29BDzgJCSr8amxl1yCnnh+BfdTr3b2jl/FfX5LCDOhA
 w8wA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTVtVRNJyhrtCFj2C3jY9LaLcuYFAB3r2E82D6ph7b/sW28Px66Y/U4eCDm9ziTY84bTJUX1X0dik=@buildroot.org
X-Gm-Message-State: AOJu0YxPWHz5JYfCaDVTT4cDGjQcb/rw0+Gpa6Q+aosVp/ae4O3rkqsy
 +gwtcOxJF0LHvn/raKE9FLS+LvkYm3/bdH7vXJg78DCyZfAic7Fp3woulMqts5Irckg=
X-Gm-Gg: AR+sD10gk8pkeA5RIzvJVDEVG9kk1gdjFnZ1SBxf8ldyw6ptyKdpHlDsN40jIsWWmJy
 P2u5kZA4QXX2cGwBuzyMJKrITbOl0U8rhP6yVU8SBzT8g5tn/Xg1cqsTS+zH7sloXE2RcZOqn4L
 fnwuWtQPyj4rbcOa05/j3etrFjkNMMm9NgOGOjR20IatEyDC/SW8YQPO4q9mLhUn6StwUNtvTAc
 J6AY7JKixgzCU52WAHOcyP77c07D1aS3GLQRRNytMlSpIVHxGuvH55XSTFtV+1jVsa9mg6XgVoc
 5wvUpygO9OOqSFq093ot5MFkJ88WMo6XtG5cmx6x8ygYTHMySf8BTpLhfYYzETbjdLCApfT1za1
 eeBRj+5oCXH3Rilmt0uiQ3b1i4RfvM24BJgaQPOpP32f6ab/1lUKgvJeDI9TRegt0DqhXS+feje
 1lyIadIUvddBl3uk4n+6NXSIA8hdwdRmxykvQUcLeJN5YYszFeAIAbKbwo9nB+dLWC6njR3nTtp
 jKd5MCJtbtLxG+ETecx62RUdB6wgsiX6gpiGKbpJS42d1PB
X-Received: by 2002:a05:600d:10e:b0:495:4572:21af with SMTP id
 5b1f17b1804b1-499879809b7mr60742045e9.9.1786716522833; 
 Fri, 14 Aug 2026 07:08:42 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b25ad8sm46924045e9.2.2026.08.14.07.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:08:42 -0700 (PDT)
Message-ID: <b362124b-fdce-49d7-b173-f3a43fa81773@mind.be>
Date: Fri, 14 Aug 2026 16:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
References: <20260706045206.2395575-1-troglobit@gmail.com>
 <20260706045206.2395575-3-troglobit@gmail.com>
Content-Language: en-US
In-Reply-To: <20260706045206.2395575-3-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/mini-snmpd: add sysv init script
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

On 6/07/26 06:52, Joachim Wiberg wrote:
> A start script has been missing since the package was added, so the
> daemon was not started automatically on sysv/busybox systems.
>
> This also fixes a regression in systemd builds introduced in fccdc6bd,
> when the package switched from local unit file to upstream.
>
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
