Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5179ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 17:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E275B41910;
	Sun, 18 Sep 2022 17:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E275B41910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyEGWR_45d-Z; Sun, 18 Sep 2022 17:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A069A418F9;
	Sun, 18 Sep 2022 17:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A069A418F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42331BF2CD
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 17:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A959C40A38
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 17:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A959C40A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aap71fOGpRgC for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 17:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A9D40989
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A9D40989
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 17:08:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e17so38112345edc.5
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=a8A8CJMQxFxI9aQN/NlA9/MoFTWiW7O+Gb1nKca6tkw=;
 b=CJNmvuOIRiaydMATE71VW4S51o0EDGR+I1H15zMJxX6xtUAf9ylDgkbL6dxoryxP8h
 HM8ykF0dsDhoyWEDI21Br0O7ZYkzzwQkCkZGwOjtlB5H3c8cccrdcYnaXkd1LbPz6VHs
 VUEH5oVS/ZgNR93VYaxfp1dsNJwcNaeeuOhToUVZFDygDlrcqDGuZhGcWNfkBz2zzB4V
 nyNCkEvq5cNibjG7k5be/UUq9O8W1lMRR4LAijJXkQgMqlOcCZ9M9kjTGY/77ovD9pOG
 VI3l6R+X8EHyrsqQjy6ZfT/wf679CgnQ2GF2JdvKgb1AfjGEMR6GX66J3TeSmnNa3qBq
 qLVw==
X-Gm-Message-State: ACrzQf2uZUa2b2hvotfPGy3N0LG0P0yMg66pkumzX9iDwzHYe5vnttNC
 jEmBiz0tlTp8tfj0xrjmJZLLybiXX7ff/ZOz
X-Google-Smtp-Source: AMsMyM76NZnCpC8WzYD+biuC9FPyRCoPiKtVRjPywQnLux7Ik7e28axTcw/vJKWi9qOy+SFCoIQnJQ==
X-Received: by 2002:a05:6402:2547:b0:450:668c:9d93 with SMTP id
 l7-20020a056402254700b00450668c9d93mr12478967edb.92.1663520926411; 
 Sun, 18 Sep 2022 10:08:46 -0700 (PDT)
Received: from [192.168.43.18] ([109.139.7.201])
 by smtp.gmail.com with ESMTPSA id
 m22-20020aa7c496000000b0044f1bd0fbd1sm18519016edq.34.2022.09.18.10.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 10:08:45 -0700 (PDT)
Message-ID: <40186ef5-cda9-6dcb-13ac-c6b2824374e8@mind.be>
Date: Sun, 18 Sep 2022 19:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>,
 buildroot@buildroot.org
References: <CAEXMXLSha38Ybck+-p9Tnx4cQqPJbXfFQ17qFMDTrpvjh_tEeA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CAEXMXLSha38Ybck+-p9Tnx4cQqPJbXfFQ17qFMDTrpvjh_tEeA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=a8A8CJMQxFxI9aQN/NlA9/MoFTWiW7O+Gb1nKca6tkw=;
 b=HmDKZ44g6SGhtYSl5QbY+RkQ5EYsz7BDmUevwC9SLk+6/X/L4elVg+I9zYneEQys0D
 M6US1XdDzCSY/X8Ql3/PkekMuqck6vY8iSIkBmS9l6HqVBK5gJeB/PU7pouUqigBmbsY
 3YouWxALJiW7v+Mj42cgNegSE0H+97zenZtLEKKzgju5K5j52PGUwgVrslazFxolid8q
 ZUsasJur+sNqDteQPkdvXiXYaiXqyHo7ho7VxlkdkUZToF0wBib3CCUUg9srbllOf2pG
 wZYHOGv+wAzh3mDy5+aqzL0Zb1pBSyhMJwNuk+YMBazZvd0D25+s6MeRb5XYd7Vq7o2D
 ahag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HmDKZ44g
