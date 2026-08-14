Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8173EC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C6B40F0F;
	Fri, 14 Aug 2026 14:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqMQe_j_vakF; Fri, 14 Aug 2026 14:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB7B340EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717273;
	bh=8eKBadUGTjNJH8RYJa3svJjKJVlMGx8uJ4SUkQPYguI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iYmwGZU0RSXZhGe+hyDNDW/jU75fddB0/wWN8i4Gg5ZsRaR+ewoJPdbd0Vrr86eOO
	 BMkjeD1MkOpeTfGGe1Qj9Wpr8D1GBlH4TsjMsXPxpg60AaS4L6Jhkxxv4QHzcNvig9
	 SIM3l7tAtX3Md1ZRty/Er+MP4jR6+1feJAD3RMeduIhmaNmCDTpzI8YHNXcJpSs31k
	 WCUIqEmMWtQWER/wm1eF7TmgtucLYO55IoTxZfH6ZojXEcwiQwHGeS2G7LiU5L2ZGO
	 TFcUf8Dy/xv22kSmnc57QzDEZmCE7ez0Kt4SWTNV6G+dNpgf8hgRSKhYNR/Hx64Ets
	 2N39UKursVA7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7B340EF8;
	Fri, 14 Aug 2026 14:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F77A3DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3630C60614
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjHWoAwdwNXS for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 635B9605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635B9605FC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 635B9605FC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:21:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so937494f8f.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717269; x=1787322069;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jdu+0aad9wz3w7oRgOjF+7Oh/gCxmCAkJ3QykbZ57h4=;
 b=rtrfk1oyZjMv3pIhoNeipc9/wp3lTfFt3vM8SfxwCRJrfUrttARFdqeKIVYFheZfd9
 eGBXUWpmBYABhVZuljb2DT61uU13gTFazBkAYzUR4IvHpuJOVUnQXrL8jDir5nbWE1Ud
 t9dN/eZCD46XxFQN0aGV5V9Q1ydimCJFZcoU4GmiQ3pOoJgnQ6u8+eyd0oW6eiWMuUlK
 7SS6dGIj0DFOZWtboKdNuSzOCAvLuiKNmFud2h5oLaht166Bh6dj851aZL1MCeKALnPW
 VNIjjWMXeXKO/6KvetOHRBiIi+3m4m21h3TpNKKGs1x5RfRzHHqdxLM6efENRVVJR7Fq
 nfKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIZuNcwIfVy5nOp6hczNf6NiKB9GtFs7Hrlsz1a5CxJF1fwcSSD70VXaLCmqfHP7e6ZZ6z+CSv8fY=@buildroot.org
X-Gm-Message-State: AOJu0YwE5O6ktlqyQM3F3ZkvbKgc3906fWT1+DTbYocg5FPle4rfYuMV
 5dc90OM2jWUqARbRNLHVTN7AFyKFZCLrsWPWiTtVmK1PCOIClcexidDYxbGgK1/axao=
X-Gm-Gg: AR+sD10GgawXDEdx6kqgGC1jajPBRdffO2KXu35RplKG6nm5cCv7DgAN3JrgmI65iQa
 PoJvyatR59cyhecjzJgwRdRWHrOtUsZ7VJZXgKcEUJ3ofw7htpxwS2uLDS//HSGb6ZoKScDUdw9
 hmGj5irweyCedHEyXu2O20jAGfFcInUyFSr3mXUeLCFOpXsJXrNN+zef0rLaLm/nR9jEcPM28+S
 nejxjhjkX1avkUj7J8CCxvOCuU8xFB6lK5f1hGC4nwHB68KH6w2LyLLzE5YCjTo6FETdIXSYohz
 wj+QkILntgy050ozx/tBd9A+yjhMnnfDdSyV+C8y3sXHxY+J5V11BmCtp6l2v3A7i4HIuLqtpGT
 qsmBKpHuH8kfMV+7NlhIoBhRoZ9GejyqhEHM8+44GyL81fUTZ3v2pVbO498m9uejO3yeVUXHoQA
 vDyafYs0tqMOU3EBBtLmDebOqn1jqw+6fgy0uNYHmarss6yXqoSUwmlkRWwMQINuIMYLRDaKyoV
 qlgWtZz+XrOD+DXgU+CHctoeXFDM24KTm6yGNKEguQm3eOo
X-Received: by 2002:a05:6000:18a6:b0:47f:5ec2:d54 with SMTP id
 ffacd0b85a97d-481607351d6mr10542110f8f.5.1786717269295; 
 Fri, 14 Aug 2026 07:21:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f219e12sm7726289f8f.10.2026.08.14.07.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:21:08 -0700 (PDT)
Message-ID: <61f3cc3d-d1c3-4f7b-8ec9-76f92156fec0@mind.be>
Date: Fri, 14 Aug 2026 16:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20260426143818.1517033-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260426143818.1517033-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/stunnel: bump version to 5.78
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

On 26/04/26 16:38, Bernd Kuhls wrote:
> https://github.com/mtrojnar/stunnel/blob/stunnel-5.78/NEWS.md
>
> Removed patch which is included in this commit:
> https://github.com/mtrojnar/stunnel/commit/1c06022093a4eb60aa1754fecbc68b37610d4b4d#diff-0134ab37004b3e923ee2e697976e032c32b114839ca0a697b01111d1381e8d08
>
> Updated license hash due to copyright year bump:
> https://github.com/mtrojnar/stunnel/commit/4c8a77e374ae3326a52d2f90c1e5248079aee008
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
