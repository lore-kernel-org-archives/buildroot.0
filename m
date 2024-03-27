Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA623C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741D1600BB;
	Wed, 27 Mar 2024 21:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4-PZbr2zkny; Wed, 27 Mar 2024 21:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B0860603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B0860603;
	Wed, 27 Mar 2024 21:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B50831BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F6C4052F
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXH34hNl4n5M for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56B1F40525
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B1F40525
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B1F40525
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:16:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4149521d76aso1860395e9.3
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711574215; x=1712179015;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4naS0BAHV4vLZSXOxS1tQlD+Vmt4a0ByVFpdBHa78FQ=;
 b=ApAyscFVCsBfpGyeQ4dT7yEPRmyZaeQGIzJFTFA5aKTlt4uHn/4MIo2DcQ0SfwrYMz
 JvrmhUGSFKlZtXIT73idrWkF5ccdlyQYvuz14If5qDCkdWKoRtsFnppVZTvlTQxGBIuK
 acbgef55RZl0AkIOU07nghYDRM3AF54IyZr5MS4Xkgr9/uCybJJyvte2eyRFo5XkZuMj
 xHenD67OqKkS98Zgk9z2tAf2IQQfXYxNAkqyCSMAy0pRrgWnHgDUOPQ4AAuT8uNjZkP7
 KejtpGaRyDoK38oaM/n85H739d1jh2nmG9mY3Yt6W/73ZAizgUl7PkaduigtwQJjYTkW
 3Gvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpBAUPbPSlm5sl+T4ZuGxsC/Ft4Kyk5eY67Wk+OmhFegd8Wv3UzEcKfs3s9hTOyceDePp/4yXo1D6BSPeyWWrZaw0zcTr1ew==
X-Gm-Message-State: AOJu0YyOffQ0Ar8yQlSovfvlTvWnreLXNoiTG1nvRxYKfPqQe8FGsAQO
 Ht2sVdfrsGO5eWWHAPkv4hzg5DdHTuFL699saHvQQJCoJaPRXCHrsB50oa5i1WL9k0E0h7Hn/FU
 o
X-Google-Smtp-Source: AGHT+IF6/W8I2Eve1B2ej2C1AzXexX85f3cVRanLI+K4ldC84ZtyJiVD6+YtxYS3yfBWiRJDfZ4wEg==
X-Received: by 2002:adf:e58a:0:b0:33e:7133:ee31 with SMTP id
 l10-20020adfe58a000000b0033e7133ee31mr358096wrm.40.1711574214461; 
 Wed, 27 Mar 2024 14:16:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b0033e41e1ad93sm24082wry.57.2024.03.27.14.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 14:16:54 -0700 (PDT)
Message-ID: <9da7a354-13d5-4294-af8e-b6155688bdcc@mind.be>
Date: Wed, 27 Mar 2024 22:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 buildroot@buildroot.org
References: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
Content-Language: en-GB
In-Reply-To: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711574215; x=1712179015; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4naS0BAHV4vLZSXOxS1tQlD+Vmt4a0ByVFpdBHa78FQ=;
 b=B4mjUCZ3o5RZlc50wLug8j0SxTayBT3lTkemPG97hztVUfGEIeLgsW+/Iy27fFHdAm
 xcNpphkvnlKVUddk7DVFYPLiAVN1nt5CGO59b/faJnsdWrkVN19N/F/zeUWKp3Cx7ODw
 3pd27CNBR1OlAGbcfVMmOttT3cn64pT7YK7ViPfx7afv6oOUOAdDFDi2K7x7r/WmtICO
 UW0aHiEmC3wmjXnInuwqjMLOIT20n/TDTVSeqMfC3Isp9C//WNf27OaWh0MYDD4++2Sy
 UUnC3pL/O/fz8wfV/KziRfe8GGjg0AvtjDNo/eLdSVpc0EJnGV429BSxofWBhPC7ePVD
 9OMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=B4mjUCZ3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: add cython
 for python-sqlalchemy
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wMy8yMDI0IDE3OjI4LCBGbMOhdmlvIFRhcGFqw7NzIHdyb3RlOgo+IEZyb206IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IAo+IFdoZW4gbWlncmF0
aW5nIHRvIHNldHVwdG9vbHMgd2l0aCBwZXA1MTcgc3VwcG9ydCB3ZSBuZWVkIHRvIGFkZAo+IGhv
c3QtcHl0aG9uLWN5dGhvbiB3aGljaCBpcyBhIHBlcDUxNyBidWlsZCBkZXBlbmRlbmN5IGZvcgo+
IHB5dGhvbi1zcWxhbGNoZW15Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IFRlc3RlZC1CeTogRmzDoXZpbyBUYXBhasOzcyA8
ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Cj4gU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBU
YXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CgogIEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgeW91IGNoZXJyeS1waWNrZWQgdGhhdCBwYXRjaCBmcm9tIHRoZSBwZXA1MTctc2V0
dXB0b29scyAKc2VyaWVzIC0gQUZBSUNTIGl0IHNob3VsZG4ndCBiZSBuZWVkZWQgZm9yIHRoZSB2
ZXJzaW9uIGJ1bXAuIEJ1dCBzaW5jZSBpdCBuZWVkcyAKdG8gYmUgYXBwbGllZCBhdCBzb21lIHBv
aW50IGFueXdheSwgSSBhcHBsaWVkIGJvdGggdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3Fs
YWxjaGVteS5tayB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXku
bWsgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCj4gaW5k
ZXggNDAwYWQ5MmY2My4uMTY3YzNhNDQ5OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1z
cWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tc3Fs
YWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tawo+IEBAIC0xMiw1ICsxMiw2IEBAIFBZVEhPTl9T
UUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKPiAgIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gICBQWVRIT05fU1FMQUxDSEVNWV9DUEVfSURfVkVORE9SID0gc3FsYWxj
aGVteQo+ICAgUFlUSE9OX1NRTEFMQ0hFTVlfQ1BFX0lEX1BST0RVQ1QgPSBzcWxhbGNoZW15Cj4g
K1BZVEhPTl9TUUxBTENIRU1ZX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLWN5dGhvbgo+ICAg
Cj4gICAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
