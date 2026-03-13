Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC74107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4707940BE1;
	Fri, 13 Mar 2026 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coZWz4vuJOYd; Fri, 13 Mar 2026 22:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F7D40E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773439253;
	bh=ioxErTwgLALICVMK2cxOhu6ssRU//ldO6hoiht0AUug=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=iQtTfAVGO+HlKSpcPPs/+AKnyZrBS1lT4/u1iR/GIvtQ2osukxtN81NldD0OWhjbu
	 oTEP3Cfwp37d0tz7Z0tf4K+dddB+ToSRe7yCxFq5wnizOXltkd8ZVF3RETDH14An9w
	 iCjuORmA9Sl11fjdF4k/ElSMVb/k5coqZhvzT8BlSbo0mPYx+r2FmZpi2rFsZaSn+V
	 lEgRWlut51noY5exXAkXCwTs4i9uqjZtgVkiJggHhfoi5yOKRsmqQFZca/fLzhRSnD
	 18qDMrmvDU0rUsPRjKtdjs59t2qRneNToCNKTA0mkpGjOYWtQqWJz7sXNefTgMP7cT
	 Ra5Ny2h38MA9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F7D40E3D;
	Fri, 13 Mar 2026 22:00:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 974861AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88380405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdNnY85m9Jax for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F7914005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7914005A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F7914005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:00:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43a03cb1df9so2399025f8f.1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 15:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773439248; x=1774044048;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BL+wL1Bt5h8iwMXfbN0FpTln1GpmqBMu3qp02e8MpCg=;
 b=UtCnbgqNYHrkuPJ8kzoYn65UU8fa5X6S/H/+cgkNpEAVroX0EQSRWhEpnyXyAz9XMx
 P8uESnguceFctVJ7P2HGwszmsZM7H/bOmFsVVdphF3duxV1JNfCrg7tSq2mM25vDm8xc
 Acymzu3OsGqYqoeQrLFn+3qqyi7zZuIRZxJiXqUWAK/Vhzbv1v1efV4gz9Ka62sNXSlf
 tOrH2V/1d12cUqLADJ0xrZ/4JZMKY1pLLIETGFzBYgrvjNDalkc++/rLlG/QJYP5O7N5
 /K3eawhXhbLqyiVZlGzp9V/AVmQu7F4nVa/oH/CxYRwd0I1+6sIasRYhyPiXB9NwkRGj
 pirg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/vCWwi+tz9vR9/lJRtskRHUVT7SPzo4MIv83x9iv9a54loC5OJoje25R0+x3PB74lrOtoix2sWPk=@buildroot.org
X-Gm-Message-State: AOJu0YzeLdIlF/fNH5ApNPWQLJcDQ4RohH+V3YzJ02S+JauB0yfkjPYa
 POhUKNijWWlxXQhFFUwYCw6IW6alDwTRpERvjmeYFpKIbFI3ky8pDziicM9yN0MB+yg=
X-Gm-Gg: ATEYQzyKgUB3Jol/pN+A5JpgEiy11MqBlmKtNF3YGJLQMer2es5YRRP/UQY8UfOTH5A
 /LZWE49dNsyrpoS23qEhQbwtUUJS4YFmZLJpUkAB5FlZd5awp+xjGRAe8TfMtvgKyXrLMpGznbF
 XDHPQvX1mt9x3vG3YpcI+bZetQflECrQB4L2fIeblfZP02F0MBENFIZCZHMxsML4RlAxiBZR6iB
 CbhqkXcvlJqM/J+qV+SQ4Qp73S8hWzjnKjuybthdg09ogCbd8OzeGlvAqdx8Z7wyDAQ3/kd6EGw
 4Kn8u6KGGS+neQzsLFb+axNArrUTr7sEVzlsDVXI9ZeS8BXhPGa66LdIX8kIjufa9mvSWXBF6UR
 eHBwwkZ+1yU77MSLCk1wBeE9pEdn6u71nxqdk6ByiDUxzHy2juS83qxrebdeaWrp2uN+YRBCnOA
 LCNjTkjdaKuiDOD7P5pZlJxO7BoojutCTdNsLFi/RmX4NuxOea0iR6uqTgVpFDVqCyWnogKWYiU
 shBjQMZPLjQwBfQc3QenjbqHnR+3LvFPX5qeLYbR6CbNQX9g3s8b7dFmhEmDK0raw==
