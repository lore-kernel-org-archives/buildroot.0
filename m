Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC7DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:34:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177C761355
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 177C761355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D861D80F94;
	Wed, 20 Oct 2021 12:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOT53YaSpAuv; Wed, 20 Oct 2021 12:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15AD080FDE;
	Wed, 20 Oct 2021 12:34:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E7821BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D9D840292
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JRmYf78R-aP for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:34:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9BA640193
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:34:49 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y12so27734750eda.4
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z57DEgiKbIonPbiNHC8BpoyTlhzAu8KJhcgMohcm8cE=;
 b=Z2xDYRvNVzKX9Ej3qX/49qrILR8TP6L+bgTv/M7VpjGnalKhFNyn2PwohLOObyb9ce
 yF+duOFLlMnkgriKPQa1NsmbcCdrLnwFwJrKj3SP35QcUfRJq9gLODLXSgTJf0Dtmmob
 q5sD0GnJA1jiKUxCGu3uVPqEI2kbp0l2bb0PyUP1atC4QlseuyhBuQqBAqiumbpdCT4Q
 AlUpmsUCt1kpB7gJ0gSmRfCcWmlnoX9vsFdpDotJ+16/hgcoPjOhQ4Db8+STb6xnkBHd
 T+1xYHY7pmyRg2bD+zM464ennAqdD+UjeWAOdFUkuQbSMy51Ftt8T7vmf+GXKDL9VqPP
 qvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z57DEgiKbIonPbiNHC8BpoyTlhzAu8KJhcgMohcm8cE=;
 b=s4deoP5fwrhsfUGUO7jX2z5Qf64pdesz/zhjcTbLybs7R+TOJiOn6Sibpia/GGmEZl
 pt+msDzIz6VU6eFhJ8+HHtbGyKyEQdyKJZu5NreYxiIUnb12lNLShZgCpe37R8nNz4hU
 s6/Dt+WtAYuLKxqLkW89f0mQ25iq9A+k9VwgREfYUvVqGxAZNn+zseQis8GHIMN0X8YT
 pHNNjCBmc0A+i8JXECGBVHN2H3ip6+98Ab2Yz/+YPzw6iRAYJlq1NSWoips0J6cOLiSy
 V5LCw0pj37x/6M12bI5hCyiWT1CxkL6KN6XbyG6rvgMlSTbjgpt+zko//XNRC8NF38xN
 5Bvg==
X-Gm-Message-State: AOAM531Fk37qmmgZDAudryxMlUZsygpnyagGo/eN22bQZVq663JzKUjP
 op37Si4UmSiZ+X0Q11qSRMRgoA==
X-Google-Smtp-Source: ABdhPJwvaUX3DTjvvKwZziwEES+BTw9xu1m4+oCd2wNbCuqZ0Y93GLMDuk4jE9cjqqmaZZGycmbu6g==
X-Received: by 2002:a17:906:8a98:: with SMTP id
 mu24mr44739978ejc.438.1634733287808; 
 Wed, 20 Oct 2021 05:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jv12sm972279ejc.83.2021.10.20.05.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:34:47 -0700 (PDT)
Message-ID: <33b3762f-0b34-8413-6d12-1a7f4850d13e@mind.be>
Date: Wed, 20 Oct 2021 14:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
References: <20211008110345.1901311-1-jose.pekkarinen@unikie.com>
 <dc50460f-e7cb-8863-9319-4904742ca2c8@mind.be>
 <CAJPV9MopDAbp6FiYLOXTsQVjdDdCzb5=O0GmYx7zBcMq0Sz40g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJPV9MopDAbp6FiYLOXTsQVjdDdCzb5=O0GmYx7zBcMq0Sz40g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/opensc: add package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8xMC8yMDIxIDE0OjEwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IAo+IAo+IE9u
