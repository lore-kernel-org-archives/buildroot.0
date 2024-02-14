Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC7C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED8260F01;
	Wed, 14 Feb 2024 10:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKe7zTy55KUB; Wed, 14 Feb 2024 10:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C6060F34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C6060F34;
	Wed, 14 Feb 2024 10:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50CA61BF360
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B3E141736
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Djqxe4FUAnc1 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3018D4176D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3018D4176D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3018D4176D
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:59:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso3500145e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908342; x=1708513142;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RM6+q7heE7gZ6qj9aigAHOx3889GhbCG3l0Upkc4qWE=;
 b=ejFOPb9i2l+843R5V8LVpPaSZ6FH3NXsZOg0wlRWbGIZiJPOUcNGWVuVGYvVwUzVBA
 cXmSQojGC2Ru/XxkQU+JnUS4VEjQcC5E81iRR/4lEA3V7AX0th6KaTjdlHChKmnkmuJw
 5+YHYmImXjtbyZg/AnWcd1G04MH6h34z9Ot/NAhoFd6c9FwSjUXCx911Wf54nFb4pfiu
 0wzlFReFlIET5DaYh/u3BSurmrp0BSAMCITO7UDIndo5J3WnjFX+37ldsGPt/VJ5JEk2
 k0JQwQYWMiPXiF33NEMyVi9h8B5TpwS2MwXjGgiuThvBJstP9Mj0usWmaf+MNnQyZcB5
 RUVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk01UHxHgYP2WzU5cXD0SuMwsY41w+cCL8i2+T9cINxCMTBZDN0BPzYR3BFE/Jn4J9jc1r+IcOE8cAoSxVR3qQZLOrsRIRBQ==
X-Gm-Message-State: AOJu0YzEuRtEiVontPyZagXb7CjYFeTzBA5XPOnnApsm3+ukzQhcAI/S
 rKh0/xoHApWXgZp/wnX9/mxltN39wlWoBqNnZHIYnPujuoFF9ybV
X-Google-Smtp-Source: AGHT+IG5uGa7s5nldDCDFpawF1mKSjfbtE/wTbhUS0YW9DyhnDAnkxADzJaTPqdlBMiaG70eV60Jhg==
X-Received: by 2002:a5d:6702:0:b0:33c:e2a1:5f28 with SMTP id
 o2-20020a5d6702000000b0033ce2a15f28mr1504609wru.0.1707908342208; 
 Wed, 14 Feb 2024 02:59:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkU5yFtVY7uC4vOE4nUN1GkC+kShtF05q8Cy7WeRxFpKeRcuYKT0MXxdWF0wNRpWwwJl4ZXsQnz012ZUhTejRxd2qhcHoCyw==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 bo26-20020a056000069a00b0033cd06387ddsm4671857wrb.82.2024.02.14.02.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:59:01 -0800 (PST)
Message-ID: <b2c93d998117ae26f726026e700a05f15479108a.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:59:01 +0100
In-Reply-To: <20240213172817.2872849-20-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-20-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908342; x=1708513142; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RM6+q7heE7gZ6qj9aigAHOx3889GhbCG3l0Upkc4qWE=;
 b=kvdZQtd1Y2pxgcDjvvEBzSghC5xT/bxS5SgbToKNSKf2LHT/8Bbx8biosBiNZwdfC0
 fDOD+J/qKNlSrVBYUNhbRC5TY50775OhCV7viA9N6OD28YuW9/HTJvAx94TRZ8xdVxkb
 ezM5vEqz6q8sfEVoXD3Usm8mbTmFk5Uo+tw0pbq+0oQrkSigYeIyho7qCackJMBBJtPV
 FQTKOfLs1cHdNoKscXattjApVcKXzxW/dfl97OLVGezshHXQEoN+kPE5setVxTVqzT3+
 Ll/Un672kM5/wnWz2H2mysROIjxt5XgtlFvof7a/WUhGulRdDj7W8KP/rDqsUKx1ZJ6P
 5wSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kvdZQtd1
Subject: Re: [Buildroot] [PATCH 19/21] configs/ti_am62x_sk_defconfig: update
 to uboot 2024.01 to use binman tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gVXBkYXRlIHUtYm9vdCBmb3IgYTUzIGFuZCByNSBjb3JlIHRvIDIwMjQuMDEg
YW5kIGVuYWJsZSBiaW5tYW4gc3VwcG9ydAo+IGluIG9yZGVyIHRvIHJlbW92ZSBCUjJfVEFSR0VU
X1RJX0szX0lNQUdFX0dFTi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KCkxvb2tzIGdvb2QgdG8gbWUgaW4gcHJpbmNpcGxlLCBzbwpSZXZp
ZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29t
PgoKQnV0IG1heWJlIHlvdSBjb3VsZCBhZGQgYSB3b3JkIGludG8gY29tbWl0IG1lc3NhZ2UgYWJv
dXQgdXBkYXRlZCBBVEYKaWYgeW91J2xsIHJlLXNwaW4uCgo+IC0tLQo+IMKgY29uZmlncy90aV9h
bTYyeF9za19kZWZjb25maWcgfCAxMiArKysrKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
dGlfYW02Mnhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBp
bmRleCBjM2FkNTU1YTgxLi5mNzI1NzM0NTUxIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvdGlfYW02
Mnhfc2tfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBA
QCAtMTYsMjUgKzE2LDI5IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gwqBCUjJfVEFS
R0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1Nk0iCj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFPXkKPiDCoEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJ
T049eQo+IC1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSJ2Mi43Igo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSJ2Mi4xMCIKPiDCoEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExB
VEZPUk09ImszIgo+IMKgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9UQVJHRVRfQk9B
UkQ9ImxpdGUiCj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9
eQo+IMKgQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gwqBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRG
T1JNPSJrMy1hbTYyeCIKPiAtQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU49eQo+IC1CUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTl9TT0NfQU02Mlg9eQo+ICtCUjJfVEFSR0VUX1RJX0szX0JPT1Rf
RklSTVdBUkU9eQo+ICtCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfU09DX0FNNjJYPXkK
PiDCoEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSPXkKPiArQlIyX1RBUkdFVF9USV9LM19SNV9M
T0FERVJfQ1VTVE9NX1ZFUlNJT049eQo+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNU
T01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIKPiDCoEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
X0JPQVJEX0RFRkNPTkZJRz0iYW02MnhfZXZtX3I1Igo+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9VU0VfQklOTUFOPXkKPiDCoEJSMl9UQVJHRVRfVUJPT1Q9eQo+IMKgQlIyX1RBUkdFVF9V
Qk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4gwqBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9W
RVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4x
MCIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIKPiDC
oEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fYTUzIgo+IMKgQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVO
U1NMPXkKPiDCoEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+IMKgQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19USV9LM19ETT15Cj4gK0JSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTj15
Cj4gwqAjIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0JJTiBpcyBub3Qgc2V0Cj4gwqBCUjJfVEFS
R0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+IMKgQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQoKLS0gCkFs
ZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
