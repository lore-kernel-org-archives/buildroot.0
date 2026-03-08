Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42A7EA8546
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC0F60702;
	Sun,  8 Mar 2026 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE4KMlTyttF3; Sun,  8 Mar 2026 21:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84FF60706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773005638;
	bh=2ld0xEKbjfRv0HtarGrnRToMbAW309b/BEvGu+19prk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cVq/zxnAS1i09HiD2VE6Ejk+2+E5lXokA/eUplaqAFZL0NLmycnViqhIRVJKP2I3F
	 qYfenXoscLWKOGnMWnWttRH/vgZRk9kjgtp+vr1yLyeuNCRHPtCZOklru646Y5S+uI
	 aZxPxXxOqSga3KY02R7XMrV9SJQ+zKOltpDKlhaPtyX0yajnkx1mI0wLqkJZeW/wdU
	 zqW+lxLsa6Z2akxfJ+WyM5eRekx4jL3ouQ+c98aKofl6mvoxvk3gMa64BpD1GkTt4l
	 NbY/TzPXqAlv5iaqoUAOBjsEAkJuxgsxKyfWuotR2ApRyxLB8vLXLRFb2n080ds0np
	 6eO4BFSp5qrXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A84FF60706;
	Sun,  8 Mar 2026 21:33:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5D9358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A54822E8
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AZ8O-PD4rGb for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E812822EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E812822EA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E812822EA
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so12790335e9.2
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 14:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005632; x=1773610432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oaaYpEJyvDb+Z4TLitN8lNnvSOVyfRRihIeNlKssRvc=;
 b=Wglu4+08LYCV20p5g7DpB6vfTiSuRvn5bDB3MIvAt6TCikFFYWRPbx0Z+LiyaACBZO
 Lx9U9DOMqMyofhxCx3NYRbiHPfgHpGaBclUCrOrRP/rN4bHmDUy8MCyEyt8Az4VPA+bs
 XYG7SUR0Jpg7Fyjz3LLrCmKKl8B8rjD5WZNA3wqM4nCB0ULJXABeW1ZkUEtn7LoGRfq4
 6JLwJ8QjEjKyluiBqs9brcVRolZtZ1mjW++pS5vlaLpdeJRstwZ9ytJ3YLEvPWWX0qMm
 0SsptKxZKp7ci4PWVhoPSTypMB43Mdw5aSWtH3+txo3OwPLwEzh25OIVmhNwoHaM55KM
 9XtA==
X-Gm-Message-State: AOJu0YzmAAhtqWCVaQpbF+hWBHdgTkH5poLmdqp6u4PlQR3+4Xtfh3xs
 UN/yD3d0M7DiKuseFXmrcKgSzjdw/y9pNkKxXimGysjZZ6f27L2orGJLBLd0JBqoUA7SiU6rNdd
 U130m
X-Gm-Gg: ATEYQzyxSYLc6HnU5uc0XawH4V2pwSHEoRO5mTsv9lzn16BHTtJakfsNwDTNZ6mTgUv
 0Dyhb1EK1FJUwn0TFGnNtYgYxo8oY1EYC/oP0Q6CJBFHNHckQEglwRIGKrrDJP6gEe/dGhIs9N5
 gqDwh5kCKo3daksKz0UpN9xldod+G3KRBkMoGyNXbZ97EuWuK/HaRwuyfxO1eCrmBvOjKGciwbI
 jrx90td7PqdQFKW9GV44NzbkzpoiAultEj2fLIUgFXtQL9Wyk6st/JN/fF4FsKbnL1wagAEOOG9
 yBheEWBnNuRIhRL9n0ToekzZIbxJUMl9dTKwXV96XASfFujKdiuTR82SqgJuSWrIbYvGx3TwBpu
 i8ur5YT9qe11PVXBUKZmQwz7s0XNqlO/JjFCiiX+A0T4cSFxk2gOCGZCkvFq5ZxeC1kI3S3AHCz
 mYCsSz72aNNTzhJjWw57Xp3aIWH3ppPzLs/Gur0tDbP7UVF2EbvjOO0hQkjWWh1rmAKZjZPprgp
 mq/uLKcDductc4W4h3bwVwQlA==
X-Received: by 2002:a05:600c:350e:b0:480:4a90:1afe with SMTP id
 5b1f17b1804b1-485269785afmr141289915e9.34.1773005632362; 
 Sun, 08 Mar 2026 14:33:52 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm458929445e9.13.2026.03.08.14.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:33:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2026 22:33:46 +0100
