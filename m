Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE64D5A6C3
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 01:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E547980A6C;
	Tue, 26 Nov 2024 01:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvsUjIdZmAWO; Tue, 26 Nov 2024 01:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1544F81195
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1544F81195;
	Tue, 26 Nov 2024 01:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6500B281F
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 01:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6093D81195
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 01:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsqKDOiktBpq for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 01:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4080580A6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4080580A6C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4080580A6C
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 01:50:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso426383e87.2
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 17:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732585824; x=1733190624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lEawSPuAihirMYxOW0SYGW7rb6XH1MpJEF6BS/tFtU=;
 b=fvJiUCte3vXDrS0dPodV7nrIHak4A4MHmRSdVOC03RTikdErOVgHLe0xodiH5PTsjP
 yz+t8yZa/3nZTnJM7sjRV5jFBAbgEpf4wWTw4MBJuY7W2W2H/8wfYmqZxZERiz15O9tk
 /qRqRsUSQX6kAmrQ4Hu0e0p///3W1HV1XxAoFrcbYv+ERbmP+p443/Ippcz/j4gCsr4I
 /j6ohZgwajiD4lNfh5BwblPddQ5dMxBpK6+Mg6uYbkTYNoikW9r4rg5XXk6vdwF5+xMF
 /Fp8Nqunwwu6KxbzSzNqZ8KPz7394l7lDbQ0Egyi+9HhvziHXk4Cu1be16fZDdWprZTT
 A8Wg==
X-Gm-Message-State: AOJu0Yyqdp+k7oBi7E99G9wAAxXawn19tt3PM3owsgAIor+UzSZVzFwV
 1x3Hafdp272Mx8qBS6eVm2FkAz8e+R6+8i9aT5T0VUWBPywlAmWiZdVYy+8vjBRi1LyOpGEq4v8
 lNw2M1N1EwkSJxP9nAbOrgFjbpc0=
X-Gm-Gg: ASbGncs29+XV+6vvkFEdRega2//hROTUv7BixwNT1p/Y4V6H34ReMhtu6KH7u/5mcel
 OTtUgaq1DGIYT2wPltSJo1+4UFHAc6FOA
X-Google-Smtp-Source: AGHT+IGZ5TbvY5x3ZpZyVpEaW7v2GqVuLrpjGYm2YeqT9Awyxod75Nr2vazvNlaJMkkvSWgnhgtAXEU5jeDnOX2fq4U=
X-Received: by 2002:ac2:5688:0:b0:53d:abc8:b6d3 with SMTP id
 2adb3069b0e04-53dd35a53c8mr7336904e87.12.1732585823467; Mon, 25 Nov 2024
 17:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
 <20241124172908.2b4db731@windsurf>
In-Reply-To: <20241124172908.2b4db731@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 26 Nov 2024 09:50:12 +0800
Message-ID: <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732585824; x=1733190624; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lEawSPuAihirMYxOW0SYGW7rb6XH1MpJEF6BS/tFtU=;
 b=mHWe/lcn+cgX/yaSSP1TWg45Rc66PRoAj5K9OCda21aK2J+nbto+Qj+PAIxOmzFol8
 Blk72zIohvFl/+qBXiy8kvrHk6Z6WfwFeCj1q8kGlY3ZUAnE9kc6qtFc4XEZ7VV3GbOx
 3DJI7omuC4TdDwetnP+9J7j/9KvGszN086x5M5xlzHR/9/FvQGMtaZnUgeBCVu/sCsaW
 VWQuxI1EKjnUoazHBSoTUZHkDk6+MsFytP23tYYugHiT/Ycq/3XaLXyNDSKlWpd1krM5
 Kh4ukUrDeaDk/fHXgRbe/SsKPL4zkyJ0JJF8TLKDwUrr9dZfVkG18TGMvbBb3q9SdnDf
 5c4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mHWe/lcn
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKSSB0aGluayBpdCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vpc2ggd2hp
Y2gga2VybmVsIHZlcnNpb24gdG8gY2hvb3NlCmFzIHRoZSBtaW5pbXVtIHZlcnNpb24uCkJ1dCBJ
IGZvdW5kIHRoZSBsaW5rOiBodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4yL3Bp
ZGZkX29wZW4uMi5odG1sCgpJJ20gbm90IHN1cmUgaWYgaXQncyBjb3JyZWN0LCBpZiBpdCBpcyB0
aGVuIGl0IHNob3VsZCBiZSBhdCBsZWFzdCA1LjMuCgpPbiBNb24sIE5vdiAyNSwgMjAyNCBhdCAx
MjoyOeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
IHdyb3RlOgo+ID4gVG8gc29sdmUgbXkgY29tcGlsYXRpb24gcHJvYmxlbSAod2l0aCBsaW51eC1o
ZWFkZXJzLTQuMTkuMzIyKSwgaW4gdGhlCj4gPiBjdXJyZW50IGNhc2UsIEkgaGFkIHRvIHBhc3Mg
dGhlIC0tZGlzYWJsZS1waWR3YWl0IG9wdGlvbi4KPiA+IElmIGF0IHNvbWUgcG9pbnQgaW4gdGhl
IGZ1dHVyZSwgd2hlbiB0aGUgcGF0Y2ggeW91IGV4cGVjdCBpcwo+ID4gc3VjY2Vzc2Z1bGx5IGFw
cGxpZWQsIEkgd2lsbCByZW1vdmUgaXQuCj4KPiBXaGF0IHlvdSBjYW4gZG8gdGhlbiBpczoKPgo+
IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTkpLCkKPiBQUk9DUFNf
TkdfQ09ORl9PUFRTICs9IGRpc2FibGUtcGlkd2FpdAo+IGVuZGlmCj4KPiBUaGlzIHdpbGwgZW5z
dXJlIHRvIGRpc2FibGUgcGlkd2FpdCBzdXBwb3J0IHdoZW4gaGVhZGVycyBhcmUgPCA0LjE5LgoK
TWF5YmUgaXQgc2hvdWxkIGJlIGFzIGZvbGxvd3M6CgppZmVxICgkKEJSMl9UT09MQ0hBSU5fSEVB
REVSU19BVF9MRUFTVF81XzMpLHkpClBST0NQU19OR19DT05GX09QVFMgKz0gLS1kaXNhYmxlLXBp
ZHdhaXQKZW5kaWYKCgpTY290dCBGYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
