Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12365CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC87F4138E;
	Mon, 11 Aug 2025 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3PFDHtFdT1T; Mon, 11 Aug 2025 15:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2B04145E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2B04145E;
	Mon, 11 Aug 2025 15:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A18C1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FEE640D47
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZvKFeaR3fK7 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03D28401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D28401DF
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03D28401DF
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:55:11 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-5397d436dccso3956199e0c.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927711; x=1755532511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XA0e1OabGf4jF4lPJAHrSo7x11pxOe7nOqTkHXFtsW0=;
 b=DqEU5YsQ8Bou9MCdNyS/XcP00/eyqvZ9PTWGrq2jA+bVaUyrTbrl8l7N8C/TdKgQ4N
 amkESJFBDVLBM6SzmvwbIZeBKK+g9HjWaAq+HumBcfgzbU/hCetHiXi/j5eYY5Gu7day
 8O47FdxP4oUakBEo4O+JM/6VhCyofWoJnGtQ6gvWJmdkbgwHNQjdmc7PAPUX1x6Xd9C3
 6XfSuqZxUXuIjZZSzgnxAYyxk6EDU2Ss4ikV1B0FfYay9Y/Q8qmGSE3wOZEHv5dx4A5K
 Qw2UnovdGK30x7fm+jWuMiMA2kkk4XsioKZgykYRHSRj9gC3l79eVkMRa/U4QqLsEAeo
 RYvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn7n0jFxGwYrBSWwi6RtflJF3xXB7qkQszS9Kp+vZQFBPu9BmgdjC4RdotLR5SdI/d5zyebkGgUic=@buildroot.org
X-Gm-Message-State: AOJu0Yz7LSbl2docV6k3qmdBWBfY5+zL8EDFXqnsVWY3sd4yGAo57imo
 YjN5NXi4qDYFhUu2DWrfv2zjLzTQq2efXIESps1XACKIByd9XP5mI+2WCZY1IK2q39y3muBfcNt
 g5UNLNZ6YnhN86/zNlAf4wLZd56tbBjXWG6sdSn0J/un29+dklWHEgIY=
X-Gm-Gg: ASbGncsZ4a78WmvQG8xyD1PhkHR9vgUzmj2moo69mS+UuKAf23YWX02lML3+CakkAmb
 qQ1WXBkJvsu/WGHs3s8qJQFQBmfqZ3fXacAgQFJVhBdeYYjOnQlOi4Qo6cxBRwv5XhNzo6cVLJa
 HI/O8MEF9b0Xc9NGGshMXJg9o3RvxoBeL3/rEMYrnndIHkMGT/WI7XUz2GWheJ5zkgM+1jCyAg3
 55oWSOL
X-Google-Smtp-Source: AGHT+IF7V8jxGrqSbIgTUodHPSof2FwLlmCjtUL/P0f3r1cqNoHaxFoNdkhZjpmBvrkxuBksV8UbGPejLDRpH5aFVpY=
X-Received: by 2002:a05:6122:2a0f:b0:520:4806:a422 with SMTP id
 71dfb90a1353d-53afa0561aamr48101e0c.3.1754927710651; Mon, 11 Aug 2025
 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-4-alex.bennee@linaro.org>
 <20250810111525.387a0433@tpx1>
In-Reply-To: <20250810111525.387a0433@tpx1>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 08:54:59 -0700
X-Gm-Features: Ac12FXy_FZc4G_KXTX5a61e4fVnBFJjLC98lHAV_efgOwmz9thV_7UZ_CgANovI
Message-ID: <CALSpo=YZvQXjkcMG0ok6NRXkD36n__Pu7Ond22kW7AWduAGxbg@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754927711; x=1755532511; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XA0e1OabGf4jF4lPJAHrSo7x11pxOe7nOqTkHXFtsW0=;
 b=J3p0ZdG2H5+GbVMo3TcPdmn6zGPLK33MInNL5f44LhhQ2B/CLDp5fwb3dS8OzbaEqx
 1B8EWEZ7azlREVtV2+RTWmhFKdbK2iln5XsFbXdvguKt+Ih53j65NvjztsfZS+kf5feX
 UEDrTo+BK4SZNaI35rBlUihtY8+s3iKW70Fy7XrR91XnsC7ODWe3lruu2A7gtv1eaeRz
 YvcivK+rOKZUF3CQWsIGfg3bN1A5xJ9KpyEWXEf7+SS3ZvoPNukmkEyin0IgHmhLuJiI
 TNAaIh2r3EPcCqiL3mdnx6UlbO6bEQtfw7MRkcqY66zDTXuszeBcG7fKMgKM1MEtdBeT
 4mLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc.com header.i=@rivosinc.com header.a=rsa-sha256
 header.s=google header.b=J3p0ZdG2