Message-ID: <20260308213348.708846-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260308213348.708846-1-romain.naour@smile.fr>
References: <20260308213348.708846-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773005632; x=1773610432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaaYpEJyvDb+Z4TLitN8lNnvSOVyfRRihIeNlKssRvc=;
 b=0EtlxGz4dxXtd1ZekNTAPBg8zP95hSRQyBn1O0eTLcnP0XqVnJ6PoNJWx5+1hMkhiM
 b3GWqhTlqTHysMRoeFyRMvisuxR8tHnjYCWQMyuWVvTKat6/BSlsCF2F3DMXCgiOE9Zi
 hxvy7aPJHeX492EPZVPdQlJ5Q+QWmymjBiEJI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0EtlxGz4
Subject: [Buildroot] [PATCH 2/4] configs/beagleboneai64_defconfig: bump to
 kernel 6.18.16
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

VGhlcmUgd2FzIGEgcHJldmlvdXMgYXR0ZW1wdCBpbiBjb21taXQgWzFdIHRvIGJ1bXAgdGhlIGtl
cm5lbCB0byA2LjE4CmJ1dCB0aGUgU0QgY2FyZCBmYWlsZWQgYXQgYm9vdC4gSXQgc2VlbXMgdGhl
IGFjdHVhbCBpc3N1ZSBpcyByZWxhdGVkIHRvCnRoZSAiY2hlYXAiIChvciBmYWtlPykgU0QgY2Fy
ZCB3aXRoIFNEIFVIUyBTRFI1MCBzcGVlZC4KClRoaXMgb2ZmZW5kaW5nIFNEIGNhcmQgY29tZSBm
cm9tIGEgbG90IHJlY2VudGx5IHB1cmNoYXNlZCBpbiBvcmRlciB0bwpmaXggbXkg4oCcVG9vIG1h
bnkgYm9hcmRzLCBub3QgZW5vdWdoIFNEIGNhcmRz4oCdIGlzc3VlLgoKWzFdIDRhYmI4YTk4YjI2
OTIyNzk2YjQxYmM5MTNlNzJiZTQ4NzMzNzY0MGUKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgotLS0KIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJv
bmVhaTY0L3BhdGNoZXMvbGludXgvbGludXguaGFzaCB8IDIgKy0KIGNvbmZpZ3MvYmVhZ2xlYm9u
ZWFpNjRfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jv
YXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3BhdGNoZXMvbGludXgvbGludXguaGFzaCBi
L2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3BhdGNoZXMvbGludXgvbGludXguaGFz
aAppbmRleCA3ZmJiODFkN2UzLi5lYjRkY2VlOTU4IDEwMDY0NAotLS0gYS9ib2FyZC9iZWFnbGVi
b2FyZC9iZWFnbGVib25lYWk2NC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKKysrIGIvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCkBAIC0x
LDIgKzEsMiBAQAogIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2tlcm5l
bC92Ni54L3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIDliNGNjZWM3ZDhjZWZmNDgyNGYxNDllNDc2
ZWMwNmU4M2M4NjU0NmFlOGFmODI1ODI4NzE2NDc4MDlhNjJlZjAgIGxpbnV4LTYuMTIuNzAudGFy
Lnh6CitzaGEyNTYgIDRmMjFjMDFmNGQwNGMxZDFiM2VkNzk0MTUzZjg5MDA4MDJjOTI0OTdiZTYy
MGIwN2M0ODY5NTMwZjJkMjhlZTMgIGxpbnV4LTYuMTguMTYudGFyLnh6CmRpZmYgLS1naXQgYS9j
b25maWdzL2JlYWdsZWJvbmVhaTY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpNjRf
ZGVmY29uZmlnCmluZGV4IDdiYWQxNTczYjcuLmFlYjE1ODMzMWYgMTAwNjQ0Ci0tLSBhL2NvbmZp
Z3MvYmVhZ2xlYm9uZWFpNjRfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpNjRf
ZGVmY29uZmlnCkBAIC0xMSw3ICsxMSw3IEBAIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9
InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJH
Uz0iLWMgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvZ2VuaW1hZ2UuY2ZnIgogQlIy
X0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTIuNzAiCitCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjE4LjE2IgogQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
QVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9G
SUxFUz0iYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvbGludXguZnJhZ21lbnQiCiBC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLS0gCjIuNTIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
