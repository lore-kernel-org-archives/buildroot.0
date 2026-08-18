Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB9C5DF70
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 10:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA72480EB1;
	Tue, 18 Aug 2026 10:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zR5REb25kzEZ; Tue, 18 Aug 2026 10:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBBB80E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787047425;
	bh=/zcCUZATr1/Ba0n533pBnLu7CWvNK7L3JfsfNZybbDQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ngwj2hdk0plYmvCzH0BqiPGKY33ZQu5Sk2zzWX+XYAMiJczep1yrzeUAYzk9w3/Rg
	 SJFGPyIu9Ey1WvqAnN2Q++pBWN0MjoHlkd/+frdUWwawpKlaj9zFqU7vZLsZCM4qlB
	 vn5alEc7of4JOfYjHPAFqMLDXfZBI7IFmo1HrVmLTKc+FfPpn1n16BKh+EYuWs+wVB
	 PxrYtimrL6C2Vnep37tjG/u2DhmNfZI2KrQ9gLVh44jJMxgXl4QTWvjB49WLgSaj+M
	 XItv5Wv696984m2Ck+Kb6xRkeiPM2VwFhVBbhL81YpF8vWCRum+lB2YWPFGQZnDCuk
	 yptweTwVE80sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BBBB80E84;
	Tue, 18 Aug 2026 10:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0725C333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 10:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0B240070
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 10:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbLZzAC9he0Z for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 10:03:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF41A40050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF41A40050
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF41A40050
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 10:03:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4956869750eso29749895e9.2
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 03:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787047420; x=1787652220;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hXlH54sASTR3INE+BTfexdfzsJlsivdsop20V4Olz5s=;
 b=CCJRhvBa7FnkFttasYQsVKyRfJRFNRVIjiytFH9IeKOwr36nhgGZ5i0O+5aKXhOE38
 LkNC92JHXbzEHgIBmpnhYQf+7SaZ76F1qxSsvm3/zHEgw9g0zHWHpFz499syNKk3YQRQ
 09JmRpJwMZUhXxW8ktfvMSBgCmk2fNpFpJHtcQjhCQ+EqXuyuBZaHWhlyAl1R9LN8Q+L
 uYrKYESEfm0cQ2pWPuz7WUY4Wr8hHKnFoC2jcI1aGvrz7roeMvn7AY0NoDNgUjoIIERp
 NBb3OsZrqgRuzJHfOyFxs1Hx9+/Yycnk+0aPco0TmD127y7XnQwVfZulxG0scesX09t9
 VKXw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqp3PchHcThu6JxVaBwbivNp0FfBtXH2GejCAp8Nf9zKW8Srno5W5yfkYmKPB9jeXNHducaFW5njV4=@buildroot.org
X-Gm-Message-State: AOJu0YzzP17gEDH/uMhA8pvWcVtmLAWDAiJ7pY3daPf9WUCKdH2a2Rd4
 0l7JSLgsHnYBCI7FCEKPFUW3Nc6rxL/vETPdIG/a8VgXrcoeP6L3CN+YCBe0oQvXHGs=
X-Gm-Gg: AR+sD10URRlRZ99cVsm4UiUlsHPLe2ekuwZpvm6D2VNKDOCzo7yYP+BXEJNnDrZ4Jsr
 96gxjrh9cWCEgleKnR86GI8yrjpCM5vs8kfJfJlbAvYnUX1dGkSOooCkqK55PKOEzjy2Z2J3S1M
 iU6E3VwGlhBEVTjuTfeOBeX3+iVXIwlficDheCGco8Un56MKOZ4dfeJoNJOmI4au82plWADm5LE
 HEW4s5xpWr2RD7bqgRoJRndNzmaO5hqVH+vq164XBw92vTKgGJf3Un3eCruAsbd6n1uf+871O91
 eR82TFp2vVgFYctNCWHj8mupO+v1bKlJDSes/LY9mzbINd0eh6FwpeKg5krf2995ltzckR7b/1T
 +Z4pTolMHkOuD3VDHUiEnxjjmC5xcz4rxZmYT0dRk/oCnA4oSXdneQxM6WFZXj3T788Oa90uwHy
 OwPtJmn2n8ZA1rzDKL3m8/90hqtQI9NaVesnCcbgD2/Dgrt/+sGpfFQFeTu8Mj96qATkZoglUki
 Yp+BuJbEQ==
X-Received: by 2002:a05:600c:5299:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-4998d7aeb77mr428008055e9.2.1787047420075; 
 Tue, 18 Aug 2026 03:03:40 -0700 (PDT)
