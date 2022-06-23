Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28514C43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7258A42515;
	Thu, 23 Jun 2022 13:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7258A42515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZE-a4i346Bj; Thu, 23 Jun 2022 13:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152F5424F6;
	Thu, 23 Jun 2022 13:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152F5424F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A37A21BF39A
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 770C4613FB
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 13:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770C4613FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2BkXIaaka0y for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 13:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F070C613E2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F070C613E2
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 13:01:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n1so27598269wrg.12
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 06:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W8MPUAa5v1a4rOzk3nmFRPl+1wTnEKMS/Ptra7K+5u8=;
 b=In6tk0V75g2XoTIirv97fKGc+BETQTHep6w0db9fyiWksoGjCt5FUXikXg8YOm7sar
 cfgv1soF/FZGdQ+4Ig3xtkfIjKo/vKK56ImZIkLg9P4s73dspr1KBG8AaYHef+tlISaT
 Y+5HOeg2bXNSKCoS8LXz7ti4COgobbVEKlxmza/9IKgoVpoF2QJNiF1ZlrVHUe6FVOQX
 mokDmOW533VHcrSzLDyJCdxbh06i+s3EUvCEMUuE2zzwHxtY5nAwvxz2iNNR9ANo20yF
 iOEQQGJ7dLNH5C9fwswNOnWy4KUS0eEEeN4pKbrDRDsdFTUK0yhV4gQylt+udKkYuhxf
 IGLA==
X-Gm-Message-State: AJIora9LCNUgPbTRfv0RSgdYxGXOfpgSxqnET4QAR9I89udXqf2eQE8k
 r/0OfOjgYgWAO+VD+jJ0Ij9zMYpq7P0c0dziZ9PnjY5k
X-Google-Smtp-Source: AGRyM1sZMa/j3xtmSx6ly3qtgB9dly3uWjNuNLwPGC62bIXtf6VqvXqgsfqWTkIZSWs8lTWYY46wFDr8xIJylXQAVBI=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr8365800wrc.315.1655989270772; Thu, 23
 Jun 2022 06:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220621203415.3601501-1-clg@kaod.org>
