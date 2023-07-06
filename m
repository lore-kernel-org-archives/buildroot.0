Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A944DEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245D4606A0;
	Thu,  6 Jul 2023 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 245D4606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPAAQi1doIoW; Thu,  6 Jul 2023 21:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39640607D6;
	Thu,  6 Jul 2023 21:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39640607D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAD9A1BF379
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9315B82299
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 21:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9315B82299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6UqhWVbNbtY for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 21:06:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9256821F4
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9256821F4
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 21:06:03 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b71cdb47e1so1098956a34.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 14:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677562; x=1691269562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snqBpI/YjMr9ICELVuW5LynukIjNbq3qk3q97XRrALk=;
 b=Vjz+idYwR4Gr/s2FiKIFY5Getz5CuzdW0Mayy+uOqTEjnIrhyUMeBPrixfiK8ox9UZ
 iFnufRj1I+YC+Cwrj+7CfCzj5hnnLLXe+5XUFukHfnaYVizsOcrivZ2r6ZgQ83fM+SGG
 1pg/CMQ9zJ5XR1QqhwrwBDpYm8dTn8Npp3LwgB/tkaWtFJafiepiRjf/wmqKBY3WyAwp
 caCj9yKjbrM1ss8+eh1Cp8Z/5u8tPoyx5c+Tz2GxjZsncCzlGYLafGrm1bhnTq8MCJa5
 Qwn0geq9wF59pGNiA9l5AQfGGGd+4rfJS8v0MfDGLYh8nEQCmYwODi+opM3a9mZ+pljS
 RrEg==
X-Gm-Message-State: ABy/qLYnQlqNiK0nafI4m62Ckc2wNqacscOTJyZ/3XiH2lM1kXQfJbgh
 /TE0DiiN95WfxPgNunjJbnv8QBiDig8m2Hhymi3/tHfv8wY=
X-Google-Smtp-Source: APBJJlHJiVlRzLSbxq/aH8pjyvvx+8+BHeO2Mw17jMpINprYQCXvBmEdb6BSkQOT39J4Fo/rSYY5gMiZUppx0z5pT24=
X-Received: by 2002:a05:6871:6a4:b0:1b0:19a4:63f5 with SMTP id
 l36-20020a05687106a400b001b019a463f5mr4325455oao.52.1688677562600; Thu, 06
 Jul 2023 14:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
 <20230703205631.4dd121b0@windsurf>
 <38008674-4a63-4223-84d1-c55aa52f023b@mind.be> <20230706202840.GB2664@scaer>
