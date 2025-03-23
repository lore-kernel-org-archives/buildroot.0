Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD25C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 20:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1D940D98;
	Sun, 23 Mar 2025 20:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4TwE5navUAA; Sun, 23 Mar 2025 20:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07A040D8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07A040D8F;
	Sun, 23 Mar 2025 20:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45CB31B8
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BC1040D8E
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEF_RtT5_i2w for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 20:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C76940D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C76940D8F
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C76940D8F
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:15:15 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3f422d6e3b0so972265b6e.1
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 13:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742760914; x=1743365714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxvBMLyVlF08KJXno+uoxIdFx6uZbvzkI+J+bs8DXOM=;
 b=TICe5T6DHfNHClc9/FmC2Z7pYSLpE/nTOnQQOZGAUx7sR9TUeZbLEjyvmSMTROai53
 t9DFrjHelY2j0g3wJO0csbyVoERUyqjDMD5CYh8siKvhBOUAYXu5S4YDe+ES5vUc4LVE
 eab64D9Dvm3LYkn8YP3EKS+DSKlcrHS2daTo0grXtIHRl5UceE10CFHT9b7ruseoSwll
 4eaCLGcKbGlQKT7FfzNVhfoNjNV/wUEoUcORObWP4P2vfK9wOaU5zETtcOxIEmwDXtcL
 bYsL+7Ybo6liyQdIoMJcBsIOIC243wVZa3uyA6rrJ3bgZo5qh8J8T3t5UZgw3BCyA9qw
 S0wg==
X-Gm-Message-State: AOJu0YzMisxm0QlAm+pIU7QOxiK4YQ4EpgusuCPA5P3sJPBE5ZdgO1OV
 X8MCvqVkRyMXkM/iLkC/NFIfkZBQ8fxyjx/Jf4ygEMALSsZNmOjV+cs99jApiNNwTsgO7FSuTED
 n
X-Gm-Gg: ASbGnctwoCkVmZgkKPHAzuaE6oRNc4a7SymGQGhwbs7YRGSRqd/LspiiEYyySgChFjf
 bUU9KwZlF0PnnY83YQePCQ5oJjJgr/OhmGnwA+iljMp4OSNx5P5FvocJBwddiaTM/4nsA586qDS
 CNUsY3PCR877D/0B8bcQYwrHUrn9I32hgwKYD4Mix9rtoQr9/UtVj9wJWMCSijTzzQKqqMN3U55
 YRby6CRm2gogA9qS1cLG42UHec+aKQADr09tN+o1aGmpB6sKGvvkG8TaUy39MWH6awY6gQqTARI
 akN2VTt3LxwKNrVQscUCzxPFuWrI0Fw2J3VhsEp6sKbUncKBXLwZ9TtOQ/IL9SWUvW7jwOZhVaP
 zhcgxia8bDIBl
X-Google-Smtp-Source: AGHT+IE1Fja/KCh9JyBLY7K+kOAJTfLSH4GhTw4hfKADoI9vuyTw076YSWR/LW9Zb0ySEaAIPIFjLg==
X-Received: by 2002:a05:6808:2e47:b0:3f6:a929:c428 with SMTP id
 5614622812f47-3febf60be4amr7803953b6e.0.1742760914058; 
 Sun, 23 Mar 2025 13:15:14 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3febf710fa7sm1330137b6e.27.2025.03.23.13.15.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Mar 2025 13:15:13 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3f6aa4b3a7fso980848b6e.3
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 13:15:13 -0700 (PDT)
X-Received: by 2002:a05:6808:2e47:b0:3f6:a929:c428 with SMTP id
 5614622812f47-3febf60be4amr7803926b6e.0.1742760913165; Sun, 23 Mar 2025
 13:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742563913.git.yann.morin@orange.com>
 <45bf4abdbbb4ff9d87b4ac7d7eebf687e723e7c4.1742563913.git.yann.morin@orange.com>
