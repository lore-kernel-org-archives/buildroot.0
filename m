Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DE8C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7CF40A59;
	Tue,  7 Feb 2023 16:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D7CF40A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhynO_Bpp2NW; Tue,  7 Feb 2023 16:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B403440168;
	Tue,  7 Feb 2023 16:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B403440168
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46B4C1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20CA740168
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CA740168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GnTQdOIaRLt for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:39:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34B140120
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34B140120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:39:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h16so14130897wrz.12
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 08:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L7+2dkAxzhSlwdNqJcDsHFQKXlEcO8Ec2GeBwuiEecg=;
 b=Q2GgQ38AHHKis9jX0sJciOGuFMLA0wPTfNuOd1ihuVSg0DS7LRxCiPACJfrmduf77s
 Z7+pAs7YIGwZF8Mgpfv/X90J2WVaxZHJjOhAIAStxsoP1c+cqz3tx+d3+jP0t0Ps9VIg
 HzXbsYoXumX25W39oFiE9THaEiWmNwxcBL00QmwbMQNiawVirfntBjzZsVSKwx55tE3c
 j07pEEFr0gWcVkXoMAxdl6ptbbcBbHnd+0EtEiz6WwLgR9brxh+RNimcvw5r8FeLYvje
 8Bj71ATmJrQpvZfPHNMro1gcZ2muzw+B6F6DDr7SNr0QgeXqxU1QpeFWxJseu6Mkcnhz
 bFbA==
X-Gm-Message-State: AO0yUKVYbzcElu/7MXz471DVDV0gHn2aHgiEdhUuw53T7zLsxUTHa7zy
 WJsjBPiJwh/AoBofDN06q1p5ioJRSfZvGS5S
X-Google-Smtp-Source: AK7set+trL20/mgH/601rs17EIrPpMEBH1W37H8epulaztXEjthCYpVHSXYDoJbcRQmSaOLEDVjDOw==
X-Received: by 2002:a05:6000:1816:b0:2c3:f121:5f98 with SMTP id
 m22-20020a056000181600b002c3f1215f98mr3711535wrh.21.1675787973960; 
 Tue, 07 Feb 2023 08:39:33 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfdec6000000b002c3eaeb18cfsm4720367wrn.31.2023.02.07.08.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:39:33 -0800 (PST)
Message-ID: <75cb042c-7a23-2685-1835-089218d3321f@smile.fr>
Date: Tue, 7 Feb 2023 17:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L7+2dkAxzhSlwdNqJcDsHFQKXlEcO8Ec2GeBwuiEecg=;
 b=gCxbvdClL3wu5xwlIcbDM4keWp2PIRdtwL4qspcOTAtBgtKghcp8W5CU6kB1ExusPI
 QEIjnf4U0po5PBwZ0clWvZl+RehqFUHWb+nI5Rs7xvMDbXT+k08hYinj8O0zfe7pEncc
 c49ZCaO6Ok6iMLO2amnJxC5OAy7Ttn88NNAU75EnPLXDbZpLux6klnB3KiSC9CipGt5X
 TMiP1IXjb3aCe4mr6822vboNUwo89VnNBytNecJ7lA9QVOdCmsQ7NuTDqaiT6fM0u18k
 mTOYL6kgz6RyHXlRdk0QXPnHQPxzyzcmhUdm+LstXXPWYU5dz35RywKPFRwdhpPO8xs8
 Kwfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gCxbvdCl