Subject: Re: [Buildroot] [PATCH v4 3/9] package/kvm-unit-tests: update
 dependencies
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
Cc: Jesse Taube <Jesse@rivosinc.com>, Cyril Bur <cyrilbur@gmail.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgMTAsIDIwMjUgYXQgMjoxNeKAr0FNIFRob21hcyBIdXRoIDxodXRoQHR1eGZh
bWlseS5vcmc+IHdyb3RlOgo+Cj4gQW0gVHVlLCAgNSBBdWcgMjAyNSAxNjoxODowNSArMDEwMAo+
IHNjaHJpZWIgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPgo+ID4gVG8g
cnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQsIGdldGNvbmYgYW5k
IG5tYXAtbmNhdAo+ID4gc28gdXBkYXRlIHRoZSBzZWxlY3QvZGVwZW5kcyBmb3IgdGhlbS4gQXMg
d2UgbmVlZCBhdCBsZWFzdCBHQ0MgOCB3ZQo+ID4gY2FuIGRyb3AgdGhlIHNwZWNpZmljIHJlcXVp
cmVtZW50IGZvciBvbGQgeDg2LTY0IHRlc3RzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiA+Cj4gPiAtLS0KPiA+IHYyCj4gPiAg
IC0gcmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMgd2UgbmVlZCBhdCBsZWFzdCA4IGFueXdheQo+ID4g
ICAtIHNlbGVjdCBRRU1VIGFuZCBvdGhlciBydW50aW1lIGRlcHMKPiA+ICAgLSBtZW50aW9uIHRo
ZSBydW50aW1lIGRlcHMKPiA+ICAgLSBhZGQgc3VwcG9ydCBmb3IgZ2V0Y29uZiBmcm9tIGV4dGVy
bmFsIHRvb2xjaGFpbgo+ID4gICAtIHVwZGF0ZSBjb21tZW50IGZhbGxiYWNrCj4gPiAtLS0KPiA+
ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDI0ICsrKysrKysrKysrKysrKysr
LS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
biBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gPiBpbmRleCA3NTM4MzYxZGY0
Li5iODlmMDEzZjJhIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25m
aWcuaW4KPiA+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gPiBAQCAt
MTUsMTIgKzE1LDE5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NV
UFBPUlRTCj4gPgo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwo+ID4gICAg
ICAgYm9vbCAia3ZtLXVuaXQtdGVzdHMiCj4gPiAtICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPiA+IC0gICAgICMgb24gaTM4NiBhbmQgeDg2
LTY0LCBfX2J1aWx0aW5fcmVhY2hhYmxlIGlzIHVzZWQsIHNvIHdlIG5lZWQKPiA+IC0gICAgICMg
Z2NjIDQuNSBhdCBsZWFzdC4gb24gaTM4Niwgd2UgdXNlIHRoZSB0YXJnZXQgZ2NjLCB3aGlsZSBv
bgo+ID4gLSAgICAgIyB4ODYtNjQgd2UgdXNlIHRoZSBob3N0IGdjYyAoc2VlIC5tayBmaWxlIGZv
ciBkZXRhaWxzKQo+ID4gLSAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF80XzUgfHwgIUJSMl9pMzg2Cj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9IT1NUQVJDSCA9ICJ4
ODZfNjQiIHx8ICFCUjJfeDg2XzY0Cj4KPiBJIHRoaW5rIHlvdSBzaG91bGQga2VlcCB0aGUgc2Vj
b25kIHBhcnQgb2YgdGhlIGNvbW1lbnQgKCJvbiBpMzg2LCB3ZSB1c2UKPiB0aGUgdGFyZ2V0IGdj
YyAuLi4iKSBzaW5jZSB0aGF0IHdhcyBhYm91dCB0aGUgc2Vjb25kICJkZXBlbmRzIiBsaW5lIGhl
cmUKPiB0aGF0IHlvdSBkaWQgbm90IHJlbW92ZT8KPgo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gPiArICAgICBkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBxZW11Cj4gPiArICAgICBkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKPiA+ICsgICAgIGRlcGVuZHMg
b24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKPiA+ICsgICAgICAgICAgICAgICAgIEJS
Ml9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4gPiArICAgICAgICAgICAgICAgICBCUjJfVE9P
TENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkgIyBydW50aW1lIGdldGNvbmYKCkp1c3Qg
YSBub3RlLCB0byBydW4ga3ZtLXVuaXQtdGVzdHMgeW91IHRlY2huaWNhbGx5IGRvbid0IG5lZWQg
Z2V0Y29uZgphcyBzZXR0aW5nIGBNQVhfU01QPSQobnByb2MpYCBvciB0byBqdXN0IGEgbnVtYmVy
IHdpbGwgd29yaywKaXQgd2lsbCBqdXN0IGdpdmUgYW4gZXJyb3IgdGhhdCBnZXRjb25mIHdhcyBu
b3QgZm91bmQgYW5kIGNvbnRpbnVlLgoKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9RRU1V
Cj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBx
ZW11LXN5c3RlbS0kQVJDSAoKVGhpcyBpbnN0YWxscyBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSBm
b3IgYWxsIGFyY2hpdGVjdHVyZXMgd2hpY2ggaXMKZXh0cmVtZWx5IGxhcmdlClRoZXJlIGlzIGFu
IG9wdGlvbiB0byBzZWxlY3QgaW5kaXZpZHVhbCBhcmNoaXRlY3R1cmVzIHdpdGgKQlIyX1BBQ0tB
R0VfUUVNVV9DSE9PU0VfVEFSR0VUUywgYnV0IG5vdCBmb3IKdGhlIHRhcmdldCBzeXN0ZW0uIEl0
IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHFlbXUgb3B0aW9uIGZvcgpCUjJfUEFDS0FHRV9RRU1V
X1RBUkdFVF8kQVJDSCBhbmQgc2VsZWN0IHRoYXQuIEluIHRoZSBtZWFudGltZSB0aGlzIGlzCmZp
bmUuCgo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVVVElMUyAjIHJ1bnRpbWUgZm9y
IHRpbWVvdXQKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9CQVNIICMgcnVudGltZQo+ID4g
KyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9OTUFQX05DQVQgIyBydW50aW1lIGZvciBuY2F0Cj4gPiAgICAgICBzZWxlY3QgQlIyX0hPU1RB
UkNIX05FRURTX0lBMzJfQ09NUElMRVIgaWYgQlIyX3g4Nl82NAo+ID4gICAgICAgaGVscAo+ID4g
ICAgICAgICBrdm0tdW5pdC10ZXN0cyBpcyBhIHByb2plY3QgYXMgb2xkIGFzIEtWTS4gQXMgaXRz
IG5hbWUKPiA+IEBAIC00MCw2ICs0Nyw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9U
RVNUUwo+ID4KPiA+ICAgICAgICAgaHR0cDovL3d3dy5saW51eC1rdm0ub3JnL3BhZ2UvS1ZNLXVu
aXQtdGVzdHMKPiA+Cj4gPiAtY29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29sY2hh
aW4gdy8gZ2NjID49IDQuNSIKPiA+ICtjb21tZW50ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRv
b2xjaGFpbiB3LyB1dGlscyBhbmQgZ2NjID49IDgiCj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9p
Mzg2Cj4gPiAtICAgICBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUK
PiA+ICsgICAgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzgKPiA+ICsg
ICAgIGRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCj4gPiArICAgICAg
ICAgICAgIEJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4gPiArICAgICAgICAgICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKQo+Cj4gU2hvdWxkIHRoZSBCUjJf
UEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFSR0VUIG5vdyBiZSBpbmNsdWRlZCBoZXJlLCB0
b28/Cj4KPiAgVGhvbWFzCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
