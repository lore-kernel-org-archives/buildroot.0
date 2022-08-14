Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3042EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634B04196A;
	Sun, 14 Aug 2022 15:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634B04196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7Y_WyWro5Kx; Sun, 14 Aug 2022 15:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C1C4195E;
	Sun, 14 Aug 2022 15:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C1C4195E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E40D1BF422
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCE8483EC1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE8483EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9EYC5NpFi4F for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339CF83EBA
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 339CF83EBA
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 15:56:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x21so6909317edd.3
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 08:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=3fodf54axdRgfk5t++djRufgQ/Sh3jbrSgpsdRJEkfQ=;
 b=M3olHgtxkpaRDffSN4+NSSIRw5xTDnSugc2gPCSOnXGZLDmvN3xmUiNfFV72EgITj8
 D1pdDptIdUmj5BblBjU7VwUGiOXElRLDA4H24p3hGpsyWE62CbItRT3Vw4tn2ucYL4XS
 eHVhpJB+UYOkkNnbkB8JeYiYazsBdILoGjmxt5qZc9HKmQ/asOE8D11D/Jnnp0oBb3qV
 1dD4WRv25HM8ePcK9gVZVlf5H0FV+bzHjlgwLiE2RvE5wrp5JyT7kXnYjyKphlfF2Tuw
 HkCPcU0+UoQbOujIn/Bl3ziL7lbB4pyhADFf5Yyt87x12lg/dn0T0O6+uaMhDcHfARaZ
 1eRg==
X-Gm-Message-State: ACgBeo3CTPohDPxwDkuiydD7ZNWeseTP8EDmWkxqaNtjUA6uifpid1mC
 ehyAMI9UpOGxzp2FIWrnwuDjPQ==
X-Google-Smtp-Source: AA6agR7qMFo8dXWLlnhN2zNKMQuuBVP3PYm9CWDH/yXbSxyUmsXjGaYyzOs4xU/LQYkuykxY0QgrJA==
X-Received: by 2002:a05:6402:274b:b0:440:608b:a4c0 with SMTP id
 z11-20020a056402274b00b00440608ba4c0mr11155893edd.321.1660492571006; 
 Sun, 14 Aug 2022 08:56:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm2301406ejd.28.2022.08.14.08.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 08:56:10 -0700 (PDT)
Message-ID: <122138b7-6c9a-b054-c986-62745b6b6f82@mind.be>
Date: Sun, 14 Aug 2022 17:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Francois Perrad <fperrad@gmail.com>
References: <20220814125656.1227977-1-francois.perrad@gadz.org>
 <20220814150444.GH2775145@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220814150444.GH2775145@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=3fodf54axdRgfk5t++djRufgQ/Sh3jbrSgpsdRJEkfQ=;
 b=VuCxhQb4XzYVwnZXgSzFmNp36FBUzEWM3urnSSsxmcpxH0lK2l9VIia3sMo5cDH/D/
 +mZ8fHjbHVqaxBXVfUC2s8bYjIGQfbsen+2mS7hwzGVD0KHwzsyFHtWZq3TzEOHPQ/z0
 aR6FSKW3l2RJWcp6vuho/ppQn7RmzQdTKB8spAQuUdbzi19LpZyx1MgSKuUKH+r9D0pk
 l4WZ7F16zTTj2Y7dJCWpacvuFW7vjXHeib3QNREQmLT145SML7iH3ztDcTH7ENGxCX75
 j+xRvYaQxYCP9x+mDNVNJ3/ckt3uur+es8sEHKF0Kg+Sb36sUnD5X5Vd5ZVbPs8I4y4Q
 Cxfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VuCxhQb4
