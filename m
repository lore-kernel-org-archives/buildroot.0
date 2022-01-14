Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0503CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 12:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7284B60F22;
	Fri, 14 Jan 2022 12:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4I7s6Wfbuk5; Fri, 14 Jan 2022 12:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938D460B48;
	Fri, 14 Jan 2022 12:27:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4D261BF35C
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 12:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B344784BCF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 12:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWsBycVZJAqC for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 12:27:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD21384BCB
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 12:27:42 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h23so12038075iol.11
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 04:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jXG1cPiiNjyWubZNYoPpfgfLuygA5Zfp2hqtqZ0CIBI=;
 b=YbtOcQe/4Kqk6qgiEou7IbCHxRve7koPfiswLHAsHPh+m4+xP9R1ZMdMSuAXc6W2nR
 FwTDsuWGsW9ElSCgZUxuoDf4zArOr36jlbFPumxqWgDEILNdC26gWatdhNIoeCTErwJA
 B+yTIvuptLj1vGxW6IcHBCnRgRnbUNKN90eshU4bGOdoev4ubXuh6OdkAREGNtuifph5
 q7r/TS1/EV/pstgDiQ2sItM6Rcn8CfkZSZ+6V1ADY+JFasAeVEy6734m6B+n1BlsOJ5G
 X4DNG4TZepFS9vSjcK6ZO3YONLFuHg2QPqmNDiqSXAYPSHVEgSvVemSCtAnwJaaSVvzs
 mTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jXG1cPiiNjyWubZNYoPpfgfLuygA5Zfp2hqtqZ0CIBI=;
 b=4qW6RDC4n3fMIrTGwvhn0AE+brpozCAMP5C6u3SJLsnUwNLf3QN7ZLogS5f4SLIbi3
 RqaItonzb3eRqfDKT+fBXI2pi5bu0/Tq4a3UtbrNC0uDVjPDEKcAEeVfniSTHtpE4J3v
 IF4ZPg3+ABsiBnC1uVA0A3bctgiY140lisNWwg03dmNsBMHbvEgKbdV4aykPFlpTWDyn
 T9f6aENRgLupzuxKjtXRvnAchlRSOEBTEVI1L0CEjyT1ad2Rq8g5l9OfIMXwZw21AkQ4
 WtW2bDSQ/nmB2Y9irjBvQ5+tlw2Eu9/KzVWvMMgRRtmtJmMYX57wsQ5gcY17kCfKEKhk
 oo6Q==
X-Gm-Message-State: AOAM533fmOSmUhjr/1wT/caLhLxHiLeFyh/oImD2r5BVIYrzl2zW+gBm
 0RUlbO31Fu4anENLrn76JYIxcNFEFyQRyNnBDeI=
X-Google-Smtp-Source: ABdhPJwZtlkhBZA19pYFdLEdXcOZcEQwI3twQzqxvL1dyMtJQKFEH/Tlla6lc/W3SYMjPw/89v+WwCGuZlB7tof3gLE=
X-Received: by 2002:a6b:1545:: with SMTP id 66mr4112737iov.62.1642163261888;
 Fri, 14 Jan 2022 04:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-3-patrickdepinguin@gmail.com>
 <cd4152f3-72a1-fff8-828e-330c22a353d5@gmail.com>
In-Reply-To: <cd4152f3-72a1-fff8-828e-330c22a353d5@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 14 Jan 2022 13:27:30 +0100
Message-ID: <CAAXf6LX7Lr_ZPA9eCwUbjxWWRFt89A2N7Eq=KcKqKSLDw8Kviw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/4] core: introduce NORMALIZED_ARCH as
 non-kernel replacement for KERNEL_ARCH
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
 Antoine Tenart <atenart@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKRWwganVlLCAxMyBlbmUgMjAyMiBhIGxhcyAyMjozMCwgUm9tYWluIE5hb3Vy