Received: from [192.168.178.32] ([213.219.175.240])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777caebsm335160875e9.0.2026.08.18.03.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:03:39 -0700 (PDT)
Message-ID: <0a73e729-46f6-48bd-844d-79b5afe05e47@mind.be>
Date: Tue, 18 Aug 2026 12:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?= <buildroot@buildroot.org>
Cc: Bernd Kuhls <bernd@kuhls.net>, Maxim Kochetkov <fido_max@inbox.ru>
References: <20260818082809.952856-1-raphael.melotte@mind.be>
 <87wltnvlb5.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87wltnvlb5.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.11
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiA4LzE4LzI2IDExOjE4IEFNLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4g
Cj4gICA+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLXNvbm5ldC01Cj4gCj4gV2UgZG9uJ3Qg
cmVhbGx5IHVzZSBhc3Npc3RlZC1ieSB0YWdzIGluIEJ1aWxkcm9vdC4gRGlkIHlvdSByZWFsbHkg
cmVhY2gKPiBvdXQgdG8gYSBMTE0gdG8gY2hhbmdlIGEgMTAgdG8gYW4gMTE/Cj4gCgpBIGJpdCBt
b3JlIHRoYW4gdGhhdCBidXQgeWVzLCBJIHVzZWQgaXQgdG86Ci0gQnVtcCB0aGUgcGFja2FnZSB2
ZXJzaW9uCi0gRmV0Y2ggdGhlIG5ldyB0YXJiYWxsIGhhc2gKLSBEb3dubG9hZCB0aGUgbmV3IHRh
cmJhbGwKLSBDaGVjayBmb3IgY2hhbmdlcyBpbiB0aGUgY29weXJpZ2h0IGZpbGUKLSBHZW5lcmF0
ZSB0aGUgY29tbWl0IHRpdGxlCi0gQnVpbGQgdGhlIGxpc3Qgb2YgQ1ZFcyBmaXhlZCBpbiB0aGlz
IHJlbGVhc2UgYmFzZWQgb24gdGhlIHJlbGVhc2Ugbm90ZXMKLSBHZW5lcmF0ZSB0aGUgY29tbWl0
IG1lc3NhZ2UgZnJvbSB0aGUgbGlzdAoKRXZlbiB0aG91Z2ggaXQncyBub3QgYSBkYXVudGluZyB0
YXNrLCBpbiB0aGlzIGNhc2UgYnVpbGRpbmcgdGhlIGxpc3Qgb2YgQ1ZFcyBpcyBwcm9iYWJseSB0
aGUgb25lIHRoYXQncyB0aGUgaGFyZGVzdCB0byBkbyBpbiBhIGdlbmVyaWMgd2F5LgpUaGUgQ1ZF
cyBhcmUgbWVudGlvbmVkIGluIHRoZSByZWxlYXNlIG5vdGVzIChbMV0pIGJ1dCB0aGV5IGFyZSBz
Y2F0dGVyZWQgYWNyb3NzIHRoZSB0ZXh0IHdoaWNoIG1lYW5zLCBzaG9ydCBvZiBjb3B5LXBhc3Rp
bmcgdGhlbSBvbmUgYnkgb25lLCBhIGJpdCBvZiBzY3JpcHRpbmcgc3BlY2lmaWMgdG8gdGhpcyBw
YWdlIGlzIG5lZWRlZCB0byByZXRyaWV2ZSB0aGVtIGFsbC4KVGhleSBhcmUgYWxzbyBhdmFpbGFi
bGUgZnJvbSBhIG5ld3MgcG9zdCBpbiBhIHdheSB0aGF0J3MgZWFzaWVyIHRvIHVzZSAoWzJdKSwg
YnV0IGZyb20gdGhhdCBwb3N0IEkgZG9uJ3QgZmluZCBpdCBpbW1lZGlhdGVseSBjbGVhciB3aGV0
aGVyIGFsbCAyOCBDVkVzIGFmZmVjdGVkIGVhY2ggcmVsZWFzZSBtZW50aW9uZWQsIG9yIG9ubHkg
c29tZSBvZiB0aGVtLgoKU28gSSB3YW50ZWQgdG8gc2VlIGlmIENsYXVkZSBjb3VsZCBoZWxwIG1l
IGluIHRoaXMgY2FzZSBhbmQgaXQgZGlkLgpPZiBjb3Vyc2UgSSBzdGlsbCBoYW5kLWNoZWNrZWQg
dGhlIHJlc3VsdCwgYXMgSSB3b3VsZCBkbyByZWdhcmRsZXNzIG9mIGhvdyB0aGUgY2hhbmdlIHdh
cyBwcm9kdWNlZC4KClNpbmNlIEkgdXNlZCBhbiBMTE0gdG8gaGVscCBtZSwgSSBwcmVmZXJyZWQg
dG8gbWFrZSBpdCBleHBsaWNpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCkkgY291bGQgbWVudGlv
biBpdCBpbiBhIGZyZWUtZm9ybSBpbnN0ZWFkIG9mIHVzaW5nIGEgdGFnLCBidXQgc2luY2UgdGhp
cyB0YWcgZXhpc3RzIGVsc2V3aGVyZSBJIHRob3VnaHQgd2h5IG5vdCB1c2UgaXQgaW5zdGVhZC4K
CgpLaW5kIHJlZ2FyZHMsCgpSYXBoYcOrbAoKWzFdOiBodHRwczovL3d3dy5wb3N0Z3Jlc3FsLm9y
Zy9kb2NzL3JlbGVhc2UvMTcuMTEvClsyXTogaHR0cHM6Ly93d3cucG9zdGdyZXNxbC5vcmcvYWJv
dXQvbmV3cy9wb3N0Z3Jlc3FsLTE4Ni0xNzExLTE2MTUtMTUxOS0xNDI0LWFuZC0xOS1iZXRhLTMt
cmVsZWFzZWQtMzM2NS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
