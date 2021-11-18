Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC7EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 11:51:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B725C613DB
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 11:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B725C613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C1B60769;
	Thu, 18 Nov 2021 11:51:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKAdOZINfZPO; Thu, 18 Nov 2021 11:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76166074B;
	Thu, 18 Nov 2021 11:51:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0E721BF239
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 11:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B00E84037F
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 11:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZsdO04uJcHT for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 11:51:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B79BB4037C
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 11:51:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso7373557wms.2
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 03:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZqMAfRpCE4NZ1tSPwkp9MKESlJtUMIoELrAi8iOevvs=;
 b=Z018qOsFw/4r+Oq6xZAeXnHv9z0z/RfqqhNsEqls+HCISTmFBroInuUo9fj9PkRR8g
 pp+vqplbFKTwMQpQYlsGztF/hobw/mkJCDDwlMKLwYCQhwWk8tEzkDKnJ7hVV3QMZBxs
 E5hX9bTUEKcZZ+Tf3d4I46EQMUQmPYFybGpoXpBem2oPRbDyZMKiLn1y/Xhr7wd0njpB
 STAATrQMR3+wk9m8sYphkq6pNYXOO0dM546Tv+nu86eKNIfqLE0MInYh318s8JQmovm9
 t3QbXZYH3ovwn/Si36rVbMRSVT6vCZuwjOtoXMo7YnK7ibEYbE8jCVzuEIPAiwL1Nzln
 r+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZqMAfRpCE4NZ1tSPwkp9MKESlJtUMIoELrAi8iOevvs=;
 b=d7c82mvv+6kmow3fd0NHgkTiQ+JvHyBVpjDAbmXZKhCZclVbRR4fMnqaJzRdmnD/mD
 kJk7KTR/1JRkAWlxPWfsgPaYYm3D0og2B/wHcELhXQzQfUcQysVhYw16XH+GcwqJtktm
 vyD3ION5OEBXX1dG01CuP1EzyQEocOz33DAEvA5iaUPN6lnMQhT9nbzova4w2KV49M57
 mfyH7rr3lo285wKm5ipld3g77+P2r8toXR5oN82c83ngmkQ+UkmmBm9Ch2rcOu93viFA
 FKmKmClRPYO3IJmz968TEgWv07O+JL2c6x3XmXXjmN6/ZjU+qYn0QNnTDqwtxygKukKy
 x39A==
X-Gm-Message-State: AOAM530kAm62UQ5DSZxhEf2meRYgwlhn6YTAgsCbLuON8gmk4b0mvQXL
 8VWSaPQ200zdcOB6X3jkw14=
X-Google-Smtp-Source: ABdhPJy655LQYn9FNFsS+6JE/Nu/qeBhQplXPZcwu5sDuFEd92TZFX2e/Hqs0mWkHe/HwblOQhoCaA==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr9227111wmq.79.1637236290810; 
 Thu, 18 Nov 2021 03:51:30 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id c6sm11301183wmq.46.2021.11.18.03.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 03:51:30 -0800 (PST)
Message-ID: <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com>
Date: Thu, 18 Nov 2021 12:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211117213348.231529-1-romain.naour@gmail.com>
 <87ee7drf65.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87ee7drf65.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAxOC8xMS8yMDIxIMOgIDEwOjIyLCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IFNpbmNlIHRoZSAzMHRoIFNlcCAyMDIxIHRoZSBkb2Nr