Subject: Re: [Buildroot] [PATCH 1/1] utils/test-pkg: proper output on host
 without jq installed
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2ViYXN0aWVuLAoKQWRkaW5nIFlhbm4gaW4gQ2MuCgpMZSAxMi8xMC8yMDIyIMOgIDE4
OjQ4LCBTw6liYXN0aWVuIFN6eW1hbnNraSBhIMOpY3JpdMKgOgo+IE9uIGhvc3Qgd2l0aG91dCBq
cSBpbnN0YWxsZWQsIHRlc3QtcGtnJ3Mgb3V0cHV0IGlzIGFzIGZvbGxvd2luZzoKCklzIGpxIGlz
IGxpc3RlZCBhcyBvcHRpb25hbCBkZXBlbmRlbmNpZXMgb2YgQnVpbGRyb290PwoKPiAKPiAkIC4v
dXRpbHMvdGVzdC1wa2cgLXAgbW1jLXV0aWxzCj4gICAgICAgICAgICAgICAgICAgICBib290bGlu
LWFybXY1LXVjbGliYyBbMS82XTogd2hpY2g6IG5vIGpxIGluICgvdXNyL2xvY2FsL3NiaW46L3Vz
ci9sb2NhbC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L29wdC9iaW46L3Vzci9s
aWIvbGx2bS8xNC9iaW46L3Vzci9saWIvbGx2bS8xMy9iaW46L3Vzci9saWI2NC9vcGVuY2FzY2Fk
ZS9iaW4pCj4gSlEgSVMKPiBPSwo+ICAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjct
Z2xpYmMgWzIvNl06IHdoaWNoOiBubyBqcSBpbiAoL3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwv
YmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi9vcHQvYmluOi91c3IvbGliL2xsdm0v
MTQvYmluOi91c3IvbGliL2xsdm0vMTMvYmluOi91c3IvbGliNjQvb3BlbmNhc2NhZGUvYmluKQo+
IEpRIElTCj4gT0sKPiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFsz
LzZdOiB3aGljaDogbm8ganEgaW4gKC91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2JpbjovdXNy
L3NiaW46L3Vzci9iaW46L3NiaW46L2Jpbjovb3B0L2JpbjovdXNyL2xpYi9sbHZtLzE0L2Jpbjov
dXNyL2xpYi9sbHZtLzEzL2JpbjovdXNyL2xpYjY0L29wZW5jYXNjYWRlL2JpbikKPiAuLi4KPiAK
PiBTaW5jZSB0ZXN0LXBrZyBoYW5kbGVzIHRoaXMgY2FzZSB3ZSBjYW4gaGlkZSB0aGlzIGVycm9y
IG1lc3NhZ2UgYW5kIGhhdmUKPiBwcm9wZXIgb3V0cHV0Ogo+IAo+ICQgLi91dGlscy90ZXN0LXBr
ZyAtcCBtbWMtdXRpbHMKPiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJj
IFsxLzZdOiBPSwo+ICAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIv
Nl06IE9LCj4gICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBbMy82XTog
T0sKCkluZGVlZCwganEgd2FzIGludHJvZHVjZWQgaW4gdGVzdC1wa2cgYnkgWzFdCgpbMV0KaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1mMjkyMzljZjliYzIx
ZDk2MzIwMzEwNzczNTRiNmJhNWM4NjhjYzFmCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+Cj4gLS0tCj4gIHV0aWxzL3Rlc3QtcGtnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvdGVz
dC1wa2cgYi91dGlscy90ZXN0LXBrZwo+IGluZGV4IDRlYmZkOWFmNjYuLmU3ZjU0NjQ4MTcgMTAw
NzU1Cj4gLS0tIGEvdXRpbHMvdGVzdC1wa2cKPiArKysgYi91dGlscy90ZXN0LXBrZwo+IEBAIC0y
MDEsNyArMjAxLDcgQEAgYnVpbGRfb25lKCkgewo+ICAKPiAgICAgICMgVmFsaWRhdGUgdGhhdCB3
ZSBnZW5lcmF0ZSBwcm9wZXIganNvbiBhcyBzaG93LWluZm8KPiAgICAgIHsgdHB1dCBzbXNvOyBw
cmludGYgJz4+PiBSdW5uaW5nIHNob3ctaW5mb1xuJzsgdHB1dCBybXNvOyB9ID4+ICIke2Rpcn0v
bG9nZmlsZSIgMj4gL2Rldi9udWxsOwo+IC0gICAgSlE9IiQod2hpY2gganEpIgo+ICsgICAgSlE9
IiQod2hpY2gganEgMj4gL2Rldi9udWxsKSIKPiAgICAgIGlmIFsgLXogIiR7SlF9IiBdOyB0aGVu
Cj4gICAgICAgICAgbWFrZSBPPSIke2Rpcn0iIGhvc3QtanEgPj4gIiR7ZGlyfS9sb2dmaWxlIiAy
PiYxCj4gICAgICAgICAgSlE9IiR7ZGlyfS9ob3N0L2Jpbi9qcSIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
