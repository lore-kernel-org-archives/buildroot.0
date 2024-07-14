Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A2EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A49405B3;
	Sun, 14 Jul 2024 20:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGuE1MIWgdHV; Sun, 14 Jul 2024 20:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC141405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC141405B5;
	Sun, 14 Jul 2024 20:58:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC821BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4855760631
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3OGOCs-6jBa for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34289605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34289605E8
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34289605E8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:58:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so42398421fa.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720990697; x=1721595497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8oCu8/Pweah03HZPMmDKMeShUupKRMcdmMhZi05ZzwU=;
 b=ATG0nxw2LGGUs4qY6U1mwnnQeuyCap7KZibjhXEvXMLgX6LLwLSpqZqVmr4uy8N+Tn
 SOsgpj+PsDYrRr4K+hmLNIEVpIRNTO/eezaJoxOY5gIEL5bR2EipW4dtrJ1qq8doarRH
 WlX4ZWr2p9AavN+5/uBa1DceW9mg/XVUNcN8bLWHpsAwIKDGLKQSbRjfKB21p3ZLlWF8
 o/lU3VcoC+PdF60qofbRDL1EPhDtUKN2gRTnFpis/IV3IZtJY+3LiQ+DtVk68KzKj5g/
 hmjY05C2R7AIdlr+pV0unpxFw765pa4I+ZPAO3SCE947VjqQBzBOMvfhfso/P+f2M28a
 xbow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC4bMewO5pZtm0sM851V6yAkQ+s2heJQSfXovx+6JvgSmhIl3S7VxnWHx8wmq/NUzQnu7/tIAllmr6drvfuu6bYtZJ+T6Rrw==
X-Gm-Message-State: AOJu0YyykNwRepbmJP1dNHyKpndih1FiDFRFO9yVD7cvZfGU4TUfb6b6
 CkQbldbWuIFXqufFzOiLTmjr2DjWjTDX8WIYHcWuXXtBrinymSv1S3icdjy8g9s=
X-Google-Smtp-Source: AGHT+IEOUhQI+s1X/9SwvvMTk5BBjLrPHTAsAujaoZhzzT+gD9IZMmhJYZFQ5soX8aBBI+VqTUXL0A==
X-Received: by 2002:a2e:7c19:0:b0:2ee:7e25:dc0a with SMTP id
 38308e7fff4ca-2eeb30e3c68mr113097371fa.21.1720990696538; 
 Sun, 14 Jul 2024 13:58:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d74d5sm98040215e9.46.2024.07.14.13.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 13:58:16 -0700 (PDT)
