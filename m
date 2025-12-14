Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E5D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09E66070F;
	Sun, 14 Dec 2025 17:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cTTwpjLiSH6; Sun, 14 Dec 2025 17:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B56860D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765732969;
	bh=n5TrPzae8vKQfN93h3wQzkXntI3RwfZV/raAmv6SDq0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VRs2LTMS81n2kF8V2SNbetYqGZuF12pKNEFDBNjZBI2dnhWT/ecT/wkrHTUoV6cIt
	 9wuHxZkuMMO/jgv6Ej8o50aXUJT2SMq3Q06C3NKYfwikrmado9exD2SSWGwlV2R97l
	 XhdDbm8hJy5ujrmYKhjwlZYyU9cO0rMG6T4yfb0mZClfQJhDN9/fpbSfh+G4fgR09K
	 HtJDWZ3vuBxUX1K5LdoxdAt0W2xAiiyrRcRGQbgaBwC6OkA5hmg6jT28bIxyly/K1t
	 hWhfYV2EoB+sKuUOgNsSvoH8HrU5rtqvEw70Qo2QR7OXhEa24qaCC9dSG0wrwYZTrQ
	 a2bQIdTX3zhDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B56860D94;
	Sun, 14 Dec 2025 17:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2313117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF16C812B1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IpWDHjT7L_I for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D33B812A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D33B812A3
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D33B812A3
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:22:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b79e7112398so559261566b.3
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 09:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765732963; x=1766337763;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1WRvFOigevP+jXZuzNf84seFIMW2XdbozARNUfzfsQc=;
 b=SVtvsY8UCGIOuA9I0r/nq/1JmC/F0TGbNlefNZRPN/sZt5RYP6rw5YTts71sc+SGUV
 dO769xRMHyv93m8T56zCsLKNl9ahgsI0xfsv2Ikp5VezlERZDtzKZnN7yEx4+Xp54pi2
 8bGkRlROA0mZDRbUghu/Oc6P/+dL5clfUL2hXrstVskd5CMxb+VvQSTUfOufM9PdMG/Z
 EV+r+fXzTMFJgXU7tWy4Bb6sKCOaEMGoUMN+TEHC/9H7oTEXRtoh+UwF+qPZ9Eq4E9+b
 XOc17o28fEq7kB7sGCgWlUf5OFZ9q1LLC+bzOn8I0qj+Yh31eiy2JFTk0POTBifDwHA/
 KEmA==
X-Gm-Message-State: AOJu0Yw7XMqDf3RUK7iKbMN+2A1o/cbbGLZ9W0MUSXQZiNdXICvwR++E
 hoxsZBhorxGQ/pVU1ferkjrupDxrLINH12U5HpwKxoOVRbwJy2soUFVZlsjOBwCs0/R9DLduJ+i
 HdvBqEEY=
X-Gm-Gg: AY/fxX77DmskEua+2Zi3mx0SZdwcCNEJcZAtswKETUz6R8wt0kDG++5iVrp5jK4Fdfk
 Lba5lKE7xn9AfTnWdPsMmDhWhzYdhq+ou80syCM45QEP7I4f7BtKHyfHxEyeT9vED7X435NycA/
 cqMaT0GeJ2nZi1aEqesKVFrSGgCuDAbQPhYt/Ivpn6Y/8vxl1tPcR1V8BOh0MsrNvczD+Eyrc8e
 w5Jd0CsdWvjTjwknGbUdSxfZH3sIu7oG3fXEsbwe0UELKzgj4AnKUsjYTGExzeTU00a1zqzpmIy
 yzfSTABRcCVZR6GjO5bk9m660r8OFzFw2C03nyvwfLYfGhFM+cWf7r80ISn0UDXb4WDFWT4/ZwA
 WPKgfmn5hbgkK4QkzGMKSPDKdK8LzQE8ORIIhyRBHQMuYIjmiFoAHvJVye4Go8BtgN8Dh0+9ncD
 Sg1XM3lvbwv723vqCu1P/6g7CApkn6
X-Google-Smtp-Source: AGHT+IEUXi7efN0aqRRGAg302Nx7UDrm5Gso0Xa0J8tj89/YYDtWH52SFZyhd0VK8N+Wbzg6cWPrUA==
X-Received: by 2002:a17:907:3daa:b0:b73:3f7d:3df with SMTP id
 a640c23a62f3a-b7d238bb61dmr913778266b.41.1765732963484; 
 Sun, 14 Dec 2025 09:22:43 -0800 (PST)
Received: from [192.168.4.20] ([79.132.236.244])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa51757asm1162138366b.45.2025.12.14.09.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Dec 2025 09:22:43 -0800 (PST)
Message-ID: <661f0535-6479-4a8e-a308-524fb54cdc7a@mind.be>
Date: Sun, 14 Dec 2025 18:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, bernd@kuhls.net
References: <DEX6TV7YTONH.2894RB8RUGLHM@bootlin.com>
Content-Language: en-US
In-Reply-To: <DEX6TV7YTONH.2894RB8RUGLHM@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1765732963; x=1766337763; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1WRvFOigevP+jXZuzNf84seFIMW2XdbozARNUfzfsQc=;
 b=X50hRG4kcNMWFFiZyBTdQI2aUkeeoePk2Qt7ZL8jr9y5gSsZKbpZfJxu8wtgyvDza5
 YDS/RC4LGYnBB85K2zV8ghDZwRpEeSTdhuWR4Z7WyS50lp4SnbhLnIi+KflUS6Gyau7y
 PJc+DKlvcVg0XB60v67eS8DyxmLL0Uok81aeurCDn8oSNyEx4PVnDN1RCtVTWc+RALz7
 2/hNqL4P6/CHho2EGq9WE7TPhZNXGQ28e6sj5kkGWdRsNcFHSuAictRdvNnktwgr4hce
 NZfYjeb0zXIDDs1Hv+F4CKk65yowsjO3gH9zXEbSlVn5YIW3MBtE4TM2fwU0Bjd644lT
 3XTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X50hRG4k
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This patch should have been picked indeed.

This will be fixed on the LTS branch on Thursday. Thanks for the notice.

PERALE Thomas

On 12/13/25 4:18 PM, Thomas Bonnefille wrote:
> Hello,
> This patch should probably be applied to 2025.02 too to fix this build
> error :
> https://autobuild.buildroot.org/results/921/92123aa8361663796d5e27188b21fd6338b4f1df/build-end.log
>
> It was fixed upstream in cmake with this commit :
> https://gitlab.kitware.com/cmake/cmake/-/commit/c8143074cf3954b1e169904eb9d843cfbe14acc3
> which was applied in CMake 3.31.9.
>
> Regards,
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
