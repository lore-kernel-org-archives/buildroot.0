Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C17E9271F
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9167360586;
	Sat, 27 Dec 2025 22:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EE61A2S_WRhA; Sat, 27 Dec 2025 22:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A455E606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766874167;
	bh=fN0f+/9gF7EKUpjXJKOeMYYMgAoCKwDyWhQEuKrE75A=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLzuVNvsZVdT6HYGtRVH2KDsOgnrfHxexoPRjl02gMyiuiOESpxql/2epYV4/lZIe
	 Xe09zAezEF9EwBlqvOeWEI4uwx7u6CM08T7Mm3GVc8TOqfIQWVyEbGq2fZ9Jpekqfh
	 0uXi3l4WCZ40LQf3WtZUz6aKCqM9q2PfaFj0kVzTgebdGudA68jm7h4kTqagOuzHcZ
	 60PD2PyvNvhCY19tWIT34/OyjQxm4DXBMD8FXbDUc2CZNUAeL9c01DgZJK8HJG10SB
	 g0mPMV6SEJQ9u25ajlGJ1qrXdEoj24T5d0hoNRu5oGEx+/PE3DcpDIu8o00jzydGss
	 dlVuF6ZYFA2Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A455E606B4;
	Sat, 27 Dec 2025 22:22:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B03FEB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2478403D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnYXZ6cCAw6J for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5802F400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5802F400F8
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5802F400F8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:22:41 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id ZcgIvruGYlGpsZcgJvNhBo; Sat, 27 Dec 2025 23:22:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 27 Dec 2025 23:22:38 +0100
Message-Id: <01A17CA6-837C-4A7A-96DB-17FAAE4427F9@benettiengineering.com>
References: <5c8413af4f66767e5c3b1f4e0853aabb@free.fr>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <5c8413af4f66767e5c3b1f4e0853aabb@free.fr>
To: Julien Olivain <ju.o@free.fr>
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfHfWnDqdqWKaGcac574hwpxlztU4Y9eb1JF5vAs3lhV0bbW0HwV8GSHGBBsr5lZXUIHLzkPybSjMwBa/c/O9CozLZ0FX6EZsOg3dXldp/5CTwjP+s6hH
 ByEYhI4+hsjm62hU2ZPKuRBRNJ+lTh4fW6S3EDAn2HEIFR1bxzVNzPjWlVczAWedRBkDobp3PYjyIyWBtyNwTkdiF72RFSJu5g9+fnMqX+H5c9aoVLohPjcr
 Eyc0Cr/P+aC0TNtsI/n9sX8Sm+TzKy7gESSarl4z6aY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766874159; bh=qf2Q85DfMrsaibaXu2cxmpRVrDot+Fw+3LwkN8PPfoY=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=WPeB6uxW8UFw8uQSVmVNKrOCCrPEJpIxI5LmsKNxONAe569TR+04sOA8ig3fiWUHE
 JDgyd697P/FjtjT2Yhj0TqvOezjXOxe8uSXlgDXNu5wy0DxByoGlMvfu+8PekyUfw9
 4XSTLxIrT1tMX+zJeXC9cX8TMqCSSoQdr49heN5r2RqF6nfS/h/l8gRUhpZDhd8Vn+
 QNqtQHGb0yZgGAwI8P/6yD8RXkE4ZgWhWAL10MkCspr0eJr+/+X/EaqHinuV+Jgpv4
 aufhruPplbGd97eBhwI+hzBWDoL6SMy1iaa6pH++kVcjAWklVKlROZFPfmxf2wMR44
 MGiKyUVqgMoKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WPeB6uxW
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: fix build failure due
 to local patch
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKPiBJbCBnaW9ybm8gMjcgZGljIDIwMjUsIGFsbGUgb3JlIDIyOjM5LCBKdWxp
ZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hpIEdpdWxpbywK
PiAKPj4gT24gMTQvMTIvMjAyNSAyMjoxNSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IExvY2Fs
IHBhdGNoIGhhc24ndCBiZWVuIHJlbW92ZWQgd2hpbGUgYnVtcGluZyBwYWNrYWdlIHZlcnNpb24g
cmVzdWx0aW5nCj4+IGludG8gYnVpbGQgZmFpbHVyZS4gU28gbGV0J3MgZHJvcCBsb2NhbCBwYXRo
IHRvIGZpeCBidWlsZCBmYWlsdXJlLgo+IAo+IFlvdSBhcmUgbm90IHNheWluZyB3aGljaCBCdWls
ZHJvb3QgY29tbWl0IGJ1bXBlZCB0aGUgcGFja2FnZSB2ZXJzaW9uIHdpdGhvdXQKPiByZW1vdmlu
ZyB0aGUgcGFja2FnZSBwYXRjaC4gSSBiZWxpZXZlIHlvdSBhcmUgcmVmZXJyaW5nIHRvOgo+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTEw
MTIyMjMwNDcuMzMyMzUzMS0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20v
Cj4gCj4gVGhpcyBwYXRjaCB3YXMgbm90IG1lcmdlZCBpbiBCdWlsZHJvb3QsIHVudGlsIG5vdy4K
PiBJIGp1c3QgYXBwbGllZCBpdCBpbjoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9jb21taXQvZDYwZGM1ZTYxODRkZDI3NDBmYjMzZjZiYzdhYThjNmE3NmIz
NWQ3Ygo+IAo+IFNvIEkgYmVsaWV2ZSB0aGlzIHBhdGNoIGlzIG5vdCBuZWVkZWQgYW55bW9yZS4K
CllvdXIgYXNzdW1wdGlvbiBpcyBjb3JyZWN0LiBUaGFua3MgZm9yIHRha2luZyBjYXJlIGFuZCBz
b3JyeSBmb3IgdGhlIG5vaXNlIQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPj4gU2lnbmVkLW9m
Zi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
