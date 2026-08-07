Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DFC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C44E60A46;
	Fri,  7 Aug 2026 11:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTNtqM9p-wzr; Fri,  7 Aug 2026 11:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8938E608F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101417;
	bh=igk/xb4x0leWg1woH/mm8T5Wzn6toub/KvGqXlbyMao=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=h83x515HvXxaQ23zYgYlLN66Nok1kmOFdB2xPBtIPNUKLfoARwkVmGS/pn0KsXAdL
	 ofBM94kZEdYP4FOJ6noI4PVUfprMmZ5or690vChst/7/KyS2U7iKya0u8OLUMi7ug5
	 rZa6ur4dd2K48aOmvchdCUGnREE76mdIw+uMDNDXNCnwze2uQBY/1dNsDkLLIHF2nj
	 k6Q24j1wfhD64kq5bFILCgNtUaQ3mJM2HsFYLGmjbt5DmNDlfEKXBwRe/2V1UQ/nSw
	 wcBvfR3Y+hhCmVbifUTGrsTz+uUp5hjWuV2MAji+4dsI6NyHut5D9OJpq4oQjD7+lt
	 sezAfUANe2wGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8938E608F8;
	Fri,  7 Aug 2026 11:16:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C16E282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425DD608F8
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9L3K5J9CHWF for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68BFE608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BFE608D4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BFE608D4
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:16:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so24351195e9.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101413; x=1786706213;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7q/k7/zUmFxWzMu9jvw1maLwThW2FxHG0M8LPiYaiW8=;
 b=rIpv4JIP2loACyKYnEbqBBlvSiKVTEiheluXXe2nJDbiO4PsN9GqTr4/xsxE4sBlo7
 ajURxSa+1X5prC8gnSV/KPGmFl88Rg0r2lDIcwkFA4NQP2jNw4+ECLbUm9pjpihz6qVt
 XTrljHaYd2Vqp/XV5sdTtlFv8lvFsuIhIzbdFeVv0PYfPAFPAbpL8YETa14tGAmZIG5N
 HnImJNqK4N2P0Kf0geWgfVq1lerNtLhKOrj5Dj4JL4lzfoMyiIIi1gpRcGvI48iHoy8C
 bB9mKtjMwfGm+1qnrQJMNOan6zPmnfZyVGQtjH/y4ZghIUITYPryFC/MHmxSZgk6fsQg
 0Pbw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXU7IkpnfiuzvAIPs/adTSKhQNcrj3yZBhEt7ohuubbu2xBqVA25NxYcgVz34CI+popCPu86+hSnk=@buildroot.org
X-Gm-Message-State: AOJu0Yz10edjCx+sYHAEepBbMEe5ZhouorhTZJJdXlv0ysS0VFtXgG58
 +GsRd4tEjTcJou/QLnOcZRiSiLCE4V7qYWzmFJKxQ6GZqUJggiqoQrhUwe2uiHLbzEI=
X-Gm-Gg: AR+sD13VUGR4zE3zeZs/H02foh3FT/h8hjM9NXJVfKTpQ529qnT8/4qxb4BZNG6Ysf+
 2DymdmYhvHbJrlKmCmiJRd0HcA2E+ZPxBSKHKcSI42wXjO56da9LxcT12OJMDkwMNxlBowkRiCE
 DqnDXt6WFq2PbwVgNsUcz0S5dafBX5IEB0u420ZvKUiRYDqFDiIYD2oo05//Ao4FYUU2uQx0rpz
 cK66F0wyIwNLZU0MzoeL7ry2hMZJFSudMlhgFzs3s3qouurrcXpGybIE3gCF6iyvSN5TE/GKAdE
 1IKMQNwtQfzP4OnLRU81NCJZCctl1OXOsmDj2M10lbd/ckXgDdLF6zD41eItRiT26jhHTqA9DtT
 sQrhK30M1jAVHNceNY/R22yo9wr3nJCdXxAwNS2soeFdkcpcdxyZ9eT7BIZaNQsUIyyz0hXVJhh
 tQLwV7ztXGS44u6eDZauFbG9/Aii8nw0JFbiY1sQcG8Zgp8S3Hhl2BweC/iQw1sxSG/86tamu8t
 GsOtZVtlJNb1fTUq5xfkSNgdhzS4rEYq1Q107a3fS2723WB
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id
 5b1f17b1804b1-4995e084875mr36067315e9.7.1786101413442; 
 Fri, 07 Aug 2026 04:16:53 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e8d50sm4815306f8f.24.2026.08.07.04.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:16:53 -0700 (PDT)
Message-ID: <1ba96fb8-24f4-46bb-97d7-8f6c044ecf30@mind.be>
Date: Fri, 7 Aug 2026 13:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260704085239.2901837-1-bernd@kuhls.net>
 <20260704085239.2901837-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260704085239.2901837-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101413; x=1786706213; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7q/k7/zUmFxWzMu9jvw1maLwThW2FxHG0M8LPiYaiW8=;
 b=WwQx7HjYqu4rXB/nLt3N9ss8Q1fXKUOwCp0k17AlX5n2pL3use3JeJARWPEGEXlfPk
 xJd4H620fMwEQw1jsmxC1m0soVzwJmS3nvsdo2iUo96If8DOygG62GJ46RqxdJEOeAxA
 xetas1+Y0AzpqzXH37l9qsZXc5GX+9SFTNUKZDFwishPzK23P0pDDhdOhqkNqKLj7a/t
 01/9PGLPYUIsDHjnQ3iNSAzXvWc1NAx7IUgQrzVSqe+urF1Lg/A1flAdPiZ4Ok+vD60C
 Fkh2L7nLewTSlljKlD9Iwju3HoRqE960g99rJTs5UDXZ0ViVC7rt9gGhZwaDng6V5Q3O
 sCVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WwQx7HjY
Subject: Re: [Buildroot] [PATCH 2/2] package/samba4: bump version to 4.24.4
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



On 4/07/26 10:52, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.4.html
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