Subject: Re: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: refactor
 with FREESCALE_IMX_EXTRACT_HELPER
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wOC8yMDIyIDE3OjA0LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEZyYW7Dp29pcywg
QWxsLAo+IAo+ICtBcm5vdXQgd291bGQgYXBwbGllZCBxb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJl
Lgo+IAo+IE9uIDIwMjItMDgtMTQgMTQ6NTYgKzAyMDAsIEZyYW5jb2lzIFBlcnJhZCBzcGFrZSB0
aHVzbHk6Cj4+IGF2b2lkIGNvZGUgZHVwbGljYXRpb24KPiAKPiBJIHVuZGVyc3RhbmQgdGhlIHVk
bmVybHlpbmcgcmVhc29uLCBidXQgSSBhbSBub3QgdG9vIGZvbmQgb2YgaXQuCj4gCj4gVGhlIEZS
RUVTQ0FMRV9JTVhfRVhUUkFDVF9IRUxQRVIgcmVhbGx5IGJlYXJzIHRoZSBuYW1lICJGcmVlc2Nh
bGUiIGluCj4gaXQsIGFuZCBpZiB3ZSBuZWVkIHRvIGNoYW5nZSBpdCBmb3IgRnJlZXNjYWxlLXJl
bGF0ZWQgcGFja2FnZXMsIGl0IHdpbGwKPiBub3QgYmUgb2J2aW91cyB0aGF0IGl0IGNhbiBhbHNv
IGJlIHVzZWQgYnkgb3RoZXIsIG5vbi1GcmVlc2NhbGUKPiBwYWNrYWdlcy4KCiAgV2VsbCwgdGhl
IG5hbWUgRnJlZXNjYWxlIGluIHRoZXJlIGlzIGxlZ2FjeSwgaXQgc2hvdWxkIHJlYWxseSBiZSBj
YWxsZWQgCk5YUF9JTVhfRVhUUkFDVF9IRUxQRVIgLSBvciBldmVuIE5YUF9FWFRSQUNUX0hFTFBF
UiAoaXQncyBub3QganVzdCBJTVggCnBsYXRmb3Jtcywgc2luY2UgaXQncyBhcHBhcmVudGx5IGFs
c28gdXNlZCBmb3IgUW9ySVEpLiBCYXNpY2FsbHkgZXZlcnl0aGluZyB0aGF0IApjdXJyZW50bHkg
aGFzIHNvbWUgZm9ybSBvZiBmcmVlc2NhbGUgaW4gdGhlIG5hbWUgc2hvdWxkIGJlIGNvbnZlcnRl
ZCB0byBOWFAuIEJ1dCAKd2UgZG9uJ3QgbGlrZSB0aGF0IGtpbmQgb2YgdXNlbGVzcyBjaHVybiwg
c28gdGhpbmdzIHN0YXkgYXMgdGhleSBhcmUuCgoKPiBBbHNvLCB3aGVuIHdlIGhhdmUgcGFja2Fn
ZXMgdGhhdCBzaGFyZSBzb21lIGluZnJhc3RydWN0dXJlLCB3ZSBsaWtlIHRoZW0KPiB0byBiZSBp
biBhIHN1Yi1kaXJlY3Rvcnkgb2YgYSBjb21tb24gZGlyIChsaWtlIHF0NSBhbmQgYWxsIHRoZSBR
dCA1LngKPiBwYWNrYWdlcywgb3IgbGlrZSBpbmRlZWQgZnJlZXNjYWxlLWlteCBhbmQgYWxsIHJl
bGF0ZWRwYWNrYWdlcykuIEJ1dAo+IHRoaXMgcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZSBpcyBu
b3QgcGFydCBvZiB0aGF0IGZyZWVzY2FsZS1pbXgKPiBjb2xsZWN0aW9uLgoKICBUaGlzLCBvbiB0
aGUgb3RoZXIgaGFuZCwgaXMgcHJldHR5IGVzc2VudGlhbCBJTUhPLgoKICBUaGUgc29sdXRpb24g
aW4gdGhpcyBjYXNlIG1heSBiZSB0byBtb3ZlIGl0IHRvIGEgZ2xvYmFsIHBsYWNlLCBlLmcuIApw
YWNrYWdlL3BrZy11dGlscy4gV2l0aCB0aGUgbnVtYmVyIG9mIHBsYWNlcyB3aGVyZSB3ZSBuZWVk
IHRoaXMgY3JhcHB5IApleHRyYWN0b3IsIGl0IGNhbiBiZSBjb25zaWRlcmVkIGluZnJhIG9uIHRo
ZSBsZXZlbCBvZiB0aGUgZ2l0bGFiIGhlbHBlci4KCiAgU28sIEkgcHJvcG9zZSA0IHBhdGNoZXMu
CgoxLiBGaXggbGljZW5zZSBmaWxlcyBhcyBkZXNjcmliZWQgYmVsb3cgYnkgWWFubi4KMi4gTW92
ZSBGUkVFU0NBTEVfSU1YX0VYVFJBQ1RfSEVMUEVSIHRvIHBhY2thZ2UvcGtnLXV0aWxzLm1rLgoz
LiBSZW5hbWUgRlJFRVNDQUxFX0lNWF9FWFRSQUNUX0hFTFBFUiB0byBOWFBfRVhUUkFDVF9IRUxQ
RVIuCjQuIFVzZSBOWFBfRVhUUkFDVF9IRUxQRVIgaW4gcW9yaXEtY2FkZW5jZS1kcC1maXJtd2Fy
ZS4KCiAgWWFubiwgZG8geW91IGFncmVlPwoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBTbywg
aW4gdGhpcyBjYXNlLCBJIHByZWZlciB3ZSBrZWVwIHRoZSBkdXBsaWNhdGlvbi4KPiAKPiBZZWFo
LCBGcmVlc2NhbGUgaXMgbm93IHBhcnQgb2YgTlhQLCBidXQgdGhpcyBpcyBub3QgYSByZWFzb24g
eWV0Lgo+IAo+IEFsc28sIG5vdGUgdGhhdCB0aGUgZXh0cmFjdCBoZWxwZXIgZG9lcyBleHRyYWN0
IGEgZmllIG5hbWVkIEVVTEEsIGJ1dCBpdAo+IGl0IG5vdCBwcmVzZW50IGluIExJQ0VOU0VfRklM
RVMsIGV2ZW4gdGhvdWdoIHRoZSBjb21tZW50IHN0YXRlcyBpdAo+IHNob3VsZCBiZS4KPiAKPiBB
ZGRpdGlvbmFsbHksIG9uZSBleHRyYWN0ZWQsIHRoZXJlIGlzIGFsc28gYW4gRVVMQS50eHQgZmls
ZSB0aGF0IGlzIG5vdAo+IGluIExJQ0VOU0VfRklMRVMgd2l0aGVyLCB3aGljaCBJIHRoaW5rIGl0
IHNob3VsZCBiZS4KPiAKPiBDYW4geW91IGFkZHJlc3MgdGhvc2UgbGFzdCB0d28gYml0cyBpbiBh
IHNlcGFyYXRlIHBhdGNoLCBwbGVhc2U/Cj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4KPj4gLS0tCj4+ICAgLi4uL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUubWsgICAgICAg
ICAgICAgIHwgMjcgKy0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMjYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Fv
cmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS5tayBiL3Bh
Y2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJl
Lm1rCj4+IGluZGV4IDIzNjQzZDI0ZS4uMWE5N2M1ODAzIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdl
L3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS5tawo+
PiArKysgYi9wYWNrYWdlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1k
cC1maXJtd2FyZS5tawo+PiBAQCAtMTMsMzMgKzEzLDggQEAgUU9SSVFfQ0FERU5DRV9EUF9GSVJN
V0FSRV9SRURJU1RSSUJVVEUgPSBOTwo+PiAgIFFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfSU5T
VEFMTF9JTUFHRVMgPSBZRVMKPj4gICBRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX0lOU1RBTExf
VEFSR0VUID0gTk8KPj4gICAKPj4gLSMgSGVscGVyIGZvciBzZWxmLWV4dHJhY3RpbmcgYmluYXJp
ZXMgZGlzdHJpYnV0ZWQgYnkgTlhQLgo+PiAtIwo+PiAtIyBUaGUgLS1mb3JjZSBvcHRpb24gbWFr
ZXMgc3VyZSBpdCBkb2Vzbid0IGZhaWwgaWYgdGhlIHNvdXJjZQo+PiAtIyBkaXJlY3RvcnkgYWxy
ZWFkeSBleGlzdHMuIFRoZSAtLWF1dG8tYWNjZXB0IHNraXBzIHRoZSBsaWNlbnNlIGNoZWNrLAo+
PiAtIyBhcyBpdCBpcyBub3QgbmVlZGVkIGluIEJ1aWxkcm9vdCBiZWNhdXNlIHdlIGhhdmUgbGVn
YWwtaW5mby4gU2luY2UKPj4gLSMgdGhlcmUncyBhIEVVTEEgaW4gdGhlIGJpbmFyeSBmaWxlLCB3
ZSBleHRyYWN0IGl0IGluIHRoaXMgbWFjcm8sIGFuZAo+PiAtIyBpdCBzaG91bGQgdGhlcmVmb3Jl
IGJlIGFkZGVkIHRvIHRoZSBMSUNFTlNFX0ZJTEVTIHZhcmlhYmxlIG9mCj4+IC0jIHBhY2thZ2Vz
IHVzaW5nIHRoaXMgbWFjcm8uIEFsc28sIHJlbWVtYmVyIHRvIHNldCBSRURJU1RSSUJVVEUgdG8K
Pj4gLSMgIk5PIi4gSW5kZWVkLCB0aGlzIGlzIGEgbGVnYWwgbWluZWZpZWxkOiB0aGUgRVVMQSBz
cGVjaWZpZXMgdGhhdCB0aGUKPj4gLSMgQm9hcmQgU3VwcG9ydCBQYWNrYWdlIGluY2x1ZGVzIHNv
ZnR3YXJlIGFuZCBoYXJkd2FyZSAoc2ljISkgZm9yCj4+IC0jIHdoaWNoIGEgc2VwYXJhdGUgbGlj
ZW5zZSBpcyBuZWVkZWQuLi4KPj4gLSMKPj4gLSMgJCgxKTogZnVsbCBwYXRoIHRvIHRoZSBhcmNo
aXZlIGZpbGUKPj4gLSMKPj4gLWRlZmluZSBRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX0VYVFJB
Q1RfSEVMUEVSCj4+IC0JYXdrICdCRUdJTiAgICAgIHsgc3RhcnQgPSAwOyB9IFwKPj4gLQkgICAg
IC9eRU9FVUxBLyAgeyBzdGFydCA9IDA7IH0gXAo+PiAtCSAgICAgICAgICAgICAgICB7IGlmIChz
dGFydCkgcHJpbnQ7IH0gXAo+PiAtCSAgICAgLzw8RU9FVUxBLyB7IHN0YXJ0ID0gMTsgfScgXAo+
PiAtCSAgICAkKDEpID4gJChARCkvRVVMQQo+PiAtCWNkICQoQEQpICYmIHNoICQoMSkgLS1mb3Jj
ZSAtLWF1dG8tYWNjZXB0Cj4+IC0JZmluZCAkKEBEKS8kKGJhc2VuYW1lICQobm90ZGlyICQoMSkp
KSAtbWluZGVwdGggMSAtbWF4ZGVwdGggMSAtZXhlYyBtdiB7fSAkKEBEKSBcOwo+PiAtCXJtZGly
ICQoQEQpLyQoYmFzZW5hbWUgJChub3RkaXIgJCgxKSkpCj4+IC1lbmRlZgo+PiAtCj4+ICAgZGVm
aW5lIFFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfRVhUUkFDVF9DTURTCj4+IC0JJChjYWxsIFFP
UklRX0NBREVOQ0VfRFBfRklSTVdBUkVfRVhUUkFDVF9IRUxQRVIsJChRT1JJUV9DQURFTkNFX0RQ
X0ZJUk1XQVJFX0RMX0RJUikvJChRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX1NPVVJDRSkpCj4+
ICsJJChjYWxsIEZSRUVTQ0FMRV9JTVhfRVhUUkFDVF9IRUxQRVIsJChRT1JJUV9DQURFTkNFX0RQ
X0ZJUk1XQVJFX0RMX0RJUikvJChRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX1NPVVJDRSkpCj4+
ICAgZW5kZWYKPj4gICAKPj4gICBkZWZpbmUgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9JTlNU
QUxMX0lNQUdFU19DTURTCj4+IC0tIAo+PiAyLjM0LjEKPj4KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
