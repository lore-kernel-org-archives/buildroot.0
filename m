Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F10CCA47F
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 07:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249676112C;
	Tue, 19 Jul 2022 07:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249676112C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgEEIp2J4KMY; Tue, 19 Jul 2022 07:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A0260D60;
	Tue, 19 Jul 2022 07:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11A0260D60
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2161BF355
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FB0541554
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 07:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB0541554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zmwlraxEAwF for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 07:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C129C4154D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C129C4154D
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 07:46:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n12so7467453wrc.8
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 00:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jaZB+vp3iyZ5lqiWumjnSgVBSE2o7HOvcvdXrukM72E=;
 b=L7sdEX7nFCBSTGBWJ1kntI4kJNclzfDwNVbK+65C+ENdcBq0eJZI6B6Lcl3ab0ca7P
 zFxGw6Cj04ax4tca98N8RoTeHmvdEzcrXfKl3b/TC4YwVrd8RCHea0nDiONRgQbxXYOZ
 9obuL73FLFfEBt4QZAx/zj+Gn0n0mLdi/MJ8Bj/kA6AZMCHqTBPgopxLMenuykmXxYQq
 ixKdVTgOQj0lay6jZfE4X3UmT239gRoj7aT+9HMf2f9ig183Q81MU9LY1AUplEIQjlk5
 pGeyb4PNTS862nmA6WtReVO9uOatYqBWGW0kammNqtbs+hFUu1fmrI1HulVf5VyibM+W
 lJKg==
X-Gm-Message-State: AJIora+Z78j1XEeI+FSgAqyGrpkmChBXV5TGGSLhEFKEk/OHRpgFCE1c
 3Iu406dOu5bG0+w0LCncxvaXnOtGfaFYDsGOeg7Y4LoTPHA=
X-Google-Smtp-Source: AGRyM1vChRm6u+Mf/RKtW8i3Pboxa+2r8O9yc5V7VaLX2Fe8goX0KucIdovnIkeXCknXZ0Ldq20XY0+sIgFKYZyUjcw=
X-Received: by 2002:a5d:6f0d:0:b0:21e:3c6f:f67c with SMTP id
 ay13-20020a5d6f0d000000b0021e3c6ff67cmr1069855wrb.606.1658216776731; Tue, 19
 Jul 2022 00:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220708142150.234611-1-bernd.kuhls@t-online.de>
 <20220718141453.23c89337@windsurf>
In-Reply-To: <20220718141453.23c89337@windsurf>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Jul 2022 07:46:03 +0000
Message-ID: <CACPK8XeFVxsENuo9uWCzQiaOOSfDvkrSMVTQfUU5me_Xzsw-gg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jaZB+vp3iyZ5lqiWumjnSgVBSE2o7HOvcvdXrukM72E=;
 b=g2jMpmVvl0JGvCzYSlrKGpRHzfuOop+O9UGdtTCPe4O00JV00LaIpZxnjsrXPiq+xe
 WwBDkBN7/kijHBOiiAI/2E51ZNsAeJ5NDQWytk3AcUEUevtetSWIxWASyWfAqkdbebgK
 VAZoLjzjDlaNdVUIofmw49GJd3OLWA3hO4avE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=g2jMpmVv
