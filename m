Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F33C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A47480E4B;
	Thu,  8 May 2025 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puCAWAvUx3mh; Thu,  8 May 2025 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D01F8339C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D01F8339C;
	Thu,  8 May 2025 08:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01EB01A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 08:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC76A60EFC
 for <buildroot@buildroot.org>; Thu,  8 May 2025 08:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsXNONL_JX8U for <buildroot@buildroot.org>;
 Thu,  8 May 2025 08:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 002C460793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002C460793
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 002C460793
 for <buildroot@buildroot.org>; Thu,  8 May 2025 08:22:51 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4c30a4bcceeso299818137.3
 for <buildroot@buildroot.org>; Thu, 08 May 2025 01:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746692570; x=1747297370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3eKk0kz+ZivQ7YiFK0ZQKa9mnwuEv6BrH2hZkh0sWA0=;
 b=Q4fWjIj0HoMto7orIeJWH7ZrOm8tMvg6VlD1/g2XAU6oiUFC4uvVHXj4XIb2aPgcIJ
 OM5mPEIV4vNUk2eKMtSgMxoNOjGwUrj10aWKXj+ioFtNYAxcowesZ80n++Dj6wjFK1Eo
 8dTig0r/NBClNG/kRsalIJtydzDDjQ+XHkAK3n9Qwp7qYaCL4dAVwsKkS7M8ae1TWwdD
 zhu7FKmm7N2I/N1jFWX8RejOkC9hOeRGpxF0RZ7fBC6RSRkmHEUcO+UzsCgDVpKvVWwr
 jCToyJZY/C7JqaRY3bHwPPe4KXdYqGMDhNOzeHh+ojtMxuvAG2RStlbRD8zmP+I0jVOy
 +7PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoz/pZ8xCQ+h+b+k+OBhchbD5oHz7dKttlaKiXiq9vb8H3/k9rsHwjkrdcPKj43qBTZcglx13FdP4=@buildroot.org
X-Gm-Message-State: AOJu0YzhZAIn1l9Ya3euzsAu6vKQVqngdmrDnWJJvVX+HHf4Q/3hpik4
 1ph4AxWgHxd5F7poKKva4jsc592KxW/ctQpSARPhpqa2tbifQ7UqofYzBY+g/ZKIFQQnEvsSRrN
 iFUUFC07b2d1Ymy5uDnObMgnrDvc=
X-Gm-Gg: ASbGncvijzQ3i/ktZ2yvI7hIR+XnXV0r+8YSrfqpuGdIZN+dyFHpb14363CZhedG9jM
 Or2Wsfr5BpryOUh5wSIarfK2dyRYHvkVLuH+O6KaI00vtG3ROQRY86xwQJ1+EhRbMry650sIZOc
 e39enUALJnEZWClth8CjDOqjs=
X-Google-Smtp-Source: AGHT+IFTZD24vhggnYJeTt+itWzOwCr7S2sKKqwayzBDixuhm+T8qgc2XylYHKN9ELJwAX6ya02YwTQZm4Eq2sfWHlE=
X-Received: by 2002:a05:6102:f88:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4ddacf6e9eemr2006289137.10.1746692570650; Thu, 08 May 2025
 01:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250507231902.14cbc9aa@windsurf>
 <87ldr71q08.fsf@dell.be.48ers.dk>
In-Reply-To: <87ldr71q08.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 8 May 2025 02:22:39 -0600
X-Gm-Features: ATxdqUEgm7NtuW8oOsnEF1WgB95eh9hEH_acXkd3T9J5MlmB5HoHoWGdhg3ck94
Message-ID: <CADvTj4pbysjPEsS1bAvkHSPTdW9ePHFpfybqg5Zb2Xkv8NnLgw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>, Thomas Perale <thomas.perale@mind.be>,
 buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746692570; x=1747297370; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3eKk0kz+ZivQ7YiFK0ZQKa9mnwuEv6BrH2hZkh0sWA0=;
 b=ZLS3I1OvULbrvYA3sLoJp4gF8ZPeLREsAEr8JXxGTju6AOBl0V20iC9m81P0tncYOI
 esLfrkwYiJBIW80fBOw+9P0+1LGvHhjYztsG/W7eQ1Npf6cIz1ipKL/FuQ0ESa9Lw7Om
 n3ss9HW0vlt09oghWB2pNlK0sLe2rgwM7uMXEjLOdPjkSiA9XZEeHD29pBoKxuRSJFxl
 Lpuew3Y+Jc0C2Bh9cptsTAW5rZC7KDOZIfr3OfQYh3pg7W0z4PYls9BL4DzZQ3tkq020
 +nWmpE5YRzCqx8Ss2KqCDHVWIDPyE8AvKDlkrMka2/xMls/RsPxHk+6fik5iB/sEjbGW
 2DqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZLS3I1Ov
