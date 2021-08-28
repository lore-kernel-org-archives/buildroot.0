Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB555C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:39:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A93560C41
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 10:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A93560C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 344D840122;
	Sat, 28 Aug 2021 10:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_nwOYF0-s3A; Sat, 28 Aug 2021 10:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B8F40222;
	Sat, 28 Aug 2021 10:38:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6941BF4E7
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8B5605BC
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 10:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R4_3MJq3wFg for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 10:38:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37E5E605AD
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:38:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id w4so16168858ljh.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oCYLRHEkqhd4TGmL+26xydZ8PKWxIWAMjwKWqN6Jjsc=;
 b=S3mu6Bk8cTrQLLsI7vGMh2pSWInRyteO8ygC5I6jeW55DXGCjONBSaoFvlTk3SR6jT
 hJy9V3GlGz75/vG3AE8JzI7goBhQuD1w9E7APsdyGXNm/+nwA+hiPtJ2ke5eQxDpSu8q
 ZohtDrWB7KllG1Kofjw/k6S3opdknNyJSOJrVnZD3nNw3TCJzIQ56NtJTnp6jeatNWGP
 7mwUWqXKcc8Bww6FvYpJO7iOXrICkVciKXUkoP77sWxj+OObZOAfBSYYA2visVZFAsIw
 ZVvNau0XS6oeW68mkeP2oOFv0ld7P2Fsoy46+tJW3gKlWPhBn0WHHiGFcglMyqpZFAvL
 bCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oCYLRHEkqhd4TGmL+26xydZ8PKWxIWAMjwKWqN6Jjsc=;
 b=npXGqElnNxJrLAUfiGas+eyVlL0UMb7Zi97BMqXbi9KCICxBxG0ywY094w94QyS1J9
 Oht6ea5y5jwF8mQfsT8/Tx70LHmbA8Nmxpa3RUZYOHc88Rb4oQHuj9KwxTPTKXw8quBV
 6F++wkx/u2fukayiqxY26aHaZdrB5rIEFNHX6lQUe33N62c8BqGtK+JyFwpjwXhXUy7q
 OTEGggF0Hiu8LZKbv1bSxPSZco68QQcyd0Uyj4vIfOi+UB6EVfP35QJrh2HBLIevjXBS
 BPhrR8RtNaaLNXS2yFuf/+/lXeZENA/7a+/7ZMkwzTPzWXOFtQC0Ra5oLhxEY1AIC3at
 f+Sg==
X-Gm-Message-State: AOAM530JmJWv/6Fs5lZWP+ujmeq0zQCEjDa+cFQuJ4qM8MNMc7dRPgvs
 xATKbJgNr842eXe/Ym+si6XStMCODAVVodxqmgg=
X-Google-Smtp-Source: ABdhPJz1CRp/Ihztx/fRqHxgM1cBKhbY6aWTVJuYzb90S/ChgQqRFlaQ02C/OSYTwq8FNd52TdVrIcSLsLcuKGxb2uY=
X-Received: by 2002:a2e:4949:: with SMTP id b9mr12050283ljd.159.1630147129052; 
 Sat, 28 Aug 2021 03:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210827221930.286234-1-fontaine.fabrice@gmail.com>
 <7dc6c3e3562fa2e8d1ddd3adf3cc8923@free.fr>