Subject: Re: [Buildroot] [PATCH 1/1] package/pixman: fix powerpc64le build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxOCBKdWwgMjAyMiBhdCAxMjoxNCwgVGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IExldCdzIGFkZCBzb21l
IFBvd2VyUEMgZm9sa3MgaW50byB0aGUgbG9vcC4gSm9lbCwgQ8OpZHJpYywgY291bGQgeW91Cj4g
aGF2ZSBhIGxvb2sgYXQgdGhlIGJlbG93IHBhdGNoLCBhbmQgaG93IHRvIGhhbmRsZSBWTVggc3Vw
cG9ydCBpbiB0aGUKPiBwaXhtYW4gcGFja2FnZT8KPgo+IEl0IGZlZWxzIGEgYml0IHVuZm9ydHVu
YXRlIHRvIHVuY29uZGl0aW9uYWxseSBkaXNhYmxlIFZNWCBzdXBwb3J0Ogo+IHRoZXJlIGlzIHNv
bWUgbG9naWMgaW4gdGhlIHBpeG1hbiBjb25maWd1cmUgc2NyaXB0IHRvIGRldGVjdCB0aGUKPiBh
dmFpbGFiaWxpdHkgb2YgVk1YLCBidXQgYXBwYXJlbnRseSB0aGlzIGxvZ2ljIGFzc3VtZXMgaXQg
d29ya3Mgb24KPiBwb3dlcnBjNjRsZSwgZXZlbiB0aG91Z2ggYXQgYnVpbGQgdGltZSBpdCBicmVh
a3MuCgpUaGFua3MhCgpUaGVyZSdzIGEgZmV3IGJ1aWxkIGZhaWx1cmVzIGdvaW5nIGFyb3VuZCBk
dWUgdG8gbm9uc2Vuc2UKY29uZmlndXJhdGlvbnMuIEluIG1vc3QgY2FzZXMgdGhlIGNvbmZpZyBo
YXMgQlIyX3Bvd2VycGM2NGxlPXkgd2l0aG91dApzZWxlY3RpbmcgYSBDUFUuIFRoaXMgZGVmYXVs
dHMgdXMgdG8gQlIyX3Bvd2VycGNfOTcwPXksIHdoaWNoIGlzIGEgQ1BVCnRoYXQgaXNuJ3Qgc3Vw
cG9ydGVkIHRvIHJ1biBwcGM2NGxlLgoKVGhlIGZpeCBpcyB0byBvbmx5IGFsbG93IENQVXMgdGhh
dCBzdXBwb3J0IHBwYzY0bGUgdG8gYmUgY29uZmlndXJlZApmb3IgdGhhdCBwbGF0Zm9ybS4gSSd2
ZSBwcmVwYXJlZCBzb21lIHBhdGNoZXMgdGhhdCBJJ20gcnVubmluZyB0aG91Z2gKQ0kgbm93LCBh
bmQgSSdsbCBzZW5kIHRoZW0gb3V0IG9uY2UgdGhleSdyZSB0ZXN0ZWQuCgpJZiBteSBjaGFuZ2Vz
IGRvbid0IGZpeCB0aGlzIHBpeG1hbiBpc3N1ZSB0aGVuIHdlIGNhbiB1c2UgdGhlCkJSMl9QT1dF
UlBDX0NQVV9IQVNfQUxUSVZFQyB0byBmb3JjZSBBbHRpVmVjL1ZNWCBvZmYgd2hlbiB3ZSBrbm93
IHRoZQpDUFUgZG9lcyBub3Qgc3VwcG9ydCBpdC4KCkNoZWVycywKCkpvZWwKCgoKCgo+Cj4gQ291
bGQgeW91IGhhdmUgYSBsb29rIGFuZCBnaXZlIHVzIHlvdXIgYWR2aWNlPwo+Cj4gVGhhbmtzIGEg
bG90IQo+Cj4gVGhvbWFzIFBldGF6em9uaQo+Cj4gT24gRnJpLCAgOCBKdWwgMjAyMiAxNjoyMTo1
MCArMDIwMAo+IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4gd3JvdGU6Cj4K
PiA+IERpc2FibGUgdm14IHN1cHBvcnQgdG8gZml4IGJ1aWxkIGVycm9yOgo+ID4KPiA+IHBpeG1h
bi12bXguYzoyNjg6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdMT0FEX1ZFQ1RPUicK
PiA+ICAgMjY4IHwgICAgIExPQURfVkVDVE9SIChzcmMpOwo+ID4gICAgICAgfCAgICAgXn5+fn5+
fn5+fn4KPiA+IHBpeG1hbi12bXguYzoyNjg6NTogZXJyb3I6IGNhbm5vdCBjb252ZXJ0IGEgdmFs
dWUgb2YgdHlwZSAnaW50JyB0bwo+ID4gIHZlY3RvciB0eXBlICdfX3ZlY3Rvcig0KSB1bnNpZ25l
ZCBpbnQnIHdoaWNoIGhhcyBkaWZmZXJlbnQgc2l6ZQo+ID4KPiA+IEZpeGVzOgo+ID4gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZmRhODg2NzY4ZmNlMjVjY2Q5YjUyYjYz
NWZmNWIxM2RhN2JhMmQwYy8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3BpeG1hbi9waXhtYW4u
bWsgfCAzICsrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9waXhtYW4vcGl4bWFuLm1rIGIvcGFj
a2FnZS9waXhtYW4vcGl4bWFuLm1rCj4gPiBpbmRleCA2NDMwMmZhNDlhLi4wZjAwYTIwY2Q4IDEw
MDY0NAo+ID4gLS0tIGEvcGFja2FnZS9waXhtYW4vcGl4bWFuLm1rCj4gPiArKysgYi9wYWNrYWdl
L3BpeG1hbi9waXhtYW4ubWsKPiA+IEBAIC0yMSw3ICsyMSw4IEBAIFBJWE1BTl9BVVRPUkVDT05G
ID0gWUVTCj4gPiAgIyBkb24ndCBidWlsZCBndGsgYmFzZWQgZGVtb3MKPiA+ICBQSVhNQU5fQ09O
Rl9PUFRTID0gXAo+ID4gICAgICAgLS1kaXNhYmxlLWd0ayBcCj4gPiAtICAgICAtLWRpc2FibGUt
bG9vbmdzb24tbW1pCj4gPiArICAgICAtLWRpc2FibGUtbG9vbmdzb24tbW1pIFwKPiA+ICsgICAg
IC0tZGlzYWJsZS12bXgKPiA+Cj4gPiAgIyBUaGUgQVJNIFNJTUQgY29kZSBmcm9tIHBpeG1hbiBy
ZXF1aXJlcyBhIHJlY2VudCBlbm91Z2ggQVJNIGNvcmUsIGJ1dAo+ID4gICMgdGhlcmUgaXMgYSBy
dW50aW1lIENQVSBjaGVjayB0aGF0IG1ha2VzIHN1cmUgaXQgZG9lc24ndCBnZXQgdXNlZCBpZgo+
Cj4KPgo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
