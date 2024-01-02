Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393DEC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C910560F0B;
	Tue,  2 Jan 2024 20:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C910560F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DqSJvUfwkIi0; Tue,  2 Jan 2024 20:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0B660FB5;
	Tue,  2 Jan 2024 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0B660FB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8E41BF31F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3117408BA
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3117408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GX4CH_OhVVSB for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:01:12 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A24F404D3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A24F404D3
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso88770901fa.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 12:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704225670; x=1704830470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBAKJhTV3znxfAg8FU//FjDEtDcGp551Fzns1ArkONk=;
 b=VOOiVm42hSkAct7TSl2ggLztn8Ds9iIEmp+szCEmQcJD/6b3L5vXY3RhJCihxGp3Uj
 oP9jlE2CK8PQQwO0L7WQLxPvnwMiT7x1tUR3hQ95CYh+0HEXH1lC1SqEkxoNDMsvTFy6
 ISau2DNJfCudF51e8QU2s2WWLSRoJdiO7ncPVG/vnQJ7NeKOFVmu7t2KDQE+VrFfE1tF
 x5eSv8virhpLfPTd70HLrF2OWzIQUSaGo6zHCwNTAjDQLWmWWwNbRv6/PFVQcSgo4kdr
 LnB99Y26iE3581in8kqA++Bqa3vgcq8ZWWA6qCWwblVFlbqaMrW5cg/OwsctGy3plnZ2
 YsLQ==
X-Gm-Message-State: AOJu0YwN1YiSaKXXZkmSCC0u/JRn+vuFfsEOULI1Izp/EcE0L4w1PCbT
 RL8kYFLigBy/ZixOIPTmD2SUo0eiEL5yoE9p+1Wvd9Zoeqg=
X-Google-Smtp-Source: AGHT+IFf/qY4CjxWmZshtVpUpB0UCkUWpAUdu71MmUa3o13GLvcxyikgXXnTtiieheZKzFY72csbnwuq1nhUFAj35z0=
X-Received: by 2002:a05:651c:603:b0:2cd:10be:cf1b with SMTP id
 k3-20020a05651c060300b002cd10becf1bmr665427lje.12.1704225669614; Tue, 02 Jan
 2024 12:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20240102194155.1345165-1-fontaine.fabrice@gmail.com>
 <ZZRqtHvbEG1i8Fbk@landeda>
In-Reply-To: <ZZRqtHvbEG1i8Fbk@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 2 Jan 2024 21:00:57 +0100
Message-ID: <CAPi7W83OPBp=zBXbR9Y=M+Zf6qr+c4NVuECo1i0Nr8TbJ62Vgg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704225670; x=1704830470; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBAKJhTV3znxfAg8FU//FjDEtDcGp551Fzns1ArkONk=;
 b=c2sFImCcPGWjlt7HQlDfU9bx5Y0ysDOp2ZF89fgNQRUAciRkhxskWocY75rP/qqd75
 C89800znV7yCN1h+SrphsxRKP4YT3V7fQSN6hhnfca3bgHHg825O4L+CQozOXSPnxnbI
 lYR5Xd3F9XI82Mgm99fGfV8rMYkWWK7txV2TQF8E/GiuzxCwhSOV9S08zGvSsltYNJR6
 U+iXnaXK+9hDV9DIhbs1fi9GBmLR1v4LyQAc4siacsR3AWa+usuj5idiaNsLRJfIDsbu
 UDxpv0AIAYo1qs8T0/xfaYQ4AHFH/xPwBpWjLsB0/1HGRWTZRs1FRzEawfJanNP/KUqa
 Gbgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c2sFImCc
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/docker: enable selinux
 module"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyIGphbnYuIDIwMjQgw6AgMjA6NTcsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBPbiAyMDI0LTAx
LTAyIDIwOjQxICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+IFRoaXMg
cmV2ZXJ0cyBjb21taXQgMjQ1YjEzYTA3NzhlYzZhZDA2MTU1NWIwYjk5NGU3NjQ5ZWYwMTAwNiBh
cyBkb2NrZXIKPiA+IHNlbGludXggbW9kdWxlIGlzIGZvciBkb2NrZXItZW5naW5lLCBub3QgZm9y
ICJhIHN5c3RlbSB0cmF5IGRvY2sgZm9yIFgiCj4gPgo+ID4gTW9yZW92ZXIsIGl0IHJhaXNlcyB0
aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cj4gPgo+ID4gQ29tcGlsaW5nIHRhcmdldGVkIHBv
bGljeS4zMwo+ID4gZW52IExEX0xJQlJBUllfUEFUSD0iL2hvbWUvYnVpbGRyb290L2F1dG9idWls
ZC9pbnN0YW5jZS0wL291dHB1dC0xL3Blci1wYWNrYWdlL3JlZnBvbGljeS9ob3N0L2xpYjovaG9t
ZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvcmVm
cG9saWN5L2hvc3QvdXNyL2xpYiIgL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0w
L291dHB1dC0xL3Blci1wYWNrYWdlL3JlZnBvbGljeS9ob3N0L3Vzci9iaW4vY2hlY2twb2xpY3kg
LWMgMzMgLVUgZGVueSAtUyAtTyAtRSBwb2xpY3kuY29uZiAtbyBwb2xpY3kuMzMKPiA+IHBvbGlj
eS5jb25mOjE5MTI6RVJST1IgJ2F0dHJpYnV0ZSBjb250YWluZXJfZW5naW5lX2RvbWFpbiBpcyBu
b3QgZGVjbGFyZWQnIGF0IHRva2VuICc7JyBvbiBsaW5lIDE5MTI6Cj4gPiB0eXBlIGRvY2tlcmRf
dCwgY29udGFpbmVyX2VuZ2luZV9kb21haW47Cj4gPiB0eXBlIGRvY2tlcmRfZXhlY190Owo+Cj4g
RG9lcyB0aGF0IG1lYW4gd2UgY2FuJ3QgZG86Cj4KPiAgICAgRE9DS0VSX0VOR0lORV9TRUxJTlVY
X01PRFVMRVMgPSBkb2NrZXIKCkluZGVlZCwgd2UgY2FuJ3QgZG8gdGhhdCBlaXRoZXIsIEkgZGlk
bid0IGludmVzdGlnYXRlZCBmdXJ0aGVyIGJ1dCBhdAp0aGUgdmVyeSBsZWFzdCwgY29udGFpbmVy
IHNlbGludXggbW9kdWxlIHNob3VsZCBiZSBhZGRlZCBsaWtlIHRoaXM6CgpET0NLRVJfRU5HSU5F
X1NFTElOVVhfTU9EVUxFUyA9IGNvbnRhaW5lciBkb2NrZXIKCj4KPiBlaXRoZXI/Cj4KPiA+IEZp
eGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvODdkNzhi
NmYxNTg3NWYwZmEzZTZmYzg1ZTM1MmRiMTRhYjAzODNiYgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Cj4gQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4g
LS0tCj4gPiAgcGFja2FnZS9kb2NrZXIvZG9ja2VyLm1rIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2RvY2tlci9kb2NrZXIubWsgYi9wYWNrYWdlL2RvY2tlci9kb2NrZXIubWsKPiA+IGlu
ZGV4IDM5ZjdlZTQ1ODAuLjRhOGM2ZmNkOGQgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2RvY2tl
ci9kb2NrZXIubWsKPiA+ICsrKyBiL3BhY2thZ2UvZG9ja2VyL2RvY2tlci5tawo+ID4gQEAgLTcs
NyArNyw3IEBACj4gPiAgRE9DS0VSX1ZFUlNJT04gPSAxLjUKPiA+ICBET0NLRVJfU0lURSA9IGh0
dHA6Ly9pY2N1bHVzLm9yZy9vcGVuYm94LzIvZG9ja2VyCj4gPiAgRE9DS0VSX0RFUEVOREVOQ0lF
UyA9IGhvc3QtcGtnY29uZiBsaWJnbGliMiB4bGliX2xpYlgxMQo+ID4gLURPQ0tFUl9TRUxJTlVY
X01PRFVMRVMgPSBkb2NrZXIKPiA+ICsKPiA+ICBET0NLRVJfTElDRU5TRSA9IEdQTC0yLjArCj4g
PiAgIyBUaGUgJ29yIGxhdGVyJyBpcyBzcGVjaWZpZWQgYXQgdGhlIGVuZCBvZiB0aGUgUkVBRE1F
LCBzbyBpbmNsdWRlIHRoYXQgb25lIHRvby4KPiA+ICBET0NLRVJfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcgUkVBRE1FCj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICct
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
