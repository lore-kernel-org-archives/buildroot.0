Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA88FA3736
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 09:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0043740A7A;
	Fri, 13 Sep 2024 09:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3tYDNbWYXDd; Fri, 13 Sep 2024 09:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88A0419C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88A0419C8;
	Fri, 13 Sep 2024 09:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE4D1BF2BD
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 09:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552AB40A7A
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 09:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-chfe6uP7Yq for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 09:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C76841DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C76841DCE
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C76841DCE
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 09:38:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8a91c8cdd5so19175066b.0
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 02:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726220294; x=1726825094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MK7HDxK8SX0cuDjtHOMZ1pniWfcIFDfprH6kr/hYAmc=;
 b=WKq37D/yjAy+/nBw68R4+h8SdLUsCY5WW53TCQdsLHOoMIRLvC1quwEmJUwhyzCc+H
 SaEfVcxZIiU8NJBgA6G9i2LEMcTdlV0+ri43JiEIi4vLvEWxccD86Qz4Vrv6QaaNyRwL
 p8/MmluorAPlOKjwwEI4lE+OQRExFUG0QbD8dbH4n9iBOmZ8Yb03PhRITkK4aZ1mm7aI
 31h6LU4C9dIVM1gxJdVoFYe7ItJVUcBrDCUK9avgg8Kmc1vw+sRmDYMI2eaneN2SIFK4
 8cnlfy/3JOvqHvzKDt8KvxpRsQzx23XHM1lDa6Vc08anTXOFapyhF15OA9fIwyoh0bc4
 FWkQ==
X-Gm-Message-State: AOJu0YxFNpipdLeLP9YVknomz/AAVvA65Jb+kjoBsu4rXK/DIF5AUGix
 Aqxp2L9ERN0a23qjUjc0d+c8a0H/MvWpwfzqTTQmQ6yz2RKfHexfV47+MMag8LvHJfPIz3TaEVu
 G7DTkH4fHbYr7OFUmoU7yX0rcHTdGcBQd1z54HQ==
X-Google-Smtp-Source: AGHT+IGsRqSQnPV6XoCbG8JQHOPqKIv0cI5V3J9RMunxFAs49o9S+Oj/cf7dqt/+t7Z5I2ghC6e40lEWtndhVJMwLtY=
X-Received: by 2002:a17:907:9489:b0:a80:a3a8:9867 with SMTP id
 a640c23a62f3a-a902964c0ecmr229173566b.9.1726220293106; Fri, 13 Sep 2024
 02:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240911105436.854798-1-adam.duskett@amarulasolutions.com>
 <633a76e1-8899-4750-9b0c-6d8f6c42321d@green-communications.fr>
