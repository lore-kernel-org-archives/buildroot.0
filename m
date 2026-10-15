Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE7FCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 22:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC9640839;
	Thu, 15 Oct 2026 22:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSZ_zs57aYMs; Thu, 15 Oct 2026 22:32:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C449340840
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792103577;
	b=gvUlLBqLz2EFYCAOPwNq5PA/cDbB70ZB4aGedKEBcNu6obRvZCXEd92xENDR8Zi+tBXz
	 lPO90oFHUKL5js33fEERiB+19nLjiwINlk+Rq04y18VPuJv+XBjdSJtxBlofcvhj/Lwxb
	 YOAeee+/mN4VAuVgMGWpO/TUCJF8vwjJhKQstYu+pUTzoja3Ew3XakialKEfI/eNWWBlN
	 eyB7cn3xFfkbSS10fbzaWepWstul+6SlPg4cPbTN9/+hnUhC2GokCr/3capNE0H/I4BiH
	 52ULGLCWERW8oe9WXqhs9ZDeUJFQw6uv9E6NRvow4txzJPY9IU2uCrQ+4XSbbwb2LzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792103577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 X-Forwarded-Encrypted:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:To:References:Content-Language:Autocrypt:
	 In-Reply-To:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=dSb+zFax9CWimyPFLVxqe29JXwgsW2+h9kwkw+7DINw=;
	b=JYZHwDv1mEvSJFiI4DUqv19T03n8KBLpTaxptCQfpJCchZbM1fMaBPwoiOmcPasVFmbZ
	 38ihyHyf5T0CLo4Mh6ZNGDQwwGMTltRTnvxWZZxnxODPEbvvA1EIGec4aHngWIgRMbdj+
	 VkE1maAU4VUNjq5k8o0owN2lq4NfKHOcm9qYLODqWoq1ueLkOf4Jt+E0WP9HQMRu+hsDx
	 Z25uWTubRiJc/WBie+Trv+kc2Y0Vk9sszT1U8+QHkaYCQcco1TLxOpw/NECOQhgz7buo6
	 mauZMQzB77NRkPslsq672beQjkes3XXkku1m2aqEEvAZAFjm+IbLgcdSALTxsNlWktg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792103577;
	bh=dSb+zFax9CWimyPFLVxqe29JXwgsW2+h9kwkw+7DINw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=p0LWP/os5vDbPVa2N7CfrAPl5PH07YnZTZi9/21PRBA66XvSgJdPfBuN21P4JXFKh
	 oAq5HyHrvAoz4boorxFj+NF2/S3qgRbJe39ZxWunlm/MN3y+kIwnHNY+soVzRMOB9x
	 Cnf8P/YpkhwpU1m3qgysbUFrG6/jipUFC/jvfORSJA78aqFdOzOhuSo9nvZVB2saZS
	 iedZRw0dWEb9Fmd4jRlLGSIZppnVsK4zYZAZSfRslqEhJR8jvUYDEqOv0/AtAHRNC6
	 N3UOXNbslPMS7cxDM5oY9QVtdPW1IQ5fCLNjyTsE/zULYT4A+Bcpd776qSBQUSacHj
	 YlmcIijBUVxwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C449340840;
	Thu, 15 Oct 2026 22:32:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE50362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EB8740840
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id furQN3cWf22Q for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 22:32:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6CA1D40839
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792103575;
 b=Hi0okJIpuzjXYACDI0KxsOaKq9f900BRdyisxResI1I7UjYYQv4BTFphWsVKKVb195M5
 VY5HNQuy9QbK0rymdwjUVGXzOlMBIQttKvFIPIrNJtLgMecZk/AC6XHpmc20mb33sNE/3
 H/lmBOq0/8GghLPIbidzb3CFz0KJud/oaPFbkMX+ltJx+7SX1PINhvB6Q1uoMS90E05Pv
 3SSsUj2D8Yp96TE32o+SpYw18m6m5J4xOqKmlp4J3mwfa9OB9dg1JRVArN21r4zs2nTbN
 18SUsgjdWmQM/5cld02xuqr/B5IGHEpShXStLnDrQIaprJ+0Cbz9oDHilGkxy/3x/7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792103575;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-DetectorID-Processed;
 bh=j1qYVY2TFJty/NI8FxkhL0akWG46XuryDnQThMhAywA=;
 b=FppB8+cKbhko5r3beCMO27VD0/HAc+AMsKOHXE7ewUG+1KS9vM5TW56AvlC5CYWajLpY
 dEZJIsj4U31+QbdSW4Q6M70+pizI2q68JYHz0I6labYdk6yZNDhKuz6gUGQIR7NNy7oqp
 gnVKL4D/IlcNa99ovv6sL1WgTq1DvSWGInPArsyMvkINi3boKXrJ+SkAGxLUUzjLbgWuL
 /+8SX9dLG6DOTRSInDXSxftXrxkJgzAX4OXQqM4RqqdvNbcLrsKnKkU8RZAz8HKb9aTF6
 F2N4ZeBUxUlQRknlZBBIMhFpCRxAJBzgjO7nsk3az5M0yE216G1yPbN+mGXxq5rCnwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=cE+vBTKQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::662"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::662; helo=mail-pl1-x662.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x662.google.com (mail-pl1-x662.google.com
 [IPv6:2607:f8b0:4864:20::662])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CA1D40839
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 22:32:54 +0000 (UTC)
Received: by mail-pl1-x662.google.com with SMTP id
 d9443c01a7336-2e8f2c3ad6bso25865235ad.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792103574; x=1792708374;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=j1qYVY2TFJty/NI8FxkhL0akWG46XuryDnQThMhAywA=;
 b=IyjPKaHbobMjzOzAoFrzFgOPAx4Oqc2Vy/Sv8ZqYL2lEtLeDSzy2pFEA50EyEEpf31
 WdQTEqHYhFiMcmSkUKlhV9OIhSGgfzNU65fAFG7Fa09jpv1C3000L7KKKPbiR6PhDNKj
 TRUbBt4WTMmZF4wOf+1yLenszXo7MOYJynlu1plbVtTJtBTr9RBKPuWi2wpICG02qB8d
 uSgWI7mKO2B4Zr151EzCsN2Rsffa4Z+t43HFo+dQ33fF0O1kzml9i23msqdI41UUrDB6
 tS8GSyqFUqnUHFKMr8E999mLt8Nw2lGjASck5DsfUf7Nd8pmuXLZHEjrx2sEyzP7S6+O
 4sqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrN4ySEc1zudht5gpC0jzChL1i3g87dg4T6NvN22sqrqafn4x3XpmvZ0OkPW78cvAgeEnQlM3J2so=@buildroot.org
