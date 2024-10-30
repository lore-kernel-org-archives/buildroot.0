Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BBD6B6D0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 19:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2996C608DA;
	Wed, 30 Oct 2024 19:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QKeX11zF7r6; Wed, 30 Oct 2024 19:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D5F608DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D5F608DB;
	Wed, 30 Oct 2024 19:49:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9766494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95F4C608E7
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJxUh_vu5Pv5 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 19:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7E1E608DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E1E608DA
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7E1E608DA
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 19:49:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso2007245e9.3
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 12:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730317763; x=1730922563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSEgfiy/HPXk8lepNvUjJD28nr6E36QrjK7tA+8MtwE=;
 b=wraGcb/aIE6wG1saOARP7BYbHJqiRsZy8VqYu70d0OihZqRMKCp6KQsNw/vSIysFt3
 ww9UR85YPmIDZ/0Trf7mphfLQ4Gq5RU8iwI5uYE2IvHwjPEYRB8S6mxqjWyswGZIxLaJ
 scBwBzkc+kjSrfhjwYzN0B7XzgMSWFQPJAXAKnRFvnNoXs9YNMN7lmQ2TZ9VeHlfpJ2Q
 sKrSUK5bMrlYThOjHJs0dlQo+s8tk22g/lOJDhv4OD4N7P1zCf8v4ZVUH3ohvzK6gvFo
 vKabfsrRmXUZA0eFXxzegLj3C/zc0+sJU+7TbHuy6i2l5P2XB2sRGG4j6cjNkPH5tgHa
 p14g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1ukkGyde+C2Pgf1TDGSsY7SGePQpEgUsTHU2cnCPJzcQ3bvBCzmuNlXY4A86GCY7yZSgPi+lYweU=@buildroot.org
X-Gm-Message-State: AOJu0Yzp4sK6pCm0z9aq4QBFwQBtWh+MawHyqAu135ytspSHLTgxNOkC
 z3Xip9/ZnR6TaX5vkpyLTxgoNdrT1dXfDCCTwOBpR/VN3ly57rSMJ8THM0eOyNg=
X-Google-Smtp-Source: AGHT+IEYhhVeGx5vgM62YWPjbzqhDyG/QjNn2w/d2XpjbUVus3iDWwdIEV+IStQ2M7Q8McWYm8ncEA==
X-Received: by 2002:a05:600c:458f:b0:431:542d:2599 with SMTP id
 5b1f17b1804b1-4319ad064e5mr188499835e9.22.1730317762584; 
 Wed, 30 Oct 2024 12:49:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70d31sm16145461f8f.86.2024.10.30.12.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 12:49:22 -0700 (PDT)
Message-ID: <01e268ae-aa9d-4f5f-bf61-3f2374fd0702@smile.fr>
Date: Wed, 30 Oct 2024 20:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241028134601.1286048-1-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20241028134601.1286048-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730317763; x=1730922563; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KSEgfiy/HPXk8lepNvUjJD28nr6E36QrjK7tA+8MtwE=;
 b=tWlraOTBixpEJx3ZT5A7nU9WUokFYKOyI4DBeH3dj0HYQ4qeY0Vsxi267h2S/jOskd
 UHzMNwzpRggK4AtI9GpCB64p8SusaQmibiNIr1AOuFZ2qYAkJrQp98ixKpusEXt0VM42
 0QWuy4wq0jYyiUzmFMu5d3EAUPJ98CY156PTk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=tWlraOTB
