Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2A1E748F0
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 03:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40F3382862;
	Sun,  1 Oct 2023 03:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40F3382862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le7XxSeHMz0a; Sun,  1 Oct 2023 03:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC2F82215;
	Sun,  1 Oct 2023 03:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC2F82215
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00A451BF8A8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B7E41E7E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B7E41E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3WDDXmcI3HU for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 03:12:12 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDE0641E74
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 03:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE0641E74
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-57de6e502fcso3387992eaf.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696129930; x=1696734730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCqqcLyPdPmgyCFflE4XEL32zAJ/cMWSIfvd9FAqABQ=;
 b=SJrSui54UJdqG0wqxUqegYvSEWDayZcnJx9IIcOR4J8p5BQWB2WRbIJMJ5GIkPVCMR
 bv6S/24ia0kkTf3rq8SyQi6ICnKUFLFadtQ/nLUqV03Q6ph8Zxh2uSJ+rq23F1ETFwfo
 4GDNo26CvTNIq8Dm7G2/y6sO9Mt+ggkpMJilBLh8NzGxjSRBKdaQAbOf+4QOTctd94QI
 I+WiQBrP8DcEqO833hJUnVrbi5ubvHxk6b9VUx6dqGKpMYFXs1My1AvtONCRtXllDyHZ
 Jtk87Vc/jIzA19LfdOr0MomPh1OlwUhfhnxhuc/hdCA4jrFhtG7q9MiQuEOWPo5ClSuf
 36Zg==
X-Gm-Message-State: AOJu0YyBETrdm6s3fh63BjcsAg3R2O+390EaTSqy3IkJV65s0ScSpOhw
 JiYBmW9l+XpzjWsfuPpHqzAcjStAGmc19A4TrDs=
X-Google-Smtp-Source: AGHT+IEHulGl3OoJdNCNJNi/T7jT0jMbJKxVwAZDpND7Fqi1z4z44Y0oXmE2qijBSQNmMDhdC3CS1+P2C6P65uKltqc=
X-Received: by 2002:a05:6358:93a7:b0:135:57d0:d171 with SMTP id
 h39-20020a05635893a700b0013557d0d171mr8995605rwb.15.1696129930574; Sat, 30
 Sep 2023 20:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230930190610.752987-1-takumiiinn@gmail.com>
 <20230930214108.387cefce@windsurf>
In-Reply-To: <20230930214108.387cefce@windsurf>
From: Takumi Takahashi <takumiiinn@gmail.com>
Date: Sun, 1 Oct 2023 12:11:34 +0900
Message-ID: <CAP+4GiLB7gD4ZLRkYnXAkgVmCqCEAQQG2=Dzy1ZnjqOD5++ZDw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696129930; x=1696734730; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCqqcLyPdPmgyCFflE4XEL32zAJ/cMWSIfvd9FAqABQ=;
 b=i5CdSP3LvDBCZzm1wjcPpf5W2Uh8nrE+VxmG0QdYv+VyeYMJMJ7xchz5MngylhUgU8
 gMX1qHOARt+kd+vlVh+IOabZZd2IgyYu6EPvWBoTdAtV4HSPP5SWrMTY4v4j0iIYXb/e
 EaRf+GTyfp8iwLPCBSTFgz1sWN63xUdxvzA/tgu6C/PMk9RO7+zOx56oy5QX40FUWIdP
 SQk7uRwh7lq5zbrsyzq2khfN/CAsL5+vUA/MtxND2DxcYOXx6tOmOy+rb/P2hW3KytM8
 pWE5akzYIWTlaMhXkvuDP6n35ZebC9AxqAvNeozQ62390tzAjEFBOOUQAYOUuVs1346G
 zZ9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i5CdSP3L