X-Gm-Message-State: AFq9FYLESyral2gwEKdp+GQdYa76Z+fAIYd1BM2KP1DFnjhHsjE0GzLS
 OI0FAvFX42ToWwyTELoImF64RdUYWNLsALr3erKEzXkqiAV6wsPVlMY6EbSI28nlUdL0lcaYfyU
 GWExXdzjlk08iEUuTdu2Q9o8x9ElP8AYxoivEEh6qK71iTIp2RFIkPjaKO315uvpooMXXkL3gKG
 pld2agjbyov4P1oeg+ke6YB0mP1PLR14ZOJGZJXMcPpOqi2CAk5MnnwLZqw88todmma0c/RNmzL
 D6+JbS17uuxPIzmfA==
X-Gm-Gg: AYBFou1H6eLrDC0VtWn0yLowOCl6JsrE53dbBK1WMMwgn/kSUoAv2J0vjG4FUEpFtRR
 /EQLVFtX3t/3Zl7BScClhnfCfomricpXnQCC+yQ4tRhJdAUWRbs8ScKQSAXF1t1zQKVkjlj8INb
 q0RbFoBh72pAh7kAbwyg7cTr4IUS4giMXBz07TbpHLNcC/E1iQ8PAf3Y66Y7LTf0ts+FGuRW70Y
 qFxO5rt7zHTlQ/Rb5PY1bTqDSdi48nfalxtpHBeZs2YOrmeXn9smr9mXIiUbAIOfAqEfwhVd2wX
 oHGpm3SCbGtngbFXQS05yFpRGrAZaQJCbvHkU7Dmd8Skk234EwvjEWNgkz7wYLBOIP0XGjnOvBI
 fkoXHgh1rMK58LDzuLd/2TjJYOkQ3swx8ZVMDrGklhqWFnZcXc6QwvSv0alNl2z+3vUi3kDXfOB
 8go9mrQHnaXhMsnwmARAM08ERm8FFWnybhYV101pby
