Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231C5C4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 03:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0B240354;
	Fri, 30 Dec 2022 03:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0B240354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p61b5bIqA_SK; Fri, 30 Dec 2022 03:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6D74020B;
	Fri, 30 Dec 2022 03:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA6D74020B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF38E1BF59C
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A79B60B04
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 03:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A79B60B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_9gGi5c7LDJ for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 03:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D28960AEC
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D28960AEC
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 03:46:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kw15so48909656ejc.10
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLIOTDIWht8qiCJmbNDeW/q1fRP+4GNxKz0brNnh7gU=;
 b=OSvGObYtFq8Z0YabsExIJLbfnkyT+Q9kkhwEQEi48/Uns9B/dBbJxzcSyoPKvgzkPU
 boK42H9KvLUapL9SjQEEH2KpwBqVkbBLSZbDcaZMc80uiBMy2seER5Pnh2ibov7SvRBa
 c76+MaSXGBbSNvXFtqGTvBvq1a2U46KkLSgUko5fP198yK+USeNQxDQ+09h+X2zCPpN/
 7mF98THv8I2QO88Y5vmkyIregLdGof7V4vY/NAeHk6PJsAk2yhSh4nthXLJiAVtsH1NE
 OuxrucPo+8T0ToScFW/y+uecrJhq18vS+5/A1UXNOKfyq0St78BP6Ns+x3QoQdqg/Jwq
 57vQ==
X-Gm-Message-State: AFqh2kprIrzMcIJwXqquvbqUM1K5IYS5YOjKhGj/4yx722P2R6wjaCTX
 U7f7Q9pCd6oq8/ALVgSryVUbTzvFPl7FZuE0l68=
X-Google-Smtp-Source: AMrXdXsdgO2skbtGy3NqZVkuuEPMaS4syczDcI3Ku1ICQ0ltpqLrnMpKVvj4ZhAWiLlTTGwuxJ2gow==
X-Received: by 2002:a17:906:36ce:b0:7c1:727c:5f70 with SMTP id
 b14-20020a17090636ce00b007c1727c5f70mr26453898ejc.46.1672372001317; 
 Thu, 29 Dec 2022 19:46:41 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 c19-20020a170906341300b007a8de84ce36sm9156908ejb.206.2022.12.29.19.46.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 19:46:40 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id ud5so49006846ejc.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:46:40 -0800 (PST)
X-Received: by 2002:a17:907:c388:b0:7c1:8fa0:527 with SMTP id
 tm8-20020a170907c38800b007c18fa00527mr4019305ejc.180.1672372000412; Thu, 29
 Dec 2022 19:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20221230032520.1066282-1-christian@paral.in>
