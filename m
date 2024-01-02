Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E74C46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 921B440AA5;
	Wed,  3 Jan 2024 00:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 921B440AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNcvU_IPaqoe; Wed,  3 Jan 2024 00:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB2440A96;
	Wed,  3 Jan 2024 00:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB2440A96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4C91BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDB0460EF8
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB0460EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cER9CAXRC0Wg for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:15 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5D4860DB7
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D4860DB7
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so6952356a12.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240013; x=1704844813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gtEMdX1Dndgg+9z/iG788OM4YTfLAObzidkJ4qDCl1E=;
 b=Uz9o4EIlBWL8DvhviB2+Nvg5FwXu40Irab+sxLUnbqRKI6eKggxLjV654PyiE/R1qf
 uIGHi8/QntRYBFfinDvRM5A/22AFpHXEvTka/MLYB4xNaTZ+SU+s5Rt918tfumLX67hX
 UuxZKfNjyWiq54BXhJkk8xsJHr38tk13VZWGiQbAKh9lw0KKuTap+6Y8J2fofN8L2HpF
 k/LhyrcUvcpSwEcBU8B7HqdFgQvFX/6NEufObXfRJK5gq1ha2DW4Lvc8IodII0YfF3i7
 /K1DitUmNcLLocnNfqwVqjfzCv0SiRV0rUNQVSKM9MnxfrV65otGcKQNycZ9K4KCkISD
 ietw==
X-Gm-Message-State: AOJu0Yy1DgycT3MFJMoz3urUPmjCcit2+9QJidyMOG/Rt2V1udDn39DK
 C/eKLmoLGC1NbW6rnjddmMfYJvgcRrk2a3ntmMqtH1s7rcU=
X-Google-Smtp-Source: AGHT+IFnVNT2SWlFIZQfBtuoy7cNSfUIoZr7Uo53pKG5w66t8ScTSpaHJV3SeKaTD/6kdkNJKffu0Q==
X-Received: by 2002:a17:90b:4a42:b0:28c:815e:e0f0 with SMTP id
 lb2-20020a17090b4a4200b0028c815ee0f0mr267227pjb.37.1704240013489; 
 Tue, 02 Jan 2024 16:00:13 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:13 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:29 -0700
Message-ID: <20240102235957.3072102-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240013; x=1704844813;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtEMdX1Dndgg+9z/iG788OM4YTfLAObzidkJ4qDCl1E=;
 b=YkwjKsFZRkEXs7zfSIv6bFhEOnDYMhhXdF1De5bNJyxBL8mOcDENwvwXzJamfuRMWU
 2P6xk4q4q+D1w124cMA/y2Wzzr04RXIxptfdWBeUoIM7+kiesP4oRVaDwdeq6YxA1lq1
 Ab+hXND1TK6uTkNCuYrTTHiwgm3JzNERXYkTc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YkwjKsFZ
