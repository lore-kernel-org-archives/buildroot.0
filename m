Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0491CF9C73
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9396F605B0;
	Tue, 24 Sep 2024 15:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7OowR9zVWvU; Tue, 24 Sep 2024 15:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818A1605CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818A1605CB;
	Tue, 24 Sep 2024 15:29:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA7ED1BF401
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5CB3409FE
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rblIfOiWcOct for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 15:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6721A409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6721A409F2
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6721A409F2
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 15:29:43 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-502adfff6fdso1720560e0c.1
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 08:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727191782; x=1727796582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AUFFPotHw7aKAqW+fqB3LG3lW7pxMt5CFiRZm7ewWLo=;
 b=wxNk2L9GzMfLbqE9DhGzQbvLfRYfNecZImQK7onO7/OsQLbxe288NOzBDgHbdPzXx+
 kufaAtHoSvhM42lgQ5Ujwa2CuYUJkrGPyo/fMAg9byCQ+Vk9cEXQ8YmwxxOhutrjZJD6
 OZc3lldhDZWaKsrSJ7u0TZHiyD9Y5J8t8vV/JtZTR6xeldGGKx/b70t8uCkpXMTAtg00
 CcJNhAsj178GQY4a9E+gMBKw5zSoRyt/sFwOo+jpfsHoWNdzBvIHBtKUv/ug+1E1+IPa
 Xl5DLUdrmRN3K56Cok81z0SKfqAgXjU/jC98d/H10FMaihRzyi6jVEVnSVuUHjm4O5lx
 axmQ==
X-Gm-Message-State: AOJu0YzCP5iRgSI6besHcu52e2/xMzWaRaJrphxfMMmuxqD4Q21r0+J7
 4Tc9LX1sWCpegfwmes1dBpXX66eghg8J3CxHeEDK9sD7okEpPuSuXDcqZHreHF4Yo7PWGp2e5kK
 rznBIkpjdZr69fji7arcicntVpa8=
X-Google-Smtp-Source: AGHT+IEP4HiNIm3B1mBZS0NTnOjpXFy5GEAUfwqxWycL6DoFRWtzQmf5Cn5IiOvqG9ULLpkRDD4OlWu72whWMs4cdpA=
X-Received: by 2002:a05:6122:d9f:b0:4ef:27e0:3f8c with SMTP id
 71dfb90a1353d-503e02299e8mr10337787e0c.0.1727191781942; Tue, 24 Sep 2024
 08:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240917202834.4017981-1-james.hilliard1@gmail.com>
 <3de08-66e9f080-3-120b78e0@82001172>
