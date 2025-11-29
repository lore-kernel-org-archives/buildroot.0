Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124B1CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D28583B97;
	Sat, 29 Nov 2025 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mt0EmoPmRWg; Sat, 29 Nov 2025 20:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE20883B84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE20883B84;
	Sat, 29 Nov 2025 20:24:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF5F7708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D47636078A;
 Sat, 29 Nov 2025 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPDOr69LFXyY; Sat, 29 Nov 2025 20:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87859606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87859606E5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87859606E5
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:24:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso23122695e9.0
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764447840; x=1765052640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G3e1yDTEaUKUkHRYyl8iVclUPVfwdDUhIIosdELKDBM=;
 b=hg13xYQjvG86CDKWBK/X1YnZwodiHH2Yetjqz+jOxuCRm70HR0EQtIpQPILRWEmONB
 oObXD5+j8qqkYD0AI+gMjgLUhhyUR7Eg1Rg2PoFs51ge6Dr4WOU2sz4HWgvOF0W8OlZR
 1BZEOZEpvifkUL3bQYYh8gtmfnDAS5nSEiuWB0ssgo0EwfxHzh0xkaoLBJMD4dT0AbqP
 RQlSESjNiBAJz8AjDwuT4OeKigXuIJgcdr6W257h8EJTopEkZSo6GpIysa+I2LSoM3Tu
 Ai4s1TOgnAsw5ro7DmIRX26uPLNAJhvr8a/C6/XmSrUl1xmtwVczjV7zjgj6Wn4nVuRU
 sXUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt1sf+PBGQwsdGIS1jfA4HxkKE+j4XwpzIkWAqNqDA2dn2gOWA/bAIzsoIVNRbwQPc1UWiI+sABos=@buildroot.org
X-Gm-Message-State: AOJu0Yyzrv65pXkRAKEm2Xw78PIvWFsbZc0pItD9DR+pPxyf+1sqtJGw
 e/5dR0eucEG9bSg0I/M0fvamxoZ6VEByQ+04L2CNU2c2d5JfpgVVhTMMuRYNAw==
X-Gm-Gg: ASbGncsZceZgPfGmxSkFLoyFB4/M1z8Uu3K57Zsy4ZHS987zdRwKStcWM8sxEqjs7c1
 uw7SbhgBx+xv/9ZggApAiB5i7Z+x1hRrmJ8ja17tYbCkcHFs2/4PcJXYTer3RyDzCChtyjJ2cDQ
 3TQ1hozp3SBg6i/yPFzBhx523SwwkAE+6zp3+S4NLaIXjzL9GF/igUngAOAokRZIeu51fRtfZ2U
 cgJkpVB4+4VWXp3lDH/uuSNvxUDwQyQWmIujAinL1wrIaSYwrSUtR+zte0NUD1hDg9Djc+/yid/
 KWlW8gz8MkNoeu9067ULqK25RrFM1ZL3uFjYJhKSSGUlW0CCO6WGokeh9xT8M7sn2hsJ5LqGNK6
 MFhtCs6WTtHuGOxlDB0UX7Pp8rjcjDsec/jlUDsQ8fpIlIH449jaRWu+C2srvWMStobnPLOcBd5
 3b3M42u/jLREsCwCcP39lgMVest0RwdhNc
X-Google-Smtp-Source: AGHT+IGv9l3BDcn6aGNqlG9E7B5++9gd/J4tUeRKNKEBB/nqvOnq6Zd+EJkE3TanlCdUpwI15y3Q1A==
X-Received: by 2002:a05:600c:c0c3:20b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-477b9ee4fdbmr282301075e9.11.1764447840262; 
 Sat, 29 Nov 2025 12:24:00 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47903c7360fsm126068085e9.0.2025.11.29.12.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 12:23:59 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 29 Nov 2025 21:23:58 +0100