Message-ID: <9f526e9e-d5d8-4ca9-9baa-663cd94873af@smile.fr>
Date: Sun, 14 Jul 2024 22:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240713163016.1135653-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240713163016.1135653-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720990697; x=1721595497; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8oCu8/Pweah03HZPMmDKMeShUupKRMcdmMhZi05ZzwU=;
 b=2es6VZfViY9UebtcuIC+pkegyM7xhL9wvjY6g6q9vCblIoeUpAxeoUmSOBGRmO+LpE
 MTJaipfUHLA7aJXHhZwFi3U1cPDPGDsaKxbNR2NwrO7QrmyJhXdtvdKRGtUgsBgm5DTK
 Q0lAWtO5ZglZZeVlBa/nGTEI+bVQfQ+z76i4Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2es6VZfV
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.8.12 and U-Boot to 2024.07
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Bryan Brattlof <bb@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxMy8wNy8yMDI0IMOgIDE4OjMwLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBwYXRjaCBidW1wcyB0aGUgTGludXgga2VybmVsIHRvIHZlcnNpb24gNi44
LjEyIGFuZCBVLUJvb3QgdG8gdmVyc2lvbgo+IDIwMjQuMDcuCj4gCj4gU2lnbmVkLW9mZi1ieTog
RGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAg
Ym9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgICAgICAgICAgICAg
ICAgfCAyICstCj4gIC4uLi9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIuaGFzaCAgIHwgMiArLQo+ICBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290
L3Vib290Lmhhc2ggICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgY29uZmlncy90aV9hbTYyeF9z
a19kZWZjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIGIvYm9h
cmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gaW5kZXggMmU5YWFkMzk5
ZWJlLi41ZTlkZjUxZWNkZGMgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hl
cy9saW51eC9saW51eC5oYXNoCj4gKysrIGIvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoCj4gQEAgLTEsMiArMSwyIEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4g
LXNoYTI1NiAgMWM0Y2RjYjlkNTYwZmFkMWZiOTVkYjJjYjhhZmJlZGM5MjJmOWVhZDg0ODM3MWZl
NDAzNjNiMTNmOWY2MzFiYSAgbGludXgtNi44LjgudGFyLnh6Cj4gK3NoYTI1NiAgMTliMzE5NTZk
MjI5YjViOWNhNTY3MWZhMWM3NDMyMDE3OTY4MmEzZDhkMDBmYzg2Nzk0MTE0YjIxZGE4NjAzOSAg
bGludXgtNi44LjEyLnRhci54ego+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wYXRj
aGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2JvYXJkL3RpL2FtNjJ4
LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gaW5kZXgg
OTdhMmI0ZWFmOTViLi5mZTliNGY1M2RjNjMgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvdGkvYW02Mngt
c2svcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gKPiArKysgYi9i
b2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIu
aGFzaAo+IEBAIC0xLDIgKzEsMiBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYg
IDE4YTg1M2ZlMzlmYWQ3YWQwM2E5MGNjMmQ0Mjc1YWVhZWQ2ZGE2OTczNWRlZmFjMzQ5MmI4MDUw
ODg0M2RkNGEgIHUtYm9vdC0yMDI0LjA0LnRhci5iejIKPiArc2hhMjU2ICBmNTkxZGE5YWI5MGVm
M2Q2YjNkMTczNzY2ZDBkZGZmOTBjNGVkNzMzMDY4MDg5NzQ4NjExN2RmMzkwZDgzYzhmICB1LWJv
b3QtMjAyNC4wNy50YXIuYnoyCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNo
ZXMvdWJvb3QvdWJvb3QuaGFzaCBiL2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJv
b3QuaGFzaAo+IGluZGV4IDk3YTJiNGVhZjk1Yi4uZmU5YjRmNTNkYzYzIDEwMDY0NAo+IC0tLSBh
L2JvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+ICsrKyBiL2JvYXJk
L3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+IEBAIC0xLDIgKzEsMiBAQAo+
ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDE4YTg1M2ZlMzlmYWQ3YWQwM2E5MGNj
MmQ0Mjc1YWVhZWQ2ZGE2OTczNWRlZmFjMzQ5MmI4MDUwODg0M2RkNGEgIHUtYm9vdC0yMDI0LjA0
LnRhci5iejIKPiArc2hhMjU2ICBmNTkxZGE5YWI5MGVmM2Q2YjNkMTczNzY2ZDBkZGZmOTBjNGVk
NzMzMDY4MDg5NzQ4NjExN2RmMzkwZDgzYzhmICB1LWJvb3QtMjAyNC4wNy50YXIuYnoyCj4gZGlm
ZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTYy
eF9za19kZWZjb25maWcKPiBpbmRleCAzNjA1MmRiYTQwN2EuLmY1NjY2OWMyNGZlNSAxMDA2NDQK
PiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvdGlf
YW02Mnhfc2tfZGVmY29uZmlnCj4gQEAgLTgsNyArOCw3IEBAIEJSMl9ST09URlNfUE9TVF9CVUlM
RF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAwbjggLWQgazMtYW02MjUtc2suZHRiIC1sIGFt
NjJ4Cj4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02
Mngtc2svZ2VuaW1hZ2UuY2ZnIgo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05f
VkFMVUU9IjYuOC44Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2
LjguMTIiCj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ICBC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVf
RFRTX05BTUU9InRpL2szLWFtNjI1LXNrIgo+IEBAIC0yNywxMiArMjcsMTIgQEAgQlIyX1RBUkdF
VF9PUFRFRV9PUz15Cj4gIEJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszLWFtNjJ4Igo+
ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15Cj4gIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjIwMjQuMDQiCj4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjA3Igo+ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ul9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4g
IEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+ICBCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iMjAyNC4wNCIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
MjAyNC4wNyIKPiAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9h
NTMiCj4gIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19PUEVOU1NMPXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
