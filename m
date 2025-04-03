Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CB0C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA9D8222C;
	Thu,  3 Apr 2025 14:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33Qu50Qhf8_Z; Thu,  3 Apr 2025 14:15:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A28F82C98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A28F82C98;
	Thu,  3 Apr 2025 14:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70273117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6240B40CB9
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1vseLh72SPo for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 14:15:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE0F640C2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0F640C2B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE0F640C2B
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so839239f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 07:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743689744; x=1744294544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zbRxnupJw4VjO/gQwt340VXUK9jRlDRl9Nx5jnPeHY=;
 b=VRavlKNmsj98d+g5teOWVNrzjHhWk4gZ9V9rSDo4F9rMOwkibe0lyiB4IS5zqK/v2E
 TCj9WHZzSAAfC4n9GyzCxOEX7kN1jA5PKUeFLpn5mXa+k6JYnoRAp6bn7zi/kl+URpr7
 2XuXBoI4yG0yKkQ03DvWKp22aLwOv61DtYM5/L8mdDNJNqcBJp7XBAvJ3HlNCX6xzJN0
 0gJgo4tcJqA5kBCsy/FK6Haaji2A3kbXD2BlU38Aey5uetd/QQxhDBJigWX16zwXhWhT
 KU4v7+Ddvxo7HazkqZWDALp/8+MRn2fcQRDBhVrCO4ETvJXAJkDUd73WSfFxfoc5cymg
 dgWg==
X-Gm-Message-State: AOJu0Yy6k1FekupWe2xJrIMQCLIBIloTbO1mDeoc46r62hs2lgf7TRVU
 t8t9G288GK3V8CTfq4+hQOuShQiP5c8G2aq6EmrarttTGJuzZih2Ttc6eyZghrB6GvKm3ebQzwM
 A
X-Gm-Gg: ASbGncvN/gUUzarWEWRd3jDawsv+4zOsakzo/DQvx2KVINhVsxyOtJA5zs4iULsO0HN
 GNMBoMn9Zd5GNtScooorOZNVBhaSoTxiHXwgqWvhm+6OqAta9nbsE2m5bEpauE+f3F89aWvqgnn
 gC0dAHyNP+R5Bb3moITXjIXX6W0VoaUiQd6jMif/3s9mnhrgaVapx4/Hlcv6cOElEM1PK8FPnvj
 dGJsqW1kGzqzMauHPSfQFuE7r1FkSI51KpTyPb2GmaOWR0FSyaVEvkxknvqmXMWQyuE+WbKfzZs
 dId6MwEbDk1FN5evFe6ICEv7BM/qJFZnKPkrDCAkh6kogL6SZSk9yVP0Tcfl39+9KmPWitw9GSl
 Bpr3tw5ul9ak3k34n3lJFB9X6y/7AtGKz8jhWr1Q=
X-Google-Smtp-Source: AGHT+IHnt/gc/nBJDHwqcRSuBgbZ3F0X5uSU7r3F1MV06tR3GlCps/UGGlPd9yt8LYJgEpK+R5wLlw==
X-Received: by 2002:a05:6000:40e1:b0:391:1923:5a91 with SMTP id
 ffacd0b85a97d-39c1211b71emr17834952f8f.55.1743689744035; 
 Thu, 03 Apr 2025 07:15:44 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm23013605e9.10.2025.04.03.07.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:15:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Apr 2025 16:15:35 +0200