Date: Sat, 29 Nov 2025 21:23:58 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Message-ID: <aStWXo6ZIIyoVWgz@landeda>
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
 <aSszM90msDWGlEaa@landeda>
 <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764447840; x=1765052640; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G3e1yDTEaUKUkHRYyl8iVclUPVfwdDUhIIosdELKDBM=;
 b=dcUXnJLJBvDbN1N7h6X2AVTxunN6Xqp0LF22lfnd9yN78b5qCs+cz3kGUVAZSjFJ1r
 F1qJZG7Gim7MfsbOjz/4zwGUvb+I0ny5wz6tUhASuLEnvEsGQy9+pmd5JCLKEG8TSyZB
 ZQRzJQ7xC3F0o8tmFo38VCykvJA2kAmx5JAh7Lw6M03fTgMl5R5P/R+Vhj+hSOXfvOym
 fNKqX1n9aLJBpIwtaHMLCqeh8C3Sat2Cx+IBCwQS93jQ1kcFZSHOY3ZZGvu6TOnSuD3D
 FwsfL/DZ1QPmw7Q0wL/fyR6Pp6Hcx9JYyAlQoFFmmRNW656WB7TY2h115uth56Kg/YZr
 Mscg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dcUXnJLJ
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWRnYXIsIEFsbCwKCk9uIDIwMjUtMTEtMjkgMjA6MzUgKzAxMDAsIEVkZ2FyIEJvbmV0IHNwYWtl
IHRodXNseToKPiBPbiAyMDI1LTExLTI5LCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6
Cj4gPiBUaGUgY29tbWl0IDc5M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjczZDhhODRiM2YwYTQg
YnJva2UgbXkgY29tcGlsYXRpb24uCj4gPiBBbiBBSSBzdWdnZXN0ZWQgdGhhdCB0aGUgcHJvYmxl
bSBpcyBiZWNhdXNlIHRoZSBzY3JpcHQKPiA+IGBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2Vk
YCByZXF1aXJlcyB0aGUgZm9sbG93aW5nIGNoYW5nZToKWy0tU05JUC0tXQo+IFlhbm4gRS4gTW9y
aW4gcmVwbGllZDoKPiA+IERpZCB5b3UgdW5kZXJzdGFuZCB3aHkgdGhlIHN1Z2dlc3RlZCBjaGFu
Z2UgaXMgY29ycmVjdD8KPiAKPiBJIHRvb2sgYSBxdWljayBsb29rIGF0IHRoZSBjb21taXQgaW4g
cXVlc3Rpb24gKDc5M2ViZDVkMjgwOQo+ICJzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkOiB1
c2UgZ2V0b3B0cyBpbnN0ZWFkIG9mIGdldG9wdCIpLiBNeQo+IHVuZGVyc3RhbmRpbmcgaXMgdGhh
dDoKClRoYW5rcyBmb3IgdGhlIGhlbHBpbmcgaGFuZCEgOi0pCgo+ICAg4oCiIEJlZm9yZSB0aGF0
IGNvbW1pdCwgdGhlIG9wdGlvbnMtcGFyc2luZyBsb29wIChgd2hpbGUgOjsgZG9gLCBsaW5lcwo+
ICAgICA0NCB0aHJvdWdoIDYzKSBjb25zdW1lZCAod2l0aCBgc2hpZnRgKSB0aGUgb3B0aW9ucyBh
bmQgbGVmdCB0aGUKPiAgICAgb3RoZXIgYXJndW1lbnRzIGluICRALiBUaG9zZSBleHRyYSBhcmd1
bWVudHMgKHRoZSByb290IGRpcmVjdG9yaWVzCj4gICAgIHRvIGNoZWNrKSB3aGVyZSB0aGVuIGNv
bnN1bWVkIGJ5IHRoZSBgZm9yIHJvb3Q7IGRvYCBsb29wIGxpbmVzIDEyNQo+ICAgICB0aHJvdWdo
IDE0NC4KPiAKPiAgIOKAoiBTaW5jZSB0aGF0IGNvbW1pdCwgdGhlIG9wdGlvbnMtcGFyc2luZyBs
b29wIGRvZXMgbm90IGNvbnN1bWUgdGhlCj4gICAgIG9wdGlvbnMgaXQgZmluZHMuIFRoZSBgZm9y
IHJvb3Q7IGRvYCBsb29wIG92ZXIgdGhlIHJvb3QgZGlyZWN0b3JpZXMsCj4gICAgIGhvd2V2ZXIs
IGhhcyBub3QgYmVlbiBjaGFuZ2VkLiBUaGlzIGxvb3Agd2lsbCB0aGVuIGludGVycHJldCB0aGUK
PiAgICAgb3B0aW9ucyBhcyBleHRyYSByb290IGRpcmVjdG9yaWVzIHRvIGNoZWNrLgoKVGhhdCdz
IGEgcGVyZmVjdGx5IGNvcnJlY3QgYW5hbHlzaXMgb2YgdGhlIGlzc3VlLiDwn5GNCgpIb3dldmVy
LCB0aGF0IGRvZXMgbm90IGV4cGxhaW4gd2h5IGl0IGNhdXNlcyBKb3PDqSdzIGJ1aWxkIHRvIGZh
aWwuIEhlcmUsCml0IGRvZXMgbm90IGZhaWwuIE9mIGNvdXJzZSwgdGhlIHNjcmlwdCBpcyBicm9r
ZW4sIGFuZCBpbnN0cnVtZW50aW5nIGl0CnNob3dzIHRoYXQgaXQgaW5kZWVkIHRyaWVzIHRvIGhh
bmRsZSB0aGUgb3B0aW9ucyBhcyBpZiB0aGV5IHdlcmUKZGlyZWN0b3JpZXMgdG8gdmFsaWRhdGUu
CgpIb3dldmVyLCB3aGVuIEkgcnVuIGEgYnVpbGQgaGVyZSB3aXRoIGEgZmV3IGRpZmZlcmVudCBv
dmVybGF5cyAocHJvcGVybHkKbWVyZ2VkIHVzciBvciBiaW4sIG9yIG5vdCBhdCBhbGwpLCBhbmQg
ZW5hYmxpbmcgb3IgZGlzYWJsaW5nIHRoZQpjb3JyZXNwb25kaW5nIE1FUkdFRF97VVNSLEJJTn0g
b3B0aW9ucywgZG8gbm90IGZhaWwgZm9yIG1lLiBUaHNhdCdzIHRoZQpyZWFzb24gSSBkaWQgbm90
IGNhdGNoIHRoZSBpc3N1ZSB3aGVuIEkgc3VibWl0dGVkIG15IHBhdGNoLgoKSGVuY2Ugd2UgZG9u
J3QgeWV0IGhhdmUgYSBjb21wbGV0ZSBleHBsYW5hdGlvbnMgYXMgdG8gd2hhdCBpcyBkaWZmZXJl
bnQKaW4gSm9zw6kncyBjYXNlLCB0aGF0IGNhdXNlcyB0aGUgYnVpbGQgdG8gZmFpbCBmb3IgdGhl
bS4gVGhhdCBpcyB3aGF0IGlzCmludGVyc3Rpbmc6IHdoeSBkb2VzIGl0IGZhaWw/CgpBbmQgeWVz
LCB0aGUgY2hhbmdlICppcyogY29ycmVjdCwgYW5kIHllcywgdGhlIHNjcmlwdCAqaXMqIGN1cnJl
bnRseQpib3JrZWQuIFN0aWxsLCB0aGVyZSdzIHRoaXMgYmVoYXZpb3VyIHRoYXQgSSBjYW4ndCBy
ZXByb2R1Y2UsIHRoYXQgaXMKaW1wb3J0YW50IHRvIHVuZGVyc3RhbmQuCgo+IEBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm86IEkgaG9wZSB0aGlzIGNhbiBoZWxwIHlvdSB3cml0ZSBhIG1vcmUKPiBh
cHByb3ByaWF0ZSBjb21taXQgbWVzc2FnZS4KClllcywgWW91ciBleHBsYW5hdGlvbnMsIEVkZ2Fy
LCBkbyBoYXZlIHRoZWlyIHBsYWNlIGluIHRoIGNvbW1pdCBsb2csIGFzCnRoZSByZWFzb24gdG8g
ZXhwbGFpbiB0aGUgYnVpbGQgZmFpbHVyZSwgdGhhdCBzaG91bGQgYmUgZGVzY3JpYmVkIGZpcnN0
LgoKTWF5YmUgZGVzY3JpYmUgeW91ciBzZXR1cDogaG93IG1hbnkgb3ZlcmxheXMgeW91IGFyZSB1
c2luZywgaWYgdGhleSBhcmUKbWVyZ2VkLXVzciwgbWVyZ2VkLWJpbiwgb3Igbm90LCBhbmQgc28g
b24uLi4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
