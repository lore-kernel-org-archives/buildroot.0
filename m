Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842E9CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 21:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0867481285;
	Wed, 13 May 2026 21:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9To4UQgH3wUS; Wed, 13 May 2026 21:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0642181286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778706270;
	bh=tbRvFkbPuxy1t3zNrhrxOYrbEAfwI1Ujflcq7lP3xD8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e99rBVpDBmRNKBr0liFzahoO4cI7hDILCKEhmoLZ9jqOqqOAaIq5xcWCnaaNgleN+
	 g98j4+jjpeV+uqu/ba0tv1VJY5RiraAKErPO/DCt0wo8cjCSZouMlbfo8d8lNkq/yA
	 RfDdXGBgeVEUpoQ03JHOcGOwhj/1CvRrxQ91vc447tWzu2TrRGchtngyIWBENXMVwN
	 3u4G5lT4PjAxP8wgRdj71IMj3D6VbeX/okwN9J+jHZ9/IBgMaGVOyE35AYaWir0eLI
	 f8mSZ94DGFfeSPVXl1iqzHMsUJItYvZ5Y4reHMBiKsXzrS9KnsaUhOEEvZCOusLAao
	 6EajzypcyxLQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0642181286;
	Wed, 13 May 2026 21:04:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC7E36F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E927B408C3
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sVRdmTzQMqa for <buildroot@buildroot.org>;
 Wed, 13 May 2026 21:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 681A24085B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681A24085B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 681A24085B
 for <buildroot@buildroot.org>; Wed, 13 May 2026 21:04:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488b0046078so59595735e9.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778706265; x=1779311065;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyaDMnxgZSO+EcSj1CiJXqI0BRF58DPKZW9IUTNRiUw=;
 b=Sazis03yZEKljiWpcifQLQPdtAb7qrv9sB9KIA1qksPyb02/TU+aAue2eEoYzNuiMr
 VMTH/xHv08QklC9ekN5AbdueEtNjoDqfni20BldGHEjQh1hHyhtdCqpDDvpzXaBuI+pb
 sysPQsLro3n2wd+BVfO59ZGAwPPyq16NaQm0/1abb8PQP8S9HDrTE8lLEr8Raksw1+0i
 uiqbE+nkowVAgpteMFurK+rZhMWnioOo50h8mcl23WRzKDHddMh2dkoXI2txNz1fPCcg
 2+EGYNQAJFaHRIdE0YqM/0s2QafJNJXjmFvi41W8Kzzap/Mjxy1NT80WD1WDFCybfynH
 eIYQ==
X-Gm-Message-State: AOJu0YyX5xip1sTXGGkNWR/9FlYwnl4k+NB8vGb6FEYuYPMKx4JlbayH
 ha310c+TGEuNgXnI0Vx9vuRRlAdOo+NnK8X5RUnil80vU/9LAv0lZsTiRSIYGkX6ESp5Et4jENV
 O490CUsc=
X-Gm-Gg: Acq92OF0ZaEFENlhka+rAiM8ZxUxRcy4xbjK9rMXHJtu2OCrS8dhTGaSD1+Scbl0hk1
 Z4Orqr9BJjyrSlnIe2dE8Uz25xRcIXdulr1jEr8Plb8CBP4wbNRQOko+li2eRGxWYyGtApd/dNb
 6A/OEyZ3be6K1CQmBbyskTPUKZe8K75Whkmb7g3TsQwhiSybOFV+L/2pC8+VGthham8ROIJUsw9
 6KZD/xnuOgVc0uVaFE5SMyL3+B+EgKB67Tdgr2jrOo25KnzMuEmxuIvIk0/XZPmQEwqy5BgONor
 aJyRt4VNwc+y03F4m0vfllAReKsDr5eAqct6lrOq1YWGKVe5WW+FaEFEoy9Bghq7s/IDvvVbZrz
 eS3/lMI73gYGLFPsPUuwN+dt5PYB1DhdE22xjJR7xFWTAHkxIFnV3VKhO0wZVAmS6aCtap3WMV+
 gC3yHZKPv1td5pkU783n/WLUsYVgDmqpk90wIhk9B9R7P5LYFMLJ9vWUkuxZqvjdUhR7td4Cbju
 OGqYY86xFO/7cTa4RRZoPcNw5+Gu8NYjvQWKHxfBRX2tSgyJhISDEjsB1/jjGVM9g==
