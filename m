Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CA1EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27CB423EC;
	Fri, 16 Jun 2023 19:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27CB423EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAzXx_o8HDHJ; Fri, 16 Jun 2023 19:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7599742419;
	Fri, 16 Jun 2023 19:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7599742419
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A93231BF5E0
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F06E60AA5
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 19:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F06E60AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gMhvOfU1nw0 for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 19:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38C86066D
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F38C86066D
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 19:40:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98746d7f35dso5196766b.2
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 12:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686944431; x=1689536431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3gCGMoijdKhZJLVv8Q8GC19X5uWEg8KjolOdF/pWiE=;
 b=c0ecsjUEh+GPhAdmTZCik1nnhj9lGFr6kIjnfwwqSKHASwiwwfjOZ5sg+NpASYtvB9
 cfxNBcZ9w+COmUY2qw66wQMyiDgF0oefjq8tTIS9+crR3PXzTEI8PSZzM4USYHTbC1Wn
 iWUOpcIiU/uwjjz4KeOWL3vjA6Ef9UurULKnKUDQemThjfzihSQFBPfWfOno7pgYrbhh
 +A1U54CfpctG9jhENpEOKQP49EQ5kIXvnPv+6kcnHSnvMXFiDsY6qBC8GKQjtzaCoEq4
 alNNCV0RSd4kMr2/yuf5K3nVWqEMOtcsjP+ohxqcl1N9oueocY3OX67XXLCk61PRk3r4
 vKtA==
X-Gm-Message-State: AC+VfDzqBOlkc97Au+t2LzBbn6fs5KWFjX/u8F4VpMUxjUbprluQZtQp
 beOhVxRFzrQjeyl3vQds9EOnoyCDmwm/+pry21T4Eg==
X-Google-Smtp-Source: ACHHUZ4jU0XL9Hq9xP5b2WCzA4Bm553qn1OZHzJdsZLllF3AOVE0npumLIQSXPNPJu1ylzz0vLaItw==
X-Received: by 2002:a17:907:7f2a:b0:97d:cda7:f0c4 with SMTP id
 qf42-20020a1709077f2a00b0097dcda7f0c4mr2836041ejc.61.1686944431337; 
 Fri, 16 Jun 2023 12:40:31 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 m25-20020a1709062b9900b0096637a19dccsm11003517ejg.210.2023.06.16.12.40.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 12:40:30 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso1424373a12.0
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 12:40:30 -0700 (PDT)
X-Received: by 2002:a17:907:94cf:b0:971:fa86:27e with SMTP id
 dn15-20020a17090794cf00b00971fa86027emr2747276ejc.16.1686944429730; Fri, 16
 Jun 2023 12:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230616060421.3606283-1-peter@korsgaard.com>
 <20230616060421.3606283-2-peter@korsgaard.com>
