Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FD3C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACE940669;
	Tue,  4 Feb 2025 15:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4lhtjVD5VIP; Tue,  4 Feb 2025 15:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FBD406EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FBD406EA;
	Tue,  4 Feb 2025 15:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EEA12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885A880ADA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGdlm_Be2xid for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC5E380EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5E380EC4
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC5E380EC4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:49:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3159700f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684155; x=1739288955;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T/rT3Gym90pJOcJVrgZk5q5SNfAtbyYg9GUMqcuw7u4=;
 b=YPWSReBFfIWYpLSZqrP/xV0Iw3G3YsdWnJynum4zZZv5pj5kbjavT5Kjr2jRYc2JW4
 UU8zQXe6CGXNXIb+hA0OVP2bCQXDxPT6wHT26LBoKBENy32qJLHRqvyHPM737/B+JUjS
 CYXU0ROwK/S4Vg6cg4FsbE9f6P8k8jPFvBrrGMSLJy/wT+cqiSshMXq/yQtnLdcG+S6L
 nhtXBcAoOkmrNuaNper/olz3MxOl8vms/DFBB+gaoIvT2smxWtxRLN9B+mJ9l1j1rNDc
 Jb5+9QWRP1dd2ifLqandgC5XTRt3TvOYpwjaZKsX+iJv3uR13PYXU8DhLuN9FSsbo8pm
 W4hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUsqVMFDgtWPvu00CMCj08fmilKt2M7LLj7Gj/Iu3GquKNQe73H/P+O3qlAtky+9bwte8M2xzPawE=@buildroot.org
X-Gm-Message-State: AOJu0Yw1hHyRBNa4bAjU+kn0rE0sBE8ogZHOcpB0iqP5A5ARHefc0thL
 xd1dZZZVUPce3xBJo+905XG+YerPEveuvUpT0V6sla0o11u9FcWP81D10HHZDBRM31I65qig9J+
 5C1s=
X-Gm-Gg: ASbGncsKxAwxJfvSHpbYlsi31Ec1UOTEmCsYKS/oor69g5Y/n6vqo042Qs/TWl6dSpm
 QYrJwBLn1oKFEZdfEiKgRgaeW64jFVbd17gc0zYqI8lVTjOLfOIDhBJk4vu0wWqL0Hi7mk3zJnL
 gnqczm8EwGRN0/EDv8HOs5YsVyMOzgBWayIVMk0YC4bpbS4iVrDzWp1QC7PTF3/E0VhnqDW2KRL
 SiCY1eznaZiZNuK45Pdo22e6Y3Wz2hhfmPbpjSGN3JrDVfs76LwbMWvZOtvsxfzvs+4HpfpYW7m
 4niB/BOwrzfL0X8uOZil4eoWp8+a9N2N8Buq8uuuK4wrZ2rX4/X13f5i
X-Google-Smtp-Source: AGHT+IHKHW4KaeuF5QTPteDPRZiclNrLH9nVjbx5KroNYo38jGER5M3b/but3d+L+159z8mbnSrfOQ==
X-Received: by 2002:a5d:6da7:0:b0:385:de67:2269 with SMTP id
 ffacd0b85a97d-38c520a3857mr21480974f8f.36.1738684155384; 
 Tue, 04 Feb 2025 07:49:15 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c12191dsm16443956f8f.51.2025.02.04.07.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:49:15 -0800 (PST)
Message-ID: <5a1c0775-ff19-4aef-aea6-5b6613d6e406@smile.fr>
Date: Tue, 4 Feb 2025 16:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Graeme Smecher <gsmecher@threespeedlogic.com>, buildroot@buildroot.org
Cc: alexander.sverdlin@gmail.com, thomas.petazzoni@bootlin.com
References: <f63378d9f3ed51f3740b15d02e66f8831905cc8b.camel@gmail.com>
 <20240229165310.1453209-1-gsmecher@threespeedlogic.com>
Content-Language: en-US
In-Reply-To: <20240229165310.1453209-1-gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738684155; x=1739288955; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T/rT3Gym90pJOcJVrgZk5q5SNfAtbyYg9GUMqcuw7u4=;
 b=mUsXycjvTiDPwUBhR9CXzGIRAD2mO99rgYILPVSaFhNbxn+qHdiJ9tvlSb7ivHj+f3
 XVZYrZ8lUyUuyaaFAxW7XEyCtXIO9/jpi5FPFu7SnBdynKYunWhesrMrMbU0mkdYyh1J
 d7DAgX2XHp+qOhuyB7aYO4Qn3bmXelaT0mBXk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mUsXycjv