IFN1biwgT2N0IDE3LCAyMDIxIGF0IDc6MTggUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBtaW5kLmJlIAo+IDxtYWlsdG86YXJub3V0QG1pbmQuYmU+PiB3cm90ZToKPiAKPiAgICAgIMKg
IEhpIEpvc2XMgSwKPiAKPiAgICAgIMKgIFNhbWUgY29tbWVudHMgb24gdGhpcyBwYXRjaCBhcyB3
aGF0IEdpbGxlcyBnYXZlIG9uIHRoZSBzb2Z0aHNtMiBvbmUuCj4gCj4gICAgIE9uIDA4LzEwLzIw
MjEgMTM6MDMsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gICAgICA+IFRoZSBmb2xsb3dpbmcg
cGF0Y2ggd2lsbCBhZGQgYSByZWNpcGUgdG8KPiAgICAgID4gaW5zdGFsbCBvcGVuc2MgaW4gZmlu
YWwgaW1hZ2VzLgo+ICAgICAgPgo+ICAgICAgPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJp
bmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbQo+ICAgICA8bWFpbHRvOmpvc2UucGVra2Fy
aW5lbkB1bmlraWUuY29tPj4KPiAgICAgID4gLS0tCj4gICAgICA+wqAgwqBwYWNrYWdlL29wZW5z
Yy9Db25maWcuaW4gfMKgIDcgKysrKysrKwo+ICAgICAgPsKgIMKgcGFja2FnZS9vcGVuc2Mvb3Bl
bnNjLm1rIDxodHRwOi8vb3BlbnNjLm1rPiB8IDE1ICsrKysrKysrKysrKysrKwo+IAo+ICAgICAg
wqAgWW91IG5lZWQgdG8gYWRkIGl0IHRvIHBhY2thZ2UvQ29uZmlnLmluLCB5b3UgbmVlZCB0byBh
ZGQgYSBoYXNoIGZpbGUsIGFuZAo+ICAgICBwcmVmZXJhYmx5IGFsc28gYWRkIHlvdXJzZWxmIHRv
IERFVkVMT1BFUlMgZm9yIHRoaXMgcGFja2FnZS4KPiAKPiAgICAgIMKgIEl0J3MgYWxzbyBjb252
ZW5pZW50IGlmIHlvdSBwdXQgdGhlIHR3byBwYWNrYWdlcyB0b2dldGhlciBpbiBhIHNlcmllcywK
PiAgICAgYmVjYXVzZQo+ICAgICB0aGUgREVWRUxPUEVSUyBhbmQgcGFja2FnZS9Db25maWcuaW4g
YXJlIGxpa2VseSB0byBjYXVzZSBjb25mbGljdHMuCj4gCj4gICAgICA+wqAgwqAyIGZpbGVzIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiAgICAgID7CoCDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL29wZW5zYy9Db25maWcuaW4KPiAgICAgID7CoCDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL29wZW5zYy9vcGVuc2MubWsgPGh0dHA6Ly9vcGVuc2MubWs+Cj4gICAgICA+Cj4gICAg
ICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zYy9Db25maWcuaW4gYi9wYWNrYWdlL29wZW5z
Yy9Db25maWcuaW4KPiAgICAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgICAgID4gaW5kZXgg
MDAwMDAwMDAwMC4uYWJkMjZhOWIwOAo+ICAgICAgPiAtLS0gL2Rldi9udWxsCj4gICAgICA+ICsr
KyBiL3BhY2thZ2Uvb3BlbnNjL0NvbmZpZy5pbgo+ICAgICAgPiBAQCAtMCwwICsxLDcgQEAKPiAg
ICAgID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9PUEVOU0MKPiAgICAgID4gK8KgIMKgIMKgYm9vbCAi
b3BlbnNjIgo+ICAgICAgPiArwqAgwqAgwqBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQk9QRU5T
U0wgJiYgQlIyX1BBQ0tBR0VfUENTQ19MSVRFCj4gICAgICA+ICvCoCDCoCDCoGhlbHAKPiAgICAg
ID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgT3BlblNDIHByb3ZpZGVzIGEgc2V0IG9mIGxpYnJhcmll
cyBhbmQgdXRpbGl0aWVzIHRvIHdvcmsKPiAgICAgd2l0aCBzbWFydCBjYXJkcy4KPiAKPiAgICAg
IMKgIEluZGVudGF0aW9uICsgd3JhcHBpbmcuIFBsZWFzZSB1c2UgdXRpbHMvY2hlY2stcGFja2Fn
ZSB0byB2ZXJpZnkuCj4gCj4gICAgICA+ICsKPiAgICAgID4gKyBodHRwczovL2dpdGh1Yi5jb20v
T3BlblNDL09wZW5TQy5naXQgPGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDLmdpdD4K
PiAKPiAgICAgIMKgIFRoZSBVUkwgc2hvdWxkbid0IGhhdmUgYSAuZ2l0IHBhcnQuIFRoYXQgc2Fp
ZCwgYSBiZXR0ZXIgbG9jYXRpb24gaXMKPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQy9P
cGVuU0Mvd2lraSA8aHR0cHM6Ly9naXRodWIuY29tL09wZW5TQy9PcGVuU0Mvd2lraT4KPiAKPiAK
PiAgICAgID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNjL29wZW5zYy5tayA8aHR0cDovL29w
ZW5zYy5taz4KPiAgICAgYi9wYWNrYWdlL29wZW5zYy9vcGVuc2MubWsgPGh0dHA6Ly9vcGVuc2Mu
bWs+Cj4gICAgICA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gICAgICA+IGluZGV4IDAwMDAwMDAw
MDAuLjc3NDFkYWMyYTUKPiAgICAgID4gLS0tIC9kZXYvbnVsbAo+ICAgICAgPiArKysgYi9wYWNr
YWdlL29wZW5zYy9vcGVuc2MubWsgPGh0dHA6Ly9vcGVuc2MubWs+Cj4gICAgICA+IEBAIC0wLDAg
KzEsMTUgQEAKPiAgICAgID4KPiAgICAgKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAgICA+
ICsjCj4gICAgICA+ICsjIG9wZW5zYwo+ICAgICAgPiArIwo+ICAgICAgPgo+ICAgICArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgICAgID4gKwo+ICAgICAgPiArT1BFTlNDX1ZFUlNJT04gPSAw
LjIyLjAKPiAgICAgID4gK09QRU5TQ19TSVRFID0gJChjYWxsIGdpdGh1YixPcGVuU0MsT3BlblND
LCQoT1BFTlNDX1ZFUlNJT04pKQo+IAo+ICAgICAgwqAgVGhlcmUncyBhbiB1cGxvYWRlZCB0YXJi
YWxsIGF0Cj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL3JlbGVhc2VzL2Rv
d25sb2FkLzAuMjIuMC9vcGVuc2MtMC4yMi4wLnRhci5nego+ICAgICA8aHR0cHM6Ly9naXRodWIu
Y29tL09wZW5TQy9PcGVuU0MvcmVsZWFzZXMvZG93bmxvYWQvMC4yMi4wL29wZW5zYy0wLjIyLjAu
dGFyLmd6Pgo+IAo+ICAgICAgPiArT1BFTlNDX0xJQ0VOU0UgPSBHUEwtMgo+IAo+ICAgICAgwqAg
SSBoYXZlbid0IGNoZWNrZWQgaW4gZGV0YWlsLCBidXQgaXQgc2VlbXMgdG8gYmUgTEdQTC0yLjEr
Cj4gCj4gICAgICA+ICtPUEVOU0NfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAKPiAgICAgIMKg
IFRoaXMgZmlsZSBkb2Vzbid0IGV2ZW4gZXhpc3QuCj4gCj4gICAgICA+ICtPUEVOU0NfREVQRU5E
RU5DSUVTID0gb3BlbnNzbCBwY3NjLWxpdGUKPiAgICAgID4gK09QRU5TQ19BVVRPUkVDT05GID0g
WUVTCj4gCj4gICAgICDCoCBZb3UgbmVlZCB0byBhZGQgYSBjb21tZW50IHdoeSB0aGlzIGlzIG5l
ZWRlZC4gSXQgcHJvYmFibHkgaXNuJ3Qgd2l0aCB0aGUKPiAgICAgdXBsb2FkZWQgdGFyYmFsbC4K
PiAKPiAgICAgID4gK09QRU5TQ19JTlNUQUxMX1RBUkdFVCA9IFlFUwo+IAo+ICAgICAgwqAgVGhp
cyBpcyB1bm5lY2Vzc2FyeSAoZGVmYXVsdCkuIF9JTlNUQUxMX1NUQUdJTkcsIG9uIHRoZSBvdGhl
ciBoYW5kLCAqaXMqCj4gICAgIG5lY2Vzc2FyeS4KPiAKPiAgICAgID4gKwo+ICAgICAgPiArJChl
dmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ICAgICAgPgo+IAo+IAo+ICAgICBIaSwKPiAKPiAg
ICAgVGhhbmtzIGZvciB0aGUgaGVscCBhbmQgZ3VpZGFuY2UsIHdoaWxlIHJlYWRpbmcgdGhlCj4g
Cj4gdjIgb2YgdGhlIHBhdGNoIEkgZmluZCB0aGUgZm9sbG93aW5nIHdhcm5pbmcgSSBkb24ndCBx
dWl0ZSB1bmRlcnN0YW5kLAo+IGFuZCBJIGRvbid0IGZpbmQgYW55IHJlbGV2YW50IGRvY3Mgb3Zl
ciB0aGUgbmV0LCB3b3VsZCB5b3UgbWluZCB0bwo+IGVsYWJvcmF0ZSB3aGF0IGNvdWxkIGl0IG1l
YW4gdGhlIGZvbGxvd2luZyB3YXJuaW5nIGZyb20gY2hlY2stcGFja2FnZToKPiAKPiAkIC4vdXRp
bHMvY2hlY2stcGFja2FnZSBwYWNrYWdlL29wZW5zYy8qCj4gcGFja2FnZS9vcGVuc2Mvb3BlbnNj
Lm1rOjggPGh0dHA6Ly9vcGVuc2MubWs6OD46IHJlbW92ZSBkZWZhdWx0IHZhbHVlIG9mIF9TT1VS
Q0UgCj4gdmFyaWFibGUgKGh0dHA6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI2dlbmVyaWMtcGFj
a2FnZS1yZWZlcmVuY2UgCj4gPGh0dHA6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI2dlbmVyaWMt
cGFja2FnZS1yZWZlcmVuY2U+KQo+IDI1IGxpbmVzIHByb2Nlc3NlZAo+IDEgd2FybmluZ3MgZ2Vu
ZXJhdGVkCj4gCj4gICAgIHdoaWxlIHRoZSBwYWNrYWdlIGxvb2tzIGxpa2UgdGhpczoKPiAKPiAk
IGNhdCBwYWNrYWdlL29wZW5zYy9vcGVuc2MubWsgPGh0dHA6Ly9vcGVuc2MubWs+Cj4gIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAjCj4gIyBvcGVuc2MKPiAjCj4gIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAKPiBPUEVOU0NfVkVSU0lPTiA9IDAuMjIuMAo+IE9QRU5TQ19TT1VSQ0UgPSBvcGVu
c2MtJChPUEVOU0NfVkVSU0lPTikudGFyLmd6CgogIElmIHlvdSBkb24ndCBzZXQgT1BFTlNDX1NP
VVJDRSBhdCBhbGwsIHRoZW4gaXQgd2lsbCBhdXRvbWF0aWNhbGx5IGdldCB0aGlzIAp2YWx1ZS4g
Y2hlY2stcGFja2FnZSB3YXJucyB0aGF0IHlvdSdyZSBkb2luZyBhbiB1bm5lY2Vzc2FyeSBzZXR0
aW5nIGhlcmUuCgoKICBSZWdhcmRzLAogIEFybm91dAoKPiBPUEVOU0NfU0lURSA9IAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9PcGVuU0MvT3BlblNDL3JlbGVhc2VzL2Rvd25sb2FkLyQoT1BFTlNDX1ZF
UlNJT04pLyAKPiA8aHR0cHM6Ly9naXRodWIuY29tL09wZW5TQy9PcGVuU0MvcmVsZWFzZXMvZG93
bmxvYWQvJChPUEVOU0NfVkVSU0lPTikvPgo+IE9QRU5TQ19MSUNFTlNFID0gTEdQTC0yLjErCj4g
T1BFTlNDX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gT1BFTlNDX0RFUEVOREVOQ0lFUyA9IG9w
ZW5zc2wgcGNzYy1saXRlCj4gT1BFTlNDX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IAo+ICQoZXZh
bCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiAKPiAgICAgVGhhbmtzIQo+IAo+ICAgICBKb3PDqS4K
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
