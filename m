Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4E9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F304140620;
	Fri, 17 Dec 2021 18:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sgs2-nbT8Vzm; Fri, 17 Dec 2021 18:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4BEC40633;
	Fri, 17 Dec 2021 18:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62DC41BF28C
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E00F61130
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2NV7fZ5HdjH for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 18:05:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DBAD60A7F
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 18:05:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y22so10974582edq.2
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 10:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rkDNzXgcFq8WgzUZGo5NSJVixojiVs+ihWTs5DcfEZg=;
 b=KsI9JmLVHupX/aNYwP7tbVboBNlSmyUncs25Bs/fkq6WMY1UexX0CMLFE4zIgqzCPL
 MVRW+3xdrmygLrFZFyp9TfG2mvrH8AH3UKxlmYNZpGzJb3+GOfAjdin9l5COml3Vol6N
 O5p5oLexs0PLRtW2bTOBFKQTKo8Dm3djiK5xi/HclUmVHdT0exloB6sdZ04Tyix9HXdn
 wtGmGEQq8UmppuTSAlwztaIhvoCKnIACvloxh2AGXvAgd8r/x0Q6zkYBdrDpqXKka/aP
 2AV8w/N8bVIm7VGqsY8FO64Fx+3Dxkpp7WvNtTSI4nAzh2NDA0b7P3pKXALjEMQRySBI
 vlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rkDNzXgcFq8WgzUZGo5NSJVixojiVs+ihWTs5DcfEZg=;
 b=4jq3LXU2iczdtruvYP0eA4TxBU1pxc3EP5807zHNEY8GWbrTmrlWHTr8fn3oINca3F
 apcdVbXTOl6GR/ODk/Dp5RNZbLbXwfB48y6R0g9DiVyYY4YD5DRDfmcnFHtT+OaGIJn0
 MjjCTvQKoOtoho8wpikn9tHyc9ZYFoFyJGiGYY98Bd+6ZoBy2JL8gv7vAcmOfjR3duV3
 YoTmTyMcdtzP46lYwloVDYTR2kqQAgEqwwj801bF7b9JEnpiQOCBP/drmeMFLZer47yF
 5BArGvGjrAOX8H/ejtDySBzB/zz9Q2icxxt/UchD8WUYV+REy7XI4bStLo5VsA5JWhov
 w9iw==
X-Gm-Message-State: AOAM53104tYy3RnDUcJnWEL8YLIMcDUc6AZyuotddHpEor7pNH9oMIZ1
 Cdwqwqueb6phG43qvf+gdEo2Zg==
X-Google-Smtp-Source: ABdhPJwRtdZNBprXBYeaDxKiZiTeyqyq9Ml0/E4kJ24L3y+LNdcb/J+xQl0ORdYbSb1QekT73LAFNw==
X-Received: by 2002:a17:906:5fca:: with SMTP id
 k10mr3706401ejv.722.1639764350464; 
 Fri, 17 Dec 2021 10:05:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dp16sm3259047ejc.34.2021.12.17.10.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 10:05:50 -0800 (PST)
