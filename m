Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08727C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A769A60DCB;
	Thu,  9 Mar 2023 20:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A769A60DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGpTOvsrGojJ; Thu,  9 Mar 2023 20:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC5A60E13;
	Thu,  9 Mar 2023 20:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC5A60E13
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF821BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 852DC415D5
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852DC415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Db7wSheb37k for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87175402B7
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87175402B7
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:58:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o12so12293530edb.9
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oaHemdwX9vc3fQUzerVGDKJT/H2n+Kslr6GJPcNrtsY=;
 b=Qib/OHZbrGrWxiqcH0dR53M57BL7jf4uUhjC9Phpl1FMYBun8oEiIzhwcsOBAv9AoQ
 H77rqikrdmfVPImXp6NR9zFCwM2cSqvc78V8xjlH2Ham1Y6fG1n7DUe+BfdpBy+zCpZp
 EacmNh1nL2tPRIxEDfOdXOByAMQcN5Htz4aEP1xzObhpml+AabWhMImnuP/47r/bop9M
 e1KEIHVOEhVyYziOvyzVW+JjJt5+YTMg0eG0SHtoCNWFm0TYjH4IevtbYwLk8QksIJ7i
 hZnNcw7weCs5a+rnoRH8kve77lNW0Y++sA1JRlPhECIF1WEsdN7gi1GGvOi/iBHNhSA4
 b4BQ==
X-Gm-Message-State: AO0yUKU6ZGyNghocmF3R8mMeJc+ol9zRn8F4JAu781oWOMb8ChMfTRbL
 IiKEuuHyTQYfpGYfcEZUaGUZNg==
X-Google-Smtp-Source: AK7set/vqkjt58GS4aFiZu7NA2waVqVZmY8sLUh7dscRyg0U+oHSkmBTMtPdRZOVE4GvYyO0OBBxuw==
X-Received: by 2002:a17:906:938f:b0:8dc:cfe8:da53 with SMTP id
 l15-20020a170906938f00b008dccfe8da53mr30457ejx.10.1678395510415; 
 Thu, 09 Mar 2023 12:58:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a170906195400b008cce6c5da29sm11888eje.70.2023.03.09.12.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:58:29 -0800 (PST)
Message-ID: <b4b828db-5892-d4be-c80a-0c00d7c52d61@mind.be>
Date: Thu, 9 Mar 2023 21:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04934E635705A3395768AC0A9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB04934E635705A3395768AC0A9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678395510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oaHemdwX9vc3fQUzerVGDKJT/H2n+Kslr6GJPcNrtsY=;
 b=NP7YqsxLZzrDVfhzJfUGHJ+kqurzHusPcO5vPsEYi8eIJ0rXBSK4+IAjpmEy99lhNu
 hTaq/owNl5wDNSSqJwmcUbe0urWJBfXqISeZK4GI8DYb0NIYH4NUWyZSaLQjFI4C00Dh
 IPKEG/NoRDjUeTpzvliINEII8N7ZkLBybxlEjdfA+G9b3XRwsYG31kMHsSsI/B1mZ2po
 GCN8khE0H5PDHKbXxE9oEr+kb5XGPnIesWHdSczAT2r9CKyhewuQZw/+0btF9VjkkdbM
 VkGjqZrMDKHzi0Jn4GFZdK4hy+nE22FGOK4ob922SrDpuKV5q+OZ1qhC2hlgQ1fKIv2p
 77tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NP7YqsxL
Subject: Re: [Buildroot] [PATCH 3/6] package/atkmm2_28: new package
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/02/2023 09:42, Lang Daniel via buildroot wrote:
> |+ This is the last version before the API and ABI change + introduced in 2.36.0 
> which requires C++17.|

  This sounds like we could use 2.34.0 instead of 2.28.0. Why did you choose 2.28.0?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