Subject: Re: [Buildroot] [PATCH] package/musl-compat-headers: fix download
 of queue.h
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMjgvMTAvMjAyNCDDoCAxNDo0NiwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gaHR0cDovL2N2c3dlYi5uZXRic2Qub3JnL2JzZHdl
Yi5jZ2kvc3JjL3N5cy9zeXMvcXVldWUuaD9yZXY9MS43MCBub3cKPiByZXR1cm5zIHNvbWUgSFRN
TCBzb3VwIGluc3RlYWQgb2YgdGhlIHBsYWluIHRleHQgdmVyc2lvbiBvZiB0aGUgZmlsZSwKPiBj
YXVzaW5nIHRoZSBoYXNoIGNoZWNrIHRvIGZhaWwuCj4gCj4gaHR0cDovL2N2c3dlYi5uZXRic2Qu
b3JnL2JzZHdlYi5jZ2kvc3JjL3N5cy9zeXMvcXVldWUuaD9yZXY9MS43MDtjb250ZW50LXR5cGU9
dGV4dCUyRnBsYWluCj4gcmV0dXJucyB0aGUgY29ycmVjdCBkYXRhLCBidXQgdGhlICI7IiBpbiB0
aGUgVVJMIGNhdXNlcyBzb21lIGlzc3Vlcwo+IHdpdGggdGhlIHBhcnNpbmcgbG9naWMgaW4gQnVp
bGRyb290Lgo+IAo+IFNvIGxldCdzIHN3aXRjaCB0bwo+IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJj
b250ZW50LmNvbS9OZXRCU0Qvc3JjLzAzYmU4MmE2YjE3M2IzYzYyMTE2YjdhMTg2MDY3ZmVkMzAw
NGRkNDQvc3lzL3N5cy9xdWV1ZS5oCj4gd2hpY2ggZGVsaXZlcnMgZXhhY3RseSB0aGUgc2FtZSBm
aWxlLCBidXQgaG9wZWZ1bGx5IHdpbGwgYmUgbW9yZQo+IHN0YWJsZS4gVGhlIGZpbGUgbmFtZSBj
aGFuZ2VkIHRvIGp1c3QgcXVldWUuaCwgYnV0IHRoZSBjb250ZW50cyBpcyB0aGUKPiBzYW1lLgo+
IAo+IEZpeGVzOgo+IAo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
NTdjODA3OGYzODJmNzQ4NTkwNzY1MTI0MjViMmYxYzUyZjQ0ZTk1YS8KPiAgIGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvODE5OTk5Mjg1MCAoYW5kIG1h
bnkgb3RoZXIgc2ltaWxhciBjYXNlcykKCkkgbm90aWNlZCBtb3JlIHRoYW4gMTAwIGZhaWx1cmVz
IGluIG91ciBnaXRsYWItY2kgT19vCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbXVzbC1jb21wYXQt
aGVhZGVycy9tdXNsLWNvbXBhdC1oZWFkZXJzLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbXVzbC1j
b21wYXQtaGVhZGVycy9tdXNsLWNvbXBhdC1oZWFkZXJzLm1rICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL211c2wtY29tcGF0LWhlYWRlcnMvbXVzbC1jb21wYXQtaGVhZGVycy5oYXNoIGIv
cGFja2FnZS9tdXNsLWNvbXBhdC1oZWFkZXJzL211c2wtY29tcGF0LWhlYWRlcnMuaGFzaAo+IGlu
ZGV4IDYyNjE0NWRmMzQuLjI3ZTBhZmI2OGMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tdXNsLWNv
bXBhdC1oZWFkZXJzL211c2wtY29tcGF0LWhlYWRlcnMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbXVz
bC1jb21wYXQtaGVhZGVycy9tdXNsLWNvbXBhdC1oZWFkZXJzLmhhc2gKPiBAQCAtMSwyICsxLDIg
QEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICBjMTM0MDdlZGQwZTMzYmU3M2Nh
ZTcyNTE0Y2IyMzRmODYxMmUxYzBlNTQ0MDFjOTQ0OGRhZmZkM2EyNDAxNThiICBxdWV1ZS5oP3Jl
dj0xLjcwCj4gK3NoYTI1NiAgYzEzNDA3ZWRkMGUzM2JlNzNjYWU3MjUxNGNiMjM0Zjg2MTJlMWMw
ZTU0NDAxYzk0NDhkYWZmZDNhMjQwMTU4YiAgcXVldWUuaAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L211c2wtY29tcGF0LWhlYWRlcnMvbXVzbC1jb21wYXQtaGVhZGVycy5tayBiL3BhY2thZ2UvbXVz
bC1jb21wYXQtaGVhZGVycy9tdXNsLWNvbXBhdC1oZWFkZXJzLm1rCj4gaW5kZXggMWNmYTg5NDg3
OS4uODY1YjBiYWU0MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL211c2wtY29tcGF0LWhlYWRlcnMv
bXVzbC1jb21wYXQtaGVhZGVycy5tawo+ICsrKyBiL3BhY2thZ2UvbXVzbC1jb21wYXQtaGVhZGVy
cy9tdXNsLWNvbXBhdC1oZWFkZXJzLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gIAo+ICAjIE5vIG1haW4gc2l0ZSwganVzdCB1c2luZyBleHRyYSBkb3du
bG9hZHMKPiAtTVVTTF9DT01QQVRfSEVBREVSU19RVUVVRV9IID0gaHR0cDovL2N2c3dlYi5uZXRi
c2Qub3JnL2JzZHdlYi5jZ2kvc3JjL3N5cy9zeXMvcXVldWUuaD9yZXY9MS43MAo+ICtNVVNMX0NP
TVBBVF9IRUFERVJTX1FVRVVFX0ggPSBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20v
TmV0QlNEL3NyYy8wM2JlODJhNmIxNzNiM2M2MjExNmI3YTE4NjA2N2ZlZDMwMDRkZDQ0L3N5cy9z
eXMvcXVldWUuaAo+ICAKPiAgTVVTTF9DT01QQVRfSEVBREVSU19FWFRSQV9ET1dOTE9BRFMgPSAk
KE1VU0xfQ09NUEFUX0hFQURFUlNfUVVFVUVfSCkKPiAgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