Cig8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IExlIDE4LzA1LzIwMjEg
w6AgMTM6MzYsIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6ljcml0IDoKPiA+IEZyb206IFRo
b21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+
Cj4gPgo+ID4gVGhlIHZhcmlhYmxlICdLRVJORUxfQVJDSCcgaXMgYWN0dWFsbHkgYSBub3JtYWxp
emVkIHZlcnNpb24gb2YKPiA+ICdBUkNIJy8nQlIyX0FSQ0gnLiBGb3IgZXhhbXBsZSwgJ2FyY2xl
JyBhbmQgJ2FyY2ViJyBib3RoIGJlY29tZSAnYXJjJywganVzdAo+ID4gYXMgYWxsIHBvd2VycGMg
dmFyaWFudHMgYmVjb21lICdwb3dlcnBjJy4KPiA+Cj4gPiBJdCBpcyBwcmVzdW1hYmx5IGNhbGxl
ZCAnS0VSTkVMX0FSQ0gnIGJlY2F1c2UgdGhlIExpbnV4IGtlcm5lbCBpcyB0eXBpY2FsbHkKPiA+
IHRoZSBmaXJzdCBwbGFjZSB3aGVyZSBzdXBwb3J0IGZvciBhIG5ldyBhcmNoaXRlY3R1cmUgaXMg
YWRkZWQsIGFuZCB0aHVzIGlzCj4gPiB0aGUgZW50aXR5IHRoYXQgZGVmaW5lcyB0aGUgbm9ybWFs
aXplZCBuYW1lLgo+ID4KPiA+IEhvd2V2ZXIsIHRoZSB0ZXJtICdLRVJORUxfQVJDSCcgY2FuIGFs
c28gYmUgaW50ZXJwcmV0ZWQgYXMgJ3RoZSBhcmNoaXRlY3R1cmUKPiA+IHVzZWQgYnkgdGhlIGtl
cm5lbCcsIHdoaWNoIG5lZWQgbm90IGJlIGV4YWN0bHkgdGhlIHNhbWUgYXMgJ3RoZSBub3JtYWxp
emVkCj4gPiBuYW1lIGZvciBhIGNlcnRhaW4gYXJjaCcuIEluIHBhcnRpY3VsYXIsIGZvciBjYXNl
cyB3aGVyZSBhIDY0LWJpdAo+ID4gYXJjaGl0ZWN0dXJlIGlzIHJ1bm5pbmcgYSA2NC1iaXQga2Vy
bmVsIGJ1dCAzMi1iaXQgdXNlcnNwYWNlLiBFeGFtcGxlcwo+ID4gaW5jbHVkZToKPiA+ICAgICAq
IGFhcmNoNjQgYXJjaGl0ZWN0dXJlLCB3aXRoIGFhcmNoNjQga2VybmVsIGFuZCAzMi1iaXQgKEFS
TSkgdXNlcnNwYWNlCj4gPiAgICAgKiB4ODZfNjQgYXJjaGl0ZWN0dXJlLCB3aXRoIHg4Nl82NCBr
ZXJuZWwgYW5kIDMyLWJpdCAoaTM4NikgdXNlcnNwYWNlCj4gPgo+ID4gSW4gc3VjaCBjYXNlcywg
dGhlICdhcmNoaXRlY3R1cmUgdXNlZCBieSB0aGUga2VybmVsJyBuZWVkcyB0byByZWZlciB0byB0
aGUKPiA+IDY0LWJpdCBuYW1lIChhYXJjaDY0LCB4ODZfNjQpLCB3aGVyZWFzIGFsbCB1c2Vyc3Bh
Y2UgYXBwbGljYXRpb25zIG5lZWQgdG8KPiA+IHJlZmVyIHRoZSwgcG90ZW50aWFsbHkgbm9ybWFs
aXplZCwgMzItYml0IG5hbWUuCj4gPgo+ID4gVGhpcyBtZWFucyB0aGF0IHRoZXJlIG5lZWQgdG8g
YmUgdHdvIGRpZmZlcmVudCB2YXJpYWJsZXM6Cj4gPgo+ID4gS0VSTkVMX0FSQ0g6ICAgICB0aGUg
YXJjaGl0ZWN0dXJlIHVzZWQgYnkgdGhlIGtlcm5lbAo+ID4gTk9STUFMSVpFRF9BUkNIOiB0aGUg
bm9ybWFsaXplZCBuYW1lIGZvciB0aGUgY3VycmVudCB1c2Vyc3BhY2UgYXJjaGl0ZWN0dXJlCj4g
Pgo+ID4gQXQgdGhpcyBtb21lbnQsIGJvdGggd2lsbCBhY3R1YWxseSBoYXZlIHRoZSBzYW1lIGNv
bnRlbnQuIEJ1dCBhIHN1YnNlcXVlbnQKPiA+IHBhdGNoIHdpbGwgYWRkIGJhc2ljIHN1cHBvcnQg
Zm9yIHNpdHVhdGlvbnMgZGVzY3JpYmVkIGFib3ZlLCBpbiB3aGljaAo+ID4gS0VSTkVMX0FSQ0gg
bWF5IGJlY29tZSBvdmVyd3JpdHRlbiB0byB0aGUgNjQtYml0IGFyY2hpdGVjdHVyZSwgd2hpbGUK
PiA+IE5PUk1BTElaRURfQVJDSCBuZWVkcyB0byByZW1haW4gdGhlIHNhbWUgKDMyLWJpdCkgY2Fz
ZS4KPiA+Cj4gPiBUaGlzIGNvbW1pdCByZXBsYWNlcyB1c2Ugb2YgS0VSTkVMX0FSQ0ggd2hlcmUg
YWN0dWFsbHkgdGhlIHVzZXJzcGFjZSBhcmNoIGlzCj4gPiBuZWVkZWQuICBQbGFjZXMgdGhhdCB1
c2UgS0VSTkVMX0FSQ0ggaW4gY29tYmluYXRpb24gd2l0aCBidWlsZGluZyBvZiBrZXJuZWwKPiA+
IG1vZHVsZXMgYXJlIG5vdCB0b3VjaGVkLgo+ID4gVGhlcmUgbWF5IGJlIGNhc2VzIHdoZXJlIGEg
cGFja2FnZSBidWlsZHMgYm90aCBhIGtlcm5lbCBtb2R1bGUgYXMgdXNlcnNwYWNlLAo+ID4gaW4g
d2hpY2ggY2FzZSBpdCBtYXkgbmVlZCB0byBrbm93IGFib3V0IGJvdGggS0VSTkVMX0FSQ0ggYW5k
Cj4gPiBOT1JNQUxJWkVEX0FSQ0gsIGZvciB0aGUgY2FzZSB3aGVyZSB0aGV5IGRpZmZlci4gQnV0
IHRoaXMgaXMgdG8gYmUgZml4ZWQgb24KPiA+IGEgcGVyLW5lZWQgYmFzaXMuCj4KPiBXaGlsZSBy
ZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSBub3RpY2VkIHRoYXQgTElOVVhfQVJDSF9QQVRIIFsxXSBp
cyB3cm9uZyBmb3Igc3BhcmM2NAo+Cj4gTElOVVhfQVJDSF9QQVRIID0gJChMSU5VWF9ESVIpL2Fy
Y2gvJChLRVJORUxfQVJDSCkKPgo+IEluZGVlZDoKPgo+ICQgbWFrZSBPPXRlc3QvcWVtdV9zcGFy
YzY0X3N1bjR1X2RlZmNvbmZpZyBwcmludHZhcnMgVkFSUz1MSU5VWF9BUkNIX1BBVEgKPiBMSU5V
WF9BUkNIX1BBVEg9L2hvbWUva3VidS9idWlsZHJvb3QvdGVzdC9xZW11X3NwYXJjNjRfc3VuNHVf
ZGVmY29uZmlnL2J1aWxkL2xpbnV4LTUuMTUvYXJjaC9zcGFyYzY0Cj4KPiBCdXQgc2luY2UgTElO
VVhfQVJDSF9QQVRIIGlzIG5vdCB1c2VkIGZvciB0aGlzIGFyY2hpdGVjdHVyZSwgaXQgd2FzIG5v
dCBub3RpY2VkLgo+Cj4gWzFdIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3Ry
ZWUvbGludXgvbGludXgubWs/aD0yMDIxLjExI24yMjYKPgoKQXJlIHlvdSBzdXJlIHRoYXQgdGhp
cyBpcyBhIHByb2JsZW0/CkluIHRoZSBrZXJuZWwgTWFrZWZpbGUsIHNvbWUgJ0FSQ0gnIHN0cmlu
Z3MgYXJlIHRyZWF0ZWQgc3BlY2lhbGx5OgoKIyBBZGRpdGlvbmFsIEFSQ0ggc2V0dGluZ3MgZm9y
IHg4NgppZmVxICgkKEFSQ0gpLGkzODYpCiAgICAgICAgU1JDQVJDSCA6PSB4ODYKZW5kaWYKaWZl
cSAoJChBUkNIKSx4ODZfNjQpCiAgICAgICAgU1JDQVJDSCA6PSB4ODYKZW5kaWYKCiMgQWRkaXRp
b25hbCBBUkNIIHNldHRpbmdzIGZvciBzcGFyYwppZmVxICgkKEFSQ0gpLHNwYXJjMzIpCiAgICAg
ICBTUkNBUkNIIDo9IHNwYXJjCmVuZGlmCmlmZXEgKCQoQVJDSCksc3BhcmM2NCkKICAgICAgIFNS
Q0FSQ0ggOj0gc3BhcmMKZW5kaWYKCiMgQWRkaXRpb25hbCBBUkNIIHNldHRpbmdzIGZvciBwYXJp
c2MKaWZlcSAoJChBUkNIKSxwYXJpc2M2NCkKICAgICAgIFNSQ0FSQ0ggOj0gcGFyaXNjCmVuZGlm
CgoKU28gY29tcGlsaW5nIHRoZSBrZXJuZWwgd2l0aCBBUkNIPXNwYXJjNjQgaXMgYWNjZXB0ZWQs
IGFuZCB0aGUgYXJjaApkaXJlY3Rvcnkgd2lsbCBiZSBhcmNoL3NwYXJjIC4gU2ltaWxhciB0byBo
b3cgY29tcGlsaW5nIHdpdGgKQVJDSD14ODZfNjQgd29ya3MgZXZlbiB0aG91Z2ggYXJjaC94ODZf
NjQgZG9lcyBub3QgKG5vIGxvbmdlcikgZXhpc3QuCgpXaGlsZSBJJ20gbm90IGZhbWlsaWFyIHdp
dGggc3BhcmM2NCwgdGhlcmUgZG9lcyBub3Qgc2VlbSB0byBiZSBhIGJ1ZyB0byBtZS4KClRoYW5r
cywKVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
