Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF2AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E0EA60B3B;
	Sun,  9 Jan 2022 13:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3dPA-6nD80R; Sun,  9 Jan 2022 13:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E8060625;
	Sun,  9 Jan 2022 13:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0A671BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED2B1405AA
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUgcqEkRu8fh for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD594401B2
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:12:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r10so13891011wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6UgCTzwTK94F+F9voH4q6ubw5RO1O+blLl0Us1dlDYI=;
 b=DNwxLZB7iT7ekgJOHOnZPLUN41k+uTcEeXZeXHRVKcSxql0q/ZRkdFUlF6cA2RiE9Q
 Ttj0oiCSmaElcgx4WH5/thPA2V3u24aSyigQl44d+CkxcMM/R82sq60EFdM6j/8alToE
 J9HZ7ik20gleH7xY8g39Ju520ZnvR0lFO8ljKc9SZhbGVsmqh7pI3H2q4ei4JMDBCjwJ
 r0tbmYpghpc6tFnsc8l2Y+rOZitrfjWcLgN/nIpIt56heRdnCQ13MpumofLUXG7a86VC
 +sMbyFPTPJSNlFLai8DTDLKQkLYG0tFpTAMrGXJLZAg06KekCetayPthnpPjBWrhjpXl
 akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6UgCTzwTK94F+F9voH4q6ubw5RO1O+blLl0Us1dlDYI=;
 b=6QJ1h14Gi5YaWPI85ci86E1bqrmW3GowDhjoFqTiXxmZ3r9F+bio37rrMgOHOjtm/Q
 xV0OnD3RUejEp6hLb0hNLhihQ+n3Img/fcFwWaiXpX3tY3cUVQaPFMl7pAQT3SLeJ8+a
 5ekMtDNJNEhdXzWOtMQ/Ypg/fyeF30zinpPBWS2z833ldV41Igl8Uk6tQirNimrODw+9
 A5QeOyp1vglw4fNQZ6xQHqXQFHiHQgMI12atZ5WYiFkQeS37XOmKMhrzfabKFLBkWtKL
 7Xvp9L6a8DTObydGKyn6tWS3n/KyXPwJIrCbtRsEDf89CUnNniLbJIuWjGkpt0KJug+8
 FMAQ==
X-Gm-Message-State: AOAM531vV7ToQyFXJbYI7Au78kcXi/x6YiSAacqnH73TSnDn17i8vljJ
 OtnsRdyhXytBv9x4dY3kfbuIEsn6b8fYrRT/
X-Google-Smtp-Source: ABdhPJxYK1rXr1U9W1qxcrhlSuPhewHHA+xB5gF91JsNrPquAeUmE7Zd7QuaX3t8bwlVQAxA8D3wDA==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr10742007wru.131.1641733937190; 
 Sun, 09 Jan 2022 05:12:17 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g84sm4149002wme.7.2022.01.09.05.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 05:12:16 -0800 (PST)