Subject: Re: [Buildroot] [PATC] package/google-breakpad: add option to build
 target tools
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBOdW5vLAoKICBBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHNvbWUgY2hhbmdlcywgc2VlIGJl
bG93LgoKT24gMDUvMDUvMjAyMiAwMDoyMSwgTnVubyBHb27Dp2FsdmVzIHdyb3RlOgo+IFRoaXMg
dG9vbHMgYXJlIHJlcXVpcmVkIGZvciBkZWJ1ZyBzY2VuYXJpb3Mgd2hlcmUgdGhlIGRlYnVnCj4g
aGFwcGVucyBpbi10YXJnZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxu
dW5vanBnQGdtYWlsLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZp
Zy5pbiAgICAgICAgICB8IDEyICsrKysrKysrKysrKwo+ICAgcGFja2FnZS9nb29nbGUtYnJlYWtw
YWQvZ29vZ2xlLWJyZWFrcGFkLm1rIHwgIDUgKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dv
b2dsZS1icmVha3BhZC9Db25maWcuaW4KPiBiL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZp
Zy5pbgo+IGluZGV4IDA3YzQ5OTk2ZGQuLjBjYjg4MWE0YzkgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9nb29nbGUtYnJlYWtwYWQvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtw
YWQvQ29uZmlnLmluCj4gQEAgLTM0LDYgKzM0LDE4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HT09H
TEVfQlJFQUtQQUQKPiAKPiAgICAgIGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9i
cmVha3BhZC9icmVha3BhZAo+IAo+ICtpZiBCUjJfUEFDS0FHRV9HT09HTEVfQlJFQUtQQUQKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX0dPT0dMRV9CUkVBS1BBRF9UT09MUwo+ICsgYm9vbCAiQnVpbGQg
dGFyZ2V0IHRvb2xzIgo+ICsgaGVscAo+ICsgICAgQnVpbGQgcHJvY2Vzc29yIGFuZCB0b29scyBm
b3IgdGFyZ2V0IGFzIGR1bXBfc3ltcywgbWluaWR1bXBfc3RhY2t3YWxrCj4gKyAgICBhbmQgbWlj
cm9kdW1wX3N0YWNrd2Fsay4KCiAgVGhlIGxpbmUgaXMgdG9vIGxvbmcsIHVzZSB1dGlscy9jaGVj
ay1wYWNrYWdlIHRvIHZlcmlmeSB5b3VyIHBhdGNoIGJlZm9yZSBzZW5kaW5nLgoKPiArCj4gKyAg
ICBUaGlzIHRvb2xzIGFyZSBpbnN0YWxsZWQgdG8gdGhlIHN0YWdpbmcgZm9sZGVyIG9ubHksIHNv
IG5vdCBwYXJ0IG9mCj4gKyAgICB0aGUgdGFyZ2V0IGltYWdlIGJ5IGRlZmF1bHQuCgogIFdoYXQn
cyBub3QgZ29vZC4gSW4gZmFjdCwgd2UgcHJvYmFibHkgd2FudCB0byBhbHdheXMgYnVpbGQgdGhl
IHRvb2xzLCBhbmQgb25seSAKaW5zdGFsbCB0aGVtIHRvIHRhcmdldCBpbiBjYXNlIHRoZSBvcHRp
b24gaXMgc2VsZWN0ZWQuIHNvIHRoYXQncyB3aGF0IEkndmUgZG9uZS4KCj4gKwo+ICtlbmRpZiAj
IEJSMl9QQUNLQUdFX0dPT0dMRV9CUkVBS1BBRAo+ICsKPiAgIGNvbW1lbnQgImdvb2dsZS1icmVh
a3BhZCByZXF1aXJlcyBhIGdsaWJjIG9yIHVDbGliYyB0b29sY2hhaW4gdy8KPiB3Y2hhciwgdGhy
ZWFkLCBDKyssIGdjYyA+PSA0LjgiCj4gICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9HT09HTEVf
QlJFQUtQQURfQVJDSF9TVVBQT1JUUwo+ICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9H
T09HTEVfQlJFQUtQQURfQVJDSF9TVVBQT1JUUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dvb2ds
ZS1icmVha3BhZC9nb29nbGUtYnJlYWtwYWQubWsKPiBiL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFk
L2dvb2dsZS1icmVha3BhZC5tawo+IGluZGV4IGNhZmUxMzU5ZjMuLmRjNDE3ZjQ2MzcgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLm1rCj4gKysr
IGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLm1rCj4gQEAgLTcsNyAr
Nyw2IEBACj4gICBHT09HTEVfQlJFQUtQQURfVkVSU0lPTiA9IGM4NWViNGE1OWI2MThmM2JlYWFk
NTQ0NWNlYjFmODY1ZmZhOGVmZGYKPiAgIEdPT0dMRV9CUkVBS1BBRF9TSVRFID0gaHR0cHM6Ly9j
aHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2JyZWFrcGFkL2JyZWFrcGFkCj4gICBHT09HTEVfQlJF
QUtQQURfU0lURV9NRVRIT0QgPSBnaXQKPiAtR09PR0xFX0JSRUFLUEFEX0NPTkZfT1BUUyA9IC0t
ZGlzYWJsZS1wcm9jZXNzb3IgLS1kaXNhYmxlLXRvb2xzCgogIFNvIHRoaXMgY2FuIGp1c3QgYmUg
cmVtb3ZlZCB1bmNvbmRpdGlvbmFsbHkuCgo+ICAgIyBPbmx5IGEgc3RhdGljIGxpYnJhcnkgaXMg
aW5zdGFsbGVkCj4gICBHT09HTEVfQlJFQUtQQURfSU5TVEFMTF9UQVJHRVQgPSBOTwoKICBJbnN0
ZWFkLCB0aGlzIHNob3VsZCBiZSBkb25lIGNvbmRpdGlvbmFsbHkuCgoKICBSZWdhcmRzLAogIEFy
bm91dAoKCj4gICBHT09HTEVfQlJFQUtQQURfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gQEAgLTM4
LDUgKzM3LDkgQEAgZGVmaW5lIEdPT0dMRV9CUkVBS1BBRF9FWFRSQUNUX1NZTUJPTFMKPiAgIGVu
ZGVmCj4gICBHT09HTEVfQlJFQUtQQURfVEFSR0VUX0ZJTkFMSVpFX0hPT0tTICs9IEdPT0dMRV9C
UkVBS1BBRF9FWFRSQUNUX1NZTUJPTFMKPiAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9HT09HTEVf
QlJFQUtQQURfVE9PTFMpLCkKPiArR09PR0xFX0JSRUFLUEFEX0NPTkZfT1BUUyA9IC0tZGlzYWJs
ZS1wcm9jZXNzb3IgLS1kaXNhYmxlLXRvb2xzCj4gK2VuZGlmCj4gKwo+ICAgJChldmFsICQoYXV0
b3Rvb2xzLXBhY2thZ2UpKQo+ICAgJChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
