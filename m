Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60571C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:07:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C229961076
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C229961076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A76E402E9;
	Mon, 23 Aug 2021 22:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbEVf1gDXWjv; Mon, 23 Aug 2021 22:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EFFA403B4;
	Mon, 23 Aug 2021 22:06:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23AB71BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E82C40334
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAoKlTcrR-cU for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:06:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 314E2400DE
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:06:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b7so28503421edu.3
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zcKKG4A3Icw1FUSVDersgD1kjxzCivG2HhN+BPCRSfA=;
 b=EtFyKige/Nlmvfe/NVH1Knc7DGhLUkZn7Wm821Gl74noetNluUOUXFzMh+x1fckttw
 rtNhswq6s9GVK7sgINGTP4prGQcyJqKV8kYxbFBvEgQbnx9eN5WSjrG81ShFPHY6iA6r
 C/dbwG6a3RAUiYty3VtIP98BbZWvkisc7vcLY6JR9zwojKZTrJZ87xdHEFn1QZICA7mc
 WnV8hNAGT4PZ2ONYcyrtctlLctQf02mIr2/uY++tAzaU1NEr3y7gwsei+HAkrlh1vLT0
 TTWARYBwT/9UMhvooNN5YPfM6LqTGZB0STRfmabY8KM0reT6ftpgFufGogRDwhW4yZ/r
 4KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zcKKG4A3Icw1FUSVDersgD1kjxzCivG2HhN+BPCRSfA=;
 b=uhBzsLGhY8uOFzDH6suHlkyIOEaHjAo0SwUAZ1XtzZPRtCSAMw5BwRg8qfwDLPlbEX
 m88O3tcwCbg397eehY5Izhl32G2jToY36tGmE62VdqXYvcjhJj+xAji7Z2vCbIoJqbn9
 VJBUQWHuRhJiVEU1KrrOCPHHPlkz0BPTceRo3omQJdgXqks6lpjFreMZsWk28EHyeoht
 HP4IXky6JFiWoSwY09zMd0RUe8BIaDVsjlAnGl4We6iALdWOrKnEFqjN6KSOyqTE87IE
 SZabqId0hL38+xTY00HjStPYzdvMpCUpytU9rq3YA4IEFsKgpsbf7gXAbD/ncG4ytzQD
 5jDg==
X-Gm-Message-State: AOAM531SsruWua8kvx92nzjtcrj86BkhVseJAHO0GmfeC70Cz3PF01WO
 Ec9g+Dn8kOEfcjd2ymjr+OSq5zGx3R/eUQ==
X-Google-Smtp-Source: ABdhPJxpG6l80YdHcinTx78/y6WdLKW0YG6XsCSWfje/hZQ0xuV/QvW6WRqa/rsphbGb92U26YME+g==
X-Received: by 2002:aa7:dace:: with SMTP id x14mr7990524eds.169.1629756410241; 
 Mon, 23 Aug 2021 15:06:50 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j14sm10329576edk.7.2021.08.23.15.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 15:06:49 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210821160509.1514047-1-fontaine.fabrice@gmail.com>
 <20210821210807.2a05b670@windsurf>
 <CAPi7W80znOLdCLW0eXkzktx7fAXt2msLetHBzyzzqm_2+RKbMA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c11e8a5a-2539-968a-ddcf-e9da328316a4@mind.be>
