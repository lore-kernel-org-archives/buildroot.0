Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D54DC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CA53801CC;
	Wed, 24 Jul 2024 18:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKKm7GczZfjU; Wed, 24 Jul 2024 18:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F09BF80B20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F09BF80B20;
	Wed, 24 Jul 2024 18:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28F481BF97D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 18:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E32406A4
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 18:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaK6BiQ7pXb6 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 18:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C46C40691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C46C40691
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C46C40691
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 18:03:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52fcc56c882so957696e87.0
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 11:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721844184; x=1722448984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqEB9NBqCo/9g8r6+KjNviUKGMtjuolRjdiy5XqpeoQ=;
 b=HJ/J80MsY/eYGvmxThfiX6xx0OQmrWI9vXJxxzTVcK5mQJFXZW9zgyjjPYuxAFw9yY
 9LOYOOd1abu4nx3pVG1aCW2svXsT1Q/kD1VF8O2+dwYHImrTWOaT/xlguhzqn55py1Ia
 coVYdA8+zgG4DMVj7MQF9LkphOsaFiLxOhJNGryqHBy9WX1F3gjt30YO664Siv9yX2xZ
 1jSktHxefv6XAoCOGEZeElPCcuWdLX+r5s18HhiVIvvPocgF14E9eJ1jpDRl6b5bPUAR
 6WCPx6YVdC6ae0WfCWnISNCRx/G3uJidd0GyrFfjnVMj8GVS0f1bGVzRD43h4/4HUWR8
 Ki1g==
X-Gm-Message-State: AOJu0YxfixAaWUYOQIP+XKpUN2RBTt/5aYTwPfEy5HQ7Ca5i05TiOTee
 4BuwABliEUTO9r0p7Wo++4s7kHIoqZMTuEd5LAsCdX4F1U+Msa1IZ9wn1V/mOA8LuJEsgBEalEW
 AoJznNl5UQCqBfPhOxMa/H8s8D1w=
X-Google-Smtp-Source: AGHT+IGwhNBPPQOjVKFR+dLtCNCVyJwgV8ZxJ3ejs2Um3lEgMkSucXS8rvdaByR45OwbY8rylvDII+bfHCjNlXSodMo=
X-Received: by 2002:a05:6512:281a:b0:52e:fa08:f0f5 with SMTP id
 2adb3069b0e04-52fd41f991bmr125987e87.13.1721844183900; Wed, 24 Jul 2024
 11:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240723215041.771843-1-fontaine.fabrice@gmail.com>
 <20240724183354.71cb212b@windsurf>
In-Reply-To: <20240724183354.71cb212b@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 24 Jul 2024 20:02:52 +0200
Message-ID: <CAPi7W82QGP9nAX=RmfsiCvh6fiHSBvoYOuMx4g2WKN-+CDvXRA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721844184; x=1722448984; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqEB9NBqCo/9g8r6+KjNviUKGMtjuolRjdiy5XqpeoQ=;
 b=m3znzdv2UCACUHvYbhDxTNKoifHKntjIZb6n1VmJ4p0E+/n5jw1oyegpnYPznrsMpV
 f5RsPM/iGGlP9h6vnNQmupMJHRV9syQsP0ld3RrSecCjZ4S215hfS52LsDkmo2HCOaQG
 N2jhAJkq+pIyMWMk5xbnMBgPykKk9caU/pjC/ofXpj+ps/+i1FyPMTS2Ixyo5XeL8Iam
 uPlsZYAGmY7KKT+DXXcIZrOIZTtuI14D6zWMAF/seAp7LIKSyWvkGqewrDHVA3RwRWcv
 MOa7mpMFRtLHpAXujRdl9GIzm019LaFdhjxSyfCI3/HlS1/vEgkgvajQR1v3BDvmIvlO
 NKaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m3znzdv2
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: fix musl static build
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