Message-ID: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743689744; x=1744294544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9zbRxnupJw4VjO/gQwt340VXUK9jRlDRl9Nx5jnPeHY=;
 b=Rw6+7KTsAJ27l+pne0NycJICQUGSJeUN33HjbeZ00WqNOgiKdovkJrwptLHtw/dQQk
 Iae4QzXX7O2fUx9T0h0DsVcGMAFjmnaYVEF+y33g6OyMEd7SodsxHIhrj9yWL5Pu+h4E
 tCia+Pqx8rYRF3e+IyE9SHgTynrWnOYmSWTeo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Rw6+7KTs
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/4=5D_package/rust=3A_fix_bootst?=
 =?utf-8?q?rap_with_Rust=E2=89=A51=2E83?=
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UnVzdCBpbmNsdWRlcyBhbiBvcHRpb24gYGRvd25sb2FkLWNpLWxsdm1gIGluIGNvbmZpZy50b21s
IHRoYXQgZW5hYmxlcwpkb3dubG9hZGluZyBwcmVidWlsdCBMTFZNIGJpbmFyaWVzIGZyb20gUnVz
dCdzIENJIGluZnJhc3RydWN0dXJlIGluc3RlYWQKb2YgYnVpbGRpbmcgTExWTSBmcm9tIHNvdXJj
ZS4gVGhpcyBvcHRpb24gaGVscHMgc3BlZWQgdXAgdGhlIGJvb3RzdHJhcApwcm9jZXNzIGFuZCBp
cyBlbmFibGVkIGJ5IGRlZmF1bHQgc3RhcnRpbmcgZnJvbSBSdXN0IDEuODMuCgpIb3dldmVyLCBz
dGFydGluZyBmcm9tIGNvbW1pdCBbMV0gdGhlIGJvb3RzdHJhcCBwcm9jZXNzIHBlcmZvcm1zCmEg
c3RyaWN0IGNoZWNrIHZpYSB0aGUgZnVuY3Rpb24KY2hlY2tfaW5jb21wYXRpYmxlX29wdGlvbnNf
Zm9yX2NpX2xsdm0oKS4KClRoaXMgdmFsaWRhdGlvbiwgaW1wbGVtZW50ZWQgaW4gdGhlIGZ1bmN0
aW9uCmNoZWNrX2luY29tcGF0aWJsZV9vcHRpb25zX2Zvcl9jaV9sbHZtKCksIGNoZWNrcyBmb3Ig
YW55IGluY29tcGF0aWJsZQpjdXN0b20gb3B0aW9ucyBzdWNoIGFzIGBsbHZtLmxkZmxhZ3NgLCBg
bGx2bS5jZmxhZ3NgLCBgdGFyZ2V0c2AsIGV0Yy4KCklmIGFueSBvZiB0aGVzZSBhcmUgc2V0IGxv
Y2FsbHkgYW5kIGRpZmZlciBmcm9tIHRoZSB2YWx1ZXMgdXNlZCB0byBidWlsZAp0aGUgQ0ktcHJv
dmlkZWQgTExWTSwgdGhlIGJ1aWxkIGZhaWxzIGltbWVkaWF0ZWx5IHdpdGggdGhlIGVycm9yOgoK
ICBFUlJPUjogU2V0dGluZyBgbGx2bS5sZGZsYWdzYCBpcyBpbmNvbXBhdGlibGUgd2l0aAogICAg
ICAgICBgbGx2bS5kb3dubG9hZC1jaS1sbHZtYC4KCkJ1aWxkcm9vdCBleHBsaWNpdGx5IHNldHMg
YGxsdm0ubGRmbGFnc2AgaW4gcnVzdC5tayB0byBlbnN1cmUgcHJvcGVyCmhvc3QgbGlua2luZyBk
dXJpbmcgdGhlIGJ1aWxkIG9mIGhvc3QtcnVzdC4gUmVtb3ZpbmcgdGhpcyBzZXR0aW5nIG1heQpp
bnRyb2R1Y2UgcG9ydGFiaWxpdHkgb3IgcmVsaWFiaWxpdHkgaXNzdWVzIGFjcm9zcyB0b29sY2hh
aW5zLgoKVG8gYWRkcmVzcyB0aGUgaXNzdWUgd2l0aG91dCBjb21wcm9taXNpbmcgdGhlIGJ1aWxk
IGVudmlyb25tZW50LCB0aGlzCnBhdGNoIGRpc2FibGVzIHRoZSB1c2Ugb2YgQ0ktcHJvdmlkZWQg
TExWTSBieSBzZXR0aW5nOgoKICBbbGx2bV0KICBkb3dubG9hZC1jaS1sbHZtID0gZmFsc2UKClRo
aXMgZm9sbG93cyB0aGUgcmVjb21tZW5kYXRpb24gZnJvbSB0aGUgUnVzdCBib290c3RyYXAgc2Ny
aXB0IGl0c2VsZi4KCk5vdGU6IHRoaXMgaXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCB0byByZXN0
b3JlIGNvbXBhdGliaWxpdHkgd2l0aCBSdXN0CuKJpTEuODMuIE90aGVyIHNvbHV0aW9ucyB3aWxs
IGJlIGludmVzdGlnYXRlZCB0byBhdm9pZCBkaXNhYmxpbmcgdGhlIHVzZQpvZiBwcmVidWlsdCBM
TFZNIGluIHRoZSBmdXR1cmUsIHdoaWxlIHByZXNlcnZpbmcgQnVpbGRyb2904oCZcyByZXByb2R1
Y2libGUKYnVpbGQgc2V0dXAuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0
L2NvbW1pdC85ZGY3NjgwZWNmNjk4YmY3MDg3NjE2YjU5NTc3NGVlMTAyM2QzYzdiCgpTaWduZWQt
b2ZmLWJ5OiBFbCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgotLS0KIHBh
Y2thZ2UvcnVzdC9ydXN0Lm1rIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QvcnVzdC5tayBiL3BhY2thZ2UvcnVzdC9ydXN0Lm1r
CmluZGV4IDI5YzAzNTk0ZDIuLjY0ODFlNDA1NjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnVzdC9y
dXN0Lm1rCisrKyBiL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCkBAIC00OCw2ICs0OCw3IEBAIGRlZmlu
ZSBIT1NUX1JVU1RfQ09ORklHVVJFX0NNRFMKIAkJZWNobyAnW3RhcmdldC4kKFJVU1RDX1RBUkdF
VF9OQU1FKV0nOyBcCiAJCWVjaG8gJ2NjID0gIiQoVEFSR0VUX0NST1NTKWdjYyInOyBcCiAJCWVj
aG8gJ1tsbHZtXSc7IFwKKwkJZWNobyAnZG93bmxvYWQtY2ktbGx2bSA9IGZhbHNlJzsgXAogCQll
Y2hvICduaW5qYSA9IGZhbHNlJzsgXAogCQllY2hvICdsZGZsYWdzID0gIiQoSE9TVF9MREZMQUdT
KSInOyBcCiAJKSA+ICQoQEQpL2NvbmZpZy50b21sCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
