Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CC4EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB38405ED;
	Mon, 19 Jun 2023 19:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB38405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPDQq0lM6VDr; Mon, 19 Jun 2023 19:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 019FE403F8;
	Mon, 19 Jun 2023 19:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 019FE403F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9CD21BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A16D84096E
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16D84096E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySjlFlbIUADC for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:45:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740EE4096B
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 740EE4096B
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:45:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-988c495f35fso146539566b.1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687203901; x=1689795901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hntOjs+mnv9nW3+zL++x0ZJJ2sfCiWTI36GpJlqO04s=;
 b=SRzDjkb4uYP1F2lLvtk1rH1ossh5qhuDEym2N+39HJLR0pY3G0hp56Py7V7ql/eJjG
 uCvfvsORp9QXPXAosI5u9PclGbWJg5E8t3aEOir9D9Y6mvHdkv6kUjqemofnX4kqOENC
 dVWKzRr2dao6HXUuiNebbr6QfnLNuYKuypT3SRI9yGLymx6A1n6FFcxtSFkQtNdynBcZ
 o+gJP6zgabh8UnhU7H3rK4DNPvz+wZL0YQCyobq+DqeyH7A25fGWvLMZ4+Fcr+DtGz8R
 AzPqplHI7BNfp6IyyFBDRXINJifXlzvNHCSiwmvYXj49Hd+TCqlRjUSSzMjdtckoxB8j
 HspA==
X-Gm-Message-State: AC+VfDwPeGdmfGAjXTp10iBKuZgY6two1ELusLw9W46ps/z5+uArQBKP
 9fzn4NCWDlM7cmkygV3MXFzowp/1YpOaaBQGgBQ=
X-Google-Smtp-Source: ACHHUZ7V0HYQBuHHdoBtcpwK74gvdlylaNAJwFVf992zFENBMurZaky2woEl3L5C79Y2qj6lYlABvw==
X-Received: by 2002:a17:907:843:b0:982:84c9:96c5 with SMTP id
 ww3-20020a170907084300b0098284c996c5mr10243010ejb.60.1687203901604; 
 Mon, 19 Jun 2023 12:45:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a1709061d1300b00982a352f078sm113036ejh.124.2023.06.19.12.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 12:45:00 -0700 (PDT)
Message-ID: <211dea2d-a959-03e5-902d-a8008ca1a434@mind.be>
Date: Mon, 19 Jun 2023 21:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-2-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-2-laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687203901; x=1689795901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hntOjs+mnv9nW3+zL++x0ZJJ2sfCiWTI36GpJlqO04s=;
 b=Y69L+3D4hUPqnoD34uR5B02KTJkATSuvkSnaIE3e+E3YxlbwhGzFPrZvmOgqV/fnAm
 upodoKpoolOxXotZvwLNVhYa0Kh4TDhR3p7CLeex6wkFbDT2X9NdS0Ms3H4dgkLGLsJY
 PYFsVRccgMN7Zj2Lj2DcvAZYQKtFOx+FYj5EQZmvzVQjqNtSbqzK6WxhGsmHBUikndI1
 Y3Cy55jWGeDYXYlbR6r1QRZNn+EA/vuNCDA5lDlKDzshy5vAjPZ1a11TKft7t0Uu7kf4
 n7mwhtfgayuoNVNGAPX2DqTpn7iaYYn9Rjb+gRYqsUC9lqSmZkgUSv+CtCjSZaDKab56
 iisw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y69L+3D4
