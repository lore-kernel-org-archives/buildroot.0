Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08CAC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5824065E;
	Sun, 18 Feb 2024 13:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8azJYNu4dGk; Sun, 18 Feb 2024 13:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8392840661
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8392840661;
	Sun, 18 Feb 2024 13:30:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076781BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E53608E7
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZ4j_iSVF6tj for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8772360675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8772360675
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8772360675
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:30:29 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so3816843276.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708263028; x=1708867828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fYI21+9y/a7i9tMELzgec31ph2FGaC/w7eHRHIZ+I4=;
 b=sNfWiOg+/lD1kC12VR5z0EU32L7wMXkbpWLWVzgHPgSsSwUct+BcqifhPeOBxEr2Sq
 4vXIc7d9OPE3lITu7bxcFG85r6tLRAPiRaTk+zPgyU74ygIRgqfj/Qk5xTrti7pCyVOE
 VQ4RtQftYEJfDhniSpryDwLtLDBzbGPAAcUptDV1ooHLb5GKrh1FoPU30gj267GEWx+6
 rwFnYNb8YwK4+STg1Z2/Q1b8WcHKiDJwS5koeoBiYygQQJQxWoSPJWNxTjHYSYsYDpA1
 I5Uhif3lRM3O1OfPACxqO6PVYyPjeW8/Cgbknq/dzlljor6XjbnDjLfXUBjCxPC1myks
 q6Xw==
X-Gm-Message-State: AOJu0YxQeH0Rpor/b68GLegNakGbYZjWC9mqy+PnzwQWBH3RQZ67mezY
 itSu3fOe7Y2/XRZhKm0j7MsodTa0okv4A6N7lG1H8sUWs9A0+qr0oJk02L0rNczVXJnVktx4MXN
 F+8ieha71OcOIpUHjo2XXM/WdLrAN0sXxGVw4uw==
X-Google-Smtp-Source: AGHT+IFuZHsGCnFOgfAg1k2TO3R0Mh/bxdurlZTZgE8JjwIqHBtZa4kRbLdRCNqnxw6JNAc4bXy2nBg7eBoPGE86TQ8=
X-Received: by 2002:a25:b9c7:0:b0:dc6:23ac:9ef2 with SMTP id
 y7-20020a25b9c7000000b00dc623ac9ef2mr6461560ybj.19.1708263026947; Sun, 18 Feb
 2024 05:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
 <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
In-Reply-To: <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:30:16 +0100
Message-ID: <CABGWkvrHAXAoQWPx2SqxqOzVitE0W05t5HvERvaBrPHxH7BdUg@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708263028; x=1708867828;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fYI21+9y/a7i9tMELzgec31ph2FGaC/w7eHRHIZ+I4=;
 b=nAcqQSkd1BCQk7G04RS5g6IlqrEHEmz7sE5TznrwzXuj0aELgt1dY9Uex+VJzl1/Tf
 zsK6k+NrWEyWXEohDU6UrArRKz1RilHoP+me9DQ4yEFXd+vbI9rZrKVO91FhRR1l6j9a
 2SpnLmJ+GfUDXixBTs24IKG9UIMNp7k/hD+YE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nAcqQSkd
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgNjoyOOKAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBE
YXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8gQmluYWNj
aGkgd3JvdGU6Cj4gPiBSZWNlbnQgdmVyc2lvbnMgb2YgVS1Cb290IGFyZSBjYXBhYmxlIG9mIGJ1
aWxkaW5nIHRpYm9vdDMuYmluIHVzaW5nCj4gPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3Mg
Y29weSBpdCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NDAyMTMxNzI4MTcuMjg3Mjg0OS0xMi1yb21haW4ubmFvdXJAc21pbGUuZnIvCj4KPiBsb29rcyBt
b3JlIGNvbXBsZXRlIHdpdGggc3lzZncuaXRiPwoKSW4gbXkgdXNlIGNhc2UsIHRoZXJlIHdhcyBu
byBuZWVkIGFzIGl0IHdhcyBuZWNlc3NhcnkgdG8gZW5hYmxlCnRpLWszLWJvb3QtZmlybXdhcmU6
CgpkZWZpbmUgVElfSzNfQk9PVF9GSVJNV0FSRV9JTlNUQUxMX0lNQUdFU19DTURTCmNwIC1kcGZy
ICQoQEQpL3RpLXN5c2Z3ICQoQklOQVJJRVNfRElSKS8KY3AgLWRwZnIgJChARCkvdGktZG0gJChC
SU5BUklFU19ESVIpLwplbmRlZgoKPgo+ID4gLS0tCj4gPgo+ID4gQWRkZWQgaW4gdjQKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICBib290L3RpLWszL3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIubWsgfCAzICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy90aS1rMy1yNS1sb2FkZXIvdGktazMt
cjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rCj4gPiBpbmRleCAyYTEwMDI0YWVkYWEuLjY0MzI5OGExZTcwYSAxMDA2NDQKPiA+IC0tLSBh
L2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gKysrIGIv
Ym9vdC90aS1rMy90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPiBAQCAtNzUs
OCArNzUsMTEgQEAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4gPiAgICAgICAk
KFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChUSV9LM19SNV9MT0FERVJfTUFLRSkgLUMgJChARCkg
JChUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTKQo+ID4gIGVuZGVmCj4gPgo+ID4gK1RJX0szX1I1
X0xPQURFUl9TRUNUWVBFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfU0VDVFlQ
RSkpCj4gPiArCj4gPiAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19DTURT
Cj4gPiAgICAgICBjcCAkKEBEKS9zcGwvdS1ib290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1
LXUtYm9vdC1zcGwuYmluCj4gPiArICAgICBmaW5kICQoQEQpIC1uYW1lICJ0aWJvb3QzLSotJChU
SV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4iIC10eXBlIGYgLWV4ZWMgY3Age30gJChCSU5B
UklFU19ESVIpL3RpYm9vdDMuYmluIFw7Cj4gPiAgZW5kZWYKPiA+Cj4gPiAgJChldmFsICQoa2Nv
bmZpZy1wYWNrYWdlKSkKPgo+IC0tCj4gQWxleGFuZGVyIFN2ZXJkbGluLgo+CgoKLS0KCkRhcmlv
IEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2
aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9u
cy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