In-Reply-To: <20230616060421.3606283-2-peter@korsgaard.com>
Date: Fri, 16 Jun 2023 12:40:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rCtVdrxfwY7pdA0Kn5gig5XOpFOEy2g9OvJY260-ypkQ@mail.gmail.com>
Message-ID: <CA+h8R2rCtVdrxfwY7pdA0Kn5gig5XOpFOEy2g9OvJY260-ypkQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1686944431; x=1689536431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3gCGMoijdKhZJLVv8Q8GC19X5uWEg8KjolOdF/pWiE=;
 b=hh+uQGN+LFP3kobZY5T7b77uQyXHbWUnm4ZlRsxLk3C7qlbJ9DYEaVAlvmEk1cygtX
 zrmaNrBrVoy7d52U/OsE2XhaOs1NjSF7uC1rnfSVuKhi7Ms9NHeDHgyOAQ7aL0R4d3QI
 HoxL4dxXNgABtajP9nLXfgeq3AiH84pLyW4IX1sTVSvsTfAO4ZmTvR1y8ooul1YFYvs8
 NSi9ZWUhJTqx0qCzGkup9EoCRawSjPXFucca/z6QGCcq41uf3zG9hjyDB7YgGed1B9/+
 ui3Z534+2z55tHt01rcgr2UNImtrhfaAhss+DlAQQMEN+LCWo2zAVlXlNMQphgnhqoAp
 j+iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=hh+uQGN+
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add python-docker test
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: james.hilliard1@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpMZ3RtLAoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3Rp
YW5AYXBlcnR1cmUudXM+CgpPbiBUaHUsIEp1biAxNSwgMjAyMyBhdCAxMTowNOKAr1BNIFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiBQeXRob24tZG9ja2Vy
IG5lZWRzIGEgd29ya2luZyBkb2NrZXIgc2V0dXAgdG8gZG8gYW55dGhpbmcgdXNlZnVsLCBzbyBh
ZGQgaXQKPiB0byB0aGUgZXhpc3RpbmcgZG9ja2VyX2NvbXBvc2UgKHdoaWNoIHRlc3RzIGRvY2tl
ciBhbmQgZG9ja2VyLWNvbXBvc2UpCj4gcmF0aGVyIHRoYW4gYWRkaW5nIGEgY29tcGxldGVseSBu
ZXcgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dh
YXJkLmNvbT4KPiAtLS0KPiAgLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9u
X2RvY2tlci5weSAgICB8IDEyICsrKysrKysrKysrKwo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X2RvY2tlcl9jb21wb3NlLnB5IHwgMTAgKysrKysrKysrLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZG9ja2Vy
LnB5Cj4KPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxl
X3B5dGhvbl9kb2NrZXIucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX2RvY2tlci5weQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uYTY5MDk3YjQxMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2RvY2tlci5weQo+IEBAIC0wLDAgKzEsMTIgQEAKPiAr
aW1wb3J0IGRvY2tlcgo+ICsKPiArY2xpZW50ID0gZG9ja2VyLmZyb21fZW52KCkKPiAraW5mbyA9
IGNsaWVudC5pbmZvKCkKPiAraW1hZ2VzID0gY2xpZW50LmltYWdlcy5saXN0KCkKPiArCj4gK2Fz
c2VydCBsZW4oaW1hZ2VzKSA+IDAKPiArCj4gK3ByaW50KCdWZXJzaW9uOicsIGluZm9bJ1NlcnZl
clZlcnNpb24nXSkKPiArcHJpbnQoJ0ltYWdlczonKQo+ICtmb3IgaSBpbiBpbWFnZXM6Cj4gKyAg
ICBwcmludChpLnRhZ3NbMF0pCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfZG9ja2VyX2NvbXBvc2UucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X2RvY2tlcl9jb21wb3NlLnB5Cj4gaW5kZXggMzhiNjY5ZmM2ZC4uMTYwMjdjOWMz
YSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2RvY2tl
cl9jb21wb3NlLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9k
b2NrZXJfY29tcG9zZS5weQo+IEBAIC00LDYgKzQsOCBAQCBpbXBvcnQgaW5mcmEuYmFzZXRlc3QK
Pgo+Cj4gIGNsYXNzIFRlc3REb2NrZXJDb21wb3NlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4g
KyAgICBzY3JpcHRzID0gWyJjb25mL2RvY2tlci1jb21wb3NlLnltbCIsCj4gKyAgICAgICAgICAg
ICAgICJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZG9ja2VyLnB5Il0KPiAgICAgIGNvbmZp
ZyA9IFwKPiAgICAgICAgICAiIiIKPiAgICAgICAgICBCUjJfeDg2XzY0PXkKPiBAQCAtMTgsNiAr
MjAsOCBAQCBjbGFzcyBUZXN0RG9ja2VyQ29tcG9zZShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+
ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjQuMTkuMjYy
Igo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICAgICAg
ICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJ7fSIKPiArICAgICAgICBC
UjJfUEFDS0FHRV9QWVRIT04zPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fRE9DS0VS
PXkKPiAgICAgICAgICBCUjJfUEFDS0FHRV9DQV9DRVJUSUZJQ0FURVM9eQo+ICAgICAgICAgIEJS
Ml9QQUNLQUdFX0RPQ0tFUl9DTEk9eQo+ICAgICAgICAgIEJSMl9QQUNLQUdFX0RPQ0tFUl9DT01Q
T1NFPXkKPiBAQCAtMjcsNyArMzEsNyBAQCBjbGFzcyBUZXN0RG9ja2VyQ29tcG9zZShpbmZyYS5i
YXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5v
dCBzZXQKPiAgICAgICAgICAiIiIuZm9ybWF0KAo+ICAgICAgICAgICAgICBpbmZyYS5maWxlcGF0
aCgidGVzdHMvcGFja2FnZS9jb3B5LXNhbXBsZS1zY3JpcHQtdG8tdGFyZ2V0LnNoIiksCj4gLSAg
ICAgICAgICAgIGluZnJhLmZpbGVwYXRoKCJjb25mL2RvY2tlci1jb21wb3NlLnltbCIpLAo+ICsg
ICAgICAgICAgICAiICIuam9pbihbaW5mcmEuZmlsZXBhdGgoaSkgZm9yIGkgaW4gc2NyaXB0c10p
LAo+ICAgICAgICAgICAgICBpbmZyYS5maWxlcGF0aCgiY29uZi9kb2NrZXItY29tcG9zZS1rZXJu
ZWwuY29uZmlnIikpCj4KPiAgICAgIGRlZiB3YWl0X2Zvcl9kb2NrZXJkKHNlbGYpOgo+IEBAIC00
Niw2ICs1MCw5IEBAIGNsYXNzIFRlc3REb2NrZXJDb21wb3NlKGluZnJhLmJhc2V0ZXN0LkJSVGVz
dCk6Cj4gICAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygnd2dldCAtcSAtTyAvdG1wL2J1c3lib3gg
aHR0cDovLzEyNy4wLjAuMS9idXN5Ym94JywgMTIwKQo+ICAgICAgICAgIHNlbGYuYXNzZXJ0UnVu
T2soJ2NtcCAvYmluL2J1c3lib3ggL3RtcC9idXN5Ym94JywgMTIwKQo+Cj4gKyAgICBkZWYgcHl0
aG9uX2RvY2tlcl90ZXN0KHNlbGYpOgo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soJ3B5dGhv
bjMgLi9zYW1wbGVfcHl0aG9uX2RvY2tlci5weScsIDEyMCkKPiArCj4gICAgICBkZWYgdGVzdF9y
dW4oc2VsZik6Cj4gICAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIs
ICJpbWFnZXMiLCAiYnpJbWFnZSIpCj4gICAgICAgICAgcm9vdGZzID0gb3MucGF0aC5qb2luKHNl
bGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmV4dDIiKQo+IEBAIC02MiwzICs2OSw0IEBA
IGNsYXNzIFRlc3REb2NrZXJDb21wb3NlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAg
ICAgc2VsZi53YWl0X2Zvcl9kb2NrZXJkKCkKPiAgICAgICAgICBzZWxmLmRvY2tlcl90ZXN0KCkK
PiAgICAgICAgICBzZWxmLmRvY2tlcl9jb21wb3NlX3Rlc3QoKQo+ICsgICAgICAgIHNlbGYucHl0
aG9uX2RvY2tlcl90ZXN0KCkKPiAtLQo+IDIuMzAuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