X-Received: by 2002:a05:6000:2385:b0:439:b114:60c0 with SMTP id
 ffacd0b85a97d-43a04db6008mr9663121f8f.35.1773439247917; 
 Fri, 13 Mar 2026 15:00:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20b544sm21950802f8f.20.2026.03.13.15.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 15:00:47 -0700 (PDT)
Message-ID: <250982aa-54db-4ae1-9e32-e6248ec0d6c8@smile.fr>
Date: Fri, 13 Mar 2026 23:00:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260309075127.801847-1-neal.frager@amd.com>
Content-Language: fr
In-Reply-To: <20260309075127.801847-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773439248; x=1774044048; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BL+wL1Bt5h8iwMXfbN0FpTln1GpmqBMu3qp02e8MpCg=;
 b=RQeaMbMPqOVriCOKE3fn4n23x3r6skDfEcG9FDRfBl/SfgCHcO1lTpKd1oSduNbJPc
 6MQHfERxPX2S+GiS5VDZvKzZ9PTZpp97vR69V3jvqTh60KmF8v7LUq94fIMj3E254QVN
 BQ4SEwO3IUeVVEfiQ1WeCGIQa94AQT0hBxgSc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=RQeaMbMP
Subject: Re: [Buildroot] [PATCH v2 1/2] board/versal2/post-image.sh: remove
 incorrect $BINARIES_DIR
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@gmail.com, michal.simek@amd.com,
 fiona.klute@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmVhbCwgQWxsLAoKTGUgMDkvMDMvMjAyNiDDoCAwODo1MSwgTmVhbCBGcmFnZXIgYSDD
qWNyaXTCoDoKPiBSZW1vdmUgaW5jb3JyZWN0ICRCSU5BUklFU19ESVIgcmVmZXJlbmNlIGZyb20g
dGhlIHN5bWJvbGljIGxpbmsgY3JlYXRpb24gdG8KPiBtYWtlIGEgcmVsYXRpdmUgcGF0aCBhbmQg
bm90IGFuIGFic29sdXRlIHBhdGguCj4gCj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5l
YWwuZnJhZ2VyQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IC0tLQo+IFYxLT5WMjoKPiAtIEltcHJvdmVkIGNvbW1pdCBtZXNzYWdl
Cj4gLS0tCj4gIGJvYXJkL3ZlcnNhbDIvcG9zdC1pbWFnZS5zaCB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jv
YXJkL3ZlcnNhbDIvcG9zdC1pbWFnZS5zaCBiL2JvYXJkL3ZlcnNhbDIvcG9zdC1pbWFnZS5zaAo+
IGluZGV4IDE3NzQ2MjcxZTEuLmFmNTA5MDlmYjEgMTAwNzU1Cj4gLS0tIGEvYm9hcmQvdmVyc2Fs
Mi9wb3N0LWltYWdlLnNoCj4gKysrIGIvYm9hcmQvdmVyc2FsMi9wb3N0LWltYWdlLnNoCj4gQEAg
LTMsNyArMyw3IEBACj4gICMgQnkgZGVmYXVsdCBVLUJvb3QgbG9hZHMgRFRCIGZyb20gYSBmaWxl
IG5hbWVkICJzeXN0ZW0uZHRiIiwgYW5kCj4gICMgd2l0aCB2ZXJzYWwyLCB0aGUgTGludXggRFRC
IGlzIHRoZSBzYW1lIGFzIHRoZSBVLUJvb3QgRFRCLCBzbwo+ICAjIGxldCdzIHVzZSBhIHN5bWxp
bmsgc2luY2UgdGhlIERUQiBpcyB0aGUgc2FtZS4KPiAtbG4gLWZzICIke0JJTkFSSUVTX0RJUn0v
dS1ib290LmR0YiIgIiR7QklOQVJJRVNfRElSfS9zeXN0ZW0uZHRiIgo+ICtsbiAtZnMgInUtYm9v
dC5kdGIiICIke0JJTkFSSUVTX0RJUn0vc3lzdGVtLmR0YiIKPiAgCj4gIEJPQVJEX0RJUj0iJChk
aXJuYW1lICIkMCIpIgo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