Date: Tue, 24 Aug 2021 00:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPi7W80znOLdCLW0eXkzktx7fAXt2msLetHBzyzzqm_2+RKbMA@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyMi8wOC8yMDIxIDAwOjA2LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IExlIHNhbS4g
MjEgYW/Du3QgMjAyMSDDoCAyMTowOCwgVGhvbWFzIFBldGF6em9uaQo+IDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4+Cj4+IE9uIFNhdCwgMjEgQXVnIDIwMjEgMTg6
MDU6MDkgKzAyMDAKPj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+Pj4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiByaXNj
djMyOgo+Pj4KPj4+IC4uL3NyYy91dGlsL2Z1dGV4Lmg6IEluIGZ1bmN0aW9uICdzeXNfZnV0ZXgn
Ogo+Pj4gLi4vc3JjL3V0aWwvZnV0ZXguaDozOToxOTogZXJyb3I6ICdTWVNfZnV0ZXgnIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdzeXNfZnV0
ZXgnPwo+Pj4gICAgMzkgfCAgICByZXR1cm4gc3lzY2FsbChTWVNfZnV0ZXgsIGFkZHIxLCBvcCwg
dmFsMSwgdGltZW91dCwgYWRkcjIsIHZhbDMpOwo+Pj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn4KPj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgc3lzX2Z1dGV4Cj4+Pgo+
Pj4gRml4ZXM6Cj4+PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82
OTI3MDBhNWY5Njc3NjBhMGI4Y2QzNThiMTcxMmYxZDVhN2I2ODFlCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+Cj4+
PiArKyNpZm5kZWYgU1lTX2Z1dGV4Cj4+PiArKyNkZWZpbmUgU1lTX2Z1dGV4IFNZU19mdXRleF90
aW1lNjQKPj4+ICsrI2VuZGlmCj4+Cj4+IEFyZSB3ZSBzdXJlIHRoYXQgU1lTX2Z1dGV4IGlzIGV4
YWN0bHkgZXF1aXZhbGVudCB0byBTWVNfZnV0ZXhfdGltZTY0ID8KPj4gSW4gYW5vdGhlciBlLW1h
aWwgdGhyZWFkIEFybm91dCBzYWlkIHRoZXkgYXJlIG5vdCBleGFjdGx5IGVxdWl2YWxlbnQuCj4g
SSdsbCBsZXQgQXJub3V0IGFuc3dlcnMgYnV0IHRoZSBzYW1lIGtpbmQgb2YgcGF0Y2ggd2FzIGFw
cGxpZWQgZm9yIGNhcG5wcm90bzoKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjEwNTI3MjEwNDAyLjU1NTMzNC0xLWZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tCgogSSBjYW4ndCBzYXkgSSBmdWxseSB1bmRlcnN0YW5kIGFsbCBvZiBpdCwg
YnV0IHRoaXMgaXMgbXkgdW5kZXJzdGFuZGluZzoKCiBUaGUgb25seSBkaWZmZXJlbmNlIGJldHdl
ZW4gU1lTX2Z1dGV4IGFuZCBTWVNfZnV0ZXhfdGltZTY0IGlzIHRoYXQgdGhlIGZvcm1lcgp0YWtl
cyBhIGxlZ2F5IHN0cnVjdCB0aW1lc3BlYyB3aGlsZSB0aGUgbGF0dGVyIHRha2VzIGEgNjQtYml0
IHN0cnVjdCB0aW1lc3BlYy4KCiBBbnkgc3lzdGVtIHdoaWNoIGRvZXNuJ3QgaGF2ZSBTWVNfZnV0
ZXggZGVmaW5lZCAoYnV0IGRvZXMgaGF2ZSBTWVNfZnV0ZXhfdGltZTY0CmRlZmluZWQpIGlzIG5l
Y2Vzc2FyaWx5IGEgc3lzdGVtIHRoYXQgb25seSBoYXMgNjQtYml0IHN0cnVjdCB0aW1lc3BlYy4g
U28gdW5sZXNzCnRoZSBsaWJjIGlzIGNvbXBsZXRlbHkgYnJva2VuLCBpdCBtdXN0IGhhdmUgYSA2
NC1iaXQgc3RydWN0IHRpbWVzcGVjLgoKIFRoZXJlZm9yZSwgYSBjaGFuZ2UgbGlrZSB0aGlzIGlz
IE9LLCBhcyBsb25nIGFzIG5vIGNvZGUgbWFrZXMgYW55IGFzc3VtcHRpb25zCmFib3V0IHRoZSBs
YXlvdXQgb2YgdGhlIHN0cnVjdCB0aW1lc3BlYyB0aGF0IGlzIHBhc3NlZCBhcyBhbiBhcmd1bWVu
dC4gVGhhdApzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIHVubGVzcyBzb21lIHZlcnkgd2VpcmQgY2Fz
dGluZyBpcyBiZWluZyBkb25lLiBXaXRoIHRpbWVfdAp0aGUgcmlzayBpcyBiaWdnZXIgKGNhc3Rp
bmcgYSBwb2ludGVyLXRvLWxvbmcgdG8gcG9pbnRlci10by10aW1lX3QgaXMgcHJldHR5CmVhc3kg
dG8gZG8pLCBidXQgZm9yIHN0cnVjdCB0aW1lc3BlYyBpdCdzIG5vdCByZWFsbHkgbGlrZWx5LgoK
IFNvIEknbSBub3QgcGFydGljdWxhcmx5IG9wcG9zZWQgdG8gcGF0Y2hlcyBsaWtlIHRoaXMsIGFz
IGxvbmcgYXMgaXQncyBzZW50CnVwc3RyZWFtIGFuZCB1cHN0cmVhbSBkb2Vzbid0IGNvbXBsYWlu
IHRvbyBtdWNoIGFib3V0IGl0LgoKIEEgbW9yZSBvZmZpY2lhbCBhcHByb2FjaCBjb3VsZCBiZSB0
byByZWx5IG9uIF9fVElNRVNJWkUuIElmIF9fVElNRVNJWkUgaXMgNjQKKHdoaWNoIGl0IGlzIG9u
IHJpc2N2MzIpLCB0aGVuIHN0cnVjdCB0aW1lc3BlYyBpcyA2NC1iaXQgc28gd2UgaGF2ZSB0byB1
c2UKU1lTX2Z1dGV4NjQgaW5zdGVhZCBvZiBTWVNfZnV0ZXguIEhvd2V2ZXIsIF9fVElNRVNJWkUg
Y29tZXMgZnJvbSBnbGliYywgSSdtIG5vdApzdXJlIGlmIHVDbGliYyBhbmQgbXVzbCBkZWZpbmUg
aXQuIEkgY2FuJ3QgZmluZSBhIHJlZmVyZW5jZSB0byBpdCBpbiB0aGVpciByZXBvcy4KCiBPZiBj
b3Vyc2UsIHRoZSBiZXR0ZXIgc29sdXRpb24gaXMgdG8gbWFrZSB0aGUgd2hvbGUgdGhpbmcgdGlt
ZTY0IGNvbXBsaWFudCwgYnV0CnRoYXQncyBnZW5lcmFsbHkgYSBiaWdnZXIgY2hhbmdlLiBBbmQg
bm90IHJlYWxseSBwb3NzaWJsZSBhdCB0aGlzIHBvaW50IC0gZ2xpYmMKZG9jdW1lbnRhdGlvbiBp
dHNlbGYgc2F5cyB0aGF0IGl0J3Mgbm90IHJlYWR5IHlldCBbMV0uCgogQm90dG9tIGxpbmU6IEkg
dGhpbmsgdGhpcyBwYXRjaCBpcyBnb29kLCBhcyBpbiwgaXQncyBwcmV0dHkgbXVjaCB0aGUgb25s
eQpmZWFzaWJsZSBhcHByb2FjaCAob3RoZXIgdGhhbiBkaXNhYmxpbmcgaXQgZm9yIHJpc2N2MzIp
LiBUaGVyZWZvcmUsIGFwcGxpZWQgdG8KbWFzdGVyLHRoYW5rcy4KCiBSZWdhcmRzLAogQXJub3V0
CgpbMV0KaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9saWJjL21hbnVhbC9odG1sX25vZGUv
NjRfMDAyZGJpdC10aW1lLXN5bWJvbC1oYW5kbGluZy5odG1sCgoKCgo+IAo+IEFub3RoZXIgb3B0
aW9uIHdvdWxkIGJlIHRvIGRpc2FibGUgbWVzYTNkIG9uIHJpc2N2MzIsIGVzcGVjaWFsbHkgaWYK
PiB1cHN0cmVhbSByZWplY3RzIHRoZSBNUi4KPj4KPj4gVGhvbWFzCj4+IC0tCj4+IFRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwo+PiBodHRwczovL2Jvb3RsaW4uY29tCj4gQmVzdCBSZWdhcmRz
LAo+IAo+IEZhYnJpY2UKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