Subject: [Buildroot] [PATCH v3 07/11] package/flutter-engine: Add profile
 runtime mode selection
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRyb290IG9ubHkgb2ZmZXJzIHR3byBwb3NzaWJsZSBydW50aW1lIG1vZGVzIGZvciBGbHV0
dGVyIHRoYXQgYXJlCmF1dG9tYXRpY2FsbHkgc2VsZWN0ZWQgYmFzZWQgb24gd2hhdCB0aGUgdXNl
ciBoYXMgc2VsZWN0ZWQ6CiAgLSBkZWJ1ZyBpZiBCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcgaXMg
ZW5hYmxlZC4KICAtIHJlbGVhc2UgaWYgQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHIGlzIG5vdCBl
bmFibGVkLgoKSG93ZXZlciwgRmx1dHRlciBhbHNvIG9mZmVycyB0aGUgcHJvZmlsZSBydW50aW1l
IG1vZGUgb3B0aW9uLgoKRnJvbSBodHRwczovL2RvY3MuZmx1dHRlci5kZXYvdGVzdGluZy9idWls
ZC1tb2RlczoKCmBgYAoiVXNlIHByb2ZpbGUgbW9kZSB3aGVuIHlvdSB3YW50IHRvIGFuYWx5emUg
cGVyZm9ybWFuY2UuIgoKV2hhdCBpcyBwcm9maWxlIG1vZGU/ClNvbWUgZGVidWdnaW5nIGFiaWxp
dHkgaXMgbWFpbnRhaW5lZCBpbiBwcm9maWxlIG1vZGUsIHdoaWNoIGlzIGVub3VnaCB0bwpwcm9m
aWxlIHlvdXIgYXBwJ3MgcGVyZm9ybWFuY2UuIFByb2ZpbGUgbW9kZSBpcyB0dXJuZWQgb2ZmIG9u
IHRoZSBlbXVsYXRvcgphbmQgc2ltdWxhdG9yIGJlY2F1c2UgdGhlaXIgYmVoYXZpb3IgZG9lcyBu
b3QgcmVwcmVzZW50IGFjdHVhbCBwZXJmb3JtYW5jZS4KYGBgCgpBcyBGbHV0dGVyIHByb2plY3Rz
IGNhbiBiZSBoZWF2eSBhbmQgY29uc3VtZSBtYW55IHJlc291cmNlcywgaXQgaXMgbmVjZXNzYXJ5
CnRvIGFsbG93IHVzZXJzIGRldmVsb3BpbmcgYSBGbHV0dGVyIGFwcGxpY2F0aW9uIHRvIHByb2Zp
bGUgdGhlaXIgYXBwbGljYXRpb24KZHVyaW5nIGRldmVsb3BtZW50LgoKVGhpcyBwYXRjaCBpbnRy
b2R1Y2VzIGEgbmV3IGNob2ljZTogRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUu
CklmIHVuc2VsZWN0ZWQsIHRoZSBnbG9iYWwgb3B0aW9uIEJSMl9FTkFCTEVfUlVOVElNRV9ERUJV
RyBjb250aW51ZXMgdG8KZGV0ZXJtaW5lIHdoZXRoZXIgdG8gYnVpbGQgRmx1dHRlciBpbiByZWxl
YXNlIG9yIGRlYnVnIG1vZGUuIFRoaXMgbmV3IG9wdGlvbgptYXkgY29uZnVzZSBzb21lIHVzZXJz
IHdobyB3b25kZXIgd2hlcmUgdGhlIHJlbGVhc2UgYW5kIGRlYnVnIG9wdGlvbnMgYXJlLCBzbwp0
aGUgaGVscCBtZW51IHNlY3Rpb24gdW5kZXIgdGhlIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9E
RV9QUk9GSUxFIG9wdGlvbgpleHBsYWlucyB0aGF0IHRoZSBnbG9iYWwgQlIyX0VOQUJMRV9SVU5U
SU1FX0RFQlVHIG9wdGlvbiBjb250cm9scyB0aGUgZGVidWcKYW5kIHJlbGVhc2UgbW9kZXMuCgpT
aWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25z
LmNvbT4KLS0tCiBwYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbiAgICAgICAgIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0ZXIt
ZW5naW5lLm1rIHwgIDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9Db25maWcu
aW4gYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbgppbmRleCAyZWM1YjkwZmZkLi4z
YzkyZTQwZjc0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbgpAQCAtMzksNiArMzksMzEgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX0ZMVVRURVJfRU5HSU5FCiAKIAkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9mbHV0dGVyL2VuZ2luZQogCitpZiBCUjJfUEFDS0FHRV9GTFVUVEVSX0VOR0lORQorCitjb25m
aWcgRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUKKwlib29sICJlbmFibGUgcHJv
ZmlsaW5nIgorCWhlbHAKKwkgIFNvbWUgZGVidWdnaW5nIGFiaWxpdHkgaXMgbWFpbnRhaW5lZOKA
lGVub3VnaCB0byBwcm9maWxlIHlvdXIKKwkgIGFwcHMgcGVyZm9ybWFuY2UuIFByb2ZpbGUgbW9k
ZSBpcyBkaXNhYmxlZCBvbiB0aGUgZW11bGF0b3IKKwkgIGFuZCBzaW11bGF0b3IsIGJlY2F1c2Ug
dGhlaXIgYmVoYXZpb3IgaXMgbm90IHJlcHJlc2VudGF0aXZlCisJICBvZiByZWFsIHBlcmZvcm1h
bmNlLiBQcm9maWxlIG1vZGUgaXMgc2ltaWxhciB0byByZWxlYXNlIG1vZGUsCisJICB3aXRoIHRo
ZSBmb2xsb3dpbmcgZGlmZmVyZW5jZXM6CisKKwkgIC0gU29tZSBzZXJ2aWNlIGV4dGVuc2lvbnMs
IHN1Y2ggYXMgdGhlIG9uZSB0aGF0IGVuYWJsZXMgdGhlCisJICAgIHBlcmZvcm1hbmNlIG92ZXJs
YXksIGFyZSBlbmFibGVkLgorCisJICAtIFRyYWNpbmcgaXMgZW5hYmxlZCwgYW5kIHRvb2xzIHN1
cHBvcnRpbmcgc291cmNlLWxldmVsCisJICAgIGRlYnVnZ2luZyAoc3VjaCBhcyBEZXZUb29scykg
Y2FuIGNvbm5lY3QgdG8gdGhlIHByb2Nlc3MuCisKKwkgIElmIHRoaXMgb3B0aW9uIGlzIGxlZnQg
dW5zZWxlY3RlZCwgdGhlIGdsb2JhbCBvcHRpb24KKwkgIEJSMl9FTkFCTEVfUlVOVElNRV9ERUJV
RyBkZXRlcm1pbmVzIHdoZXRoZXIgdG8gYnVpbGQgRmx1dHRlcgorCSAgaW4gcmVsZWFzZSBvciBk
ZWJ1ZyBtb2RlLgorCisJICBodHRwczovL2RvY3MuZmx1dHRlci5kZXYvdGVzdGluZy9idWlsZC1t
b2RlcyNwcm9maWxlCisKK2VuZGlmCisKIGNvbW1lbnQgImZsdXR0ZXItZW5naW5lIG5lZWRzIGFu
IE9wZW5HTCBvciBPcGVuR0xFUyBiYWNrZW5kIgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRkxV
VFRFUl9FTkdJTkVfQVJDSF9TVVBQT1JUUwogCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0hBU19M
SUJHTCAmJiAhQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1
dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2Zs
dXR0ZXItZW5naW5lLm1rCmluZGV4IGMzYWMxNDRmMmEuLmU5NzI2MTIwOTcgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsKKysrIGIvcGFja2FnZS9m
bHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVuZ2luZS5tawpAQCAtNTIsNyArNTIsOSBAQCBGTFVUVEVS
X0VOR0lORV9UQVJHRVRfQVJDSCA9IHg2NAogRkxVVFRFUl9FTkdJTkVfVEFSR0VUX1RSSVBQTEUg
PSB4ODZfNjQtdW5rbm93bi1saW51eC1nbnUKIGVuZGlmCiAKLWlmZXEgKCQoQlIyX0VOQUJMRV9S
VU5USU1FX0RFQlVHKSx5KQoraWZlcSAoJChGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREVfUFJP
RklMRSkseSkKK0ZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1wcm9maWxlCitlbHNlIGlmZXEg
KCQoQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHKSx5KQogRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9N
T0RFPWRlYnVnCiBlbHNlCiBGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREU9cmVsZWFzZQotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