X-Received: by 2002:a05:600c:a48:b0:489:1ff1:74df with SMTP id
 5b1f17b1804b1-48fc9a02911mr73345115e9.1.1778706265135; 
 Wed, 13 May 2026 14:04:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17ec2sm1290264f8f.24.2026.05.13.14.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 14:04:24 -0700 (PDT)
Message-ID: <8635728b-ccae-4c74-ac6c-eda4f18ff78a@smile.fr>
Date: Wed, 13 May 2026 23:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
 <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
 <CAMWSM7gneUcaExHXk5=O0TwwUUXGpX=c_jdFNB_=TNS5UMJU+g@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CAMWSM7gneUcaExHXk5=O0TwwUUXGpX=c_jdFNB_=TNS5UMJU+g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778706265; x=1779311065; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nyaDMnxgZSO+EcSj1CiJXqI0BRF58DPKZW9IUTNRiUw=;
 b=DoQwOmKMV+xbnp+8yPiVrgU73ksA+PpzV2ZjERgLqW+MHy6IYvQf0MoNbI9rRW9Zbo
 tTLBKXG0wPvhCTNta3GqRMJbXh67Iv6YOASSnzxbnagOkXs2IZnDyRkg7drxm/jaEl7M
 i+voRDD5wMCoQIEkOlgnXCbvkaNW6m+vm1NqA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=DoQwOmKM
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAxMy8wNS8yMDI2IMOgIDIwOjE2LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBIZWxsbyBSb21haW4sCj4gCj4gT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQg
MTA6MTfigK9BTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+
Cj4+PiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUgo+Pj4gKyAgICAgYm9v
bCAiRW5hYmxlIHZpcmdscmVuZGVyZXIiCj4+PiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMCj4+PiArICAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfUUVNVV9PUEVOR0wKPj4+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9WSVJHTFJF
TkRFUkVSCj4+Cj4+IEFsbCB0aGlzIGVmZm9ydCB0byBidWlsZCB2aXJnbHJlbmRlcmVyIHdpdGhv
dXQgZWdsIG9yIGdsIHRvIHVzZSBpdCAoc2VsZWN0IGl0KQo+PiB1bmRlciBhbiBvcHRpb24gdGhh
dCBkZXBlbmRzIG9uIGVnbCBvciBnbD8KPj4KPj4gSSdsbCBoYXZlIGEgc2Vjb25kIGxvb2suCj4+
Cj4gCj4gSW5kZWVkLCB2aXJnbHJlbmRlcmVyIGlzIHVzZWQgYnkgbW9yZSB0aGFuIGp1c3QgcWVt
dS4gSXQncyBhbHNvIHVzZWQKPiBieSBtdXZtL2xpYmtydW4sIGFuZCBvdGhlciBWTU1zIGxpa2Ug
Y3Jvc3ZtIGZvciBjb21wdXRlL2dyYXBoaWNzLiBUaGUKPiBydXRhYmFnYV9nZnggYmFja2VuZCBp
biBxZW11IGNhbiBhbHNvIG9wdGlvbmFsbHkgdXNlIHZpcmdscmVuZGVyZXIuCj4gCj4gRm9yIHFl
bXUsIHRoZXJlJ3MgY3VycmVudGx5IGEgZGVwZW5kZW5jeSBvbiB0aGUgZGlzcGxheSBoYXZpbmcg
R0wKPiBlbmFibGVkIHRvIHVzZSB2aXJnbHJlbmRlcmVyIHdpdGggdGhlIHZpcnRpby1ncHUgZGV2
aWNlLiBJIGJlbGlldmUKPiB0aGlzIGlzIGEgaGlzdG9yaWNhbCByZWxpYy4gQXMgdGhlIG5hbWUg
c3VnZ2VzdHMsIHZpcmdscmVuZGVyZXIgd2FzCj4gY3JlYXRlZCB0byBleHBvc2UgYSB2aXJ0dWFs
IEdQVSB0byBndWVzdHMgZ2l2aW5nIHRoZW0gaGFyZHdhcmUKPiBhY2NlbGVyYXRlZCBHTCB0aHJv
dWdoIGEgcmVuZGVyZXIgb24gdGhlIGhvc3QuIFRoZXJlZm9yZSwgaXQgd2FzCj4gcmVhc29uYWJs
ZSBmb3IgdGhlIGhvc3QncyBkaXNwbGF5IGZyb250ZW5kIHRvIGFsc28gZGVwZW5kIG9uIGxpYkdM
Lgo+IAo+IExhdGVyLCB2aXJnbHJlbmRlcmVyIGdyZXcgbW9yZSBjYXBhYmxlLCBnYWluaW5nIHN1
cHBvcnQgZm9yIFZ1bGthbiwKPiBhbmQgbGF0ZXIgaG9zdCBuYXRpdmUgY29udGV4dC4gVGhpcyBh
bGxvd2VkIGd1ZXN0cyB0byBydW4gdGhlIE1lc2EKPiBVTURzIGRpcmVjdGx5LCB3aXRob3V0IGFu
eSBhc3N1bXB0aW9uIG9mIGhvc3QgcmVuZGVyaW5nIGNhcGFiaWxpdGllcy4KPiAKPiBQYXRjaGVz
IFswXSBvbiB0aGUgcWVtdS1kZXZlbCBtYWlsaW5nIGxpc3QgYWltIHRvIGRlY291cGxlCj4gY29t
cHV0ZS9yZW5kZXJpbmcgaW4gdGhlIGd1ZXN0IGZyb20gdGhlIGhvc3QncyBkaXNwbGF5IHBpcGVs
aW5lLiBUaGlzCj4gbWVhbnMgd2UgY291bGQgcnVuIHFlbXUgb24gYSBob3N0IHdpdGhvdXQgbGli
R0wgYW5kIHN0aWxsIGRvCj4gY29tcHV0ZS9yZW5kZXJpbmcgaW5zaWRlIHRoZSBndWVzdC4KPiAK
PiBQcm9qZWN0cyBsaWtlIG11dm0gYWxyZWFkeSB3b3JrIHdpdGggaGVhZGxlc3MgZ3JhcGhpY3Mv
Y29tcHV0ZSBpbgo+IGd1ZXN0cyB0aHJvdWdoIHZpcmdscmVuZGVyZXIuIFRoaXMgY2hhbmdlIHN1
cHBvcnRzIHRoZXNlIGtpbmRzIG9mCj4gYXBwbGljYXRpb25zIGFuZCB1c2UgY2FzZXMuCgpUaGFu
a3MgZm9yIHRoZSBleHBsYW5hdGlvbiEKClNvcnJ5IEknbSBub3QgZmFtaWxpYXIgd2l0aCB2aXJ0
aW8tZ3B1IC8gdmlyZ2wgc3RhY2sgKGF0IGxhc3QgSSBoYXZlIGEgYmV0dGVyCnVuZGVyc3RhbmRp
bmcgdGhhbmtzIHRvIHlvdXIgcGF0Y2ggc2VyaWVzKQoKPiAKPiBZb3UgZm9sbG93ZWQgdXAgd2hp
bGUgSSB3YXMgZHJhZnRpbmcgbXkgb3duIHJlcGx5LiA6KQo+IAo+IE9uIFdlZCwgTWF5IDEzLCAy
MDI2IGF0IDExOjA24oCvQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
b3RlOgo+Pgo+PiBPayBJIGdldCBpdCwgYnVpbGRpbmcgbGliZXBveHkgd2l0aG91dCBlZ2wgb3Ig
Z2wgZGVwZW5kZW5jeSBtYWtlcyBzZW5zIHdoaWxlCj4+IGJ1aWxkaW5nIHdpdGggb25seSB2ZW51
cyAodnVsa2FuKS4gbGliZXBveHkgaXMgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeSBvZgo+PiB2aXJn
bHJlbmRlcmVyIGV2ZW4gaWYgb25seSB2ZW51cyAodnVsa2FuKSBpcyBlbmFibGVkIGluIHRoZSBk
ZWZjb25maWcuCj4+Cj4+IFRoZSBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVSX1ZFTlVTIG9wdGlv
biBpcyBub3QgdXNlZCBieSBRZW11IGJ1dCBjb3VsZCBiZSB1c2VkCj4+IGluIGJ5IGFub3RoZXIg
cGFja2FnZSBvciBkZWZjb25maWcuCj4gCj4gRXhhY3RseSwgdmlyZ2xyZW5kZXJlciBhbHdheXMg
ZGVwZW5kcyBvbiBsaWJlcG94eSwgd2hpY2ggY2FuIGJlIGJ1aWx0Cj4gd2l0aG91dCBHTC9FR0wu
IFdlIG1heSB3YW50IHRvIGJ1aWxkIHZpcmdscmVuZGVyZXIgd2l0aCBWZW51cyBhbmQvb3IKPiBE
Uk0gc3VwcG9ydCwgd2hpY2ggd291bGQgZW5hYmxlIGd1ZXN0cyB0byBkbyBjb21wdXRlL3JlbmRl
cmluZyBlaXRoZXIKPiBoZWFkbGVzcywgb3IgZm9yIGRpc3BsYXkgb24gdGhlIGhvc3QgdGhyb3Vn
aCBWdWxrYW4uCj4gCj4gVGhlIHZpcmdscmVuZGVyZXIgcGFja2FnZSBkZWZhdWx0cyBWaXJHTCBz
dXBwb3J0IHRvIHkgd2hlbiBsaWJHTCBpcwo+IHByZXNlbnQuIFRoaXMgaXMgdGhlIGNhc2Ugd2hl
biB3ZSBzZWxlY3QgdmlyZ2xyZW5kZXJlciBzdXBwb3J0IGluCj4gcWVtdSwgYXMgZXhwbGFpbmVk
IGFib3ZlLgoKWWVzIGJ1dCBldmVuIGlmIGl0J3MgdGhlIGRlZmF1bHQsIEJSMl9QQUNLQUdFX1FF
TVVfVklSR0xSRU5ERVJFUiBvcHRpb24gc2hvdWxkCnNlbGVjdCBCUjJfUEFDS0FHRV9WSVJHTFJF
TkRFUkVSX1ZJUkdMLiBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVSX1ZJUkdMIGNhbgpzdGlsbCBi
ZSBkaXNhYmxlZCBmcm9tIG1lbnVjb25maWcuCgpXaGF0IGhhcHBlbiBpZiBCUjJfUEFDS0FHRV9R
RU1VX1ZJUkdMUkVOREVSRVIgaXMgc2VsZWN0ZWQgYW5kCkJSMl9QQUNLQUdFX1ZJUkdMUkVOREVS
RVJfVklSR0wgZGlzYWJsZWQ/Cgo+IAo+IFBlcmhhcHMgd2UgY291bGQgY2xhcmlmeSB0aGlzIGJ5
IGV4cGFuZGluZyB0aGUgaGVscCBtZXNzYWdlIHVuZGVyCj4gcWVtdSdzIHZpcmdscmVuZGVyZXIg
Y29uZmlnIHRvIGV4cGxhaW4gdGhhdCB2aXJnbHJlbmRlcmVyIGl0c2VsZiBoYXMKPiBhZGRpdGlv
bmFsIG9wdGlvbnMuCgpGaXJzdCwgd2Ugc2hvdWxkIGltcHJvdmUgdGhlIGxpYmVwb3h5IGhlbHAg
dGV4dCB0byBleHBsYWluIHdoeSBpdCdzIGZpbmUgdG8gdXNlCmxpYmVwb3h5IHdpdGhvdXQgRUdM
IGFuZCBHTC4KClRoZW4sIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUiBzaG91bGQgbm90
IG9ubHkgc2VsZWN0CkJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIgd2l0aG91dCBlbmFibGluZyBh
bnkgc3Vib3B0aW9uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gQmVzdCByZWdhcmRzLAo+
IEpvc2VwaAo+IAo+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjYw
MzE3MTgyMDQ5LjMzODQ4LTEtbHVjYWFhbWFyYWxAZ21haWwuY29tLwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