Message-ID: <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
Date: Fri, 17 Dec 2021 19:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8xMi8yMDIxIDEyOjA0LCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToKPiBIaSwKPj4+ICvC
oMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfRFJBQ1VUCj4+PiArwqDCoMKgIHNlbGVjdCBC
UjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTCj4+PiArwqDCoMKgIGhlbHAKPj4+ICvCoMKgwqDC
oMKgIEJ1aWxkcyBhbiBhZGRpdGlvbmFsIGluaXRyYW1mcyB1c2luZyBkcmFjdXQuIFRoaXMgY2Fu
IGJlIHVzZWZ1bCB0byAKPj4+IGNyZWF0ZSBhIHJlY292ZXJ5IHN5c3RlbSwgZm9yIGluc3RhbmNl
Lgo+Pj4gKwo+Pj4gK2lmIEJSMl9UQVJHRVRfUk9PVEZTX0RSQUNVVAo+Pj4gK2NvbmZpZyBCUjJf
VEFSR0VUX1JPT1RGU19EUkFDVVRfQ09ORl9GSUxFCj4+PiArwqDCoMKgIHN0cmluZyAiY29uZmln
dXJhdGlvbiBmaWxlIgo+Pgo+PiDCoElzIHRoZXJlIGEgcG9zc2liaWxpdHkgZm9yIGEgZGVmYXVs
dCBjb25maWd1cmF0aW9uIGZpbGU/Cj4gV291bGQgdGhhdCByZWFsbHkgbWFrZSBzZW5zZSA/IFdo
YXQgd291bGQgYmUgZGVmYXVsdCB0aGUgZXhwZWN0ZWQgcGFja2FnZXMgaW4gCj4gdGhlIHJhbSBk
aXNrID8KCiAgWWVhaCwgT0ssIGdvb2QgcG9pbnQuLi4KCj4gTm90aWNlIHRoYXQgdGhlIGNvbnRl
bnQgb2YgdGhlIGNvbmZpZyBmaWxlIHN0cm9uZ2x5IGRlcGVuZHMgb24gdGhlIGluaXQgc3lzdGVt
IAo+IChkcmFjdXQgYmVpbmcgbW9zdGx5Cj4gdGhvdWdodCBmb3Igc3lzdGVtZCwgYnV0IEkgdXNl
IGl0IHdpdGggYnVzeWJveC9pbml0LmQgaW4gbXkgY2FzZSkuCj4gQnV0IEkgYWdyZWUgdGhhdCBJ
IG11c3QgYWRkIGFuIGVycm9yIGluIHRoZSAubWsgd2hlbiB0aGUgZmlsZSBpcyBub3QgCj4gc3Bl
Y2lmaWVkL2RvZXMgbm90IGV4aXN0Cj4gCj4gKG1vcmUgbm90ZXMgYmVsb3cpCj4+Cgpbc25pcF0K
Pj4+ICsjIGRldnRtcGZzIGRvZXMgbm90IGdldCBhdXRvbW91bnRlZCB3aGVuIGluaXRyYW1mcyBp
cyB1c2VkLgo+Pj4gKyMgQWRkIGEgcHJlLWluaXQgc2NyaXB0IHRvIG1vdW50IGl0IGJlZm9yZSBy
dW5uaW5nIGluaXQKPj4+ICsjIFdlIG11c3QgaGF2ZSAvZGV2L2NvbnNvbGUgdmVyeSBlYXJseSwg
ZXZlbiBiZWZvcmUgL2luaXQgcnVucywKPj4+ICsjIGZvciBzdGRpbi9zdGRvdXQvc3RkZXJyCj4+
PiArZGVmaW5lIFJPT1RGU19EUkFDVVRfQUREX0lOSVQKPj4+ICvCoMKgwqAgaWYgWyAhIC1lICQo
VEFSR0VUX0RJUikvaW5pdCBdOyB0aGVuIFwKPj4+ICvCoMKgwqDCoMKgwqDCoCAkKElOU1RBTEwp
IC1tIDA3NTUgZnMvY3Bpby9pbml0ICQoVEFSR0VUX0RJUikvaW5pdDsgXAo+Pj4gK8KgwqDCoCBm
aQo+Pj4gK8KgwqDCoCBta2RpciAtcCAkKFRBUkdFVF9ESVIpL2Rldgo+Pj4gK8KgwqDCoCBta25v
ZCAtbSAwNjIyICQoVEFSR0VUX0RJUikvZGV2L2NvbnNvbGUgYyA1IDEKPj4+ICtlbmRlZgo+Pj4g
Kwo+Pj4gK2VuZGlmICMgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fU1RBVElDCj4+Cj4+IMKg
VGhlIGFib3ZlIGlzIHRoZSBzYW1lIGxvZ2ljIGFzIGluIGNwaW8ubWsuIEl0IHdvdWxkIGJlIGJl
dHRlciBpZiB3ZSBjb3VsZCAKPj4gcmVmYWN0b3IgdGhhdCB0byBhIGNvbW1vbiBwbGFjZS4KPiAK
PiBJIGRlZmluaXRpdmVseSBhZ3JlZSwgdGhhdCBpcyB3aGF0IEkgc2FpZCBteXNlbGYuIEJ1dCB3
aGF0IGlzIHRoZSBtb3N0IAo+IGFwcHJvcHJpYXRlIHBsYWNlIHRvIHB1dCBpdCA/CgogIEkgd291
bGRuJ3QgYmUgb3Bwb3NlZCB0byBwdXR0aW5nIGl0IGluIGZzL2NvbW1vbi5tay4gWWFubiwgd2hh
dCBkbyB5b3UgdGhpbms/CgogIEkgYW0sIGhvd2V2ZXIsIHRoaW5raW5nIHNvbWV0aGluZyBlbHNl
IGFzIHdlbGwuIFdoYXQgZG9lcyB0aGUgZHJhY3V0IGZzIApwcm9kdWNlPyBJcyBpdCBhIGNwaW8g
aW1hZ2U/IElmIHNvLCB0aGVuIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGluc3RlYWQgbWFr
ZSAKdGhpcyBhIHN1Ym9wdGlvbiBvZiBjcGlvLiBUaGlzLCBpbiB0dXJuLCB3b3VsZCBtYWtlIGl0
IHBvc3NpYmxlIHRvIHVzZSBkcmFjdXQgCmZvciBhbiBpbml0cmFtZnMuCgoKPj4+ICsKPj4+ICtS
T09URlNfRFJBQ1VUX1BSRV9HRU5fSE9PS1MgKz0gUk9PVEZTX0RSQUNVVF9BRERfSU5JVAo+Pj4g
Kwo+Pj4gK2RlZmluZSBST09URlNfRFJBQ1VUX0NNRAo+Pj4gKwo+Pj4gK8KgwqDCoCBta2RpciAt
cCAkKEBEKS90bXAKPj4+ICvCoMKgwqAgcm0gLXJmICQoQEQpL3RtcC8qCj4+PiArCj4+PiArwqDC
oMKgIERSQUNVVF9MREQ9JChUQVJHRVRfQ1JPU1MpbGRkIFwKPj4+ICvCoMKgwqAgRFJBQ1VUX0lO
U1RBTEw9IiQoSE9TVF9ESVIpL2xpYi9kcmFjdXQvZHJhY3V0LWluc3RhbGwiXAo+Pj4gK8KgwqDC
oCBkcmFjdXRiYXNlZGlyPSQoSE9TVF9ESVIpL3Vzci9saWIvZHJhY3V0IFwKPj4KPj4gwqBJdCB3
b3VsZCBiZSBuaWNlIGlmIGFsbCBvZiB0aGUgYWJvdmUgY291bGQgYmUgcGF0Y2hlcyBpbnRvIGhv
c3QtZHJhY3V0LCBzbyAKPj4gd2hlbiBjYWxsZWQgZnJvbSBhIHBvc3QtaW1hZ2Ugc2NyaXB0LCBp
dCdzIG5vdCBuZWVkZWQgdG8gcGFzcyBhbGwgb2YgdGhhdCBpbi4KPiAKPiBUaGlzIHRpbWUsIEkg
ZG8gbm90IGFncmVlLiBJIGNvbnRyYXJ5IHRvIHNvbWUgdG9vbHMgdGhhdCBhcmUgbm90IHRob3Vn
aHQgZm9yIAo+IGNyb3NzIGVudmlyb25tZW50cywgYW5kIHRoYXQgZGVzZXJ2ZSBwYXRjaGluZyB0
byBiZWhhdmUgdGhlCj4gYXBwcm9wcmlhdGUgd2F5LCBkcmFjdXQgaXMgZGVzaWduZWQgZm9yIHRo
YXQuCj4gQXQgdmFyaW91cyBwbGFjZXMgaXQgY2hlY2tzIHRoZSBnaXZlbiBlbnZpcm9ubWVudCB2
YXJpYWJsZXMgKGluIGJvdGggYmFzaCBhbmQgCj4gQyksIGFuZCB0aGlzIGlzIHRoZSB3YXkgdG8g
dXNlIGl0LgoKICBPSywgbGV0IG1lIHJlY29uc2lkZXIgdGhhdC4gSXQgd291bGQgYmUgbmljZSB0
byBhZGQgYSB3cmFwcGVyIHNjcmlwdCB0byB0aGUgCmhvc3QtZHJhY3V0IHBhY2thZ2UgdGhhdCBz
ZXRzIHRoZXNlIGVudmlyb25tZW50IHZhcmlhYmxlcy4gVGhpcyB3YXkgaXQgYmVjb21lcyBhIAps
b3QgZWFzaWVyIHRvIHVzZSBkcmFjdXQgaW4gYSBwb3N0LWltYWdlIHNjcmlwdCBpbnN0ZWFkIG9m
IGFzIGEgZmlsZXN5c3RlbS4KCiAgQnV0IG1heWJlIEknbSBvdmVydGhpbmtpbmcgdGhpbmdzIC0g
dGhlIGRyYWN1dCBmcyBjb3VsZCB2ZXJ5IHdlbGwgYmUgZW5vdWdoIHRvIApzdGFydCB3aXRoLiBJ
biB0aGF0IGNhc2UsIHRoZSBwcm9iYWJseSBzaG91bGRuJ3QgYmUgYSB1c2VyLXZpc2libGUgSE9T
VF9EUkFDVVQgCm9wdGlvbiBlaXRoZXIuCgoKPj4gwqBZb3Ugc2hvdWxkIGFsc28gY2hlY2sgdGhl
biBpZiBpdCBnZXRzIHByb3Blcmx5IHVwZGF0ZWQgYnkgCj4+IHN1cHBvcnQvbWlzYy9yZWxvY2F0
ZS1zZGsuc2ggKEkgdGhpbmsgeWVzKS4KPiBJIGFtIHNvcnJ5LCBidXQgSSBkbyBub3Qgc2VlIHRo
ZSBwb2ludCBoZXJlLCB3b3VsZCB5b3UgbWluZCBleHBsYWluIHBsZWFzZSA/CgogIElmIHRoZXJl
J3Mgc3VjaCBhIHdyYXBwZXIgc2NyaXB0IHRoYXQgc2V0cyB0aGUgZW52aXJvbm1lbnQgdmFyaWFi
bGVzIApjb3JyZWN0bHksIHRoZSBpZGVhIGlzIHRvIGJlIGFibGUgdG8gdXNlIHRoYXQgYXMgcGFy
dCBvZiB0aGUgU0RLLiBUaGF0IGFsc28gCm1lYW5zIGl0IG11c3QgYmUgcG9zc2libGUgdG8gbW92
ZSBpdCB0byBhIGRpZmZlcmVudCBwbGFjZS4gU2luY2UgaXQgY29udGFpbnMgCmhhcmRjb2RlZCBw
YXRocyB0byBIT1NUX0RJUiwgdGhlc2UgbmVlZCB0byBiZSBjaGFuZ2Ugd2hlbiB0aGUgU0RLIGlz
IHJlbG9jYXRlZC4gClRoZSByZWxvY2F0ZS1zZGsuc2ggc2NyaXB0IHNob3VsZCBkbyB0aGF0LCBi
dXQgaXQncyBpbXBvcnRhbnQgdG8gY2hlY2sgdGhhdCAKaW5kZWVkIGl0IGRvZXMuCgoKPj4+ICvC
oMKgwqAgZHJhY3V0c3lzcm9vdGRpcj0kKFRBUkdFVF9ESVIpIFwKPj4+ICvCoMKgwqAgJChIT1NU
X0RJUikvYmluL2RyYWN1dCBcCj4+PiArwqDCoMKgIC0ta3ZlciAkKEJSMl9MSU5VWF9LRVJORUxf
VkVSU0lPTikuMCBcCj4+Cj4+IMKgVGhpcyBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCBhIHNlY29u
ZCB0YWIuCj4+Cj4+IMKgQWxzbywgeW91IGNhbid0IHVzZSBCUjJfTElOVVhfS0VSTkVMX1ZFUlNJ
T04gYmVjYXVzZSB0aGF0J3Mgb25seSBhdmFpbGFibGUgaWYgCj4+IEJSMl9MSU5VWF9LRVJORUw9
eS4gU28gZWl0aGVyIHlvdSBoYXZlIHRvIGRlcGVuZCBvbiB0aGF0LCBvciB5b3UgbmVlZCB0byBh
ZGQgCj4+IGFuIG9wdGlvbiB0byBDb25maWcuaW4gdG8gYmUgYWJsZSB0byBzZXQgaXQuIEFsc28s
IHlvdSBzaG91bGQgcHJvYmFibHkgdXNlIAo+PiBMSU5VWF9WRVJTSU9OX1BST0JFRCBpbnN0ZWFk
IChhdCBsZWFzdCBpZiB5b3UgbmVlZCBhbiBhY3R1YWwga2VybmVsIHZlcnNpb24sIAo+PiBhbmQg
bm90IHNvbWUgY29tbWl0IGhhc2ggb3Igc29tZXRoaW5nKS4gQWxzbywgd2hhdCBpcyB0aGUgLjAg
YXBwZW5kZWQgdG8gaXQ/Cj4gCj4gRHJhY3V0IG5lZWRzIHRoZSAvbGliL21vZHVsZXMveC54Lngg
ZGlyZWN0b3J5IG5hbWUKPiBXaGVuIGEgNS4xMCBrZXJuZWwgaXMgc2VsZWN0ZWQsIG1vZHVsZXMg
Z28gdG8gL2xpYi9tb2R1bGVzLzUuMTAuMAo+IFRoYW5rcyBmb3IgdGhlIExJTlVYX1ZFUlNJT05f
UFJPQkVELCB0aGlzIGlzIHdoYXQgSSBuZWVkZWQgIQoKICBUaGlzIGlzIG9ubHkgbmVlZGVkIGlm
IHlvdSBhY3R1YWxseSBoYXZlIG1vZHVsZXMgdG8gYWRkIHRvIHRoZSBjcGlvIGltYWdlIAood2hp
Y2ggaXMgb25seSB0aGUgY2FzZSBpZiB5b3UgYnVpbGQgdGhlIGtlcm5lbCwgb2J2aW91c2x5KS4g
VGhlcmUgYXJlIHBsZW50eSBvZiAKdXNlIGNhc2VzIHdoZXJlIGFuIGluaXRyZCBpcyB1c2VmdWwg
YnV0IG5vIG1vZHVsZXMgYXJlIHVzZWQgKG9yIHRoZXkgYXJlbid0IApuZWVkZWQgZHVyaW5nIHVu
dGlsIHRoZSByb290ZnMgaXMgbW91bnRlZCkuCgogIFNvLCBkb2VzIGRyYWN1dCBoYXZlIGFuIG9w
dGlvbiB0byBub3QgaW5zdGFsbCBtb2R1bGVzPyBJZiB5ZXMsIHlvdSBjYW4gdXNlIAotLWt2ZXIg
aXMgdGhlIGtlcm5lbCBpcyBidWlsdCwgYW5kIHdoYXRldmVyIG9wdGlvbiBpcyBuZWVkZWQgdG8g
c2tpcCBtb2R1bGVzIGlmIG5vdC4KCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPj4+ICvCoMKgwqAg
LWMgJChCUjJfVEFSR0VUX1JPT1RGU19EUkFDVVRfQ09ORl9GSUxFKSBcCj4+Cj4+IMKgV2Ugbm9y
bWFsbHkgaGF2ZSBhIGNoZWNrIGluIHRoZSBtYWtlZmlsZSB0byBleGl0IGltbWVkaWF0ZWx5IGlm
IHRoZSBvcHRpb24gaXMgCj4+IG5vdCBzZXQuIFNlZSBmb3IgZXhhbXBsZSBpbiBsaW51eC1iYWNr
cG9ydHMuIE5vdGUgdGhhdCBpdCBuZWVkcyB0byBiZSBpbiBhIAo+PiBCUl9CVUlMRElORyBjb25k
aXRpb24uCj4gT2ssIEkgd2lsbCBjaGVjayB0aGF0Cj4gUmVnYXJkcwo+IFRoaWVycnQKPj4KPj4K
Pj4gwqBSZWdhcmRzLAo+PiDCoEFybm91dAo+Pgo+Pj4gK8KgwqDCoCAtLXRtcGRpciAkKEBEKS90
bXAgXAo+Pj4gK8KgwqDCoCAtTSBcCj4+PiArwqDCoMKgIC0tZm9yY2UgXAo+Pj4gK8KgwqDCoCAt
LWtlZXAgXAo+Pj4gK8KgwqDCoCAkQAo+Pj4gKwo+Pj4gK2VuZGVmCj4+PiArCj4+PiArJChldmFs
ICQocm9vdGZzKSkKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
