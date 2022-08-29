Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C96FECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E713682695;
	Mon, 29 Aug 2022 14:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E713682695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piOeHvjpE2_D; Mon, 29 Aug 2022 14:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13682825C7;
	Mon, 29 Aug 2022 14:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13682825C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61ABD1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 14:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3897860F4C
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 14:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3897860F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Avj-k7KCCbTk for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 14:52:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CEF460B93
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CEF460B93
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 14:52:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso6053578otb.6
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 07:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/M98CMxbxb+hO/Xm7nyr7qQYVshoSZLpPrrOjidIo14=;
 b=jPDMhY1nLapyZtCY+Xud5SgGj47w6RV/BNsC9ed5dLWltL8Kj4zsIkAeXh/gujCp+k
 9L56584i36nEr58A2AOaSruQeEk4hDDc+AZpK1+Ia9ysoRXbkPeUbU/ZUCwl1E7Rmzis
 4EMZ57gCu+xM6xSU6Z4a5xyooNcdQk0o3c1wUZdkeTXJmzJlhsXmTtUuaYACHh/sc9kx
 kE+9K8mgaGqfz4Lc5Fx8bhJ5X+bU1ymXOrTXT5o75Pn72/oKg8Y5ypVmdee8sapWF03U
 TrJjjK8me+OqvtAYiSOthXyw5Yi1pUsEmFBq+KVQKK8iy3HzstqTyBWTSwNZrugFb3da
 eK7A==
X-Gm-Message-State: ACgBeo3RjFgccyCHyo1SFexQPGHZrR4N0G0VE1Gi4TV1c6SyN+XBCLqi
 vvsFRivzCSgqdgedx2n9+ABREcNts24/wQ==
X-Google-Smtp-Source: AA6agR7A8mdDPChvDVTS6Pm0yG53HFX8srY++Nu4OjrQzT01WLun07tpUZ/lXdhNPuJeckshwSHlxw==
X-Received: by 2002:a9d:20aa:0:b0:637:3767:8e5f with SMTP id
 x39-20020a9d20aa000000b0063737678e5fmr6532420ota.131.1661784763010; 
 Mon, 29 Aug 2022 07:52:43 -0700 (PDT)
Received: from [10.0.0.73] (96-82-249-149-static.hfc.comcastbusiness.net.
 [96.82.249.149]) by smtp.gmail.com with ESMTPSA id
 c8-20020a544e88000000b0034536748843sm4785618oiy.3.2022.08.29.07.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 07:52:42 -0700 (PDT)
Message-ID: <a5b2e1bc-4e5a-1135-d837-a6d66c10f3c5@gmail.com>
Date: Mon, 29 Aug 2022 08:52:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220824202617.21650-1-lancethepants@gmail.com>
 <20220827133854.GW37358@scaer>
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <20220827133854.GW37358@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=/M98CMxbxb+hO/Xm7nyr7qQYVshoSZLpPrrOjidIo14=;
 b=fKY//K7b0mfLbZw1YwSmhL5XHvDh/+ZtyE8D15afIw6OgBIGvUeVRW9qbLczQ2D3bm
 I1tSb8qIYJGxe7NUDe0xlwh/rHCk8SH9qq+K1R33VdKvzOKDjdrfeUETuAsna/q+qcFg
 sjFpABzA5j1NAHQnivCqYiEomKFGAOSOlkamxmlMuHZuT5qbq/KJk0JQ3o9hhqXlH5U8
 zRjFZE4lG/AfGd29ktXJsCS0XOLQOzZLgQabJY9jLcYLjvAynUsJK1nJhkDDFNOF0K8B
 Fn+8zH/9kjgfBxgFgz8/Qk7e3qN2GwWoYPpKsJ7kbv5gQGlzxJMS4LNkWwkSZHD7zFvu
 wvJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fKY//K7b