TGUgbWVyLiAyNCBqdWlsLiAyMDI0IMOgIDE4OjMzLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIDIzIEp1bCAyMDI0
IDIzOjUwOjQxICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBGb3IgYW4gdW5rbm93biByZWFzb24sIHJ1bm5uaW5nIGF1dG9y
ZWNvbmYgaXMgbmVlZGVkIHRvIGF2b2lkIHRoZQo+ID4gZm9sbG93aW5nIHN0YXRpYyBidWlsZCBm
YWlsdXJlIG9uIG11c2wgd2hpY2ggaXMgcmFpc2VkIGJlY2F1c2UgTERGTEFHUwo+ID4gKHdoaWNo
IGNvbnRhaW5zIC1zdGF0aWMpIGlzIG5vdCBwYXNzZWQ6Cj4gPgo+ID4gL2hvbWUvYXV0b2J1aWxk
L2F1dG9idWlsZC9pbnN0YW5jZS0xNi9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvYXJtZWItYnVpbGRy
b290LWxpbnV4LW11c2xlYWJpLzEzLjMuMC8uLi8uLi8uLi8uLi9hcm1lYi1idWlsZHJvb3QtbGlu
dXgtbXVzbGVhYmkvYmluL2xkOiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTE2
L291dHB1dC0xL2hvc3QvbGliL2djYy9hcm1lYi1idWlsZHJvb3QtbGludXgtbXVzbGVhYmkvMTMu
My4wL2xpYmdjYy5hKF9kdm1kX2xueC5vKTogaW4gZnVuY3Rpb24gYF9fYWVhYmlfaWRpdjAnOgo+
ID4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xNi9vdXRwdXQtMS9idWlsZC9o
b3N0LWdjYy1maW5hbC0xMy4zLjAvYnVpbGQvYXJtZWItYnVpbGRyb290LWxpbnV4LW11c2xlYWJp
L2xpYmdjYy8uLi8uLi8uLi9saWJnY2MvY29uZmlnL2FybS9saWIxZnVuY3MuUzoxNDk5OigudGV4
dCsweDgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGByYWlzZScKPiA+Cj4gPiBUaGlzIGJ1aWxk
IGZhaWx1cmUgaXMgcmFpc2VkIGJ5IGF1dG9idWlsZGVycyBzaW5jZSBidW1wIHRvIHZlcnNpb24g
NS42LjIKPiA+IGluIGNvbW1pdCBkMWQ3N2ViMjc0NzYxZDFmMmQyNGVlNGI1NWEzNzRlOTE3YzY3
YThlIGJ1dCBpdCBjYW4gYWxzbyBiZQo+ID4gcmVwcm9kdWNlZCBvbiB2ZXJzaW9uIDUuNC43IChi
dXQgbm90IG9uIDUuNC42KS4gVGhlcmUgaXMgcHJvYmFibHkgYW4KPiA+IGlzc3VlIHdpdGggdGhl
c2UgdHdvIG9mZmljaWFsIGF1dG90b29scyB0YXJiYWxscyB3aGljaCBoYXZlIGJlZW4KPiA+IHJl
bGVhc2VkIHRoZSBzYW1lIGRheSAob24gTWF5IDI5IDIwMjQpLgo+ID4KPiA+IEZpeGVzOiA0MDI0
MGFjMzBhZmM0YzZhZjc2NTc5NGYzOGU2ODE1MTYyY2E2MWZhCj4gPiAgLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zNDQ4MTNiMjAyNjQ0YTIzYzE2NjkyMGFhN2U4NjFl
YmY0MDg1MzZiCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3h6L3h6Lm1rIHwgMiAr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IFRoYW5rcyBmb3IgdGhl
IGludmVzdGlnYXRpb24uIEhvd2V2ZXIsIEknZCBsaWtlIHRvIGhhdmUgYSBsaXR0bGUgYml0Cj4g
YmV0dGVyIHVuZGVyc3RhbmRpbmcgdGhhbiAidW5rbm93biByZWFzb24iLiBDb3VsZCB5b3UgY29t
cGFyZSB0aGUKPiBidWlsZC9saW5rIGNvbW1hbmQgbGluZXMgdXNlZCBieSB4eiB3aXRob3V0L3dp
dGggdGhlIEFVVE9SRUNPTkYgPSBZRVMsCj4gdG8gc2VlIHdoYXQncyBkaWZmZXJlbnQ/CgpXaXRo
b3V0IGF1dG9yZWNvbmY6CgpsaWJ0b29sOiBsaW5rOiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9v
dXRwdXQvaG9zdC9iaW4vYXJtZWItYnVpbGRyb290LWxpbnV4LW11c2xlYWJpLWdjYwotZnZpc2li
aWxpdHk9aGlkZGVuIC1XYWxsIC1XZXh0cmEgLVd2bGEgLVdmb3JtYXQ9MiAtV2luaXQtc2VsZgot
V21pc3NpbmctaW5jbHVkZS1kaXJzIC1Xc2hpZnQtb3ZlcmZsb3c9MiAtV3N0cmljdC1vdmVyZmxv
dz0zCi1XYWxsb2MtemVybyAtV2R1cGxpY2F0ZWQtY29uZCAtV2Zsb2F0LWVxdWFsIC1XdW5kZWYg
LVdzaGFkb3cKLVdwb2ludGVyLWFyaXRoIC1XYmFkLWZ1bmN0aW9uLWNhc3QgLVd3cml0ZS1zdHJp
bmdzIC1XZGF0ZS10aW1lCi1Xc2lnbi1jb252ZXJzaW9uIC1XZmxvYXQtY29udmVyc2lvbiAtV2xv
Z2ljYWwtb3AgLVdhZ2dyZWdhdGUtcmV0dXJuCi1Xc3RyaWN0LXByb3RvdHlwZXMgLVdvbGQtc3R5
bGUtZGVmaW5pdGlvbiAtV21pc3NpbmctcHJvdG90eXBlcwotV21pc3NpbmctZGVjbGFyYXRpb25z
IC1XcmVkdW5kYW50LWRlY2xzIC1EX0xBUkdFRklMRV9TT1VSQ0UKLURfTEFSR0VGSUxFNjRfU09V
UkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLU8wIC1nMiAtbyB4emRlYwp4emRlYy14emRlYy5v
IHh6ZGVjLXR1a2xpYl9wcm9nbmFtZS5vIHh6ZGVjLXR1a2xpYl9leGl0Lm8KLi4vLi4vc3JjL2xp
Ymx6bWEvLmxpYnMvbGlibHptYS5hIC1scHRocmVhZCAtcHRocmVhZAoKV2l0aCBhdXRvcmVjb25m
OgoKbGlidG9vbDogbGluazogL2hvbWUvZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmlu
L2FybWViLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaS1nY2MKLWZ2aXNpYmlsaXR5PWhpZGRlbiAt
V2FsbCAtV2V4dHJhIC1XdmxhIC1XZm9ybWF0PTIgLVdpbml0LXNlbGYKLVdtaXNzaW5nLWluY2x1
ZGUtZGlycyAtV3NoaWZ0LW92ZXJmbG93PTIgLVdzdHJpY3Qtb3ZlcmZsb3c9MwotV2FsbG9jLXpl
cm8gLVdkdXBsaWNhdGVkLWNvbmQgLVdmbG9hdC1lcXVhbCAtV3VuZGVmIC1Xc2hhZG93Ci1XcG9p
bnRlci1hcml0aCAtV2JhZC1mdW5jdGlvbi1jYXN0IC1Xd3JpdGUtc3RyaW5ncyAtV2RhdGUtdGlt
ZQotV3NpZ24tY29udmVyc2lvbiAtV2Zsb2F0LWNvbnZlcnNpb24gLVdsb2dpY2FsLW9wIC1XYWdn
cmVnYXRlLXJldHVybgotV3N0cmljdC1wcm90b3R5cGVzIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24g
LVdtaXNzaW5nLXByb3RvdHlwZXMKLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3JlZHVuZGFudC1k
ZWNscyAtRF9MQVJHRUZJTEVfU09VUkNFCi1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09G
RlNFVF9CSVRTPTY0IC1PMCAtZzIgLXN0YXRpYyAtc3RhdGljCi1vIHh6ZGVjIHh6ZGVjLXh6ZGVj
Lm8geHpkZWMtdHVrbGliX3Byb2duYW1lLm8geHpkZWMtdHVrbGliX2V4aXQubwouLi8uLi9zcmMv
bGlibHptYS8ubGlicy9saWJsem1hLmEgLWxwdGhyZWFkIC1wdGhyZWFkCgpTbyBhcyB5b3UgY2Fu
IHNlZSwgdGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGUgYWRkaXRpb24gb2YgLXN0YXRpYyAtc3Rh
dGljLgoKPgo+IFdoYXQgcHV6emxlcyBtZSBpcyB0aGF0IHRoZSBidWlsZCBmYWlsdXJlcyBhcmUg
cmVsYXRlZCB0byBsaWJnY2MuYQo+IG1pc3Npbmcgc29tZSBzeW1ib2xzLiBTbyBkbyB3ZSBoYXZl
IGEgeHogaXNzdWUgaGVyZSwgb3IgZG8gd2UgaGF2ZSBhbgo+IGFjdHVhbCBob3N0LWdjYy1maW5h
bCBpc3N1ZSB0aGF0IHNvbWVob3cgZ2V0cyB3b3JrZWQtYXJvdW5kIGJ5IGRvaW5nCj4gWFpfQVVU
T1JFQ09ORiA9IFlFUyA/IFRoYXQgaXMgd2hhdCB3b3JyaWVzIG1lIGFib3V0IG1lcmdpbmcgdGhp
cyBmaXgKPiB3aXRob3V0IGEgc2xpZ2h0bHkgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2Ygd2hhdCdz
IGdvaW5nIG9uLgoKVGhlICJ1bmRlZmluZWQgcmVmZXJlbmNlIHRvIHJhaXNlIiBpcyB0aGUgdXN1
YWwgZXJyb3Igd2hlbiAtc3RhdGljIGlzCm5vdCBwYXNzZWQgd2hlbiBidWlsZGluZyBzdGF0aWNh
bGx5IHdpdGggbXVzbC4KWW91IGV2ZW4gb3BlbmVkIGEgdGlja2V0IG9uIG11c2wgbWFpbGluZyBs
aXN0IGJhY2sgaW4gMjAxODoKaHR0cHM6Ly9pbmJveC52dXh1Lm9yZy9tdXNsLzIwMTgwNTA5MTEy
OTMyLjFhMzE3NmIwQHdpbmRzdXJmLmhvbWUvVC8KCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
