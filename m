Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F696C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2523140DD1;
	Fri, 14 Aug 2026 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kc1RBVwqD54; Fri, 14 Aug 2026 14:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED8840DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716324;
	bh=fknm3w/ZjE8PSfShOUrze08Zx1NbXQNWb9gPtyALBJI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nzkQUs6SrQMoHuj8UstEEpdNBODwK5x+0z4PWbpuuqJCdho/li5u/HjsogxPWSOKM
	 6OoRI0QFJ4ZXiuARdXhj7JpDqND455u7oYQqv1tLS1DsZ+hmzTWS/5wY/4V9VITv7k
	 MhazE0cQwvEhw9N7DrFzoxarS4DZChlMf4hmlJcMWIiFMCLoy/QfLr5p80bs98DKj2
	 +2Mi6MRHPx3za32ZW5cLZk1w6+/ffrYdweXU5iNgWv3lP7RDwLXizBdddNs+g4RA3F
	 21yRYSOwCtMaUV3F6HBvu0X35UjgvEqETjqLnnIikfZnnuB1kFFc85k9k63zCUPTds
	 ng4GAu1Xusagw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED8840DC8;
	Fri, 14 Aug 2026 14:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88CE2B2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFD940411
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LYBFMQ2Rb27 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BC70403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC70403B4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BC70403B4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:05:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso5668765e9.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716319; x=1787321119;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hWOH/DXhD2yHiH65HCqUYjairLzUzyYyyGk9QDWLLHM=;
 b=UQl/0/svuOx3ESd0ZCD+UoxkaaRvELQmXWCKC318+TmtLY+o9u2sbXkdNHxd2gIfTG
 pHxCzqqbLIluyRV3pL+WYj8jFF1NiQh3PXTgLcaCF69ICS3Tn3NwN4s2jR0a8DZ+gRoY
 u//LYc7S1SS9QdzSE9Ov2iF3NLC0nXM/BB0zyjOqvI4I4vp0WdqSEgwxQblEqEhcqFP6
 4IJbrN1NCQUg+8QDOM7Laiek3sbIyOm9UF0HU1wBGLBbP0jaGvPEmjheu5A7HClCEcDw
 cv7J7AKLVRUySclXz02uN6AbVG/nzbf9XDlukBC+lq2sXrfGxltpyQTKPXML6mmJGjI7
 b1ug==
X-Forwarded-Encrypted: i=1;
 AHgh+Rod25rQHkpzv1x5ZY/GynVN5BsAwcIOQ+drnqffnswMTJDfOwJsPdcgvlXVLFlYpwCiS7f9bLGOS+w=@buildroot.org
X-Gm-Message-State: AOJu0YxA8Lvpv/p4oQ09z+HtFV4LD4Oyv7VgBnIPQ/0ngxxVs1uJ3dly
 NtjGCMBu1PCC6xXvrmusdYKiadT6Wtu8n32fUCgB9ANNO4P9xpgT8LqhVYS73EDPZ7qJkOmDM1a
 qDS4/
X-Gm-Gg: AR+sD13Cnn81lUYNUr8d7yuoRJdcZ12tePJm49dhB2naP1N65P5/8zR6sFXC2Zgx9qu
 gTnnR9b0V8JIHTo1iP1Ay8NVy7yaZeUf44hUkL3kLTpreO3T+Oz6Ef0tKqpmYA/JkW09Xc8dOwj
 r4cN6Ty9Rc4qUl9d7G+7R2DGj3ACNrtsYW5NaLLhhbbrkP0xgb++jp4r7Gxm+wMFa0U1zEj+K9H
 bv2Ywyj/obmCbesqqC9FVPdvD/Tzz4sFlI6x1tm6GZQ6Qkkqz1BgMRRwRea4bOTUpNDzQAjfUFQ
 Aj3WpT2jk9XAV/PqjZdDrb5oF5jgN1yYHQbiuQzbdUZ6ValhBWJL/TMtJXWnIQc+qhRy2YB5yn0
 TOZuKV5YMskATuqlw+TQyNkKnP22ewkQDx8KYetZzDXjIlcW8JWaXwbVhPsQKOOl9iIekoR/e5Y
 HjKMHhqWDF05L1o7rgBltnk9xoXcel9tpwjKwz43rn6KYYTWKvqSFkapdEuaA9/kOWh+Pu4qDIW
 JeNCb7SIPe2QQ1uy5NTfkbHRCdQFLQ5DNtCf7lLIx5HWff1lQ==
X-Received: by 2002:a05:600c:3acf:b0:499:728c:4704 with SMTP id
 5b1f17b1804b1-49987979c41mr100376605e9.12.1786716318648; 
 Fri, 14 Aug 2026 07:05:18 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988af1068sm59443055e9.8.2026.08.14.07.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:05:17 -0700 (PDT)
Message-ID: <51e9c0df-8196-4dd1-ab2f-9615035aeb6a@mind.be>
Date: Fri, 14 Aug 2026 16:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Vanbever <fvb@funkworks.be>, buildroot@buildroot.org
References: <20260803115121.378977-1-fvb@funkworks.be>
Content-Language: en-US
In-Reply-To: <20260803115121.378977-1-fvb@funkworks.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.16
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

On 3/08/26 13:51, Frank Vanbever wrote:
> https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES
>
> Fixes CVE-2026-52761 & CVE-2026-52747
>
> Signed-off-by: Frank Vanbever <fvb@funkworks.be>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