Subject: Re: [Buildroot] [PATCH 1/1] package/musl-fts: always build static
 library
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA4LzI3LzIwMjIgNzozOCBBTSwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gTGFu
Y2UsIEFsbCwKPgo+IFBsZWFzZSwgYmUgc3VyZSB0aGF0IHRoZSBGcm9tIGhlYWRlciBtYXRjaGVz
IHlvdXIgU29CIGxpbmU7IGV2bmUgdGhvdWdoCj4geW91ciBlbWFpbCBtYXRjaGVzLCB0aGUgRnJv
bSBsYWNrcyB5b3VyIHJlYWwgbmFtZS4KPgo+IE9uIDIwMjItMDgtMjQgMTQ6MjYgLTA2MDAsIGxh
bmNldGhlcGFudHMgc3Bha2UgdGh1c2x5Ogo+PiBtdXNsLWZ0cyBwcm92aWRlcyBmZWF0dXJlcyBs
ZWZ0IG91dCBvZiBtdXNsIHRoYXQgYXJlIGluY2x1ZGVkIGluIG90aGVyIGxpYmMncy4KPj4KPj4g
VGhpcyBwYXRjaCBhbHdheXMgZW5hYmxlcyBidWlsZGluZyB0aGUgc3RhdGljIGxpYnJhcnkgc28K
Pj4gdGhhdCBpdCBpcyBhbHdheXMgcHJlc2VudCB3aXRoIG11c2wncyBsaWJjLmEgd2hlbiBlbmFi
bGVkLgo+Pgo+PiBGb3IgdGhvc2UgdGhhdCBhcmUgdXNpbmcgYnVpbGRyb290IGZvciB0b29sY2hh
aW4gY3JlYXRpb24KPj4gYW5kIHdhbnQgdG8gc3RhdGljIGxpbmssIHRoZW4gbGliZnRzLmEgaXMg
YXZhaWxhYmxlLgo+IFNvcnJ5LCBJIGFtIG5vdCBzdXJlIEkgdG90YWxseSB1bmRlcnN0b29kIHdo
YXQgeW91IG1lYW50IGhlcmUuCj4KPiBJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5LCB5b3Ugd2Fu
dCB0byB1c2UgQnVpbGRyb290LCB0byBnZW5lcmF0ZSBhCj4gbXVzbC1iYXNlZCB0b29sY2hhaW4s
IHRoYXQgeW91IGNhbiBkaXN0cmlidXRlLiBZb3Ugd2FudCB0aGF0IHRoYXQKPiB0b29sY2hhaW4g
YmUgdXNhYmxlIHRvIGRvIGJvdGggc2hhcmVkIGFuZCBzdGF0aWMgbGlua2luZy4gUmlnaHQ/Cj4K
PiBUaGVuIHlvdSB3YW50IHRvIGJlIGFibGUgdG8gdXNlIHRoYXQgdG9vbGNoYWluIHRvIGJ1aWxk
IHNvbWUgc29mdHdhcmUKPiB0aGF0IHVzZXMgZnRzKDMpLiBBbmQgc28sIHNpbmNlIHlvdSB3YW50
IHRvIGFsbG93IHN0YXRpYy1vbmx5IGxpbmtpbmcsCj4geW91IHdhbnQgdGhhdCB0b29sY2hhaW4g
dG8gYWxzbyBpbmNsdWRlIHRoZSBmdHMgbGlicmFyeSBhcyBhIHN0YXRpYwo+IGxpYnJhcnkuCgpZ
ZXMsIHRoYXQgaXMgY29ycmVjdC4KPiBIb3dldmVyLCB0aGlzIGlzLCBpbiBteSBvcGluaW9uLCBw
cm9ibGVtYXRpYyBmb3IgYSBmZXcgcmVhc29ucy4KPgo+IEZpcnN0LCBpbmNsdWRpbmcgbXVzbC1m
dHggdW5kZXIgdGhlIHRvb2xjaGFpbiBkZW5vbWluYXRpb24gaXMgd3Jvbmc7IGl0Cj4gbm8gbG9u
Z2VyIGlzIGEgdG9vbGNoYWluLCBidXQgbW9yZSBvZiBhbiBTREsuIEluY2x1ZGluZyBtdXNsLWZ0
cyB3aWxsCj4gZm9yIGV4YW1wbGUgbWVhbiB0aGF0IHRoYXQgdG9vbGNoYWluIHdpbGwgbm90IGJl
IHJldXNhYmxlIGFzIGFuIGV4dGVybmFsCj4gdG9vbGNoYWluIGZvciBCdWlsZHJvb3QsIGJlY2F1
c2UgdGhlbiBtdXNsLWZ0cyBpbiB0aGUgdG9vbGNoYWluIHdpbGwKPiBjb21lIGNvbmZsaWN0aW5n
IHdpdGggbXVzbC1mdHMgdGhlIHBhY2thZ2UgaW4gQnVpbGRyb290LgpJIHNlZSB0aGUgaXNzdWUg
eW91J3JlIHNheWluZyBoZXJlLgoKPiBTZWNvbmQsIGlmIHlvdSBuZWVkIGJvdGggc3RhdGljIGFu
ZCBzaGFyZWQgbGlicmFyaWVzLCB3aHkgZG9uJ3QgeW91Cj4gYnVpbGQgeW91ciBTREsgd2l0aCBC
UjJfU0hBUkVEX1NUQVRJQ19MSUJTIHRvIGJlZ2luIHdpdGg/IFdpdGggdGhhdCwgd2UKPiBwYXNz
IGJvdGggLS1lbmFibGUtc3RhdGljIC0tZW5hYmxlLXNoYXJlZCB3aGVuIGJ1aWxkaW5nIGF1dG90
b29scwo+IHBhY2thZ2VzIChhbmQgbXVzbC1mdHMgaXMgYW4gYXV0b3Rvb2xzIHBhY2thZ2UpOyBz
ZWUgcGFja2FnZS9NYWtlZmlsZS5pbgo+IGxpbmVzIDQyMy00MjQuClRoaXMgaXMgYSBnb29kIHNv
bHV0aW9uLgo+IFRoaXJkLCB3aGF0IG1ha2VzIG11c2wtZnRzIGRpZmZlcmVudCBmcm9tIG90aGVy
IGxpYnJhcmllcyB0aGF0IG1heSBiZQo+IGluY2x1ZGVkIGluIHRoZSBTREs/IElmIHlvdXIgZXh0
ZXJuYWwgc29mdHdhcmUgbmVlZHMgb3RoZXIgbGlicmFyaWVzLAo+IGFuZCB5b3UgZG8gbm90IGhh
dmUgdGhlbSBpbiB0aGUgU0RLLCB0aGVuIHlvdSdsbCBoYXZlIHRvIGJ1aWxkIHRob3NlCj4gbGli
cmFyaWVzIGZpcnN0LCBhbmQgcG9pbnQgeW91ciBzb2Z0d2FyZSBidWlsZHN5c3RlbSB0byB1c2Ug
dGhlbTsgd2h5Cj4gY2FuJ3QgeW91IGRvIHRoZSBzYW1lIGZvciBtdXNsLWZ0cz8KVGhpcyBpcyBh
bHNvIGEgZ29vZCBzb2x1dGlvbi4KCiJ3aGF0IG1ha2VzIG11c2wtZnRzIGRpZmZlcmVudCBmcm9t
IG90aGVyIGxpYnJhcmllcy4uLi4/IgpXZWxsIGl0IGlzIGEgbGlicmFyeSB0aGF0IGhhcyBsaWJj
IGZ1bmN0aW9uYWxpdHkuIEkgY2FuIGNvbXBpbGUgYSBnbGliYyAKb3IgdWNsaWJjIHRvb2xjaGFp
biBhbmQgZnRzIGlzIGluY2x1ZGVkLiBCdWlsZHJvb3QncyBtdXNsIHRvb2xjaGFpbiAKaW5jbHVk
ZXMgbXVzbC1jb21wYXQtaGVhZGVycyB0byBjb21wbGV0ZSBzb21lIG9mIGl0J3MgZnVuY3Rpb25h
bGl0eSwgYW5kIAptdXNsLWZ0cyB3b3VsZCBiZSB0aGUgc2FtZS4gRm9yIHRoYXQgcmVhc29uIEkg
c2VlIGl0IGFzIGEgY29yZSB0b29sY2hhaW4gCmNvbXBvbmVudCBhbmQgbm90IGFzIHNvbWV0aGlu
ZyBhZGRpdGlvbmFsIGFzIGFuIHNkay4gSSBkbyBrbm93IHRoYXQgdGhlIAptdXNsIGRldmVsb3Bl
cnMgYXJlIHZlcnkgaW50ZW50aW9uYWwgb24gd2hhdCBpcyBpbmNsdWRlZCBhbmQgb24gCmNvcnJl
Y3RuZXNzLCBhbmQgZnRzIGRpZG4ndCBtYWtlIHRoZSBjdXQgaW4gdGhlaXIgZXN0aW1hdGlvbi4g
SWYgZnRzIAp3ZXJlIHRvIGJlIGluY2x1ZGVkIGFzIHBhcnQgb2YgdGhlIG11c2wgdG9vbGNoYWlu
IGluIGJ1aWxkcm9vdCBJIG5vdyAKdW5kZXJzdGFuZCB0aGF0IHNvbHV0aW9uIHdvdWxkIGxvb2sg
ZGlmZmVyZW50IGZyb20gbXkgc3VibWlzc2lvbi4KCkhvd2V2ZXIsIGFmdGVyIGdyZXBwaW5nIHRo
cm91Z2ggdGhlIHNvdXJjZSBJIHNlZSB0aGF0IGJhcmVseSBhbnkgCnBhY2thZ2VzIGluIGJ1aWxk
cm9vdCBhcmUgZGVwZW5kZW50IG9uIGl0LsKgIFBlcmhhcHMgb3RoZXIgdG9vbGNoYWluIAptYWtl
cnMgb21pdCBpdCBhcyB3ZWxsIGFuZCBzbyB0aGUgY3VycmVudCBmdHMgc3RyYXRlZ3kgd291bGQg
YmUgCm5lY2Vzc2FyeSBpZiB1c2luZyB0aG9zZSBhcyBhbiBleHRlcm5hbCB0b29sY2hhaW4uClRo
YW5rcyBmb3IgeW91ciByZXNwb25zZSwgeW91J3ZlIGdpdmVuIG1lIHNvbWUgZ29vZCB3b3JrYWJs
ZSBzb2x1dGlvbnMgCmFuZCBJJ2xsIHJ1biB3aXRoIG9uZSBvZiB0aG9zZS4KPj4gU2lnbmVkLW9m
Zi1ieTogTGFuY2UgRnJlZHJpY2tzb24gPGxhbmNldGhlcGFudHNAZ21haWwuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBsYW5jZXRoZXBhbnRzIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KT29wc2ll
IG9uIG15IHBhcnQuIEkgbWFudWFsbHkgYWRkZWQgdGhlIGZpcnN0IGxpbmUgYnV0IHRoZW4gSSBk
aWRuJ3QgCmNhdGNoIHRoYXQuLi4KZ2l0IGZvcm1hdC1wYXRjaCAtTSAtbiAtcyAtbyBvdXRnb2lu
ZyBvcmlnaW4vbWFzdGVyCmFkZHMgb25lIGFzIHdlbGwgdXNpbmcgbXkgZ2l0IGNvbmZpZy4KPiBU
aGF0IHNlY29uZCBTb0IgbGluZSBpcyBpbmNvcnJlY3QsIGFzIGl0IGhhcyBubyByZWFsLW5hbWUg
cGFydDsgaXQgaXMKPiBhbHNvIHN1cGVyZmx1b3VzLCBiZWNhdXNlIGl0IGlzIHRoZSBzYW1lIGVt
YWlsIHBhcnQuCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPj4gLS0tCj4+ICAgcGFj
a2FnZS9tdXNsLWZ0cy9tdXNsLWZ0cy5tayB8IDEgKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXNsLWZ0cy9tdXNsLWZ0cy5t
ayBiL3BhY2thZ2UvbXVzbC1mdHMvbXVzbC1mdHMubWsKPj4gaW5kZXggZGQ3ZjFmOWVhMC4uZmNh
ZDljM2Q3NSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9tdXNsLWZ0cy9tdXNsLWZ0cy5tawo+PiAr
KysgYi9wYWNrYWdlL211c2wtZnRzL211c2wtZnRzLm1rCj4+IEBAIC0xMiw1ICsxMiw2IEBAIE1V
U0xfRlRTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4+ICAgIyBwa2ctY29uZmlnIG5lZWRlZCBm
b3IgYXV0b3JlY29uZgo+PiAgIE1VU0xfRlRTX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+
PiAgIE1VU0xfRlRTX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+PiArTVVTTF9GVFNfQ09ORl9PUFRT
ICs9IC0tZW5hYmxlLXN0YXRpYwo+PiAgIAo+PiAgICQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdl
KSkKPj4gLS0gCj4+IDIuMjAuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