In-Reply-To: <3de08-66e9f080-3-120b78e0@82001172>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Sep 2024 09:29:30 -0600
Message-ID: <CADvTj4rKo0SZRxjb+Agin4Ow4UG0+MkxAM_8UWM0f0DTdy0KFA@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727191782; x=1727796582; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUFFPotHw7aKAqW+fqB3LG3lW7pxMt5CFiRZm7ewWLo=;
 b=Ms0zsjDrgp6h4/uFFvSZiA3WAiBC/jY1wVERhjN2msfZ615AVcPREP4l0rYcGpjykV
 lNefyMpXMPGZzcGAQH27ZdvdE2+UZMy8xfDHR+xhJCEnxh7fNsjuLf57YSgXYsrfQ/5E
 t0vz0wQKELgFGDgxyrV5o4LcqPCoOeOaA425mqeugYvBA0Z+DwK+LhhOJzbXLZOm34Rp
 YhXK47PDLwS0vWharepYK1pvIqKvaGxVq9lsdPXeldu/XzwwdCevYsrS7DvjJe7W3MNs
 H3y6eGoVfR+mjGd/rQNkJCSuCEpJXKK3jf5m1SGzfcm6KjUkdeR9ZlWlycMHJ3Zo2kbE
 0VbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ms0zsjDr
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 28.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBTZXAgMTcsIDIwMjQgYXQgMzoxMOKAr1BNIE1pY2hhZWwgTm9zdGhvZmYgPGJ1aWxk
cm9vdEBoZWluZS50ZWNoPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gVHVlc2RheSwgU2Vw
dGVtYmVyIDE3LCAyMDI0IDIyOjI4IENFU1QsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gTWlncmF0ZSBwcm90b2J1ZiBidWlsZCBmcm9tIGF1
dG90b29scyB0byBjbWFrZS4KPiA+Cj4KPiBJIHRoaW5rIHRoaXMgaXMgdGhlIHJpZ2h0IGFwcHJv
YWNoIDopCj4KPiA+IC0tLSBhL3BhY2thZ2UvcHJvdG9idWYvcHJvdG9idWYubWsKPiA+ICsrKyBi
L3BhY2thZ2UvcHJvdG9idWYvcHJvdG9idWYubWsKPiA+IEBAIC03LDE2ICs3LDQwIEBACj4gPiAg
IyBXaGVuIGJ1bXBpbmcgdGhpcyBwYWNrYWdlLCBtYWtlIHN1cmUgdG8gYWxzbyB2ZXJpZnkgaWYg
dGhlCj4gPiAgIyBweXRob24tcHJvdG9idWYgcGFja2FnZSBzdGlsbCB3b3JrcyBhbmQgdG8gdXBk
YXRlIGl0cyBoYXNoLAo+ID4gICMgYXMgdGhleSBzaGFyZSB0aGUgc2FtZSB2ZXJzaW9uL3NpdGUg
dmFyaWFibGVzLgo+Cj4gSSB0aGluayB0aGUgY29tbWVudCBuZWVkcyB1cGRhdGluZyBhcyB3ZWxs
LCB0aGUgc2l0ZSB2YXJpYWJsZXMgYXJlIG5vdyBkaWZmZXJlbnQuCj4KPiA+IC1QUk9UT0JVRl9W
RVJTSU9OID0gMjEuMTIKPiA+IC1QUk9UT0JVRl9TT1VSQ0UgPSBwcm90b2J1Zi1jcHAtMy4kKFBS
T1RPQlVGX1ZFUlNJT04pLnRhci5nego+ID4gK1BST1RPQlVGX1ZFUlNJT04gPSAyOC4xCj4gPiAg
UFJPVE9CVUZfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9i
dWYvcmVsZWFzZXMvZG93bmxvYWQvdiQoUFJPVE9CVUZfVkVSU0lPTikKPiA+ICBQUk9UT0JVRl9M
SUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gPiAgUFJPVE9CVUZfTElDRU5TRV9GSUxFUyA9IExJQ0VO
U0UKPiA+ICBQUk9UT0JVRl9DUEVfSURfVkVORE9SID0gZ29vZ2xlCj4gPgo+Cj4gc2FkbHkgSSBj
YW4ndCBjb21waWxlIChob3N0LSlncnBjIGFueW1vcmUgYWZ0ZXIgdGhpcyB2ZXJzaW9uIGJ1bXAu
IEkgZmVhciB0aGF0IGluIHRoZSBlbmQgd2UgbmVlZCB0byBidW1wIHByb3RvYnVmLCBncnBjIGFu
ZCBsaWJhYnNlaWwgaW4gb25lIHBhdGNoc2V0Lgo+IEJ1dCBtYXliZSB5b3UgY2FuIHByb29mIG1l
IHdyb25nLgoKVXBkYXRlZCBhbGwgMyBpbiBteSB2MjoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9NDI1MTc0Cgo+Cj4gRGVmY29uZmln
IHRvIHJlcHJvZHVjZToKPgo+IEJSMl9hcm09eQo+IEJSMl9jb3J0ZXhfYTE1X2E3PXkKPiBCUjJf
QVJNX0ZQVV9ORU9OX1ZGUFY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfUEFD
S0FHRV9HUlBDPXkKPgo+IEVycm9yOgo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9idWlsZC9i
dWlsZHJvb3QtdXBzdHJlYW0vb3V0cHV0L2J1aWxkL2hvc3QtZ3JwYy0xLjUxLjEvc3JjL2NvbXBp
bGVyL29iamVjdGl2ZV9jX2dlbmVyYXRvci5jYzoyODoKPiAvYnVpbGQvYnVpbGRyb290LXVwc3Ry
ZWFtL291dHB1dC9idWlsZC9ob3N0LWdycGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVf
Y19nZW5lcmF0b3JfaGVscGVycy5oOiBJbiBmdW5jdGlvbiDigJhzdGQ6OnN0cmluZyBncnBjX29i
amVjdGl2ZV9jX2dlbmVyYXRvcjo6TWVzc2FnZUhlYWRlck5hbWUoY29uc3QgRmlsZURlc2NyaXB0
b3IqKeKAmToKPiAvYnVpbGQvYnVpbGRyb290LXVwc3RyZWFtL291dHB1dC9idWlsZC9ob3N0LWdy
cGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVfY19nZW5lcmF0b3JfaGVscGVycy5oOjM3
OjUwOiBlcnJvcjog4oCYRmlsZVBhdGjigJkgaXMgbm90IGEgbWVtYmVyIG9mIOKAmGdvb2dsZTo6
cHJvdG9idWY6OmNvbXBpbGVyOjpvYmplY3RpdmVj4oCZCj4gICAgMzcgfCAgIHJldHVybiBnb29n
bGU6OnByb3RvYnVmOjpjb21waWxlcjo6b2JqZWN0aXZlYzo6RmlsZVBhdGgoZmlsZSkgKyAiLnBi
b2JqYy5oIjsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fgo+IC9idWlsZC9idWlsZHJvb3QtdXBzdHJlYW0vb3V0cHV0L2J1
aWxkL2hvc3QtZ3JwYy0xLjUxLjEvc3JjL2NvbXBpbGVyL29iamVjdGl2ZV9jX2dlbmVyYXRvcl9o
ZWxwZXJzLmg6IEluIGZ1bmN0aW9uIOKAmHN0ZDo6c3RyaW5nIGdycGNfb2JqZWN0aXZlX2NfZ2Vu
ZXJhdG9yOjpTZXJ2aWNlQ2xhc3NOYW1lKGNvbnN0IFNlcnZpY2VEZXNjcmlwdG9yKinigJk6Cj4g
L2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEuMS9z
cmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yX2hlbHBlcnMuaDo0NTo0NzogZXJyb3I6
IOKAmEZpbGVDbGFzc1ByZWZpeOKAmSBpcyBub3QgYSBtZW1iZXIgb2Yg4oCYZ29vZ2xlOjpwcm90
b2J1Zjo6Y29tcGlsZXI6Om9iamVjdGl2ZWPigJkKPiAgICA0NSB8ICAgICAgIGdvb2dsZTo6cHJv
dG9idWY6OmNvbXBpbGVyOjpvYmplY3RpdmVjOjpGaWxlQ2xhc3NQcmVmaXgoZmlsZSk7Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+Cj4gL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1n
cnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOiBBdCBnbG9i
YWwgc2NvcGU6Cj4gL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1n
cnBjLTEuNTEuMS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOjMwOjQ5OiBl
cnJvcjog4oCYQ2xhc3NOYW1l4oCZIGhhcyBub3QgYmVlbiBkZWNsYXJlZCBpbiDigJhnb29nbGU6
OnByb3RvYnVmOjpjb21waWxlcjo6b2JqZWN0aXZlY+KAmQo+ICAgIDMwIHwgdXNpbmcgOjpnb29n
bGU6OnByb3RvYnVmOjpjb21waWxlcjo6b2JqZWN0aXZlYzo6Q2xhc3NOYW1lOwo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
Cj4gL2J1aWxkL2J1aWxkcm9vdC11cHN0cmVhbS9vdXRwdXQvYnVpbGQvaG9zdC1ncnBjLTEuNTEu
MS9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9yLmNjOiBJbiBmdW5jdGlvbiDigJhz
dGQ6Om1hcDxzdGQ6Ol9fY3h4MTE6OmJhc2ljX3N0cmluZzxjaGFyPiwgc3RkOjpfX2N4eDExOjpi
YXNpY19zdHJpbmc8Y2hhcj4gPiBncnBjX29iamVjdGl2ZV9jX2dlbmVyYXRvcjo6e2Fub255bW91
c306OkdldE1ldGhvZFZhcnMoY29uc3QgTWV0aG9kRGVzY3JpcHRvciop4oCZOgo+IC9idWlsZC9i
dWlsZHJvb3QtdXBzdHJlYW0vb3V0cHV0L2J1aWxkL2hvc3QtZ3JwYy0xLjUxLjEvc3JjL2NvbXBp
bGVyL29iamVjdGl2ZV9jX2dlbmVyYXRvci5jYzoxNTM6MjY6IGVycm9yOiDigJhDbGFzc05hbWXi
gJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCj4gICAxNTMgfCAgIHJlc1sicmVxdWVz
dF9jbGFzcyJdID0gQ2xhc3NOYW1lKG1ldGhvZC0+aW5wdXRfdHlwZSgpKTsKPiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiAvYnVpbGQvYnVpbGRyb290LXVwc3Ry
ZWFtL291dHB1dC9idWlsZC9ob3N0LWdycGMtMS41MS4xL3NyYy9jb21waWxlci9vYmplY3RpdmVf
Y19nZW5lcmF0b3IuY2M6IEluIGZ1bmN0aW9uIOKAmHN0ZDo6c3RyaW5nIGdycGNfb2JqZWN0aXZl
X2NfZ2VuZXJhdG9yOjpHZXRBbGxNZXNzYWdlQ2xhc3Nlcyhjb25zdCBGaWxlRGVzY3JpcHRvciop
4oCZOgo+IC9idWlsZC9idWlsZHJvb3QtdXBzdHJlYW0vb3V0cHV0L2J1aWxkL2hvc3QtZ3JwYy0x
LjUxLjEvc3JjL2NvbXBpbGVyL29iamVjdGl2ZV9jX2dlbmVyYXRvci5jYzoyNzc6MjQ6IGVycm9y
OiDigJhDbGFzc05hbWXigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCj4gICAyNzcg
fCAgICAgICAgIGNsYXNzZXMuaW5zZXJ0KENsYXNzTmFtZShtZXRob2QtPmlucHV0X3R5cGUoKSkp
Owo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiBtYWtlWzNdOiAq
KiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIvYnVpbGQubWFrZTo3NjogQ01h
a2VGaWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9zcmMvY29tcGlsZXIvY3BwX2dlbmVyYXRv
ci5jYy5vXSBFcnJvciAxCj4gbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIv
YnVpbGQubWFrZToxMzI6IENNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIvc3JjL2Nv
bXBpbGVyL3BocF9nZW5lcmF0b3IuY2Mub10gRXJyb3IgMQo+IG1ha2VbM106ICoqKiBbQ01ha2VG
aWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9idWlsZC5tYWtlOjExODogQ01ha2VGaWxlcy9n
cnBjX3BsdWdpbl9zdXBwb3J0LmRpci9zcmMvY29tcGlsZXIvb2JqZWN0aXZlX2NfZ2VuZXJhdG9y
LmNjLm9dIEVycm9yIDEKPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3Vw
cG9ydC5kaXIvYnVpbGQubWFrZToxNjA6IENNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5k
aXIvc3JjL2NvbXBpbGVyL3J1YnlfZ2VuZXJhdG9yLmNjLm9dIEVycm9yIDEKPiBtYWtlWzNdOiAq
KiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIvYnVpbGQubWFrZToxMDQ6IENN
YWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9ydC5kaXIvc3JjL2NvbXBpbGVyL25vZGVfZ2VuZXJh
dG9yLmNjLm9dIEVycm9yIDEKPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvZ3JwY19wbHVnaW5f
c3VwcG9ydC5kaXIvYnVpbGQubWFrZToxNDY6IENNYWtlRmlsZXMvZ3JwY19wbHVnaW5fc3VwcG9y
dC5kaXIvc3JjL2NvbXBpbGVyL3B5dGhvbl9nZW5lcmF0b3IuY2Mub10gRXJyb3IgMQo+IG1ha2Vb
M106ICoqKiBbQ01ha2VGaWxlcy9ncnBjX3BsdWdpbl9zdXBwb3J0LmRpci9idWlsZC5tYWtlOjkw
OiBDTWFrZUZpbGVzL2dycGNfcGx1Z2luX3N1cHBvcnQuZGlyL3NyYy9jb21waWxlci9jc2hhcnBf
Z2VuZXJhdG9yLmNjLm9dIEVycm9yIDEKPgo+Cj4gUmVnYXJkcywKPiBNaWNoYWVsCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
