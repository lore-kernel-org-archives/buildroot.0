Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581C4C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CC460AA4;
	Sun, 26 Nov 2023 16:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CC460AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WdP-boa37LhI; Sun, 26 Nov 2023 16:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E51360A98;
	Sun, 26 Nov 2023 16:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E51360A98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 685171BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4C860A98
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F4C860A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFLwNWKoqzBx for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:46:45 +0000 (UTC)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 157AB60A89
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 157AB60A89
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-41cc535cd5cso17412641cf.2
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 08:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701017204; x=1701622004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKk5+QB7ug9Df0V9qlKKeBELBiPhVD8iZE4TlFxuoEE=;
 b=Y/8CQIgIhlgiEJ0yteSxatnsTVIzagrc+tGv8gh5ps/bwmmQs79zq3jT++JRbeheDR
 N4vkWr+rltIkx1KFpNwl7Mt5dE7DA2sZG7QEE8xXHyRjRKM15m6msLb+pCY/AvyCVfg5
 5bUmyrnNnPnCaYDnl6URAbIKVXitN6WXQGMsaz9Ah579yHHWUAmp71WdmktpaTg0/ULZ
 ZrVIFmGzMXYB+CVrJ0aHXK5cCERQnguApD9znqXiChTDGD9pNT4pJ7g3opjV1KRqwsth
 DIqqqgFukyOazDIyZNac146toPZ90yRa+L7OdYTh3XR5NA33BFyLfYs8QqhihNpIBWwd
 6fXQ==
X-Gm-Message-State: AOJu0YzLSNcEnInuJRx+c6eb+FwnlwWk0J8TuSCVIgMdofgpJv/ebHpv
 9PJX1mL1meJ6Vej1AUEa+pXb+yp/iKe+gZcx5xQ=
X-Google-Smtp-Source: AGHT+IFVsrnakbpZuoe7sL1Al1JRqJmHK3mn4vR5OYAN9Ov9x13JXJ4jdOtG+ojyS0p+TRhmaNKlAw9QPnHQ1fMipN8=
X-Received: by 2002:ac8:4e8c:0:b0:423:8e47:7236 with SMTP id
 12-20020ac84e8c000000b004238e477236mr11555424qtp.41.1701017203829; Sun, 26
 Nov 2023 08:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
 <20231125153609.GJ3177259@scaer>
 <CADvTj4oC_mtb0EymNkFQ969rPRoaw8L8QVvAV2n--knCYB9=iQ@mail.gmail.com>
 <20231126112725.GS3177259@scaer>
 <CADvTj4qHe+Puev4JLopaBbH-Kq0+NAR_GH0G43JkcGy125tqXQ@mail.gmail.com>
 <20231126163955.GX3177259@scaer>
In-Reply-To: <20231126163955.GX3177259@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Nov 2023 09:46:31 -0700
Message-ID: <CADvTj4pVMmG2Ba-AzvCT98xZ9JtOQouv4p1U2=GX7EMgYgigUg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701017204; x=1701622004; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKk5+QB7ug9Df0V9qlKKeBELBiPhVD8iZE4TlFxuoEE=;
 b=OS4H01CWRsF64dlLrv+PQ83U/imcr5njbf7XGQQ2ZAVwGGb1mIzv4mdjFCgVl6luXq
 ZluL1d8u6lKjneEcSiAsGYrW7iz3qSvGqDYFxiaWtsLp8ULsroqzKg1OXcArDi6xjYXY
 qGYEnStZk10Y6JHjxB9uvsCWsHKm531Z9BhuD2nEi8ldSknZ6iritWgNiqxKE43d4x6H
 0NFIchIyqmZknvpEnI4hLjAsl4KX6WnNlzosX6nCGHT52m7DhAU+tt3WquXbypLVprK2
 8I8ODps7862pdVJ4EKoJL9DM2NIXa9raDoyNvWKrMoFeJProZ+MdwizQQ9fh8FkQmciP
 nxAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OS4H01CW
