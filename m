Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE89C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D465661168
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D465661168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84AC76148D;
	Wed, 22 Sep 2021 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPk2i5Ay8Zxo; Wed, 22 Sep 2021 21:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB97605AC;
	Wed, 22 Sep 2021 21:34:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 591441BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 489FA605AC
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUBp3gVE5yXx for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E45C605AA
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:34:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c22so15066730edn.12
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uND9qM4m2G6PpVolO6M2e52ssNTerGXghgZiyXgCLXE=;
 b=e6PVoHTY05olFBboCeFJ1C32I6ghMaOhYNX1kr2O7cZCFRJVz9X1Ovl5rVXSOTFPXy
 g4KOnQIynGahkKQ0Td3f7xQ8K+h+RzPk/DCFYrYr+HFkHeL4Qb7P5J2Yc3QqAsd8B63s
 wxBhdmH7rjmkX6WTe/rMZFhl762eVYcso5TsVpB/78vpHEu+MCeCdAeRJVzTqpARuBrY
 HCSKcW2wT+2XUguI4taNX0D19L8DIWgkZrPcBrfWmrPdYv9dUWyOutDTwHRfVfKkaMVV
 r8BOBlXSNl/lja0oMo93YtcuQ1hj/UrtkRcrnH4i101WoEUHpRR1NfOBv5bNIZ/pgJtx
 BbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uND9qM4m2G6PpVolO6M2e52ssNTerGXghgZiyXgCLXE=;
 b=4jGbvUF0XngJzO4R/eEy3cSFAyYMgs2oKrkdpxX+xbL666U8MKKU9IfXXG1qBujXPR
 ffTnWSxWulQhMLUgOSk2qJYrceAtXQu90I+qRa2OUS8d4tMRjI99RWsaUVsWc2vxGljx
 MWcLfkmgpxvwRIn6laA5Sq6C/igcu0tIMX1DjE1sNj5zjVNF4IDPU/xBJFJxHaWfcbNT
 Wekeuvluz8bve2ARrpFOkMz69oC/1uVTiX2CzPgIlC8Bvmp28kHPnvo5wwsnrCKEu93Z
 zHS/Bg8bPjPJCXxHbc/MKCVU5wSPlc6hGA5LG5ZAKeWPa3y5ds0pLSPmHwH0tb1XR1P5
 tuBA==
X-Gm-Message-State: AOAM532xMNTSbfupV1ONEEkZKdunVp2GQhrXf7dSLO7C8aTCznJIuEW5
 82JLh/8GHl1jOs+TBPByxEP8F2j05WMQ0g==
X-Google-Smtp-Source: ABdhPJynoJTmeVOxleOzaaTR30xaQzLY54xlVOb1SqgquD2wwfUPEZ2QiWcvdqwhDKJoKppMaO24Pw==
X-Received: by 2002:a05:6402:54:: with SMTP id
 f20mr1775996edu.382.1632346438414; 
 Wed, 22 Sep 2021 14:33:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m15sm1634238ejx.73.2021.09.22.14.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:33:58 -0700 (PDT)
