Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92C8E77172
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC7F606E8;
	Wed,  4 Dec 2024 20:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bPRr0XWHUNB; Wed,  4 Dec 2024 20:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D84C60854
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D84C60854;
	Wed,  4 Dec 2024 20:31:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FFE01DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6019C81458
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTS1p0cv9B0T for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 892F581457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892F581457
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892F581457
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-434a83c6b01so1498205e9.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344301; x=1733949101;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9voy/QD7h9YD8wAMBKH1p34+nH7uSEXJF+CRDYGdIx0=;
 b=AhefjnhjvgvZyToArWzmPvyQpzbTukf3ID4J36HocRklbXcC2JEP0crS/G6MRmGf05
 jCQJLIfF6JnRKHFosLgDaG/Wd3w5v4N1d85POtbJphDiG/FAJisrYhoq6YRVJf8Io4Sm
 2qiNZhFGd6AX9XK8KT+RLXIu0Q9OgkcTLV2ZvH/43ujrspqBHX5UUihteH1woLoKjz/6
 QGrbCDqdsB0hnOL+cc0HgjJllwD3iXGe7Dxhf/vSV1zmwijosO/5pdE3xjtumRTvhofg
 NFi1nYQWQCpFOZqsiIWxSlojdRR1g9tWySXa0HoSimcYnkT05qNPOF1QCZ+osQYMGXJ6
 Nryg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNbP+IRbz7zD2i3qq2Y5M2h0Fi2TsdUXeksZRnHQ3HRbVF+AMa+gD/8Ad3WH+AyvZ1153j00QHNUg=@buildroot.org
X-Gm-Message-State: AOJu0Yyd+/vTt6lPCF/nb4MgbmOG70U7/slOFcjHT3jl7Wgu99kPcKki
 Med1F+7u/tSrhmYovXdgEOmYoozRWTCzcwtz01nQ3LYoZdptaXPHKAO8Z7OpWOc9W9MWTES3SmA
 s
X-Gm-Gg: ASbGncuFgFEpZBCy+Ns753wsT6oWpHYHZI57388jWfJxs7Z40Fr86ste3sh+/gSz/ol
 934CX3kJ3MINoelmsqrbP76pI3WE/tO0tg/gA9kzUDPGgHRy5qjbH6LA1KSP2uUd4K0cZgn2Su2
 sZ+tBujzOc//7KlZf/GHfUIVJ3IlSs0p1SpEUGqQUZ1ozS8kR7Y40CPTIeoleP8ALh8gOlfyRb9
 qrdDoTcDlrEnzOFcS6ULiVhICSCkiljoVLthiTV0HS9jWozHNJhMHeih7qZTOKDcs2CQKURE0Qs
 09U2vSeyk5BafaRjkAPhPlc2DA5Z7TYe4DMaXYLmfLHqco1EMTr8+phHshdZpwxuJBUv5oLNYD7
 kEwCK
X-Google-Smtp-Source: AGHT+IGqVWhhygzD8ZnoxQB0anNghlmfjUu0CFgDM47Obr1xedGy4gre+pyMqrjvxeQYWQ1TsIgkzg==
X-Received: by 2002:a05:600c:570a:b0:434:9f81:76d5 with SMTP id
 5b1f17b1804b1-434d0a06619mr63835305e9.22.1733344301434; 
 Wed, 04 Dec 2024 12:31:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526b375sm36296085e9.9.2024.12.04.12.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:31:41 -0800 (PST)
Message-ID: <346f6d56-22f8-4a8c-88b9-53a5e9fd4e50@mind.be>
Date: Wed, 4 Dec 2024 21:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anssi Hannula <anssi.hannula@bitwise.fi>, buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
Content-Language: en-GB
In-Reply-To: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733344301; x=1733949101; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9voy/QD7h9YD8wAMBKH1p34+nH7uSEXJF+CRDYGdIx0=;
 b=Er8ctDQ1+eHZN5pS0F+0iX2yjvwt2cMFGg9v4aRbjn5tYPlJkYpm9WT9GSIDGR36yD
 dN8C42a1e38kpn0fqABjj7WB2UgBIDM3UNPOoQa6ZhZqkuCM7C7I96rv+tRQz4TAieCn
 eBcMenEtPy7rWH53FgmH8WBPorniDbrHMZpnAF/jH0MgOjMDzt9P3QzSKbAVW1BQVZq4
 CretvQSAQx6p06A0TXZmpx2pl+j3SKEtPc2LDzfTiQ2fGkMjaQelykqvZ8WXbQaGVfE9
 rH1U/v2LK8KVxNPe1gyehX2UuoIou4BK+FGZJUXF8CaQ5ILLtIQWAw8G8IXcq6sup/+h
 zuIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Er8ctDQ1
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit
 dependencies without systemd on build host
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



On 06/11/2024 11:02, Anssi Hannula via buildroot wrote:
> nfs-utils configure script uses "systemd-escape" to determine the
> rpc_pipefs mount point unit name in the non-default case.
> 
> If the host build system has no systemd this will silently result in an
> empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".
> 
> Fix that by depending on host-systemd for build.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nfs-utils/nfs-utils.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index b757e3e51d..9ea3bae79d 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -79,7 +79,7 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
>   
>   ifeq ($(BR2_INIT_SYSTEMD),y)
>   NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
> -NFS_UTILS_DEPENDENCIES += systemd
> +NFS_UTILS_DEPENDENCIES += systemd host-systemd
>   else
>   NFS_UTILS_CONF_OPTS += --without-systemd
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