Subject: Re: [Buildroot] [PATCH] package/python-pygments: support host
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLgoKVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4KCj4gSG93ZXZlciwgY291
bGQgeW91IGNsYXJpZnkgb24gd2h5IHlvdSBuZWVkIGEgaG9zdCB2YXJpYW50IG9mIHRoaXMKPiBw
YWNrYWdlLCBhbmQgaG93IGl0IGdldHMgdXNlZD8KPgo+IEFsc28sIHdlIHJlcXVpcmUgYWxsIHBh
dGNoZXMgdG8gaGF2ZSBhIFNpZ25lZC1vZmYtYnkgbGluZSBmcm9tIHRoZWlyCj4gYXV0aG9yLiBX
aXRob3V0IHRoaXMsIHdlIGNhbm5vdCBhcHBseSBwYXRjaGVzIHRoYXQgYXJlIGNvbnRyaWJ1dGVk
Lgo+IENvdWxkIHlvdSBzZW5kIGEgbmV3IHZlcnNpb24gdGhhdCAoMSkgaGFzIGFuIGV4cGxhbmF0
aW9uIG9mIHdoeSB5b3UKPiBuZWVkIGEgaG9zdCBwYWNrYWdlIGFuZCB3aGF0IHVzZXMgaXQgYW5k
ICgyKSBoYXMgeW91ciBTaWduZWQtb2ZmLWJ5Cj4gbGluZT8KCigxKQoKVGhlIHJlYXNvbiB0aGlz
IHBhdGNoIGlzIG5lZWRlZCBpcyBiZWNhdXNlIGd0ay1kb2MgcmVxdWlyZXMgcHlnbWVudHMuClRo
ZSBmaW5hbCBnb2FsIGlzIHRvIHN1Ym1pdCBhIHBhdGNoIGZvciBsaWdodGRtLCBidXQgc2luY2Ug
Z3RrLWRvYyBpcwpyZXF1aXJlZCB0byBidWlsZCBsaWdodGRtLCBweWdtZW50cyB3aWxsIGFsc28g
YmUgcmVxdWlyZWQuCgpTaG91bGQgSSBpbmNsdWRlIHRoZSBhYm92ZSByZWFzb24gaW4gdGhlIGNv
bW1pdCBsb2c/Ckkgd291bGQgYXBwcmVjaWF0ZSBhbnkgYWRkaXRpb25hbCBhZHZpY2UuCgooMikK
ClNvcnJ5LCBJIGZvcmdvdCB0byBpbmNsdWRlIGBTaWduZWQtb2ZmLWJ5YC4KTmV4dCB2ZXJzaW9u
IHdpbGwgaW5jbHVkZSBgU2lnbmVkLW9mZi1ieWAuCgpUaGFuayB5b3UuCgpUYWt1bWkKCjIwMjPl
ubQxMOaciDHml6Uo5pelKSA0OjQxIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+Ogo+Cj4gSGVsbG8gVGFrdW1pLAo+Cj4gT24gU3VuLCAgMSBPY3QgMjAyMyAw
NDowNjoxMCArMDkwMAo+IFRha3VtaSBUYWthaGFzaGkgPHRha3VtaWlpbm5AZ21haWwuY29tPiB3
cm90ZToKPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9weXRob24tcHlnbWVudHMvcHl0aG9uLXB5Z21l
bnRzLm1rIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2guCj4KPiBIb3dldmVyLCBjb3VsZCB5b3UgY2xhcmlmeSBvbiB3aHkg
eW91IG5lZWQgYSBob3N0IHZhcmlhbnQgb2YgdGhpcwo+IHBhY2thZ2UsIGFuZCBob3cgaXQgZ2V0
cyB1c2VkPwo+Cj4gQWxzbywgd2UgcmVxdWlyZSBhbGwgcGF0Y2hlcyB0byBoYXZlIGEgU2lnbmVk
LW9mZi1ieSBsaW5lIGZyb20gdGhlaXIKPiBhdXRob3IuIFdpdGhvdXQgdGhpcywgd2UgY2Fubm90
IGFwcGx5IHBhdGNoZXMgdGhhdCBhcmUgY29udHJpYnV0ZWQuCj4gQ291bGQgeW91IHNlbmQgYSBu
ZXcgdmVyc2lvbiB0aGF0ICgxKSBoYXMgYW4gZXhwbGFuYXRpb24gb2Ygd2h5IHlvdQo+IG5lZWQg
YSBob3N0IHBhY2thZ2UgYW5kIHdoYXQgdXNlcyBpdCBhbmQgKDIpIGhhcyB5b3VyIFNpZ25lZC1v
ZmYtYnkKPiBsaW5lPwo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMg
UGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
