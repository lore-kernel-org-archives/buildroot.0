Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC0C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 478D3421FB;
	Fri, 24 Nov 2023 16:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 478D3421FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-kfuEoaSh70; Fri, 24 Nov 2023 16:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350C0421FF;
	Fri, 24 Nov 2023 16:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350C0421FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3445A1BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C16341A7E
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C16341A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8IVnF7tOHUE for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:15 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9516B41A79
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9516B41A79
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b2ddab817so14552735e9.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842573; x=1701447373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/Y1dIYluqF8CSnHnR4WsCwM9ucw7uC0IcCb4r3L0wk=;
 b=RNbFXj9JIK8Uj/cwp8NG1x7dEJ/er0DLF1OpjQ1Cw4gVumF6j6fTYv0cgE8MPeiJOY
 XNT9STmu9Y5F0Y6oz3dt3AGbooUOzVTgVBw9HBNYiy0gS/SOKfEIVPj0Gm1XyxqGO4kI
 1QzsCqde005ht2BdRmrsRkMMo20TygiyHSoMsN4DD/bRZH2MG3+4OvXsU/0YjCAvK4PP
 WzAHxeBMBQkW9DxMEojyRSfVN4aJsx9eJWIWjIwb+rjcmV28yLyobDfx77rFIPQELHUR
 0/su28xVR/J3e1lYKABChZoIjBtVhMLyzDphmWfX6rVaVsWPy+sgC69PQkq3a2wtsGDh
 TWIA==
X-Gm-Message-State: AOJu0Yz06cIQ4ICTK+Hh7anr0lvL1+49onb6Q3NEvgqO3KFWNIvkweZi
 4twUAAKyq91O550Ici1KFGtqIQVS5xED+z6ZpugdSA==
X-Google-Smtp-Source: AGHT+IFsRFo0xylnoQeD1bHnlUcn0CL7IkDGkMVBI7yXDtT3f6HdgXS1d10pFLSsthqZgufOURJXBQ==
X-Received: by 2002:a05:600c:46cc:b0:402:e68f:8896 with SMTP id
 q12-20020a05600c46cc00b00402e68f8896mr3101824wmo.0.1700842573503; 
 Fri, 24 Nov 2023 08:16:13 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:16:13 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:22 +0100
Message-Id: <20231124161523.215078-7-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124161523.215078-1-antoine.coutant@smile.fr>
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842573; x=1701447373;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/Y1dIYluqF8CSnHnR4WsCwM9ucw7uC0IcCb4r3L0wk=;
 b=m/Ya+Uz+/yuCF6zvxd4z6ryAjlApnDxMUwGay2/r3TB6/KJhebFARF0416BtGEQJil
 k8FNagztHcykYP9LTi2IIQ94P12xvMdHHVk0O7Bhhl4EC9qCE1pph5ZxTZtxXLo3yZTF
 9+fKekbRxlviRWw0dFL5UKBT0k0CMKXXIFZlJB23/Vy2GHE8Lh+fI4Hoeys6wvecGXOg
 HM/iWsK4V8QCBL8aXrZKYFjCIHlSD2jUVsrj2+3fnVojTWJTVLaW49DKPKGlRek/GAFC
 EBjzPPHbFtDcCAucdYUqWDpGjt00euW9/6hep6ALukgBEdJKpXV2JqDG4BDRdl7Pryt4
 sXAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=m/Ya+Uz+