Subject: Re: [Buildroot] Grub security situation
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

T24gVGh1LCBNYXkgOCwgMjAyNSBhdCAyOjEx4oCvQU0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJUaG9tYXMiID09IFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyaXRlczoKPgo+IEhpLAo+Cj4gID4g
U28gdGhlIG9ubHkgc29sdXRpb24gdGhhdCBJIGNhbiBzZWUgcmlnaHQgbm93IGlzIHRvIHVzZWQg
Z3J1YidzIG1hc3Rlcgo+ICA+IGJyYW5jaCAob2YgY291cnNlIHdpdGggYSBmaXhlZCBjb21taXQp
LiBPZiBjb3Vyc2UsIGZvciAyMDI1LjAyLCB0aGlzCj4gID4gbWVhbnMgd2Ugd291bGQgYnVtcCBn
cnViIHRvIGEgbmV3ZXIgdmVyc2lvbiB0aGF0IG5vdCBvbmx5IGhhcyBzZWN1cml0eQo+ICA+IGZp
eGVzLCBidXQgYWxzbyBhIHdob2xlIGJ1bmNoIG9mIG90aGVyIHJhbmRvbSBjaGFuZ2VzLiBCdXQg
dGhhdCdzIGhvdwo+ICA+IGdydWIgaXMgbWFpbnRhaW5lZCwgYW5kIEknbSBub3Qgc3VyZSB3aGF0
IHdlIGNhbiBkbyBhYm91dCBpdC4KPgo+ICA+IE9waW5pb25zPyBUaG91Z2h0cz8gU3VnZ2VzdGlv
bnM/Cj4KPiBJdCBzdWNrcywgYnV0IGdydWIyIGRvZXNuJ3Qgc2VlbSB2ZXJ5IGFsaXZlIGFuZCB3
ZWxsIG1haW50YWluZWQgbm93ZGF5cy4KPiBGcm9tIHRoZSBtYWlscyBhYm92ZSBpdCBzb3VuZGVk
IGxpa2UgdGhlIGN1cnJlbnQgZ2l0IHZlcnNpb24gaGFkIHNvbWUKPiByZWdyZXNzaW9ucyBjb21w
YXJlZCB0byAyLjEyLCBzbyB1c2luZyBnaXQgZG9lc24ndCBzb3VuZCB0aGF0IGdyZWF0Lgo+Cj4g
QXJub3V0cyBzdWdnZXN0aW9uIGFib3V0IHBpZ2d5IGJhbmtpbmcgb24gRGViaWFuIGNvdWxkIGJl
IGFuIG9wdGlvbiwgb3IKPiBhbHRlcm5hdGl2ZWx5IHdlIGNvdWxkIHNpbXBseSBkcm9wIGdydWIy
PyBXaXRoIEVGSSBJIGd1ZXNzIHRoZXJlIGlzIGxlc3MKPiBuZWVkIGZvciBncnViMiBhbnl3YXk/
CgpQcm9iYWJseSBqdXN0IGJlc3QgdG8ga2VlcCB0aGUgcGFja2FnZSBhbmQganVzdCBtYXJrIGl0
IGFzIGhhdmluZyBzb21lCmtub3duIHNlY3VyaXR5IGlzc3Vlcy4KCkknbSBhc3N1bWluZyB0aGVz
ZSBhcmUgc2VjdXJpdHkgaXNzdWVzIHRoYXQgYXJlIGluIG1vc3QgY2FzZXMgcmVsYXRpdmVseQp1
bmxpa2VseSB0byBiZSBleHBsb2l0ZWQgaW4gcHJhY3RpY2UuCgo+Cj4gLS0KPiBCeWUsIFBldGVy
IEtvcnNnYWFyZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
