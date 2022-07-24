Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B22183F9E;
	Sun, 24 Jul 2022 14:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B22183F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DAqK77UUxJw; Sun, 24 Jul 2022 14:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A2783F89;
	Sun, 24 Jul 2022 14:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A2783F89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 956451BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C45283F89
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C45283F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBdclQbBZ6hr for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB5E783F70
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB5E783F70
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:09:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id id17so5339611wmb.1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EeFes/6f74flThDDxhE3F0gyrl0q/kEwDdFcB1XHhSI=;
 b=O9eRaQ+z7a10FQK6l/p4jxadTOHPmTij7BAAFn14jz2n2+olw/7rWNkXRGGVIy7fLI
 Hk2zzCEqKLILEEHPNkR3M2CNzpblkp0IWV8GrKz3sWY1s44fVt8Ua6QpDslu0TkEXlCQ
 TyD+yVcJkcv2da0fblLpZV9YieiD941WvhihUbz17CbtC+t2ypDWPCfpuOnnD8n4Iwc1
 0ofEfJdbQsHiJqsTko4KJs/c67lOpkAiDaec5bYTbgowE4Crjw/oETKnvf99Vj5eFTB3
 8J152K3PAPe9mF93GE1V+Q6lkDw+ISa8RoiVaEdg84Lvn2Oe1Ikn3QVtgP2TmxI7FbEx
 3+BA==
X-Gm-Message-State: AJIora8Dl6C4Q+/8SgFTRnoOIQ68JNBr3nMzrzOLyvaMbUXMCVN1/yD3
 sRcNmHrzkmB+zxHfcLvj80gH9Q==
X-Google-Smtp-Source: AGRyM1sJvlHTgjqT8E8MBT6lrjqrA8YOOA9atzDi5wqkKUKdDGuuRwBYPFFdMEHTqudDXbLqPf8TBg==
X-Received: by 2002:a05:600c:1c96:b0:3a3:10b6:e84f with SMTP id
 k22-20020a05600c1c9600b003a310b6e84fmr17849986wms.175.1658671769717; 
 Sun, 24 Jul 2022 07:09:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm14559758wmq.48.2022.07.24.07.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 07:09:29 -0700 (PDT)