Subject: Re: [Buildroot] [PATCH v14 1/4] petitboot: add pb-discover daemon
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wNi8yMDIzIDEyOjUwLCBMYXVyZW50IFZpdmllciB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4gUmV2aWV3ZWQtYnk6IEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gICBwYWNrYWdlL3BldGl0Ym9v
dC9TMTVwYi1kaXNjb3ZlciB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
ICBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgICB8ICA0ICsrKwo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9w
ZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJv
b3QvUzE1cGItZGlzY292ZXIgYi9wYWNrYWdlL3BldGl0Ym9vdC9TMTVwYi1kaXNjb3Zlcgo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44MzMwNWVkOWVhOGEKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKPiBA
QCAtMCwwICsxLDU0IEBACj4gKyMhL2Jpbi9zaAo+ICsKPiArREFFTU9OPSJwYi1kaXNjb3ZlciIK
PiArUElERklMRT0iL3Zhci9ydW4vJERBRU1PTi5waWQiCj4gK0xPR0ZJTEU9Ii92YXIvbG9nLyRE
QUVNT04ubG9nIgo+ICsKPiArUEJfRElTQ09WRVJfQVJHUz0iLWwgJExPR0ZJTEUiCgogIEkgaGF2
ZSBhZGRlZCB0aGUgZm9sbG93aW5nIGhlcmU6CgpbIC1yICIvZXRjL2RlZmF1bHQvJERBRU1PTiIg
XSAmJiAuICIvZXRjL2RlZmF1bHQvJERBRU1PTiIKCiAgSWYgZm9yIHNvbWUgcmVhc29uIHRoYXQn
cyBub3QgYXBwcm9wcmlhdGUsIHBsZWFzZSBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIHRoYXQgCnJl
bW92ZXMgaXQgYWdhaW4uCgo+ICsKPiAraWYgWyAiJChwYi1jb25maWcgZGVidWcpIiA9ICJlbmFi
bGVkIiBdIDsgdGhlbgo+ICsJUEJfRElTQ09WRVJfQVJHUz0iJFBCX0RJU0NPVkVSX0FSR1MgLS12
ZXJib3NlIgoKICBOb3RlIHRoYXQgdGhlIHNvdXJjaW5nIG9mIHRoZSBkZWZhdWx0IGZpbGUgY29t
ZXMgYmVmb3JlIHRoaXMuIEkgdGhpbmsgdGhhdCdzIAphcHByb3ByaWF0ZS4KCiAgQXBwbGllZCB0
byBtYXN0ZXIgd2l0aCB0aGF0IGNoYW5nZSwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiArZmkKPiArCj4gK3N0YXJ0KCkgewo+ICsJcHJpbnRmICdTdGFydGluZyAlczogJyAiJERBRU1P
TiIKPiArCSMgc2hlbGxjaGVjayBkaXNhYmxlPVNDMjA4NiAjIHdlIG5lZWQgdGhlIHdvcmQgc3Bs
aXR0aW5nCj4gKwlzdGFydC1zdG9wLWRhZW1vbiAtUyAtcSAtYiAtcCAiJFBJREZJTEUiIC14ICIv
dXNyL3NiaW4vJERBRU1PTiIgXAo+ICsJCS0tICRQQl9ESVNDT1ZFUl9BUkdTCj4gKwlzdGF0dXM9
JD8KPiArCWlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KPiArCQllY2hvICJPSyIKPiArCWVs
c2UKPiArCQllY2hvICJGQUlMIgo+ICsJZmkKPiArCXJldHVybiAiJHN0YXR1cyIKPiArfQo+ICsK
PiArc3RvcCgpIHsKPiArCXByaW50ZiAnU3RvcHBpbmcgJXM6ICcgIiREQUVNT04iCj4gKwlzdGFy
dC1zdG9wLWRhZW1vbiAtSyAtcSAtcCAiJFBJREZJTEUiCj4gKwlzdGF0dXM9JD8KPiArCWlmIFsg
IiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KPiArCQllY2hvICJPSyIKPiArCWVsc2UKPiArCQllY2hv
ICJGQUlMIgo+ICsJZmkKPiArCXJldHVybiAiJHN0YXR1cyIKPiArfQo+ICsKPiArcmVzdGFydCgp
IHsKPiArCXN0b3AKPiArCXNsZWVwIDEKPiArCXN0YXJ0Cj4gK30KPiArCj4gK2Nhc2UgIiQxIiBp
bgo+ICsJc3RhcnR8c3RvcHxyZXN0YXJ0KQo+ICsJCSIkMSI7Owo+ICsJcmVsb2FkKQo+ICsJCXJl
c3RhcnQ7Owo+ICsJKikKPiArCQllY2hvICJVc2FnZTogJDAge3N0YXJ0fHN0b3B8cmVzdGFydHxy
ZWxvYWR9Igo+ICsJCWV4aXQgMQo+ICsJCTs7Cj4gK2VzYWMKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1r
Cj4gaW5kZXggYTc5OGU3Y2E2MTRmLi40ZDU2YjczOTM4ZTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRi
b290Lm1rCj4gQEAgLTUzLDYgKzUzLDEwIEBAIGRlZmluZSBQRVRJVEJPT1RfUE9TVF9JTlNUQUxM
Cj4gICAJCSQoVEFSR0VUX0RJUikvZXRjL3BldGl0Ym9vdC9ib290LmQvMDEtY3JlYXRlLWRlZmF1
bHQtZHRiCj4gICAJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL3V0aWxzL2hvb2tzLzkwLXNv
cnQtZHRiIFwKPiAgIAkJJChUQVJHRVRfRElSKS9ldGMvcGV0aXRib290L2Jvb3QuZC85MC1zb3J0
LWR0Ygo+ICsJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoUEVUSVRCT09UX1BLR0RJUikvUzE1cGIt
ZGlzY292ZXIgXAo+ICsJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMTVwYi1kaXNjb3Zlcgo+
ICsJbG4gLXNmIC91c3Ivc2Jpbi9wYi11ZGhjcGMgXAo+ICsJCSQoVEFSR0VUX0RJUikvdXNyL3No
YXJlL3VkaGNwYy9kZWZhdWx0LnNjcmlwdC5kLwo+ICAgZW5kZWYKPiAgIAo+ICAgUEVUSVRCT09U
X1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gUEVUSVRCT09UX1BPU1RfSU5TVEFMTApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