Message-ID: <f78e9576-5626-dbe4-b61b-7cd8f4a6b779@mind.be>
Date: Sun, 9 Jan 2022 14:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220109110555.3789-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109110555.3789-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/openrc: add patch to create
 /run/lock/subsys
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
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS8wMS8yMDIyIDEyOjA1LCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+IFRvZ2V0aGVyIHdp
dGggY2hhbmdlcyB0byBzeXN2L2J1c3lib3ggaW5pdCwgdGhpcyBkaXJlY3RvcnkKPiB3aWxsIGFs
cmVhZHkgZXhpc3Qgb24gYWxsIGluaXQgc3lzdGVtcyBiZWZvcmUgYW55IHNlcnZpY2UKPiBzY3Jp
cHRzIGFyZSBydW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5
QGdtYWlsLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgTm9ybWFsbHkgd2Ug
cmVxdWlyZSBwYXRjaGVzIHRvIGJlIHVwc3RyZWFtZWQgZmlyc3QsIGJ1dCB0aGVyZSBhcmUgYWxy
ZWFkeSAKcGxlbnR5IG9mIG90aGVyIHBhdGNoZXMgdGhhdCBoYXZlbid0IGJlZW4gc2VudCB1cHN0
cmVhbS4gSXQgY291bGQgYWxzbyBiZSBhIGJpdCAKYnVpbGRyb290LXNwZWNpZmljICh0aG91Z2gg
SSB0aGluayB0aGUgc3Vic3lzIGlzIHRoZXJlIGJlY2F1c2Ugc29tZSBwYWNrYWdlcyAKYWN0dWFs
bHkgdXNlIHRoYXQgZGlyZWN0b3J5KS4KCiAgU3RpbGwsIE1pY2hhxYIsIGRvIHlvdSB0aGluayB0
aGlzIHBhdGNoIHdvdWxkIGJlIGFjY2VwdGFibGUgdXBzdHJlYW0/IE9idmlvdXNseSAKbm90IGlu
IGl0cyBjdXJyZW50IGZvcm0gc2luY2UgdXBzdHJlYW0gaGFzIGdyb3VwIHV1Y3AgcmF0aGVyIHRo
YW4gZGFlbW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiB2MS0+djI6Cj4gKiAgIHJl
ZnJlc2ggcGF0Y2gKPiAtLS0KPiAgIC4uLmxzby1jcmVhdGUtcnVuLWxvY2stc3Vic3lzLWRpcmVj
dG9yeS5wYXRjaCB8IDI5ICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVucmMvMDAw
Ni1BbHNvLWNyZWF0ZS1ydW4tbG9jay1zdWJzeXMtZGlyZWN0b3J5LnBhdGNoCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvb3BlbnJjLzAwMDYtQWxzby1jcmVhdGUtcnVuLWxvY2stc3Vic3lzLWRp
cmVjdG9yeS5wYXRjaCBiL3BhY2thZ2Uvb3BlbnJjLzAwMDYtQWxzby1jcmVhdGUtcnVuLWxvY2st
c3Vic3lzLWRpcmVjdG9yeS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uY2Y1OTJhODhiMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL29wZW5y
Yy8wMDA2LUFsc28tY3JlYXRlLXJ1bi1sb2NrLXN1YnN5cy1kaXJlY3RvcnkucGF0Y2gKPiBAQCAt
MCwwICsxLDI5IEBACj4gK0Zyb20gNDllNTkyOWI0NjhmNjA0ZDgwYTBjMDRhNmNlNzhlYjk2Y2Ez
NjA5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogTm9yYmVydCBMYW5nZSA8bm9s
YW5nZTc5QGdtYWlsLmNvbT4KPiArRGF0ZTogU3VuLCA5IEphbiAyMDIyIDAwOjIyOjQwICswMTAw
Cj4gK1N1YmplY3Q6IFtQQVRDSF0gQWxzbyBjcmVhdGUgL3J1bi9sb2NrL3N1YnN5cyBkaXJlY3Rv
cnkKPiArCj4gK0J1aWxkcm9vdCBzZXJ2aWNlIHNjcmlwdHMgcmVndWxhcmx5IHVzZSB0aGlzIGRp
cmVjdG9yeSwgc28KPiArY3JlYXRlIGl0IGluIHRoZSBtb3N0IGFwcHJvcHJpYXRlIHNwb3QuCj4g
Kwo+ICtTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+
ICstLS0KPiArIHNoL2luaXQuc2guTGludXguaW4gfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9zaC9pbml0
LnNoLkxpbnV4LmluIGIvc2gvaW5pdC5zaC5MaW51eC5pbgo+ICtpbmRleCBlOGFmYzFmYi4uNjYy
YWIyMjMgMTAwNjQ0Cj4gKy0tLSBhL3NoL2luaXQuc2guTGludXguaW4KPiArKysrIGIvc2gvaW5p
dC5zaC5MaW51eC5pbgo+ICtAQCAtODIsNyArODIsNyBAQCBlbGlmICEgbW91bnRpbmZvIC1xIC9y
dW47IHRoZW4KPiArIGZpCj4gKwo+ICsgY2hlY2twYXRoIC1kICIkUkNfU1ZDRElSIgo+ICstY2hl
Y2twYXRoIC1kIC1tIDA3NzUgLW8gcm9vdDpkYWVtb24gL3J1bi9sb2NrCj4gKytjaGVja3BhdGgg
LWQgLW0gMDc3NSAtbyByb290OmRhZW1vbiAvcnVuL2xvY2sgL3J1bi9sb2NrL3N1YnN5cwo+ICsK
PiArICMgVHJ5IHRvIG1vdW50IHhlbmZzIGFzIGVhcmx5IGFzIHBvc3NpYmxlLCBvdGhlcndpc2Ug
cmNfc3lzKCkgd2lsbCBhbHdheXMKPiArICMgcmV0dXJuIFJDX1NZU19YRU5VIGFuZCB3aWxsIHRo
aW5rIHRoYXQgd2UgYXJlIGluIGEgZG9tVSB3aGlsZSBpdCdzIG5vdC4KPiArLS0KPiArMi4zNC4x
Cj4gKwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