In-Reply-To: <20230706202840.GB2664@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Jul 2023 15:05:50 -0600
Message-ID: <CADvTj4odf80nmk9rocLKstv4W9Er4ggqR6WoNpQzApBrwUCydA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677562; x=1691269562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snqBpI/YjMr9ICELVuW5LynukIjNbq3qk3q97XRrALk=;
 b=j01g5ih4x712q55ZHE8rQAuNShscyY2aGhUni6A4Jiw0e8vFc+LmU52NAeqISnXEf3
 oE69Qj2/lebUEE5kIGCEry48T46jJhS2apsEXSeX73CVHNQOtn/tSnTF+ijAayc+sKYt
 GRfJ5+WS4Z0OnN5/N5CYSTeuWNIPtsWCmQ3J0wrTONtVIgfwIL1qUUyHzPUBu763mYT1
 L6A7gajumNFuDOhXK3WSN5HSHdutR7mIsh42D5dj705Dmb/BalLiOrZ4u+YHBZV/gFXa
 9yz+F8hkRLv9uIaSkrVgr8qcQqqJsU8CFDP66IQyvSBYVs97cUFg5lLS4MILUYd+3p/9
 blhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j01g5ih4
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCAyOjI44oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gQXJub3V0LCBBbGwsCj4KPiBPbiAyMDIzLTA3LTA0
IDIyOjI4ICswMjAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBzcGFrZSB0aHVzbHk6Cj4gPiBPbiAw
My8wNy8yMDIzIDIwOjU2LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+ID4gPk9uIE1vbiwgMyBK
dWwgMjAyMyAyMDoyMDozMSArMDIwMAo+ID4gPkFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+ID5IdSwgdGhpcyB3YXMg
bm90IGluIHRoZSBwYXRjaCBmcm9tIFJvbWFpbiBJIGJlbGlldmUuCj4gPiA+PisgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfUFlUSE9OX1dIRUVMICMgcnVudGltZQo+ID4gPlRoaXMgaXMgbm90IGNvcnJl
Y3QsIHRoZXJlIGlzIG5vIHN1Y2ggc3ltYm9sIGluIEJ1aWxkcm9vdCwgYW5kIGl0Cj4gPiA+Y2F1
c2VzIGEgY2hlY2stc3ltYm9sIGVycm9yOgo+ID4gPmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDU4NjE0NDg0OAo+ID4gPldoYXQgd2FzIHRoZSBtb3Rp
dmF0aW9uIGJlaGluZCB0aGlzIGFkZGl0aW9uYWwgc2VsZWN0Pwo+ID4KPiA+ICBCZWNhdXNlIHNl
dHVwdG9vbHMgaGFzIGEgcnVudGltZSBkZXBlbmRlbmN5IG9uIHdoZWVsLiBUaGUgcGVwNTE3Cj4g
PiBpbmZyYXN0cnVjdHVyZSBkb2VzIGEgYnVpbGQtdGltZSBjaGVjayBvZiB0aGlzIHJ1bnRpbWUg
ZGVwZW5kZW5jeSwgYnV0IGR1ZQo+ID4gdG8gdGhlIHdheSB3ZSBydW4gcHl0aG9uLCB0aGUgYnVp
bGQtdGltZSBjaGVjayBsb29rcyBhdCB3aGF0IGlzIGluc3RhbGxlZAo+ID4gZm9yIHRoZSBob3N0
LCBub3Qgd2hhdCBpcyBpbnN0YWxsZWQgZm9yIHRoZSB0YXJnZXQuIFRoZXJlZm9yZSwgd2UgaGF2
ZSBhCj4gPiBkZXBlbmRlbmN5IG9uIGhvc3QtcHl0aG9uLXdoZWVsIGluc3RlYWQgb2YgdGFyZ2V0
IHB5dGhvbi13aGVlbC4KPiA+Cj4gPiAgU2luY2Ugc2V0dXB0b29scyBjbGVhcmx5IGRlZmluZXMg
dGhhdCBpdCBoYXMgYSBkZXBlbmRlbmN5IG9uIHdoZWVsLCBJCj4gPiB0aG91Z2h0IGl0IGxvZ2lj
YWwgdGhhdCB3ZSB3b3VsZCByZWZsZWN0IHRoYXQgZGVwZW5kZW5jeSBpbiBCdWlsZHJvb3QgYXMK
PiA+IHdlbGwuIEl0IGlzIHJlYWxseSBhIHJ1bnRpbWUgZGVwZW5kZW5jeSwgbm90IGEgYnVpbGQt
dGltZSBkZXBlbmRlbmN5LCBzbyBJCj4gPiBhZGRlZCB0aGlzIHNlbGVjdCBsaWtlIHdlIGRvIGZv
ciBydW50aW1lIGRlcGVuZGVuY2llcy4KPiA+Cj4gPiAgT2YgY291cnNlLCBJIGRpZG4ndCBub3Rp
Y2UgdGhhdCB3ZSBkb24ndCBoYXZlIGEgdGFyZ2V0IHB5dGhvbi13aGVlbAo+ID4gcGFja2FnZSwg
c28gaXQgZG9lc24ndCBhY3R1YWxseSB3b3JrLgo+ID4KPiA+ICBTbywgZHJvcHBpbmcgdGhpcyBz
ZWxlY3QgSSdtIHByZXR0eSBzdXJlIGlzIGdvaW5nIHRvIGJyZWFrIHNvbWV0aGluZywgYXQKPgo+
IERyb3BwaW5nIHRoZSBzZWxlY3QgY2FuIG5vdCBicmVhayBhbnl0aGluZzogdGhlcmUgaXMgbm8g
cGFja2FnZSB0bwo+IHNlbGVjdCB0byBiZWdpbiB3aXRoLiBTbyBpdCBjYW4ndCBiZSBtb3JlIGJy
b2tlbiB0aGFuIGl0IHdhcyBiZWZvcmUgdGhlCj4gc2VsZWN0IHdhcyBpbnRyb2R1Y2VkLgo+Cj4g
T2YgY291cnNlLCBpZiB3ZSByZWFsbHkgbmVlZCB3aGVlbCBhcyBhIHRhcmdldCBwYWNrYWdlLCB0
aGVuIGl0IHNob3VsZAo+IGJlIG1hZGUgc3VjaCBhIHBhY2thZ2UgYmVmb3JlIHdlIGNhbiBzZWxl
Y3QgaXQuCgpJIGRvbid0IHRoaW5rIHdlIG5lZWQgYSB0YXJnZXQgd2hlZWwgYXMgd2hlZWwgaXMg
b25seSByZWFsbHkgdXNlZCBmb3IKcGVwNTE3IGJ1aWxkcyhhbmQgd2UgZG9uJ3QgaGF2ZSBhIHRh
cmdldCBwZXA1MTcgdG9vbGNoYWluL2Zyb250ZW5kKS4KCj4KPiBBbHRob3VnaCBoYXZpbmcgc2hl
ZWwgb24gdGhlIHRhcmdldCBqc3V0IGJlY2F1c2Ugc29tZSAobW9zdD8pIHBhY2thZ2VzCj4gaGF2
ZSBhIHNwdXJpb3VzIGRlcGVuZGVuY3kgb24gaXQsIHdvdWxkIGJlIHNlcmlvdXNseSBhIHNoYW1l
Li4uCj4KPiA+IHNvbWUgcG9pbnQuIEkndmUgbG9va2VkIGEgYml0IGNsb3NlciBub3csIGFuZCBp
dCB0dXJucyBvdXQgdGhhdCB3aGVlbCBpcwo+ID4gYWN0dWFsbHkgb25seSBpbXBvcnRlZCBpbiBv
bmUgc3BlY2lmaWMgZnVuY3Rpb24sIGluIHRoZSAiZWRpdGFibGVfd2hlZWwiCj4gPiBjb21tYW5k
LiBTbyBpdCdzIHF1aXRlIHVubGlrZWx5IGFueW9uZSB3aWxsIGV2ZXIgc2VlIHRoaXMgYnJlYWth
Z2UuCj4gPgo+ID4gIEhvd2V2ZXIsIG5vdyBJIGxvb2sgYSBiaXQgbW9yZSBpbiBkZXRhaWwgYXQg
aXQsIGl0IGxvb2tzIGxpa2UgdGhpcyBjb21taXQKPiA+IGlzIGluIGZhY3QgYm9ndXMsIGFuZCBZ
YW5uJ3Mgb3JpZ2luYWwgY29tbWVudCB0aGF0IHRoZSB3aGVlbCBkZXBlbmRlbmN5Cj4gPiBzaG91
bGQgYmUgYWRkZWQgdG8gdGhlIGluZnJhc3RydWN0dXJlIGlzIGluIGZhY3QgY29ycmVjdC4gRnJv
bSB0aGUKPiA+IGRvY3VtZW50YXRpb246Cj4gPgo+ID4gICAgSGlzdG9yaWNhbGx5IHRoaXMgZG9j
dW1lbnRhdGlvbiBoYXMgdW5uZWNlc3NhcmlseSBsaXN0ZWQgYGB3aGVlbGBgCj4gPiAgICBpbiB0
aGUgYGByZXF1aXJlc2BgIGxpc3QsIGFuZCBtYW55IHByb2plY3RzIHN0aWxsIGRvIHRoYXQuIFRo
aXMgaXMKPiA+ICAgIG5vdCByZWNvbW1lbmRlZC4gVGhlIGJhY2tlbmQgYXV0b21hdGljYWxseSBh
ZGRzIGBgd2hlZWxgYCBkZXBlbmRlbmN5Cj4gPiAgICB3aGVuIGl0IGlzIHJlcXVpcmVkLCBhbmQg
bGlzdGluZyBpdCBleHBsaWNpdGx5IGNhdXNlcyBpdCB0byBiZQo+ID4gICAgdW5uZWNlc3Nhcmls
eSByZXF1aXJlZCBmb3Igc291cmNlIGRpc3RyaWJ1dGlvbiBidWlsZHMuCj4gPgo+ID4gQW5kIGl0
J3MgcHJldHR5IGNsZWFyIHdoYXQgaXMgYWRkaW5nIHRoaXMgZGVwZW5kZW5jeTogdGhlIHBlcDUx
NyBpbmZyYSBjYWxscwo+ID4gdGhlIGJ1aWxkIHdpdGgKPiA+Cj4gPiAgICBweXRob24gLW0gYnVp
bGQgLW4gLXcKPiA+Cj4gPiBUaGUgIi13IiBzdGFuZHMgZm9yICJidWlsZCBhIHdoZWVsIiBhbmQg
SSBndWVzcyBpdCdzIG9idmlvdXMgdGhhdCB0aGF0Cj4gPiBpbXBsaWVzIGEgZGVwZW5kZW5jeSBv
biBob3N0LXB5dGhvbi13aGVlbD8gQW5kIEkgZ3Vlc3MgdGhhdCB0aGUgcmVsYXRpdmVseQo+ID4g
ZmV3IHBlcDUxNyBwYWNrYWdlcyB3ZSBoYXZlIGFscmVhZHkgaGF2ZSBhIHNldHVwdG9vbHMtYmFz
ZWQgcGFja2FnZSAoYW5kCj4gPiB0aGVyZWZvcmUgaG9zdC1weXRob24tc2V0dXB0b29scyBhbmQg
aG9zdC1weXRob24td2hlZWwpIHNvbWV3aGVyZSBpbiB0aGVpcgo+ID4gZGVwZW5kZW5jeSBjaGFp
bi4KPiA+Cj4gPiAgU28sIEkgZG8gdGhpbmsgdGhpcyBkZXBlbmRlbmN5IHNob3VsZCBtb3ZlIHRo
ZSB0aGUgcGtnLXB5dGhvbiBpbmZyYSBfZm9yCj4gPiBwZXA1MTcgcGFja2FnZXNfLCBhcyBZYW5u
IG9yaWdpbmFsbHkgY29tbWVudGVkLgo+Cj4gSSdkIGRlZmVyIHRvIEphbWVzIHRvIGZpbmQgYSBi
ZXR0ZXIgc29sdXRpb24sIGJlY2F1c2UgSSBkb24ndCBncmFzcCBldmVuCj4gcGFydGlhbGx5IGFs
bCB0aGlzIHBlcDUxNy1pbnRyb2R1Y2VkIHBhaW4uLi4KCkkgdGhpbmsgdGhlIGhvc3QtcHl0aG9u
LXdoZWVsIGJ1aWxkIGRlcGVuZGVuY3kgaXMgc3VmZmljaWVudCBmb3IKdGFyZ2V0IHNldHVwdG9v
bHMsCnNldHVwdG9vbHMgdXNlcyBhbiBpbi10cmVlIHNldHVwdG9vbHMgcGVwNTE3IGJhc2VkIGJ1
aWxkIHdpdGggd2hlZWwgYXMgYSBidWlsZApkZXBlbmRlbmN5LgoKU2VlOgpodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2Jsb2IvdjY4LjAuMC9weXByb2plY3QudG9tbCNMNApodHRw
czovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL2Jsb2IvdjY4LjAuMC9zZXR1cHRvb2xzL2J1
aWxkX21ldGEucHkjTDM0MQoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4g
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