Subject: Re: [Buildroot] [PATCH v2] linux.mk: Allow wildcards in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR3JhZW1lLCBBbGwsCgpMZSAyOS8wMi8yMDI0IMOgIDE3OjUzLCBHcmFlbWUgU21lY2hl
ciBhIMOpY3JpdMKgOgo+IFRoZXJlIGFyZSBhIGZldyBjb25maWcvIGVudHJpZXMgd2hlcmUgd2ls
ZGNhcmRzIGFyZSBhbHJlYWR5IHByZXNlbnQ6Cj4gCj4gICAgICAkIGdyZXAgLXJsZSAnQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEg9LipcKicgY29uZmlncy8KPiAgICAgIGNvbmZpZ3Mv
b2N0YXZvX29zZDMybXAxX2Jya19kZWZjb25maWcKPiAgICAgIGNvbmZpZ3Mvb2N0YXZvX29zZDMy
bXAxX3JlZF9kZWZjb25maWcKPiAKPiAuLi5ob3dldmVyLCB3aGlsZSB0aGUgY29weS1pbiBzdGVw
IG9mIGRldmljZSB0cmVlIGNvbXBpbGF0aW9uIHdvcmtzCj4gY29ycmVjdGx5LCB0aGVzZSB3aWxk
Y2FyZHMgYXJlIG5vdCBjb252ZXJ0ZWQgdG8gRFRDIGJ1aWxkIHRhcmdldHMgaW4gdGhlCj4ga2Vy
bmVsIGJ1aWxkLiBBcyBhIHJlc3VsdCwgdGhpcyBjb25maWd1cmF0aW9uIGxpbmUgYWxvbmUgaXMg
bm90IGVub3VnaAo+IHRvIGdlbmVyYXRlIERUQ3MuIEl0IHNob3VsZCBiZS4KPiAKPiBUaGlzIHBh
dGNoIGFkZHMgYSAkKHdpbGRjYXJkKSBleHBhbnNpb24gc3RlcCBpbnRvIGdlbmVyYXRpb24gb2Yg
RFRCCj4gY29tcGlsYXRpb24gdGFyZ2V0cyAodGhlIExJTlVYX0RUQl9OQU1FIHZhcmlhYmxlKS4g
QXMgYSByZXN1bHQsCj4gd2lsZGNhcmRzIGJlaGF2ZSBjb3JyZWN0bHkuCgpBY3R1YWxseSwgdGhl
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIGhlbHAgdGV4dCBzdGF0ZSB0aGF0IG9u
bHkgYSBsaXN0Cm9mIGZpbGVzIGlzIGV4cGVjdGVkIGhlcmUgWzFdLgoKSSBzdWdnZXN0IHRvIGV4
cGxpY2l0bHkgbGlzdCBhbGwgZHRzIGZpbGVzIHRoYXQgc2hvdWxkIGJlIHVzZWQgYnkgdGhpcyBj
b25maWcgZmlsZS4KCk5vdGU6IEFuIGlzc3VlIHdhcyByZXBvcnRlZCByZWNlbnRseSB3aXRoIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRILCB3ZQpwbGFuIHRvIHJld29yayBob3cgdGhl
IGV4dGVybmFsIGRldmljZXRyZWUgZmlsZXMgYXJlIGltcG9ydGVkIGludG8gdGhlIGtlcm5lbApz
b3VyY2VzLgoKV2hpbGUgdHJ5aW5nIHRvIHJlcHJvZHVjZSBkdWUgdG8gYSBrZXJuZWwgYnVpbGQg
aXNzdWUgd2l0aCBsYXRlc3QgcHJlYnVpbHQKdG9vbGNoYWlucy4KClsxXQpodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9saW51eC9Db25maWcu
aW4/cmVmX3R5cGU9aGVhZHMjTDQyOQoKWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvODk5MDI2MjY3Nwoob2N0YXZvX29zZDMybXAxX2Jya19kZWZj
b25maWcpClszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzg5OTAyNjI2NzkKKG9jdGF2b19vc2QzMm1wMV9yZWRfZGVmY29uZmlnKQoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogR3JhZW1lIFNtZWNoZXIgPGdzbWVjaGVy
QHRocmVlc3BlZWRsb2dpYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8
YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiAtLS0KPiAgbGludXgvbGludXgubWsgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9saW51eC9saW51eC5tayBiL2xpbnV4L2xpbnV4Lm1rCj4gaW5kZXggMWRi
NWM2MDQ2ZC4uODA4ODE1OTdhZCAxMDA2NDQKPiAtLS0gYS9saW51eC9saW51eC5tawo+ICsrKyBi
L2xpbnV4L2xpbnV4Lm1rCj4gQEAgLTE5NSw3ICsxOTUsNyBAQCBMSU5VWF9EVFNfTkFNRSArPSAk
KGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUUpKQo+ICAjIGFu
ZCAuZHRzaSBmaWxlcyBpbiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSC4gQm90aCB3
aWxsIGJlCj4gICMgY29waWVkIHRvIGFyY2gvPGFyY2g+L2Jvb3QvZHRzLCBidXQgb25seSB0aGUg
LmR0cyBmaWxlcyB3aWxsCj4gICMgYWN0dWFsbHkgYmUgZ2VuZXJhdGVkIGFzIC5kdGIuCj4gLUxJ
TlVYX0RUU19OQU1FICs9ICQoYmFzZW5hbWUgJChmaWx0ZXIgJS5kdHMsJChub3RkaXIgJChjYWxs
IHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIKSkpKSkKPiArTElOVVhf
RFRTX05BTUUgKz0gJChiYXNlbmFtZSAkKGZpbHRlciAlLmR0cywkKG5vdGRpciAkKHdpbGRjYXJk
ICQoY2FsbCBxc3RyaXAsICQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKSkpKSkK
PiAgCj4gIExJTlVYX0RUQlMgPSAkKGFkZHN1ZmZpeCAuZHRiLCQoTElOVVhfRFRTX05BTUUpKQo+
ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