Subject: [Buildroot] [[DO NOT MERGE] v3 6/7] package/mesa3d: add RustiCL
 support
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpUbyBidWlsZCBSdXN0
aWNsIHlvdSBuZWVkIHRvIHNhdGlzZnkgdGhlIGZvbGxvd2luZyBidWlsZCBkZXBlbmRlbmNpZXM6
CgogICAgcnVzdGMKICAgIHJ1c3RmbXQgKGhpZ2hseSByZWNvbW1lbmRlZCwgYnV0IG9ubHkgcmVx
dWlyZWQgZm9yIENJIGJ1aWxkcyBvciB3aGVuIGF1dGhvcmluZyBwYXRjaGVzKQogICAgYmluZGdl
bgogICAgTExWTSBidWlsdCB3aXRoIGxpYmNsYyBhbmQgLURMTFZNX0VOQUJMRV9EVU1QPU9OLgog
ICAgU1BJUlYtVG9vbHMKICAgIFNQSVJWLUxMVk0tVHJhbnNsYXRvciBmb3IgYSBsaWJMTFZNU1BJ
UlZMaWIuc28gbWF0Y2hpbmcgeW91ciB2ZXJzaW9uIG9mIExMVk0sIGkuZS4gaWYgeW914oCZcmUg
dXNpbmcgTExWTSAxNSAobGliTExWTS5zby4xNSksIHRoZW4geW91IG5lZWQgYSBsaWJMTFZNU1BJ
UlZMaWIuc28uMTUuCgpTZWU6Cmh0dHBzOi8vZG9jcy5tZXNhM2Qub3JnL3J1c3RpY2wuaHRtbAoK
U2luY2UgcnVzdGljbCBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiBPcGVuQ0wsIG1ha2UgaXQgYSBw
cm92aWRlciBvZgpPcGVuQ0wuCgpXZSBuZWVkIHRvIHVzZSBvcGVuY2wtaWNkLWxvYWRlciBpbiBv
cmRlciB0byBiZSBhYmxlIHRvIGNhcHR1cmUgQVBJCmNhbGxzIGFuZCBmb3J3YXJkIHRoZW0gdG8g
dGhlIGNvcnJlY3QgaW1wbGVtZW50YXRpb24gb2YgT3BlbkNMIChSdXN0aUNMCmluIHRoaXMgY2Fz
ZSkKCm9wZW5jbC1pY2QtbG9hZGVyIG5lZWRzIHRvIGJlIGluc3RhbGxlZCBpbiB0aGUgdG9vbGNo
YWluJ3Mgc3lzcm9vdAphcyB3ZWxsIHRvIGJlIGFibGUgdG8gY29tcGlsZSBwYWNrYWdlcyBkZXBl
bmRpbmcgb24gbGlib3BlbmNsIHNpbmNlCm90aGVyd2lzZSB0aGVyZSdzIG9ubHkgZm9yIGV4YW1w
bGUgbGliUnVzdGlPcGVuQ0wuc28gYW5kIG5vCmxpYk9wZW5DTC5zbwoKU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+ClNpZ25lZC1vZmYtYnk6IFNlYmFz
dGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgpTaWduZWQtb2ZmLWJ5OiBBbnRv
aW5lIENvdXRhbnQgPGFudG9pbmUuY291dGFudEBzbWlsZS5mcj4KLS0tCnYyOiBjaGFuZ2UgY29t
bWl0IGhlYWRlciAtPiBSdXN0aUNMIHN1cHBvcnQgaXMgbm90IGV4cGVyaW1lbnRhbAotLS0KIHBh
Y2thZ2UvbWVzYTNkL0NvbmZpZy5pbiB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIHBhY2thZ2Uv
bWVzYTNkL21lc2EzZC5tayB8IDIwICsrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCmluZGV4IDM5YTRm
NzA2ZTIuLjI5YjQ3MTBkOGQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KQEAgLTU2LDYgKzU2LDIzIEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkNMQwogCXNl
bGVjdCBCUjJfUEFDS0FHRV9IQVNfTElCT1BFTkNMCiAKKyMgbGliY2xjIGRlcGVuZGVuY2llcyBh
cmUgc2F0aXNmaWVkIGJ5CisjIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCitjb25maWcgQlIyX1BB
Q0tBR0VfTUVTQTNEX1JVU1RJQ0wKKwlib29sICJSdXN0aUNMIChPcGVuQ0wpIHN1cHBvcnQiCisJ
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQorCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUworCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1BBTkZST1NUCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hP
U1RfUlVTVEMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9SVFRJCisJc2VsZWN0IEJSMl9QQUNL
QUdFX0NMQU5HCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xMVk1fRFVNUAorCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJDTEMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZfVE9PTFMKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfU1BJUlZfTExWTV9UUkFOU0xBVE9SCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19M
SUJPUEVOQ0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNMX0lDRF9MT0FERVIKKwogIyBpbmZv
cm0gdGhlIC5tayBmaWxlIG9mIGdhbGxpdW0sIGRyaSwgZHJpMyBvciB2dWxrYW4gZHJpdmVyIHNl
bGVjdGlvbgogY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzCiAJYm9vbApAQCAtMzk2LDcg
KzQxMyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTEVTCiAJZGVmYXVsdCAi
bWVzYTNkIiBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VTICYmICFCUjJfUEFDS0FHRV9M
SUJHTFZORAogCiBjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCT1BFTkNMCi0JZGVmYXVs
dCAibWVzYTNkIiBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCisJZGVmYXVsdCAibWVzYTNk
IiBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMIHx8IEJSMl9QQUNLQUdFX01FU0EzRF9SVVNU
SUNMCiAKIGVuZGlmICMgQlIyX1BBQ0tBR0VfTUVTQTNECiAKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bWVzYTNkL21lc2EzZC5tayBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawppbmRleCA0YjM2MGM4
YThmLi5mNDQ0Njk2NTQ3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKKysr
IGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCkBAIC01OCwxNiArNTgsMzQgQEAgZWxzZQogTUVT
QTNEX0NPTkZfT1BUUyArPSAtRGxsdm09ZGlzYWJsZWQKIGVuZGlmCiAKLSMgRGlzYWJsZSBvcGVu
Y2wtaWNkOiBPcGVuQ0wgbGliIHdpbGwgYmUgbmFtZWQgbGliT3BlbkNMIGluc3RlYWQgb2YKICMg
bGliTWVzYU9wZW5DTCBhbmQgQ0wgaGVhZGVycyBhcmUgaW5zdGFsbGVkCiBpZmVxICgkKEJSMl9Q
QUNLQUdFX01FU0EzRF9PUEVOQ0wpLHkpCiBNRVNBM0RfUFJPVklERVMgKz0gbGlib3BlbmNsCiBN
RVNBM0RfREVQRU5ERU5DSUVTICs9IGNsYW5nIGxpYmNsYworaWZlcSAoJChCUjJfUEFDS0FHRV9P
UEVOQ0xfSUNEX0xPQURFUikseSkKK01FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLW9wZW5j
bD1pY2QKK01FU0EzRF9ERVBFTkRFTkNJRVMgKz0gIG9wZW5jbC1pY2QtbG9hZGVyCisjIERpc2Fi
bGUgb3BlbmNsLWljZDogT3BlbkNMIGxpYiB3aWxsIGJlIG5hbWVkIGxpYk9wZW5DTCBpbnN0ZWFk
IG9mCitlbHNlCiBNRVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1vcGVuY2w9c3RhbmRhbG9u
ZQorZW5kaWYKIGVsc2UKIE1FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLW9wZW5jbD1kaXNh
YmxlZAogZW5kaWYKIAorIyAtRHJ1c3Rfc3RkPTIwMjE6IGtub3duIG1lc29uIGJ1ZyAoaHR0cHM6
Ly9naXRodWIuY29tL21lc29uYnVpbGQvbWVzb24vaXNzdWVzLzEwNjY0KQorIyAgQnkgZGVmYXVs
dCBkZXZpY2VzIGFyZSBkaXNhYmxlZCBpbiBydXN0aWNsLiBJZiB5b3Ugd2FudCB0byBlbmFibGUg
YSBkZXZpY2UsCisjICB5b3UgbmVlZCB0byBzZXQgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIFJV
U1RJQ0xfRU5BQkxFIHRvIHRoZSBkcml2ZXIgeW91CisjICBhcmUgdXNpbmcKKyMgIHJlZjogaHR0
cHM6Ly9kb2NzLm1lc2EzZC5vcmcvZW52dmFycy5odG1sI2VudnZhci1SVVNUSUNMX0VOQUJMRQor
aWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfUlVTVElDTCkseSkKK01FU0EzRF9QUk9WSURFUyAr
PSBsaWJvcGVuY2wKK01FU0EzRF9ERVBFTkRFTkNJRVMgKz0gaG9zdC1ydXN0YyBob3N0LXJ1c3Qt
YmluZGdlbiBjbGFuZyBsaWJjbGMgb3BlbmNsLWljZC1sb2FkZXIgc3BpcnYtdG9vbHMgc3BpcnYt
bGx2bS10cmFuc2xhdG9yCitNRVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1ydXN0aWNsPXRy
dWUgLURydXN0X3N0ZD0yMDIxCitlbHNlCitNRVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1y
dXN0aWNsPWZhbHNlCitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19F
TEZVVElMUykseSkKIE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gZWxmdXRpbHMKIGVuZGlmCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