In-Reply-To: <633a76e1-8899-4750-9b0c-6d8f6c42321d@green-communications.fr>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 13 Sep 2024 11:38:01 +0200
Message-ID: <CAHDQB6NxvLZTXTKzTxHsQmj1jcSA=aMPN6Ph=wpTJT61=wqK=w@mail.gmail.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726220294; x=1726825094;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MK7HDxK8SX0cuDjtHOMZ1pniWfcIFDfprH6kr/hYAmc=;
 b=VRz+J9/QpO1F1tUGMiHlfJ1nVzqiHFQMIVJznIL/5Tv5M7VaRfTq6HOE3+fwLzA7q9
 Xb9nFCNkQKELaa6lSwd1lpDQYuNZT7TKqN9Qsg9kkDHwhIYAx8WL7kEkPCwP6c0u2NgF
 G/KnJUQJZQPsrow81W0IXoFIRONw2RLhnKedU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VRz+J9/Q
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: revert commit
 4349746dac6f55b0b0faca21a7e609fb67d1471b
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmljb2xhcyEgVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEKCkFkYW0gRHVza2V0dAoKCgoK
T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMjowMOKAr1BNIE5pY29sYXMgQ2F2YWxsYXJpCjxuaWNv
bGFzLmNhdmFsbGFyaUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4gd3JvdGU6Cj4KPiBPbiAxMS8w
OS8yMDI0IDEyOjU0LCBBZGFtIER1c2tldHQgd3JvdGU6Cj4gPiBDb21taXQgNDM0OTc0NmRhYzZm
NTViMGIwZmFjYTIxYTdlNjA5ZmI2N2QxNDcxYiBzdGF0ZXM6Cj4gPiBgYGAKPiA+IGNvbW1pdCA0
MzQ5NzQ2ZGFjNmY1NWIwYjBmYWNhMjFhN2U2MDlmYjY3ZDE0NzFiCj4gPiBBdXRob3I6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gRGF0ZTogICBUaHUg
QXByIDE4IDExOjEzOjUwIDIwMTkgKzAyMDAKPiA+Cj4gPiBwYWNrYWdlL2Jvb3N0OiBkb24ndCBp
bnN0YWxsIGJvb3N0IGNtYWtlIGZpbGVzCj4gPgo+ID4gU2luY2UgdmVyc2lvbiAxLjcwLjAsIGJv
b3N0IGluc3RhbGxzIGl0cyBvd24gY21ha2UgZmlsZXMgd2hpY2ggYXJlCj4gPiB1dHRlcmx5IGJy
b2tlbiBzbyBkb24ndCBpbnN0YWxsIHRoZW0gb3RoZXJ3aXNlIGFsbCBjbWFrZSBwYWNrYWdlcyB1
c2luZwo+ID4gYm9vc3QgKGhvc3QtdGhyaWZ0LCBkb21vdGljeiwgaTJwZCAuLi4pIHdpbGwgZmFp
bCBiZWNhdXNlCj4gPiBCT09TVF9JTkNMVURFX0RJUlMgd2lsbCBiZSBlbXB0eQo+ID4KPiA+IEZp
eGVzOgo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzRhZGEy
NmJhYjVjMWU2NTA0YzdkOGM5MjY3MjMyNmNlZDFkMzM2ZGYKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Cj4gPiBgYGAKPiA+Cj4gPiBIb3dldmVyLCB0aGlzIGhhcyBzZW5zZSBiZWVuIGZpeGVkIGluIHRo
ZSBmaXZlIHllYXJzIHRoaXMgY2hhbmdlIGhhcyBiZWVuIGluCj4gPiBCdWlsZHJvb3QuIEZ1cnRo
ZXJtb3JlLCBoYXZpbmcgLS1uby1jbWFrZS1jb25maWcgYnJlYWtzIHBhY2thZ2VzIGV4cGVjdGlu
ZyB0bwo+ID4gZHluYW1pY2FsbHkgbGluayB0byBib29zdDo6bG9nIHdpdGggYSBtdWx0aXR1ZGUg
b2YKPiA+IGB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGJvb3N0Ojpsb2dgIGVycm9ycy4KPiA+IFNl
ZTogaHR0cHM6Ly9naXRodWIuY29tL21lbmRlcnNvZnR3YXJlL21lbmRlci9wdWxsLzE2NjMgZm9y
IG9uZSBzdWNoIGV4YW1wbGUuCj4gPgo+ID4gQXMgdGhlIC0tbm8tY21ha2UtY29uZmlnIGlzIG5v
IGxvbmdlciBuZWVkZWQgYmVjYXVzZSB0aGUgb3JpZ2luYWwgcHJvYmxlbSBoYXMKPiA+IGxvbmcg
c2luY2UgYmVlbiBmaXhlZCB1cHN0cmVhbSwgaXQgaXMgc2FmZSB0byByZXZlcnQgdGhlIGNoYW5n
ZS4KPiA+Cj4gPiBUZXN0ZWQgd2l0aCB0aGUgZm9sbG93aW5nIHBhY2thZ2VzIGFzIGEgc21va2Ug
dGVzdDoKPiA+Cj4gPiAgICAtIGhvc3QtdGhyaWZ0Cj4gPiAgICAtIGRvbW90aWN6Cj4gPiAgICAt
IGkycGQKPiA+ICAgIC0gbGliY3BwcmVzdHNkawo+ID4gICAgLSBsb2c0Y3h4Cj4KPiBtZXNvbiBj
YW4gYWxzbyByZWFkIGNtYWtlIGZpbGVzIGFuZCBpdCBhbHNvIGhhdmUgc3BlY2lhbCBjYXNlcyBm
b3IKPiBib29zdC4gSSdtIG5vdCBzdXJlIGhvdyBib3RoIGludGVyYWN0IHdpdGggZWFjaCBvdGhl
ciwgYnV0IGl0IHNob3VsZAo+IHByb2JhYmx5IHdvcmsgZmluZS4gSWYgeW91IHdhbnQgdG8gYmUg
c3VyZSwgdHJ5IGNvbXBpbGluZyBtcGQgb3IKPiBsaWJjYW1lcmEtYXBwcy4KSSB0ZXN0ZWQgbXBk
IGFuZCBldmVyeXRoaW5nIGNvbXBpbGVkIHdpdGhvdXQgaXNzdWUhCgpBZGFtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