In-Reply-To: <7dc6c3e3562fa2e8d1ddd3adf3cc8923@free.fr>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Aug 2021 12:38:37 +0200
Message-ID: <CAPi7W80+j=7nRk5YaPWSknQ1V6t4u9yGEUny=9FZqWFA2fQBGA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox: kms needs gbm
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgSnVsaWVuLAoKTGUgc2FtLiAyOCBhb8O7dCAyMDIxIMOgIDEyOjA0LCBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBIaSBGYWJyaWNlLAo+Cj4gT24gMjgvMDgv
MjAyMSAwMDoxOSwgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+IE9idmlvdXNseSwgS01TL0RS
TS9HQk0gbmVlZHMgZ2JtIChhbmQgc28gbWVzYTNkIHdoaWNoIGlzIHRoZSBvbmx5IGdibQo+ID4g
cHJvdmlkZXIgc2luY2UgY29tbWl0IDgxNGJmYzVlYzFhYjQ5MTg4ZDFjOGNiN2YwZDhkODU3Yjky
ZDZhMDMpOgo+Cj4gVG8gbXkga25vd2xlZGdlLCBpbXgtZ3B1LXZpdiBhbHNvIHByb3ZpZGVzIGEg
d29ya2luZyBnYm0uCj4KPiA+IGNoZWNraW5nIGZvciBnYm0uLi4gbm8KPiA+IGNvbmZpZ3VyZTog
ZXJyb3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRzIChnYm0pIHdlcmUgbm90IG1ldDoKPiA+Cj4gPiBQ
YWNrYWdlICdnYm0nLCByZXF1aXJlZCBieSAndmlydHVhbDp3b3JsZCcsIG5vdCBmb3VuZAo+ID4K
PiA+IEZpeGVzOgo+ID4gIC0KPiA+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzMxYjNmZmY5NzQ4MzAwZTI5M2I0ZWZiNTYxNTE3NmNjY2U0OGRkMTUKPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIHBhY2thZ2UvZ2xzbHNhbmRib3gtcGxheWVyL0NvbmZpZy5pbiAgICAgICAg
ICAgICB8IDQgKysrKwo+ID4gIHBhY2thZ2UvZ2xzbHNhbmRib3gtcGxheWVyL2dsc2xzYW5kYm94
LXBsYXllci5tayB8IDQgKy0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dsc2xzYW5kYm94
LXBsYXllci9Db25maWcuaW4KPiA+IGIvcGFja2FnZS9nbHNsc2FuZGJveC1wbGF5ZXIvQ29uZmln
LmluCj4gPiBpbmRleCBkYzBkMmMwN2YxLi5iODVkZmY2YTJmIDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9nbHNsc2FuZGJveC1wbGF5ZXIvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL2dsc2xz
YW5kYm94LXBsYXllci9Db25maWcuaW4KPiA+IEBAIC02Nyw4ICs2NywxMiBAQCBjaG9pY2UKPiA+
ICBjb25maWcgQlIyX1BBQ0tBR0VfR0xTTFNBTkRCT1hfUExBWUVSX0tNUwo+ID4gICAgICAgYm9v
bCAiS01TL0RSTS9HQk0iCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgIyBsaWJkcm0KPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0dC
TQo+Cj4gVGhlcmUgd2FzIGFscmVhZHkgZmV3IGRpc2N1c3Npb25zIHRvIGhhdmUgYSBnYm0gdmly
dHVhbCBwYWNrYWdlLCB3aGljaAo+IHdhcyBub3QKPiBhY2NlcHRlZC4gIFNlZSBbMV0uICBJIGJl
bGlldmUgdGhpcyBpcyB0aGUga2luZCBvZiB0aGluZyB0aGF0IHdvdWxkIGhlbHAKPiBpbgo+IHRo
YXQgY2FzZS4gIEl0IGlzIGEgdmFsaWQgY2FzZSAoYnV0IG1heWJlIG5vdCByZWFsbHkgY29tbW9u
KSB0byBkbwo+IE9wZW5HTCBFUwo+IGFjY2VsZXJhdGVkIGdyYXBoaWNzLCBvbiB0b3Agb2YgS01T
L0dCTSwgd2l0aG91dCBiZWluZyBhIFdheWxhbmQKPiBjb21wb3NpdG9yLgo+Cj4gVGhlIG5leHQg
YmVzdCBjYW5kaWRhdGUgSSBzZWUgd291bGQgYmUgYSBkZXBlbmRlbmN5IG9uCj4gQlIyX1BBQ0tB
R0VfSEFTX0xJQkVHTF9XQVlMQU5ELCBpbnRyb2R1Y2VkIGluIGNvbW1pdAo+IDFlM2RmZWYxOWQ4
YWUzODA0NjcxYTAzYjMwMDAzZmEyZDgxMTVmYzYuCj4KPiBTaW5jZSBnYm0gaXMgdXN1YWxseSBp
biB0aG9zZSBkZXBlbmRlbmNpZXMsIHRoYXQgc2hvdWxkIGZpeCB0aGlzIGJ1aWxkCj4gZmFpbHVy
ZSwKPiBldmVuIGlmIHRoZSBkZXBlbmRlbmN5IGlzIG5vdCBhY2N1cmF0ZSAod2UgZGVwZW5kIG9u
IHdoYXQgYSB3YXlsYW5kCj4gY29tcG9zaXRvcgo+IHdvdWxkIG5lZWQsIGFuZCB0aGlzIHBhY2th
Z2UgaXMgbm90IGEgY29tcG9zaXRvcikuCj4KPiBTZWUgYWxzbyBjb21taXQgZmVkODM1NzY4YWFj
MThmMjQ1NzU0NGZmNDBmM2I1OWIzODcxMTdlZAo+Cj4gRmluYWxseSwgd2UgY291bGQgZXZlbnR1
YWxseSBpbnRyb2R1Y2UgaGVyZSBhCj4gQlIyX1BBQ0tBR0VfR0xTTFNBTkRCT1hfUExBWUVSX0tN
U19TVVBQT1JUUwo+IHdoaWNoIGxpc3RzIHRoZSBkZXBlbmRlbmNpZXMga25vd24gdG8gd29yayBp
biB0aGF0IGNhc2U6Cj4gSSBzZWUgYXQgbGVhc3Q6IEJSMl9QQUNLQUdFX01FU0EzRF9HQk0gYW5k
Cj4gQlIyX1BBQ0tBR0VfSU1YX0dQVV9WSVZfT1VUUFVUX1dMCj4KPiA+ICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9MSUJEUk0KPiA+Cj4gPiArY29tbWVudCAiS01TL0RSTS9HQk0gYmFja2VuZCBu
ZWVkcyBtZXNhM2Qgdy8gR0JNIgo+ID4gKyAgICAgZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTUVT
QTNEX0dCTQo+ID4gKwo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9HTFNMU0FOREJPWF9QTEFZRVJf
TUFMSQo+ID4gICAgICAgYm9vbCAiQWxsd2lubmVyIEFSTS9NYWxpIEZyYW1lIEJ1ZmZlciIKPiA+
ICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9NQUlOTElORQo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ2xzbHNhbmRib3gtcGxheWVyL2dsc2xzYW5kYm94LXBsYXllci5t
awo+ID4gYi9wYWNrYWdlL2dsc2xzYW5kYm94LXBsYXllci9nbHNsc2FuZGJveC1wbGF5ZXIubWsK
PiA+IGluZGV4IDVhY2U2OWQ3ZGQuLjRmMDU4NzcyZGYgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L2dsc2xzYW5kYm94LXBsYXllci9nbHNsc2FuZGJveC1wbGF5ZXIubWsKPiA+ICsrKyBiL3BhY2th
Z2UvZ2xzbHNhbmRib3gtcGxheWVyL2dsc2xzYW5kYm94LXBsYXllci5tawo+ID4gQEAgLTM3LDkg
KzM3LDcgQEAgR0xTTFNBTkRCT1hfUExBWUVSX0NPTkZfT1BUUyArPQo+ID4gLS1kaXNhYmxlLWlu
c3RhbGwtc2NyaXB0cwo+ID4gIGVuZGlmCj4gPgo+ID4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfR0xT
TFNBTkRCT1hfUExBWUVSX0tNUykseSkKPiA+IC0jIGdibSBkZXBlbmRlbmN5IGlzIG5vdCBuZWVk
ZWQsIGFzIGl0IGlzIG5vcm1hbGx5IHBhY2thZ2VkIHdpdGgKPiA+IC0jIGxpYmVnbC9saWJnbGVz
IGRyaXZlcnMuCj4gPiAtR0xTTFNBTkRCT1hfUExBWUVSX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0K
PiA+ICtHTFNMU0FOREJPWF9QTEFZRVJfREVQRU5ERU5DSUVTICs9IGxpYmRybSBtZXNhM2QKPgo+
IFNhbWUgY29tbWVudDogbWVzYTNkIGlzIG5vdCB0aGUgb25seSBnYm0gcHJvdmlkZXIuCj4KPiA+
ICBHTFNMU0FOREJPWF9QTEFZRVJfQ09ORl9PUFRTICs9IC0td2l0aC1uYXRpdmUtZ2Z4PWttcwo+
ID4gIGVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9HTFNMU0FOREJPWF9QTEFZRVJfTUFMSSkseSkK
PiA+ICBHTFNMU0FOREJPWF9QTEFZRVJfREVQRU5ERU5DSUVTICs9IHN1bnhpLW1hbGktbWFpbmxp
bmUKPgo+IFdoYXQgZG8geW91IHRoaW5rPwpJJ20gbm90IGFuIGV4cGVydCBpbiBnYm0gYW5kIFRo
b21hcyB0b2xkIG1lIHRoYXQgQm9vdGxpbiBoYXZlIGEgcGF0Y2gKc2VyaWVzIHRvIGltcHJvdmUg
dGhlIEJ1aWxkcm9vdCBoYW5kbGluZyBvZiBnYm06Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTA4MTkxNjAzMTcuMTA0NTQ4Mi0xLWZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tLwpTbyBJJ2xsIGxldCBUaG9tYXMgYW5kIGdibSBleHBlcnRz
IGhhbmRsZSB0aGlzIGxvbmcgdGVybSBzb2x1dGlvbi4KCkFzIGEgc2hvcnQgdGVybSBzb2x1dGlv
biAoaS5lLiBmb3IgdGhlIGJ1aWxkcm9vdCBBdWd1c3QgcmVsZWFzZSksIEkKdGhpbmsgdGhhdCBh
ZGRpbmcgYQoiZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCB8fCBCUjJf
UEFDS0FHRV9JTVhfR1BVX1ZJVl9PVVRQVVRfV0wiCmFzIGl0IGlzIGFscmVhZHkgZG9uZSBpbiB3
ZXN0b24gaXMgcHJvYmFibHkgZW5vdWdoICh3aXRob3V0CkJSMl9QQUNLQUdFX0dMU0xTQU5EQk9Y
X1BMQVlFUl9LTVNfU1VQUE9SVFMgd2hpY2ggc2VlbXMgYSBiaXQKb3ZlcmtpbGxlZCkuCkknbGwg
YWxzbyBkcm9wIHRoZSBtZXNhM2QgZGVwZW5kZW5jeS4KPgo+IEJlc3QgcmVnYXJkcywKPgo+IEp1
bGllbi4KPgo+IFsxXS4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMTgwOTEzMTk0NDEwLjI0MDc3LTEtYmVybmQua3VobHNAdC1vbmxpbmUu
ZGUvCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJv
eC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