In-Reply-To: <20221230032520.1066282-1-christian@paral.in>
Date: Thu, 29 Dec 2022 19:46:29 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q-UFnEMLeN-_MbDbyCGvVe9_y9eg5pV4xm2Rq-G0u6Cg@mail.gmail.com>
Message-ID: <CA+h8R2q-UFnEMLeN-_MbDbyCGvVe9_y9eg5pV4xm2Rq-G0u6Cg@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLIOTDIWht8qiCJmbNDeW/q1fRP+4GNxKz0brNnh7gU=;
 b=byt2tSbV32da8rvZizyeNQsn/lIivM6YlLCGwfHyWHtVhdNzaY4aoojdWlxSEaqAOx
 +XwzI85Wx3KfskoDVnPISV1jxlUm+wQdj9V9W8XUiqdAdFDSlih0vh4wstlpbPKrcMKL
 zXth6bhfZ+vkZNPmScZ4Z0IfqpGkqGXe9PoMD4070SRrWj9NHkSeaHX7/UULOYRgSICu
 I5IJ7cO8EQBxhfIxF9TNuha/UQI7BID/2mGBvqqzKOkiGbaxILuosdGVwblLuEuO3D1w
 ED7a3aMitBf8hkSR+wy7r6StkWwyUfANoEjft8GBc6zH5pDKPtuFmhBovU3z8OEensuD
 0HuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=byt2tSbV
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: fix build failure:
 undefined jent_notime_ctx
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsOgoKSSBzZWUgdGhhdCB0aGlzIHdhcyBhY3R1YWxseSBmaXhlZCB1cHN0cmVhbSwgYnV0IHRo
ZXJlJ3Mgbm90IGJlZW4gYQpuZXcgcmVsZWFzZSB0YWdnZWQgc2luY2UuCgpJJ2xsIHJlcGxhY2Ug
dGhlIHBhdGNoIHdpdGggdGhlIG9uZSB1cHN0cmVhbSAoY2hlcnJ5LXBpY2spLgoKVGhhbmtzLApD
aHJpc3RpYW4gU3Rld2FydAoKCk9uIFRodSwgRGVjIDI5LCAyMDIyIGF0IDc6MjUgUE0gQ2hyaXN0
aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5pbj4gd3JvdGU6Cj4KPiBTaW5jZSBjb21taXQg
YTg4MDdkIHVwZGF0ZWQgaml0dGVyZW50cm9weS1saWJyYXJ5IHRvIHZlcnNpb24gMy40LjE6Cj4K
PiBUaGUgdXBkYXRlIHJlcXVpcmVzIHNldHRpbmcgdGhlIG1hY3JvIEpFTlRfQ09ORl9FTkFCTEVf
SU5URVJOQUxfVElNRVIsIG90aGVyd2lzZQo+IHRoZSBidWlsZCBjYW4gZmFpbCB3aXRoIHRoZSBm
b2xsb3dpbmcgdHlwZSBvZiBlcnJvcjoKPgo+IGppdHRlcmVudHJvcHktbGlicmFyeSByZXF1aXJl
cyBzZXR0aW5nIHRoZSBtYWNybyBKRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSCj4gdG8g
ZGVmaW5lIGplbnRfbm90aW1lX2N0eC4gSWYgbm90IHNldCwgdGhlIGJ1aWxkIGZhaWxzIHdpdGgg
dGhlIGZvbGxvd2luZyBlcnJvcjoKPgo+IHJuZ2Rfaml0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmHJu
Z2Rfbm90aW1lX3N0b3DigJk6Cj4gcm5nZF9qaXR0ZXIuYzo5NzozMjogZXJyb3I6IGludmFsaWQg
dXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmHN0cnVjdCBqZW50X25vdGltZV9jdHjigJkKPiAgICA5
NyB8ICAgICAgICAgcHRocmVhZF9qb2luKHRocmVhZF9jdHgtPm5vdGltZV90aHJlYWRfaWQsIE5V
TEwpOwo+Cj4gUmVmZXJlbmNlOgo+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tc2cxNjA1MzEuaHRtbAo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5pbj4KPiAtLS0K
PiAgLi4uYWJsZS1KRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSLnBhdGNoIHwgMzkgKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ybmctdG9vbHMvMDAwNC1qaXR0ZXJlbnRyb3B5LWVu
YWJsZS1KRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSLnBhdGNoCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9ybmctdG9vbHMvMDAwNC1qaXR0ZXJlbnRyb3B5LWVuYWJsZS1KRU5UX0NPTkZf
RU5BQkxFX0lOVEVSTkFMX1RJTUVSLnBhdGNoIGIvcGFja2FnZS9ybmctdG9vbHMvMDAwNC1qaXR0
ZXJlbnRyb3B5LWVuYWJsZS1KRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSLnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wOGY5M2IwM2ZhCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvcm5nLXRvb2xzLzAwMDQtaml0dGVyZW50cm9weS1l
bmFibGUtSkVOVF9DT05GX0VOQUJMRV9JTlRFUk5BTF9USU1FUi5wYXRjaAo+IEBAIC0wLDAgKzEs
MzkgQEAKPiArRnJvbSA0OWYyNzBiYWY3ZmZmMjg1NWUzOWIyMDg0MTIxZDc2NWQyYTk5OTBjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0
aWFuQHBhcmFsLmluPgo+ICtEYXRlOiBUaHUsIDI5IERlYyAyMDIyIDE5OjIxOjA0IC0wODAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gaml0dGVyZW50cm9weTogZW5hYmxlIEpFTlRfQ09ORl9FTkFCTEVf
SU5URVJOQUxfVElNRVIKPiArIGRlZmluaXRpb24KPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKPiArCj4gK2ppdHRlcmVudHJvcHktbGlicmFyeSByZXF1aXJlcyBzZXR0
aW5nIHRoZSBtYWNybyBKRU5UX0NPTkZfRU5BQkxFX0lOVEVSTkFMX1RJTUVSCj4gK3RvIGRlZmlu
ZSBqZW50X25vdGltZV9jdHguIElmIG5vdCBzZXQsIHRoZSBidWlsZCBmYWlscyB3aXRoIHRoZSBm
b2xsb3dpbmcgZXJyb3I6Cj4gKwo+ICtybmdkX2ppdHRlci5jOiBJbiBmdW5jdGlvbiDigJhybmdk
X25vdGltZV9zdG9w4oCZOgo+ICtybmdkX2ppdHRlci5jOjk3OjMyOiBlcnJvcjogaW52YWxpZCB1
c2Ugb2YgdW5kZWZpbmVkIHR5cGUg4oCYc3RydWN0IGplbnRfbm90aW1lX2N0eOKAmQo+ICsgICA5
NyB8ICAgICAgICAgcHRocmVhZF9qb2luKHRocmVhZF9jdHgtPm5vdGltZV90aHJlYWRfaWQsIE5V
TEwpOwo+ICsKPiArRGVmaW5lIEpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIgaWYgaml0
dGVyZW50cm9weSBpcyBlbmFibGVkLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0
ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5pbj4KPiArLS0tCj4gKyBjb25maWd1cmUuYWMgfCAyICst
Cj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4g
K2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPiAraW5kZXggNmVjM2Mz
YS4uMjUxMzZmMiAxMDA2NDQKPiArLS0tIGEvY29uZmlndXJlLmFjCj4gKysrKyBiL2NvbmZpZ3Vy
ZS5hYwo+ICtAQCAtODcsNyArODcsNyBAQCBBQ19BUkdfRU5BQkxFKGppdHRlcmVudHJvcHksCj4g
KyAgICAgICBbRGlzYWJsZSBqaXR0ZXJlbnRyb3B5IHNvdXJjZSwgb3Igc3BlY2lmeSBpdHMgbG9j
YXRpb25dKSwKPiArICAgICAgIFtpZiBbIHRlc3QgLWQgJGVuYWJsZV9qaXR0ZXJlbnRyb3B5IF07
IHRoZW4KPiArICAgICAgICAgICAgICAgZXhwb3J0IExERkxBR1MrPS1MJGVuYWJsZV9qaXR0ZXJl
bnRyb3B5Owo+ICstICAgICAgICAgICAgICBleHBvcnQgQ0ZMQUdTKz0iIC1JJGVuYWJsZV9qaXR0
ZXJlbnRyb3B5IjsKPiArKyAgICAgICAgICAgICAgZXhwb3J0IENGTEFHUys9IiAtSSRlbmFibGVf
aml0dGVyZW50cm9weSAtREpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIiOwo+ICsgICAg
ICAgZmldLFtdKQo+ICsKPiArIEFTX0lGKAo+ICstLQo+ICsyLjM5LjAKPiArCj4gLS0KPiAyLjM5
LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