Message-ID: <a4133389-1182-11aa-9edc-215ffd82eb48@smile.fr>
Date: Sun, 24 Jul 2022 16:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220216154910.8627-1-br015@umbiko.net>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220216154910.8627-1-br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EeFes/6f74flThDDxhE3F0gyrl0q/kEwDdFcB1XHhSI=;
 b=WAQh8MJoS7OjxgJKJFoKRR0Rk7xY3LzcReGE7AMkUUQH8R+T7wCxCj7LUVcYgOwePW
 qArkOkPRQ9+4ui+dJyrGLC75pBLlLoyEk8SV2VK+yO1fWkxyYb2sBgXHLm0YOy22tjYQ
 sHWeJ9Dw2ILZ0Bvq07fqUNVV1LtQaLlQeX9mcdwSuD97DwNyi+0lNASrBJJ5OiI33IT4
 ItRBLh+H9A5YKPD6YNNAXzcVKpyP/tlarQKPf/nQaZPVvfsOZQmhk+XlaKYthNgnKWPi
 EZS/5XR3KM3WiEgSlSK3VVb2YFlqsDuKW2M2U5L+EmUb3hXiOj+TLet4fJDIwHKisSHV
 dq6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=WAQh8MJo
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: add option for async file
 access using io_uring
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcwoKTGUgMTYvMDIvMjAyMiDDoCAxNjo0OSwgQW5kcmVhcyBaaWVnbGVyIGEg
w6ljcml0wqA6Cj4gSW4gdmVyc2lvbiAwLjIyIG1wZCBhZGRlZCBhbiBvcHRpb24gdG8gdXNlIHRo
ZSBpb191cmluZyBrZXJuZWwgaW50ZXJmYWNlIGZvciAKPiBhc3luY2hyb25vdXMgYWNjZXNzIHRv
IGxvY2FsIGZpbGVzLiBCdWlsZHJvb3QgYWRkZWQgdGhlIG5lY2Vzc2FyeSBsaWJyYXJ5IAo+IChw
YWNrYWdlL2xpYnVyaW5nKSBpbiBjb21taXQgMDNjYTZmNGUzOTg3NDU4MzA2MDMxN2U3ZTE1ZTll
MzYwMjIwODc3ZS4KPiAKPiBBZGQgYW4gb3B0aW9uIGZvciBtcGQgdG8gb3B0aW9uYWxseSBlbmFi
bGUgYXN5bmNocm9ub3VzIGZpbGUgYWNjZXNzIHVzaW5nIAo+IGlvX3VyaW5nICh2aWEgbGlidXJp
bmcpLgoKVGhlIGNvbW1pdCB0aXRsZSBjb3VsZCBiZQoKInBhY2thZ2UvbXBkOiBhZGQgaW9fdXJp
bmcgb3B0aW9uYWwgZGVwZW5kZW5jeSIKCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBaaWVn
bGVyIDxicjAxNUB1bWJpa28ubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL21wZC9Db25maWcuaW4gfCAx
MCArKysrKysrKysrCj4gIHBhY2thZ2UvbXBkL21wZC5tayAgICB8ICA3ICsrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bXBkL0NvbmZpZy5pbiBiL3BhY2thZ2UvbXBkL0NvbmZpZy5pbgo+IGluZGV4IGZjMGY0MDk0NDgu
LmM1YTUwODk4ZTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tcGQvQ29uZmlnLmluCj4gKysrIGIv
cGFja2FnZS9tcGQvQ29uZmlnLmluCj4gQEAgLTM0Nyw2ICszNDcsMTYgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX01QRF9BVkFISV9TVVBQT1JUCj4gIGNvbW1lbnQgImF2YWhpIHN1cHBvcnQgbmVlZHMg
YSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5Igo+ICAJZGVwZW5kcyBvbiBCUjJfU1RBVElD
X0xJQlMKPiAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9NUERfSU9fVVJJTkcKPiArCWJvb2wgImlv
X3VyaW5nIgo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV8x
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVVJJTkcKPiArCWhlbHAKPiArCSAgQXN5bmNocm9u
b3VzIEkvTyB1c2luZyBrZXJuZWwgaW9fdXJpbmcgc3Vic3lzdGVtCj4gKwo+ICtjb21tZW50ICJp
b191cmluZyBuZWVkcyBhdCBsZWFzdCBrZXJuZWwgdmVyc2lvbiA1LjEiCgpJdCdzIG5vdCBhIGtl
cm5lbCB2ZXJzaW9uIGRlcGVuZGVuY3kgYnV0IGEgdG9vbGNoYWluIGtlcm5lbCBoZWFkZXJzIGRl
cGVuZGVuY3kuCgpVc3VhbGx5IHdlIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1lbnQgZm9ybWF0OgoK
ImlvX3VyaW5nIHN1cHBvcnQgbmVlZHMgYSB0b29sY2hhaW4gdy8gaGVhZGVycyA+PSA1LjEiCgpS
ZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKPiArCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9M
RUFTVF81XzEKPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9NUERfTElCTVBEQ0xJRU5UCj4gIAli
b29sICJsaWJtcGRjbGllbnQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCTVBEQ0xJRU5UCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXBkL21wZC5tayBiL3BhY2thZ2UvbXBkL21wZC5tawo+IGlu
ZGV4IGE1NWU0YWRkZTIuLmEwY2ViZWRjNjQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tcGQvbXBk
Lm1rCj4gKysrIGIvcGFja2FnZS9tcGQvbXBkLm1rCj4gQEAgLTExOSw2ICsxMTksMTMgQEAgZWxz
ZQo+ICBNUERfQ09ORl9PUFRTICs9IC1EaWQzdGFnPWRpc2FibGVkCj4gIGVuZGlmCj4gIAo+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX01QRF9JT19VUklORykseSkKPiArTVBEX0RFUEVOREVOQ0lFUyAr
PSBsaWJ1cmluZwo+ICtNUERfQ09ORl9PUFRTICs9IC1EaW9fdXJpbmc9ZW5hYmxlZAo+ICtlbHNl
Cj4gK01QRF9DT05GX09QVFMgKz0gLURpb191cmluZz1kaXNhYmxlZAo+ICtlbmRpZgo+ICsKPiAg
aWZlcSAoJChCUjJfUEFDS0FHRV9NUERfSkFDSzIpLHkpCj4gIE1QRF9ERVBFTkRFTkNJRVMgKz0g
amFjazIKPiAgTVBEX0NPTkZfT1BUUyArPSAtRGphY2s9ZW5hYmxlZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
