Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A0C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A307940D18;
	Tue, 18 Feb 2025 20:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIXCn7sncVZu; Tue, 18 Feb 2025 20:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A55440D05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A55440D05;
	Tue, 18 Feb 2025 20:18:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9042AC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D99B40D06
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfyoPIHJzYQM for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32E9940D05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E9940D05
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32E9940D05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-439946a49e1so8185445e9.0
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739909909; x=1740514709;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JviJTGuDuCmxqUy7jmineb3BKPVYCJi60PJVbjuD2c0=;
 b=CDDF5Agjy1ZaX5XXLeBhEy/BYqWlITBFJukMfNygJzs2270sKxK3RiI7f5Eg/bSGwT
 sotPsJTdjIs2EjhMSwR2597mTF1bndN72wrL+oYBruUNJyP/lrdaa91PKZmCHZyxYc3b
 KSLQvc8g8jJKRrppIYs6goxS6EJFu+x5s4zm1KPTfO7CfZdGzLWoZep3EFEQ0op+YuSx
 C/CBLddrIW4/TBI0nLzC2hFz8V4on5+aYqtIWCbq7kIxhFyLR3aK94pO3fT0fL5/BHkQ
 HEgZRr3gjT2HTNyMZNP4tyliwhdkRTMB4mPsSO+DGYvVE94/4mIjDHtbtTJ3nCLLF8Ce
 Rn3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiEVNdSGFC5XMnlDtGFw2AbbmeacEtQGQjRgwJIZJs33lc9sIlVo0QDK7k3HwEXSKmQnR33T8VbyM=@buildroot.org
X-Gm-Message-State: AOJu0YxmYV9+GEp3dJrtdrG9KBWJJyCCEG7mDKZBEn3hlgvMHYbLsr4x
 R0VMMLhRxlnJb+J8faxlL8eHT55KE/jvlxJgPoHxiXvlujaqZ/S4nJLOfe+kfLhKRkBzdoQt7S6
 S
X-Gm-Gg: ASbGncu+E/ngF9WZZ4uTGIViMr62bJQ2uknBCqVUjwn18cDXmTzW5KlrHWhDghCQwZ3
 Aq+0Ktm2A671Cs/R0oAVLbTFm3/HBkLUk5CD51mRU71BGHC7JSjZoG+56ZChbkKgjeEiFdMfPN5
 UiLZPRRq/71636j3fqjHsf/FkgzCPyLcmZyRGK64Rh6WGouwCm6gXMVTcwx+b4oWXkESYEyp/Xx
 mIC8G58rokuNw16hPSv+L/NZyLmFwllnasIiM66FNJqd2eYdHqyP5iuJJ283SixmEHeHhviLD6o
 m0jXrRy0HWhdtUB5A/34lrgKSJq2Gelhgs1ezdodik5epBHPBT9tBUAx+vs50+M+4eFOpEIedP+
 8zjLRMbp4LvDvcXaaf6I4k6rd6wnN+SmdUDNf2rAGy5pjbw==
X-Google-Smtp-Source: AGHT+IEkXfYjISQNysz5Dmuam4xrTTn2EghcwisZueCnwzKK4dn0U6dvAQH+SaKINw7jBWlfYH9ZaQ==
X-Received: by 2002:a05:600c:4f83:b0:439:69e0:fa23 with SMTP id
 5b1f17b1804b1-43999d76de7mr10294275e9.2.1739909909232; 
 Tue, 18 Feb 2025 12:18:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8471sm193849765e9.37.2025.02.18.12.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 12:18:28 -0800 (PST)
Message-ID: <de946a9b-0105-4a31-a0cd-f93970088448@mind.be>
Date: Tue, 18 Feb 2025 21:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1739865449.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <cover.1739865449.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739909909; x=1740514709; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JviJTGuDuCmxqUy7jmineb3BKPVYCJi60PJVbjuD2c0=;
 b=KKWGIn0FQIoOBdLXUBLqn5UJ2c0MN3PcwDPTBqsFKnqMMTu8xr4BMV4s1zxVqBhPqs
 Cl6Ml/7aT2Lq5gVc2HMlgmhIUEigq0PT7nNyilDvye61GcRPlMuwQvwnRe+Vbs2LRxsf
 Art4+zFbrjh43LlktYUxiURK9UcXZ/M7cDOarQV3/VNDL2KkBtKiucrTFpL1kJe4Z6L/
 mEvBYfrZwkbV0OYAY9T5DQUH5ki8PvHJI/PiulgRq94wUve97UsXkMQlwZ3shvsjTMLQ
 C8g4TXXJyBp0rM6nwwM0LQYWOILlE/2dyzFmHdY2ndJ5Tr5Qh29xrsB7I62tO2BIoUkO
 GFRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KKWGIn0F
Subject: Re: [Buildroot] [PATCH 0/3] utils/brmake: simplifications and
 cleanups (branch yem/brmake-docker)
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



On 18/02/2025 08:57, Yann E. MORIN wrote:
> Hello All!
> 
> This small series cleanups and simplifies brmake to make it usable with
> docker-run like other commands:  ./utils/docker-run ./utils/brmake
> 
> This is a follow-up to a discussion with Arnout when reviewing an
> unrelated change ([0] and replies).
> 
> [0] https://lore.kernel.org/buildroot/4876bbc6-4a3d-4b07-9329-7f5d4e9cf3c2@mind.be/T/#m5ad1cfae86426b29ff6f15fa0c643be5a0c70de6

  Series applied to master, thanks.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>        utils/brnmake: drop use of unbuffer
>        Revert "utils/brmake: add option to run in docker"
>        utils/brmake: simplify redirection
> 
>   utils/brmake     | 15 ++-------------
>   utils/readme.txt |  3 ---
>   2 files changed, 2 insertions(+), 16 deletions(-)
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