X-Received: by 2002:a17:90b:3cc7:b0:3ac:9785:4c32 with SMTP id
 98e67ed59e1d1-3ac97855ffbmr3072300a91.30.1792103573766; 
 Thu, 15 Oct 2026 15:32:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
 by smtp-relay.gmail.com with ESMTPS id
 41be03b00d2f7-cd654a514b6sm28237a12.19.2026.10.15.15.32.53
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2026 15:32:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b4bf686ceso184815926d6.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwb7hXB1K8UikqeJaIPOyGO0SukbEXxYgiDJis1yyPdp3vH8f0KlyoARkYhhWzVF/KIDyFAbLoo3jw=@buildroot.org
X-Received: by 2002:ad4:5c4d:0:b0:914:2c1b:7d29 with SMTP id
 6a1803df08f44-91b553398c3mr379374086d6.6.1792103572304; 
 Thu, 15 Oct 2026 15:32:52 -0700 (PDT)
X-Received: by 2002:ad4:5c4d:0:b0:914:2c1b:7d29 with SMTP id
 6a1803df08f44-91b553398c3mr379373856d6.6.1792103571875; 
 Thu, 15 Oct 2026 15:32:51 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcba3d5a1sm6879386d6.8.2026.10.15.15.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 15:32:50 -0700 (PDT)
Message-ID: <89b3f1c7-7056-4e8c-bc66-3c9397de0dbb@broadcom.com>
Date: Thu, 15 Oct 2026 15:32:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Markus Mayer <markus.mayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <20261015222908.760160-1-markus.mayer@broadcom.com>
Content-Language: en-US, fr-FR
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261015222908.760160-1-markus.mayer@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] [PATCH v2]
 package/linux-tools/linux-tool-perf.mk.in: fix doc build issue
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
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/15/26 15:29, Markus Mayer via buildroot wrote:
> Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
> is enabled.
> 
> The perf package wants to prevent the documentation from being built,
> since it won't be installed anyway. The trick is to create an empty
> GNUmakefile in the proper place. It did this by using a POST_PATCH hook.
> 
> The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
> is that the build system ensures only one package builds at a time, so
> Linux's "extract" stage and Linux Tool's "patch" stage can never execute
> in parallel.
> 
> However, with per-package builds enabled, there is no guarantee that
> Linux has finished extracting by the time the linux-tool's POST_PATCH
> hook runs. This means the creation of GNUmakefile could silently be
> skipped if that portion of the source code hadn't been extracted yet.
> If, in addition to this, asciidoc happened to be installed on the build
> host (/usr/bin/asciidoc), perf would detect this and enable the doc
> build stage. At actual build time, it would use host-python3 (not the
> host's system Python), which does NOT have asciidoc, and the build would
> fail.
> 
>    INSTALL libperf_headers
>    SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
>    INSTALL libbpf_headers
> fatal: not a git repository: '.'
>    ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
> fatal: not a git repository: '.'
> [...]
>    ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
> /local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
> No module named asciidoc
> make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1
> 
> Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
> problem and guarantees that the "fake" GNUmakefile can be injected into
> $(LINUX_DIR)/tools/perf/Documentation as intended.
> 
> Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