Subject: Re: [Buildroot] [PATCH 2/3] package/python-pydantic-core: new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBOb3YgMjYsIDIwMjMgYXQgOTo0MOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDIzLTExLTI2
IDA5OjE5IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBTdW4sIE5v
diAyNiwgMjAyMyBhdCA0OjI34oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+IHdyb3RlOgo+ID4gPiA+IE9uIFNhdCwgTm92IDI1LCAyMDIzIGF0IDg6MzbigK9BTSBZ
YW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gWy0tU05JUC0t
XQo+ID4gPiA+IFRoZXJlJ3Mgbm8gY29uZmxpY3Qgc2luY2UgcHlkYW50aWMtY29yZSBpcyBhIG5l
dyBwYWNrYWdlIHdpdGggbm8gcmV2ZXJzZQo+ID4gPiA+IGRlcGVuZGVuY2llcy4KPiA+ID4gSXQg
aXMgbm90IGp1c3QgYWJvdXQgcmV2ZXJzZSBkZXBlbmRlbmNpZXMuIEFzc3VtaW5nIHdlIGp1c3Qg
YXBwbHkgdGhlCj4gPiA+IHB5ZGFudGljLWNvcmUgbmV3IHBhY2thZ2UsIGFuZCBrZWVwIHRoZSBv
bGQgcHlkYW50aWMgKGUuZyB3ZSBoYXZlIHRvCj4gPiA+IHJldmVydCB0aGUgYnVtcCBsYXRlciBm
b3IgdmFyaW91cyByZWFzb25zKSwgd2hhdCBoYXBwZW5zIGF0IGJ1aWxkIHRpbWUKPiA+ID4gb3Ig
YXQgcnVudGltZSwgaWYgdGhlIHVzZXIgZW5hYmxlcyBweWRhbnRpYy1jb3JlIGFuZCBweWRhbnRp
YyAodGhlIG9sZCk/Cj4gPiBTbyBweWRhbnRpYy1jb3JlIGlzIGp1c3QgYSBuZXcgZGVwZW5kZW5j
eSBmb3IgcHlkYW50aWMgdG8gaGFuZGxlIGNvcmUKPiA+IHZhbGlkYXRpb24gbG9naWMuIElmIHB5
ZGFudGljLWNvcmUgaXMgdXNlZCB3aXRoIG9sZCBweWRhbnRpYyB0aGVyZSBzaG91bGRuJ3QKPiA+
IGJlIGFueSBidWlsZC9ydW50aW1lIGlzc3VlcyBhcyB0aGV5IHdvdWxkIG5vdCBjb25mbGljdCBp
biBhbnkgd2F5Lgo+ID4KPiA+ID4gSWYgdGhhdCBtYWtlcyBweWRhbnRpYy1vbGQgZmFpbCB0byBi
dWlsZCBvciBydW4sIHRoYXQgaXMgd2hhdCB3ZSBjYXJlCj4gPiA+IGFib3V0Lgo+ID4gV2h5IHdv
dWxkIGl0IG1ha2UgcHlkYW50aWMtb2xkIGZhaWw/IFRoZSBweWRhbnRpYy1jb3JlIHBhY2thZ2Ug
dXNlcyBhCj4gPiBkaWZmZXJlbnQgbW9kdWxlIG5hbWVzcGFjZSB3aGljaCBpcyB0eXBpY2FsbHkg
aG93IHB5dGhvbiBwYWNrYWdlcwo+ID4gcHJldmVudCBpbXBvcnQgY29uZmxpY3RzIGluIGdlbmVy
YWwuCj4gPgo+ID4gVG8gaW1wb3J0IGZyb20gcHlkYW50aWMtY29yZSB5b3UgaW1wb3J0IGxpa2U6
Cj4gPiBmcm9tIHB5ZGFudGljX2NvcmUgaW1wb3J0IFNjaGVtYVZhbGlkYXRvciwgVmFsaWRhdGlv
bkVycm9yCj4gPgo+ID4gVG8gaW1wb3J0IGZyb20gcHlkYW50aWMgeW91IGltcG9ydCBsaWtlOgo+
ID4gZnJvbSBweWRhbnRpYyBpbXBvcnQgQmFzZU1vZGVsCj4gPgo+ID4gTmV3IHB5ZGFudGljIHNp
bXBseSBpbnRlcm5hbGx5IGltcG9ydHMgZnJvbSBweWRhbnRpY19jb3JlIGJ1dCBvbGQKPiA+IHB5
ZGFudGljIGRvZXMgbm90IGFuZCB3aWxsIGZ1bmN0aW9uIHRoZSBzYW1lIHdoZXRoZXIgb3Igbm90
IHdlIGhhdmUKPiA+IHB5ZGFudGljX2NvcmUgaW5zdGFsbGVkLgo+Cj4gU28sIHB5ZGFudGljLWNv
cmUgZG9lcyBub3QgcHJvdmlkZSBhIHN1YnNldCBvZiB0aGUgbW9kdWxlcyBwcmV2aW91c2x5IGlu
Cj4gcHlkYW50aWMsIHNvIHRoZXJlIHdpbGwgbm90IGJlIGEgY29uZmxpY3QuCgpXZWxsIHRvIGNs
YXJpZnkgcHlkYW50aWMtY29yZSBsaWtlbHkgaW1wbGVtZW50cyBhIHN1YnNldCBvZiB0aGUgZnVu
Y3Rpb25hbGl0eSBpbgpvbGQtcHlkYW50aWMsIGhvd2V2ZXIgYnkgdXNpbmcgYSBkaWZmZXJlbnQg
bW9kdWxlIG5hbWVzcGFjZSB0aGVyZSBpcyBubwpjb25mbGljdC4KCgo+Cj4gVGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb25zLiA6LSkKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0t
Cj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