ZXIgaW1hZ2UgdXNlZCB0aGUgZ2l0bGFiLWNpIGlzIG5vdCBhYmxlCj4gID4gdG8gZG93bmxvYWQg
dGhlIHRvb2xjaGFpbiBhcmNoaXZlIGZyb20gaHR0cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29t
IGR1ZQo+ICA+IHRvIGFuIGV4cGlyZWQgY2VydGlmaWNhdGUuCj4gCj4gID4gd2dldCBodHRwczov
L3Rvb2xjaGFpbnMuYm9vdGxpbi5jb20vZG93bmxvYWRzL3JlbGVhc2VzL3Rvb2xjaGFpbnMvYWFy
Y2g2NC90YXJiYWxscy9hYXJjaDY0LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDIwLjA4LTEudGFy
LmJ6Mgo+ICA+IENvbm5lY3RpbmcgdG8gdG9vbGNoYWlucy5ib290bGluLmNvbSAodG9vbGNoYWlu
cy5ib290bGluLmNvbSl8NTEuMjU0LjE0OS4xOTl8OjQ0My4uLiBjb25uZWN0ZWQuCj4gID4gRVJS
T1I6IFRoZSBjZXJ0aWZpY2F0ZSBvZiDigJh0b29sY2hhaW5zLmJvb3RsaW4uY29t4oCZIGlzIG5v
dCB0cnVzdGVkLgo+ICA+IEVSUk9SOiBUaGUgY2VydGlmaWNhdGUgb2Yg4oCYdG9vbGNoYWlucy5i
b290bGluLmNvbeKAmSBoYXMgZXhwaXJlZC4KPiAKPiAgPiBSZW1vdmUgZXhwaXJlZCBtb3ppbGxh
L0RTVF9Sb290X0NBX1gzLmNydCBbMV0uCj4gCj4gID4gWzFdIGh0dHBzOi8vc3RhY2tvdmVyZmxv
dy5jb20vcXVlc3Rpb25zLzY5NDA4Nzc2L2hvdy10by1mb3JjZS1vbGRlci1kZWJpYW4tdG8tZm9y
Z2V0LWFib3V0LWRzdC1yb290LWNhLXgzLWV4cGlyYXRpb24tYW5kLXVzZS1pc3JnCj4gCj4gID4g
U2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+ICA+
IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiAgPiAtLS0KPiAg
PiBCYWNrcG9ydCB0aGlzIHBhdGNoIGZvciAyMDIxLjA4LnggYW5kIDIwMjEuMDIueCB1c2luZyBi
dWlsZHJvb3QvYmFzZToyMDIwMDgxNC4yMjI4Cj4gCj4gSG93IGRvZXMgdGhpcyBhY3R1YWxseSB3
b3JrPyBXaG8gYnVpbGRzIHRoYXQgY29udGFpbmVyPyBEbyB3ZSBub3QgbmVlZAo+IGEgY29ycmVz
cG9uZGluZyB1cGRhdGUgb2YgLmdpdGxhYi1jaS55bWwgdGhlbj8KCldlbGwsIHVzdWFsbHkgaXQn
cyBBcm5vdXQgb3IgWWFubiB0aGF0IGJ1aWxkIGFuZCBwdXNoIGNvbnRhaW5lcnMgdG8gZG9ja2Vy
aHViLgpPbiBtYXN0ZXIgd2UgcmVjZW50bHkgc3dpdGNoZWQgdG8gZ2l0bGFiIHJlZ2lzdHJ5LCBz
byBtYWludGFpbmVycyBhbmQgZGV2ZWxvcGVycwpvZiBCdWlsZHJvb3QgZ2l0bGFiIHByb2plY3Qg
Y2FuIHVwZGF0ZSBjb250YWluZXJzLgoKVGhlIC5naXRsYWItY2kueW1sIGlzIGNoYW5nZWQgYXMg
c29vbiBhcyB0aGUgY29udGFpbmVyIGlzIHJlYnVpbGQgdXNpbmcgdGhlCnVwZGF0ZWQgRG9ja2Vy
ZmlsZSAoYWZ0ZXIgdGhlIGNvbW1pdCBvZiBEb2NrZXJmaWxlIGNoYW5nZSkuCgo+IAo+IAo+ICA+
IC0tLQo+ICA+ICBzdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIHwgMiArKwo+ICA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gID4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG9j
a2VyL0RvY2tlcmZpbGUgYi9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCj4gID4gaW5kZXggYTli
YWNjYTNhMC4uZTY1Zjg0MGRhOCAxMDA2NDQKPiAgPiAtLS0gYS9zdXBwb3J0L2RvY2tlci9Eb2Nr
ZXJmaWxlCj4gID4gKysrIGIvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+ICA+IEBAIC00Nyw2
ICs0Nyw4IEBAIFJVTiBhcHQtZ2V0IGluc3RhbGwgLXkgLS1uby1pbnN0YWxsLXJlY29tbWVuZHMg
XAo+ICA+ICAgICAgICAgIHVuemlwIFwKPiAgPiAgICAgICAgICB3Z2V0IFwKPiAgPiAgICAgICAg
ICAmJiBcCj4gID4gKyAgICBzZWQgLWkgJy9ebW96aWxsYVwvRFNUX1Jvb3RfQ0FfWDMuY3J0JC8g
cy9eLyEvJyAvZXRjL2NhLWNlcnRpZmljYXRlcy5jb25mICYmIFwKPiAgPiArICAgIHVwZGF0ZS1j
YS1jZXJ0aWZpY2F0ZXMgJiYgXAo+IAo+IEFsdGVybmF0aXZlbHkgd2UgY291bGQganVzdCB1cGRh
dGUgdG8gdGhlIGxhdGVzdCBzdHJldGNoIHJlbGVhc2UgaW5zdGVhZAo+IG9mIHRoaXMgc25hcHNo
b3QgZnJvbSAyMDE3Ogo+IAo+IGRvY2tlciBydW4gLS1ybSAtaXQgZGViaWFuOjkuMTMKPiByb290
QDQyZWM1Y2E3NWYwYTovIyBhcHQtZ2V0IHVwZGF0ZSAmJiBcCj4gICBhcHQtZ2V0IGluc3RhbGwg
LXkgLS1uby1pbnN0YWxsLXJlY29tbWVuZHMgY2EtY2VydGlmaWNhdGVzIHdnZXQKPiAKPiByb290
QDQyZWM1Y2E3NWYwYTovIyB3Z2V0IGh0dHBzOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3du
bG9hZHMvcmVsZWFzZXMvdG9vbGNoYWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQtLWdsaWJj
LS1ibGVlZGluZy1lZGdlLTIwMjAuMDgtMS50YXIuYnoyCj4gLS0yMDIxLTExLTE4IDA5OjIwOjAz
LS0gIGh0dHBzOi8vdG9vbGNoYWlucy5ib290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMvdG9v
bGNoYWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQtLWdsaWJjLS1ibGVlZGluZy1lZGdlLTIw
MjAuMDgtMS50YXIuYnoyCj4gUmVzb2x2aW5nIHRvb2xjaGFpbnMuYm9vdGxpbi5jb20gKHRvb2xj
aGFpbnMuYm9vdGxpbi5jb20pLi4uIDUxLjI1NC4xNDkuMTk5Cj4gQ29ubmVjdGluZyB0byB0b29s
Y2hhaW5zLmJvb3RsaW4uY29tICh0b29sY2hhaW5zLmJvb3RsaW4uY29tKXw1MS4yNTQuMTQ5LjE5
OXw6NDQzLi4uIGNvbm5lY3RlZC4KPiBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9u
c2UuLi4gMjAwIE9LCj4gTGVuZ3RoOiAxMjc0NTY1NjMgKDEyMk0pIFthcHBsaWNhdGlvbi94LWJ6
aXAyXQo+IFNhdmluZyB0bzogJ2FhcmNoNjQtLWdsaWJjLS1ibGVlZGluZy1lZGdlLTIwMjAuMDgt
MS50YXIuYnoyJwo+IAo+IGluZy1lZGdlLTIwMjAuMDgtMS50ICA4NSVbPT09PT09PT09PT09PT09
PT09PiAgICBdIDEwMy41MU0gIDE2LjlNQi9zICAgIGV0YSAxcyAgICAgRgo+IGFhcmNoNjQtLWds
aWJjLS1ibGVlIDEwMCVbPT09PT09PT09PT09PT09PT09PT09PT5dIDEyMS41NU0gIDE2LjZNQi9z
ICAgIGluIDcuNHMKPiAKPiAyMDIxLTExLTE4IDA5OjIwOjEwICgxNi41IE1CL3MpIC0gJ2FhcmNo
NjQtLWdsaWJjLS1ibGVlZGluZy1lZGdlLTIwMjAuMDgtMS50YXIuYnoyJyBzYXZlZCBbMTI3NDU2
NTYzLzEyNzQ1NjU2M10KPiAKSW5kZWVkIGJ1dCB3ZSBtYXkgaW50cm9kdWNlIHNvbWUgKHVubGlr
ZWx5KSByZWdyZXNzaW9uIGluIHRoZSB0ZXN0c3VpdGUuCgpPciBhZGQgLS1uby1jaGVjay1jZXJ0
aWZpY2F0ZSB0byBCUjJfV0dFVDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290
Ly0vY29tbWl0L2Q3ODI4ZjE4MTQ5YzdmZDcwYzk0ODJhYWMwMmRjMWExODU2OTQ0NDIKCkJlc3Qg
cmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
