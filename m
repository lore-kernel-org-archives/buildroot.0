Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E8C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8FE60A4D;
	Fri,  7 Aug 2026 11:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAfAzTCky_Jo; Fri,  7 Aug 2026 11:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7102D60A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101185;
	bh=POeafQ9u6kJCN+WFnuKQRdiZf0yEb2+P6zP0qxAkdhE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c0tQ+QmQgj9kXKaxq0ldkeaDnt2yczH7DW67Z1ibq+f1w7Qr9ywPLnIGVy9NNGVkQ
	 qb9YQkokx+bxyYMKWakjF44IOp6uStcAd3H72fRZo+Mt00oCk+ttJdfd+6FoYD+vbG
	 FN+0i9KqoJGVmv0gmhpqfeebBDj/eDUKS9DOn3eb1uuCg8gcA7mpVIRlBhva0BN/3y
	 7GSpD/k7/DTE3VTWBZreJlNnGmYTpDwUvmWj67gAobTX8HKbtpzVHJ6n+gC5JNn1Mh
	 e/a1YWEDKnH6CaFIeiz7Ow9qdChrWHgc+zTHgo4DGB+SLvWYjwIVNQ+g//iz7h2IJB
	 Zz87sAkbeukqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7102D60A3D;
	Fri,  7 Aug 2026 11:13:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 900AD282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8274160909
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D48L9tSh-6M4 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FB8B60A3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB8B60A3D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FB8B60A3D
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49555a0e68bso15838645e9.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101181; x=1786705981;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GSIk2o6iPt6t4FVUShGW9AfZkM/SKlYiNMxIGHIPzNc=;
 b=FBsYLTcxx22W5AXJOiHawO0JxxAUmSJQcm5ngthz2geXeZ42zHrfNd/QW8l8sedl39
 1zSuin15vWaFD1QKVoIRqLrwSEIFHH1B4SLkusrhNVt0likO2WV7/ppqWXjfthv9nFQs
 HpzXR4hKXcJBXnWHwGNjmrToC5BudB09jz41e6Ftv/pb5hwev8bvtbsyCXZolGd4ze2Q
 enA0T6HcFJ82eYSdJi1ssZYN5+jyQBCK8y1uttHpkDvWJ0Eo3xprvm2f2RhQBUpjcsGR
 mEyalIyigBwCLlsF7YpqSthm70mqum1J8USIjsiBFLxlH/lxwaBsD809v9WUyUZbFKI/
 5c/A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVnI+lRBL150MgSy6J08TlUEhkzzuP7k8ZJy3XYobSsktF1TESfL3fqKIFo/s/4mN8N+Q3frlu8O4=@buildroot.org
X-Gm-Message-State: AOJu0YxU8uWgPV1jSpPZfe29P9WPksR1viLV0UaEJaO+YeOqKEhRq6yG
 G8M38JauBxIeSuO647KDmURHtJF4tIlhwNjGa/hY3DtlykSLAkdVwj5UM54A7Wavsf+tt7au79G
 Urouy
X-Gm-Gg: AR+sD11cIBDTCu6G+U6qkmbz/i4jvBZ5IgvIRwZtrZOrup38ugRxd8JSy7cc4+TG8JZ
 p6WHxafGOyX4A4iC4UMkVoqz9HRAk9+cjIlwTNatUHsGMo4DdwTqCeYVqHBs7iJVabUFDVRtuz7
 DJ8pV5yVJysqDsDDap0IRPXWtG6s3CdJiN9lUsRHq2xksgJC2JRssYaZ1C2Z1X5HQ8g6zd/mB3d
 fTBvzBU3NxKtsJSeCR6+UdDMxUupTKiJ8YHNE8URX9uLVA8tfDxumziy1bqXqjvHMqS10UZCeYe
 p6wyeLqNj4TCN9R8qKLRru70VNhVuTVZwpANfSAxVKRP32Mee2MT3hlxMUMcA5EhYxaxlghzAAw
 fb/7VfYKGR/7uTo/k4Jpq+6qbZ8KN1FnXjw54CKZyIKe+JNsxhDz2wvKCErk2LrV87tx86fnPss
 X/RieYgUUnl4UfC8p6Wv5iudiM7irixmkiq1BzYSBwAnKX9om9tyj/hiBwm6+WQvVfCC9WyCbU0
 l0zsvFtJdc9DvLsyF5VMj2DPiuwysBW3Mk5BmDAyKwDu1CZ
X-Received: by 2002:a05:600c:4f4d:b0:493:cc25:9c0e with SMTP id
 5b1f17b1804b1-4994e7cb0e8mr289996955e9.14.1786101181502; 
 Fri, 07 Aug 2026 04:13:01 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021501bcsm4808182f8f.9.2026.08.07.04.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:13:01 -0700 (PDT)
Message-ID: <e4365911-ed62-4af2-843a-765677a0a885@mind.be>
Date: Fri, 7 Aug 2026 13:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
References: <20260728094808.2438837-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20260728094808.2438837-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101181; x=1786705981; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GSIk2o6iPt6t4FVUShGW9AfZkM/SKlYiNMxIGHIPzNc=;
 b=CwKmnQCuPwEsAngHtHmjmNHqybrcIYEQ72Kk6awyvz0heF09BYFIKrTdUX0shKrbh7
 uUZQ8HfGksqGgLL4t8NDdeXzyN9EBw5ujsgXCWc3ZQmuP5d2REA+KD9ghzgBZCVwXhA3
 FOdnwyzQ7BGc5nD5NFN8nXhk+pVnmeICqa8DwmtHNmI6DAZsyzAik4FaGN7oOpMo0DAq
 ELjT8Oj0nS0VKHi5E+zeEcXtRscDSPv5nOF1Ta6ffpw4JFy1knrvERK1s4DcBwlyfHQ2
 TIkWN0rxu/khogfrBIRHRiphW3JgkDDQWLK4TxwIodF4+WlY1HR0tG3PQ3BEdOrJ38yS
 Hh2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CwKmnQCu
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.7
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



On 28/07/26 11:48, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Changelog since 1.0.6:
>
> This is a bugfix release, fixing modest security vulnerabilities
> discovered by A. Ramos.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