Message-ID: <12c37043-7099-cba8-3394-48501f377502@mind.be>
Date: Wed, 22 Sep 2021 23:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org, Baruch Siach <baruch@tkos.co.il>
References: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH v3] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAxNS8wOS8yMDIxIDE1OjA2LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggd2lsbCBhZGQgYW4gaW5pdCBzY3JpcHQgdGhhdCBhbGxvd3MKPiB0byBzZXQgYSBydWxlc2V0
IGluIC9ldGMvaXB0YWJsZXMuY29uZiB0byBiZSBsb2FkZWQKPiBvbiBib290LCBvciBmbHVzaGVk
IG9uIHN0b3AsIGFzIHdlbGwgYXMgYSBzYXZpbmcKPiBjb21tYW5kIHRvIGdlbmVyYXRlIGEgbmV3
IGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJp
bmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gW3YxIC0+IHYyXSBzL3RvdWNoICQoREVTVERJUikvdG91
Y2ggJChUQVJHRVRfRElSKS8KPiBbdjIgLT4gdjNdIEV4ZWN1dGUgYmVmb3JlIG5ldHdvcmtpbmcg
c2NyaXB0LCBoYW5kbGUgcm8gcm9vdGZzCj4gCj4gICBwYWNrYWdlL2lwdGFibGVzL1MzNWlwdGFi
bGVzIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBwYWNrYWdl
L2lwdGFibGVzL2lwdGFibGVzLm1rIHwgIDYgKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2OCBp
bnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pcHRhYmxlcy9TMzVp
cHRhYmxlcwo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lwdGFibGVzL1MzNWlwdGFibGVzIGIv
cGFja2FnZS9pcHRhYmxlcy9TMzVpcHRhYmxlcwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNjAyMzI5NzIzNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2lwdGFibGVzL1MzNWlwdGFibGVzCj4gQEAgLTAsMCArMSw2MiBAQAo+ICsjIS9iaW4vc2gKPiAr
Cj4gK0RBRU1PTj0iaXB0YWJsZXMiCj4gKwo+ICtJUFRBQkxFU19BUkdTPSIiCj4gKwo+ICtzdGFy
dCgpIHsKPiArCXByaW50ZiAnU3RhcnRpbmcgJXM6ICcgIiREQUVNT04iCj4gKwlpcHRhYmxlcy1y
ZXN0b3JlIDwgL2V0Yy9pcHRhYmxlcy5jb25mCj4gKwlzdGF0dXM9JD8KPiArCWlmIFsgIiRzdGF0
dXMiIC1lcSAwIF07IHRoZW4KPiArCQllY2hvICJPSyIKPiArCWVsc2UKPiArCQllY2hvICJGQUlM
Igo+ICsJZmkKPiArCXJldHVybiAiJHN0YXR1cyIKPiArfQo+ICsKPiArc3RvcCgpIHsKPiArCXBy
aW50ZiAnU3RvcHBpbmcgJXM6ICcgIiREQUVNT04iCj4gKwlpcHRhYmxlcyAtRgo+ICsJc3RhdHVz
PSQ/Cj4gKwlpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4gKwkJZWNobyAiT0siCj4gKwll
bHNlCj4gKwkJZWNobyAiRkFJTCIKPiArCWZpCj4gKwlyZXR1cm4gIiRzdGF0dXMiCj4gK30KPiAr
Cj4gK3Jlc3RhcnQoKSB7Cj4gKwlzdG9wCj4gKwlzbGVlcCAxCj4gKwlzdGFydAo+ICt9Cj4gKwo+
ICtzYXZlKCkgewo+ICsJcHJpbnRmICdTYXZpbmcgJXM6ICcgIiREQUVNT04iCj4gKwlpZiBpcHRh
Ymxlcy1zYXZlID4gL2V0Yy9pcHRhYmxlcy5jb25mOyB0aGVuCj4gKwkJc3RhdHVzPSQ/Cj4gKwkJ
aWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhlbgoKICBUaGlzIG1ha2VzIG5vIHNlbnNlIC0gaWYg
eW91IGVudGVyIHRoZSBpZiBicmFuY2gsIHRoZW4gc3RhdHVzIGlzIGJ5IGRlZmluaXRpb24gCjAu
Li4KCiAgU2luY2UgaXQncyBub3QgdGVycmlibHkgaW1wb3J0YW50IElNSE8gKEkgZG9uJ3QgdGhp
bmsgdGhlIGNvbXBsZXhpdHkgb2YgdGhlIApTMjB1cmFuZG9tIHN0dWZmIGlzIHJlYWxseSB3YXJy
YW50ZWQsIHNpbmNlICdzYXZlJyBpcyBqdXN0IGEgbWFudWFsIG9wZXJhdGlvbiksIApJIGZpeGVk
IGl0IHVwIHNvIGl0IGp1c3QgcHJpbnRzIE9LIGluIHRoZSBpZiBicmFuY2ggYW5kIFNLSVAgaW4g
dGhlIGVsc2UgYnJhbmNoLgoKICBCYXJ1Y2gsIGFueSBvYmplY3Rpb25zPwoKCiAgQlRXLCBJIGhh
dmUgbm8gcHJvYmxlbSB3aXRoIHRoaXMgaW4gdGhlIGRlZmF1bHQgaW5zdGFsbGF0aW9uLCBiZWNh
dXNlIGJ5IApkZWZhdWx0IGl0IGRvZXNuJ3QgZG8gYW55dGhpbmcgKGlwdGFibGVzLmNvbmYgaXMg
YW4gZW1wdHkgZmlsZSkuIFBlcnNvbmFsbHkgSSdkIApoYXZlIGltcGxlbWVudGVkIGl0IGJ5IHRl
c3RpbmcgaWYgaXQgZXhpc3RzIGluIHRoZSBpbml0IHNjcmlwdCwgYnV0IHRoYXQncyAKcmVhbGx5
IGJpa2VzaGVkZGluZy4KCiAgVGh1cywgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVn
YXJkcywKICBBcm5vdXQKCj4gKwkJCWVjaG8gIk9LIgo+ICsJCWVsc2UKPiArCQkJZWNobyAiRkFJ
TCIKPiArCQlmaQo+ICsJZWxzZQo+ICsJCXN0YXR1cz0kPwo+ICsJCWVjaG8gIlNLSVAgKHJlYWQt
b25seSBmaWxlIHN5c3RlbSBkZXRlY3RlZCkiCj4gKwlmaQo+ICsJcmV0dXJuICIkc3RhdHVzIgo+
ICt9Cj4gKwo+ICtjYXNlICIkMSIgaW4KPiArCXN0YXJ0fHN0b3B8cmVzdGFydHxzYXZlKQo+ICsJ
CSIkMSI7Owo+ICsJcmVsb2FkKQo+ICsJCSMgUmVzdGFydCwgc2luY2UgdGhlcmUgaXMgbm8gdHJ1
ZSAicmVsb2FkIiBmZWF0dXJlLgo+ICsJCXJlc3RhcnQ7Owo+ICsJKikKPiArCQllY2hvICJVc2Fn
ZTogJDAge3N0YXJ0fHN0b3B8cmVzdGFydHxyZWxvYWR9Igo+ICsJCWV4aXQgMQo+ICtlc2FjCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsgYi9wYWNrYWdlL2lwdGFi
bGVzL2lwdGFibGVzLm1rCj4gaW5kZXggZGMwMTQ2NjYwNy4uZjBkZGNhOGY5YSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1rCj4gKysrIGIvcGFja2FnZS9pcHRhYmxl
cy9pcHRhYmxlcy5tawo+IEBAIC01Nyw0ICs1NywxMCBAQCBkZWZpbmUgSVBUQUJMRVNfTElOVVhf
Q09ORklHX0ZJWFVQUwo+ICAgCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05FVEZJ
TFRFUl9YVEFCTEVTKQo+ICAgZW5kZWYKPiAgIAo+ICtkZWZpbmUgSVBUQUJMRVNfSU5TVEFMTF9J
TklUX1NZU1YKPiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCBwYWNrYWdlL2lwdGFibGVzL1MzNWlw
dGFibGVzIFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzM1aXB0YWJsZXMKPiArCXRv
dWNoICQoVEFSR0VUX0RJUikvZXRjL2lwdGFibGVzLmNvbmYKPiArZW5kZWYKPiArCj4gICAkKGV2
YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3Rz
LmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