In-Reply-To: <45bf4abdbbb4ff9d87b4ac7d7eebf687e723e7c4.1742563913.git.yann.morin@orange.com>
Date: Sun, 23 Mar 2025 13:15:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ryj16xcVCD_-b3PoQQ6FWaxGVtyn0KRL41LzHa2rB+hA@mail.gmail.com>
X-Gm-Features: AQ5f1JqNdDsQ2Lyo6AQfuWuLycWG_2vm4oKw6iBU_BoJwEVVZqaWfypaL_wFNvY
Message-ID: <CA+h8R2ryj16xcVCD_-b3PoQQ6FWaxGVtyn0KRL41LzHa2rB+hA@mail.gmail.com>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1742760914; x=1743365714; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxvBMLyVlF08KJXno+uoxIdFx6uZbvzkI+J+bs8DXOM=;
 b=poDSiL/NvvKvcztAQgtoyvxoPRiTVYORUBBF2WzDV3pU3lcKxzcmBtHxTXAUgMrHwy
 ft1D4+70wXMAzYbmpaew34S44cSOgWP4z0HX+tOC+y2HgHcVkowN8mtBlcsahxlwUCZ9
 K5NYDhvxNnxZ6e2RYiN3yiMFNG26gIFEQQm5tkzeBMUutS5+r3tTNkxJAPqdIXNdrUpk
 vwM3rXU5jABiZxjkmKm4brPGfgyzYzF5kHiwbh4rfC8JuOTOotsyKHZWkJgn25aGhhEX
 JbCN2sQt15cYJdnpf3/7046y8f8IZHWNRYUZvrZ5v9Y4g1E+6oZiKT3L8ZHKqHPWCMv6
 ThDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=poDSiL/N
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-golang: support _SUBDIR
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGd0bQoKT24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgNjozMuKAr0FNIDx5YW5uLm1vcmluQG9yYW5n
ZS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5n
ZS5jb20+Cj4KPiBTb21lIHBhY2thZ2VzIGhhdmUgdGhlaXIgYWN0dWFsIHNvdXJjZSB0cmVlIGlu
IGEgc3ViLWRpcmVjdG9yeSAoZXZlbiBpZgo+IHRoYXQgaXMgdGhlIG9ubHkgc291cmNlIGluIHRo
ZSByZXBvc2l0b3J5KTsgdGhpcyBpcyB0aGUgY2FzZSBmb3IgZXhhbXBsZQo+IHdpdGggdGhlIEFt
YXpvbiBFQ1IgY3JlZGVudGlhbCBoZWxwZXIgKHRvIGJlIHBhY2thZ2VkIGluIGEgZm9sbG93IHVw
Cj4gY29tbWl0KToKPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL2F3c2xhYnMvYW1hem9uLWVjci1j
cmVkZW50aWFsLWhlbHBlcgo+Cj4gRG8gdGhlIGJ1aWxkIGluIF9TVUJESVIsIGFuZCBhbHNvIGRv
IHRoZSB2ZW5kb3JpbmcgaW4gdGhlcmUuCj4KPiBXZSBkb24ndCBuZWVkIHRoZSBidWlsZCB0byBn
ZW5lcmF0ZSBleGVjdXRhYmxlcyBpbnNpZGUgX1NVQkRJUiwgc28gd2UKPiBqdXN0IGtlZXAgdXNp
bmcgJChARCkvYmluIGFzIGEgcGxhY2UgdG8gZ2VuZXJhdGUgdGhlbSAoYW5kIGluc3RhbGwgdGhl
bQo+IGZyb20pLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBv
cmFuZ2UuY29tPgo+IENjOiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVz
Pgo+IC0tLQo+ICBwYWNrYWdlL3BrZy1nb2xhbmcubWsgICAgICAgICAgICB8IDEzICsrKysrKysr
Ky0tLS0KPiAgc3VwcG9ydC9kb3dubG9hZC9nby1wb3N0LXByb2Nlc3MgfCAgNSArKystLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4g
aW5kZXggYmRmOGRlNGQ2Ni4uYTRlOGJkMzBjYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1n
b2xhbmcubWsKPiArKysgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiBAQCAtNzksOCArNzksOCBA
QCAkKDIpX0dPTU9EID89ICQkKCQoMilfU1JDX0RPTUFJTikvJCQoJCgyKV9TUkNfVkVORE9SKS8k
JCgkKDIpX1NSQ19TT0ZUV0FSRSkKPiAgIyBHZW5lcmF0ZSBhIGdvLm1vZCBmaWxlIGlmIGl0IGRv
ZXNuJ3QgZXhpc3QuIE5vdGU6IEdvIGlzIGNvbmZpZ3VyZWQKPiAgIyB0byB1c2UgdGhlICJ2ZW5k
b3IiIGRpciBhbmQgbm90IG1ha2UgbmV0d29yayBjYWxscy4KPiAgZGVmaW5lICQoMilfR0VOX0dP
TU9ECj4gLSAgICAgICBpZiBbICEgLWYgJCQoQEQpL2dvLm1vZCBdOyB0aGVuIFwKPiAtICAgICAg
ICAgICAgICAgcHJpbnRmICJtb2R1bGUgJCQoJCgyKV9HT01PRClcbiIgPiAkJChARCkvZ28ubW9k
OyBcCj4gKyAgICAgICBpZiBbICEgLWYgJCQoQEQpLyQkKCQoMilfU1VCRElSKS9nby5tb2QgXTsg
dGhlbiBcCj4gKyAgICAgICAgICAgICAgIHByaW50ZiAibW9kdWxlICQkKCQoMilfR09NT0QpXG4i
ID4gJCQoQEQpLyQkKCQoMilfU1VCRElSKS9nby5tb2Q7IFwKPiAgICAgICAgIGZpCj4gIGVuZGVm
Cj4gICQoMilfUE9TVF9QQVRDSF9IT09LUyArPSAkKDIpX0dFTl9HT01PRAo+IEBAIC05MSw2ICs5
MSwxMSBAQCAkKDIpX0RMX0VOViArPSBcCj4gICAgICAgICBHT1BST1hZPWRpcmVjdCBcCj4gICAg
ICAgICAkJCgkKDIpX0dPX0VOVikKPgo+ICsjIElmIGJ1aWxkaW5nIGluIGEgc3ViIGRpcmVjdG9y
eSwgZG8gdGhlIHZlbmRvcmluZyBpbiB0aGVyZQo+ICtpZm5lcSAoJCQoJCgyKV9TVUJESVIpLCkK
PiArJCgyKV9ET1dOTE9BRF9QT1NUX1BST0NFU1NfT1BUUyArPSAtcyQkKCQoMilfU1VCRElSKQo+
ICtlbmRpZgo+ICsKPiAgIyBCZWNhdXNlIHdlIGFwcGVuZCB2ZW5kb3JlZCBpbmZvLCB3ZSBjYW4n
dCByZWx5IG9uIHRoZSB2YWx1ZXMgYmVpbmcgZW1wdHkKPiAgIyBvbmNlIHdlIGV2ZW50dWFsbHkg
Z2V0IGludG8gdGhlIGdlbmVyaWMtcGFja2FnZSBpbmZyYS4gU28sIHdlIGR1cGxpY2F0ZQo+ICAj
IHRoZSBoZXVyaXN0aWNzIGhlcmUKPiBAQCAtMTM1LDcgKzE0MCw3IEBAIGVuZGlmCj4gICMgQnVp
bGQgcGFja2FnZSBmb3IgdGFyZ2V0Cj4gIGRlZmluZSAkKDIpX0JVSUxEX0NNRFMKPiAgICAgICAg
ICQkKGZvcmVhY2ggZCwkJCgkKDIpX0JVSUxEX1RBUkdFVFMpLFwKPiAtICAgICAgICAgICAgICAg
Y2QgJCQoQEQpOyBcCj4gKyAgICAgICAgICAgICAgIGNkICQkKEBEKS8kJCgkKDIpX1NVQkRJUik7
IFwKPiAgICAgICAgICAgICAgICAgJCQoSE9TVF9HT19UQVJHRVRfRU5WKSBcCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgJCQoJCgyKV9HT19FTlYpIFwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAkJChHT19CSU4pIGJ1aWxkIC12ICQkKCQoMilfQlVJTERfT1BUUykgXAo+IEBAIC0xNDcsNyAr
MTUyLDcgQEAgZWxzZQo+ICAjIEJ1aWxkIHBhY2thZ2UgZm9yIGhvc3QKPiAgZGVmaW5lICQoMilf
QlVJTERfQ01EUwo+ICAgICAgICAgJCQoZm9yZWFjaCBkLCQkKCQoMilfQlVJTERfVEFSR0VUUyks
XAo+IC0gICAgICAgICAgICAgICBjZCAkJChARCk7IFwKPiArICAgICAgICAgICAgICAgY2QgJCQo
QEQpLyQkKCQoMilfU1VCRElSKTsgXAo+ICAgICAgICAgICAgICAgICAkJChIT1NUX0dPX0hPU1Rf
RU5WKSBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgJCQoJCgyKV9HT19FTlYpIFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAkJChHT19CSU4pIGJ1aWxkIC12ICQkKCQoMilfQlVJTERfT1BU
UykgXAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2Rvd25sb2FkL2dvLXBvc3QtcHJvY2VzcyBiL3N1
cHBvcnQvZG93bmxvYWQvZ28tcG9zdC1wcm9jZXNzCj4gaW5kZXggZWY5NmE3Njk0OC4uZWRjMjNl
YzU2NCAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L2Rvd25sb2FkL2dvLXBvc3QtcHJvY2Vzcwo+ICsr
KyBiL3N1cHBvcnQvZG93bmxvYWQvZ28tcG9zdC1wcm9jZXNzCj4gQEAgLTUsMTAgKzUsMTEgQEAg
c2V0IC1lCj4gIC4gIiR7MCUvKn0vaGVscGVycyIKPgo+ICAjIFBhcnNlIG91ciBvcHRpb25zCj4g
LXdoaWxlIGdldG9wdHMgIm46bzoiIE9QVDsgZG8KPiArd2hpbGUgZ2V0b3B0cyAibjpvOnM6IiBP
UFQ7IGRvCj4gICAgICBjYXNlICIke09QVH0iIGluCj4gICAgICBvKSAgb3V0cHV0PSIke09QVEFS
R30iOzsKPiAgICAgIG4pICBiYXNlX25hbWU9IiR7T1BUQVJHfSI7Owo+ICsgICAgcykgIHN1YmRp
cj0iJHtPUFRBUkd9Ijs7Cj4gICAgICA6KSAgZXJyb3IgIm9wdGlvbiAnJXMnIGV4cGVjdHMgYSBt
YW5kYXRvcnkgYXJndW1lbnRcbiIgIiR7T1BUQVJHfSI7Owo+ICAgICAgXD8pIGVycm9yICJ1bmtu
b3duIG9wdGlvbiAnJXMnXG4iICIke09QVEFSR30iOzsKPiAgICAgIGVzYWMKPiBAQCAtMjIsNyAr
MjMsNyBAQCBmaQo+ICBwb3N0X3Byb2Nlc3NfdW5wYWNrICIke2Jhc2VfbmFtZX0iICIke291dHB1
dH0iCj4KPiAgIyBEbyB0aGUgR28gdmVuZG9yaW5nCj4gLXB1c2hkICIke2Jhc2VfbmFtZX0iID4g
L2Rldi9udWxsCj4gK3B1c2hkICIke2Jhc2VfbmFtZX0vJHtzdWJkaXJ9IiA+IC9kZXYvbnVsbAo+
Cj4gIGlmIFsgISAtZiBnby5tb2QgXTsgdGhlbgo+ICAgICAgZWNobyAiRVJST1I6IG5vIHZlbmRv
ci8gZm9sZGVyIGFuZCBubyBnby5tb2QsIGFib3J0aW5nIgo+IC0tCj4gMi4zNC4xCj4KPgoKUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