In-Reply-To: <20220621203415.3601501-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 13:00:58 +0000
Message-ID: <CACPK8Xd_CA_TU1v90f8OstUVo7dCSXuu_kRZEE7Pp2exEgm7sw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jeremy Kerr <jk@ozlabs.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W8MPUAa5v1a4rOzk3nmFRPl+1wTnEKMS/Ptra7K+5u8=;
 b=EqumH9avPn2fKH9c+ClW6RzXBEmQfVzSzuPb2yqPAp8o+PNHeng7qrIBvWqHxTx1GV
 Rjo4RqJoJF4QoRjIfqhhzgVCdAFnP53yyK5ys6CIJJ7U0MDyxigTfVXNoqOeCd71jj06
 r0RKfPdPGGaJT3tqg3qP9wWwqu1SrROLtGK+0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=EqumH9av
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/aspeed_ast2600evb: new
 defconfig
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBKdW4gMjAyMiBhdCAyMDozNCwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBUaGUga2VybmVsIGlzIGZyb20gdXBzdHJlYW0gYW5kIFUtQm9vdCBp
cyBmcm9tIHRoZSBPcGVuQk1DIGJyYW5jaAo+IGJlY2F1c2UgbWFpbmxpbmUgZG9lc24ndCBoYXZl
IHRoZSByZXF1aXJlZCBzdXBwb3J0IGZvciBIVywgeWV0Lgo+Cj4gVGhlIG1haW4gcmVzdWx0aW5n
IGZpbGUgZnJvbSB0aGUgYnVpbGQgaXMgYSBmbGFzaCBpbWFnZS4gVGhlIHBhcnRpdGlvbgo+IGxh
eW91dCBtYXRjaGVzIHRoZSBPcGVuQk1DIG9uZSBmb3IgNjRNIGNoaXBzLiBJdCBtYWtlcyBpdCBl
YXNpZXIgdG8KPiB1cGRhdGUgdGhlIGRpZmZlcmVudCBwYXJ0aXRpb25zIGZyb20gTGludXguIElu
dGVybWVkaWF0ZSBmaWxlcyBjYW4gYmUKPiB1c2VkIHRvIGJvb3QgZnJvbSBVLWJvb3Qgb3ZlciB0
aGUgbmV0d29yayBvciB0byBib290IFFFTVUgdXNpbmcKPiAta2VybmVsLy1pbml0cmQvLWR0Yi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpSZXZp
ZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCj4gZGlmZiAtLWdpdCBhL2Jv
YXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9nZW5pbWFnZS5jZmcgYi9ib2FyZC9hc3BlZWQvYXN0MjYw
MC1ldmIvZ2VuaW1hZ2UuY2ZnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjU2OTMyZDQ3ODc1Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib2FyZC9hc3BlZWQv
YXN0MjYwMC1ldmIvZ2VuaW1hZ2UuY2ZnCj4gQEAgLTAsMCArMSw0MCBAQAo+ICsjCj4gKyMgVGhp
cyBjb25maWcgcmVwcm9kdWNlcyB0aGUgT3BlbkJNQyBmbGFzaCBsYXlvdXQgZGVmaW5lZCBpbiBM
aW51eCA6Cj4gKyMKPiArIyAgICBhcmNoL2FybS9ib290L2R0cy9vcGVuYm1jLWZsYXNoLWxheW91
dC02NC5kdHNpCj4gKyMKPiArIyBhbmQgaW5jbHVkZWQgYnkgYXNwZWVkLWFzdDI2MDAtZXZiLmR0
cwo+ICsjCj4gK2ZsYXNoIG5vci02NE0tMjU2IHsKPiArICAgICAgIHBlYnNpemUgPSA0Swo+ICsg
ICAgICAgbnVtcGVicyA9IDE2Swo+ICsgICAgICAgbWluaW11bS1pby11bml0LXNpemUgPSAyNTYK
PiArfQo+ICsKPiAraW1hZ2UgZmxhc2guaW1nIHsKPiArICAgICAgIGZsYXNoIHsKPiArICAgICAg
IH0KPiArICAgICAgIGZsYXNodHlwZSA9ICJub3ItNjRNLTI1NiIKPiArCj4gKyAgICAgICBwYXJ0
aXRpb24gdWJvb3Qgewo+ICsgICAgICAgICAgICAgICBpbWFnZSA9ICJ1LWJvb3QuYmluIgoKVGhp
cyB3b3JrcyB3aXRoIHRoZSBjb25maWcgeW91J3JlIHVzaW5nLiBJZiB3ZSB3ZW50IHRvIHVwc3Ry
ZWFtIHdlCndvdWxkIG5lZWQgdG8gY29uc3RydWN0IHRoaXMgZnJvbSB0aGUgU1BMICsgdS1ib290
LUZJVC4KCj4gKyAgICAgICAgICAgICAgIHNpemUgPSA4OTZLCj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgcGFydGl0aW9uIHVib290ZW52IHsKPiArICAgICAgICAgICAgICAgLyogVE9ETyAqLwo+
ICsgICAgICAgICAgICAgICBvZmZzZXQgPSA4OTZLCj4gKyAgICAgICAgICAgICAgIHNpemUgPSAx
MjhLCj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcGFydGl0aW9uIGZpdGltYWdlIHsKPiArICAg
ICAgICAgICAgICAgaW1hZ2UgPSAiaW1hZ2UuaXRiIgo+ICsgICAgICAgICAgICAgICBvZmZzZXQg
PSAxTQo+ICsgICAgICAgICAgICAgICBzaXplID0gOU0KPiArICAgICAgIH0KPiArCj4gKyAgICAg
ICBwYXJ0aXRpb24gc3BhcmUgewo+ICsgICAgICAgICAgICAgICBvZmZzZXQgPSAxME0KPiArICAg
ICAgICAgICAgICAgc2l6ZSA9IDU0TQo+ICsgICAgICAgfQo+ICt9Cgo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jZDA1OGFkMGFjMjgKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKPiBAQCAtMCwwICsx
LDQ0IEBACj4gKyMgQXJjaGl0ZWN0dXJlCj4gK0JSMl9hcm09eQo+ICtCUjJfY29ydGV4X2E3PXkK
PiArQlIyX0FSTV9GUFVfVkZQVjQ9eQoKTmljZS4gVGhpcyB3b3JrcyBvbiBoYXJkd2FyZSBhbmQg
aW4gcWVtdSBJIGFzc3VtZT8gSmVyZW15IHdhcyBhc2tpbmcKYWJvdXQgdGhlIGNvcnJlY3QgRlBV
IGNvbmZpZyBmb3IgdGhlIDI2MDAgdGhlIG90aGVyIGRheS4KCj4gKyMgQm9vdAo+ICtCUjJfVEFS
R0VUX1VCT09UPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4g
K0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15Cj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9N
X1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy91LWJvb3QuZ2l0Igo+ICtCUjJf
VEFSR0VUX1VCT09UX0NVU1RPTV9SRVBPX1ZFUlNJT049ImYyYjgyZmE0YmExN2VkODA5MWZlNzZj
Mjg0MjIwMDA2NjQ1YTI5M2IiCj4gK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJl
dmItYXN0MjYwMCIKPiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+ICtCUjJfVEFSR0VU
X1VCT09UX0NVU1RPTV9NQUtFT1BUUz0iREVWSUNFX1RSRUU9YXN0MjYwMGExLWV2YiIKClRoaXMg
Y291bGQgYmUgImFzdDI2MDAtZXZiIiwgd2hpY2ggaXMgcHJldHR5IG11Y2ggdGhlIHNhbWUgYXMg
dGhlIGExCmRldmljZSB0cmVlIGJ1dCBpcyBpbnRlbmRlZCBmb3IgYWxsIG5vbi1hMCBib2FyZHMu
Cgo+ICsKPiArQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15Cj4gK0JSMl9QQUNLQUdFX0hP
U1RfVUJPT1RfVE9PTFNfRklUX1NVUFBPUlQ9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdF
PXkKPiArCj4gKyMgVGFyZ2V0IHRvb2xzCj4gK0JSMl9QQUNLQUdFX01URD15Cj4gLS0KPiAyLjM1
LjMKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
