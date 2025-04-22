Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6779AC369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188D1403F9;
	Tue, 22 Apr 2025 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tn9tvtQEnFEm; Tue, 22 Apr 2025 07:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5440440912
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5440440912;
	Tue, 22 Apr 2025 07:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8681A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CE24608E9
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPfpkFcDeADC for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 471926067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471926067F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 471926067F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so33130045e9.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308084; x=1745912884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zbRxnupJw4VjO/gQwt340VXUK9jRlDRl9Nx5jnPeHY=;
 b=LE2vl8FlmMANbEIXBl4e5mwL4SvQYL1kGgAD53G7y4boJBKISRaI9MzdEB5Diyv09h
 brm47FIyYhx9pXuNalkYU5PwAGvLvDuYhoEIQ5ziuERX1Ngw58Te5we0Vmqp7AUiSZPC
 kPF4W5/Ts12n4YnY6lbRAPGo9PMTEaf73QL0fF6G0/E6suZc9lf61yFBmNk4wqbXdInT
 7Nc6GOIccXg71TqMc+3AM9n2x2yxO9dvXGjN3DCgqcDwkhsRkbmWj8PhVSfc4Pzm2uff
 jeqgzBRNpkjFRSXA1g+5EitqylBGhniDl7HCd3KCkewjlSMtRIvOh7VyF89We3Klg/Ww
 /V4w==
X-Gm-Message-State: AOJu0Yx0nc1RJIMZfSNQNhgWvX5HjN43CFd2S0HQeQI+4sYlsli17IJp
 MeNFBcTsazjT5RyQPAQprSL5ibXIvt3LBL8hiOD/Lq6+wxtlY8+KWf0r+4meItfNsVhCBm3nZbh
 pHzM=
X-Gm-Gg: ASbGnct6aIeHkHqY4dDbwTaMcAqFoSecFniER5oGiXayG5JUJaBbArRWi45YsavRg2c
 66cj9wUb5MK312LblVX3/UyqayXfe6QBDvBjuX1pf7fN9o9xr5GVpFVPvh2fI3kDTzzg9mGwaLt
 IO7OoRKkS0CimglB3qM1o/mqYWtJqZCZS97wqc+uu6FpXPkSpU3yvGyY/tqk/TSVC+5rwn5Hijw
 Ij14Np0Fb5ReC/FT973yvV0M7IISre9xq/L2wnHMtmXUpoYNLNA0U1yXNvKOm/5Ydpo5tZCOwHN
 TbyAxz9RY6+CRORGJV4zgkqvg/ZQi0nQ6icp/IeaLHeBXLdnivaOtaRHnbkzEgRnzr+Qp9FR4uo
 3NFOlTsbCMdxf+WCVgIc3Fm3LOwPZX4khWL6y6CgQhZrCgg==
X-Google-Smtp-Source: AGHT+IFXxAaw1ph10g3xS3qkCKl0F0cjIyVOGmbdWCdrr3JWZq3PPb+rEgUsDfGo29sZeLRAdrhEcg==
X-Received: by 2002:a05:600c:46c5:b0:43b:ca8c:fca3 with SMTP id
 5b1f17b1804b1-4406b28e9e5mr107018295e9.11.1745308083677; 
 Tue, 22 Apr 2025 00:48:03 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm162913405e9.23.2025.04.22.00.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:48:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:47:35 +0200
Message-ID: <20250422074738.821755-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745308084; x=1745912884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zbRxnupJw4VjO/gQwt340VXUK9jRlDRl9Nx5jnPeHY=;
 b=RuDo13rHRVSJyMpV5GF35g1DNgl00bWWyp8/FN2Ue9+djLrsmoy+PFhC2NtEgVR9bl
 2VRuEbjyq5kY0wEMfP6uJIEhEyK58rIa3+l5hiYrkTrXGiG3UJmd2dBVyhaWu1PntYqu
 ljm/2fTQWbvo4XhSGq7VykfXO2Fheh/b9t7FI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RuDo13rH
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
ICAgICAgRVJST1I6IFNldHRpbmcgYGxsdm0ubGRmbGFnc2AgaXMgaW5jb21wYXRpYmxlIHdpdGgK
ICAgICAgICAgICAgIGBsbHZtLmRvd25sb2FkLWNpLWxsdm1gLgoKQnVpbGRyb290IGV4cGxpY2l0
bHkgc2V0cyBgbGx2bS5sZGZsYWdzYCBpbiBydXN0Lm1rIHRvIGVuc3VyZSBwcm9wZXIKaG9zdCBs
aW5raW5nIGR1cmluZyB0aGUgYnVpbGQgb2YgaG9zdC1ydXN0LiBSZW1vdmluZyB0aGlzIHNldHRp
bmcgbWF5CmludHJvZHVjZSBwb3J0YWJpbGl0eSBvciByZWxpYWJpbGl0eSBpc3N1ZXMgYWNyb3Nz
IHRvb2xjaGFpbnMuCgpUbyBhZGRyZXNzIHRoZSBpc3N1ZSB3aXRob3V0IGNvbXByb21pc2luZyB0
aGUgYnVpbGQgZW52aXJvbm1lbnQsIHRoaXMKcGF0Y2ggZGlzYWJsZXMgdGhlIHVzZSBvZiBDSS1w
cm92aWRlZCBMTFZNIGJ5IHNldHRpbmc6CgogICAgICBbbGx2bV0KICAgICAgZG93bmxvYWQtY2kt
bGx2bSA9IGZhbHNlCgpUaGlzIGZvbGxvd3MgdGhlIHJlY29tbWVuZGF0aW9uIGZyb20gdGhlIFJ1
c3QgYm9vdHN0cmFwIHNjcmlwdCBpdHNlbGYuCgpOb3RlOiB0aGlzIGlzIGEgdGVtcG9yYXJ5IHdv
cmthcm91bmQgdG8gcmVzdG9yZSBjb21wYXRpYmlsaXR5IHdpdGggUnVzdAriiaUxLjgzLiBPdGhl
ciBzb2x1dGlvbnMgd2lsbCBiZSBpbnZlc3RpZ2F0ZWQgdG8gYXZvaWQgZGlzYWJsaW5nIHRoZSB1
c2UKb2YgcHJlYnVpbHQgTExWTSBpbiB0aGUgZnV0dXJlLCB3aGlsZSBwcmVzZXJ2aW5nIEJ1aWxk
cm9vdOKAmXMgcmVwcm9kdWNpYmxlCmJ1aWxkIHNldHVwLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9ydXN0LWxhbmcvcnVzdC9jb21taXQvOWRmNzY4MGVjZjY5OGJmNzA4NzYxNmI1OTU3NzRlZTEw
MjNkM2M3YgoKU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1laGRpLnlvdW5lc0Bz
bWlsZS5mcj4KLS0tCiBwYWNrYWdlL3J1c3QvcnVzdC5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0L3J1c3QubWsgYi9wYWNr
YWdlL3J1c3QvcnVzdC5tawppbmRleCAyOWMwMzU5NGQyLi42NDgxZTQwNTYxIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3J1c3QvcnVzdC5taworKysgYi9wYWNrYWdlL3J1c3QvcnVzdC5tawpAQCAtNDgs
NiArNDgsNyBAQCBkZWZpbmUgSE9TVF9SVVNUX0NPTkZJR1VSRV9DTURTCiAJCWVjaG8gJ1t0YXJn
ZXQuJChSVVNUQ19UQVJHRVRfTkFNRSldJzsgXAogCQllY2hvICdjYyA9ICIkKFRBUkdFVF9DUk9T
UylnY2MiJzsgXAogCQllY2hvICdbbGx2bV0nOyBcCisJCWVjaG8gJ2Rvd25sb2FkLWNpLWxsdm0g
PSBmYWxzZSc7IFwKIAkJZWNobyAnbmluamEgPSBmYWxzZSc7IFwKIAkJZWNobyAnbGRmbGFncyA9
ICIkKEhPU1RfTERGTEFHUykiJzsgXAogCSkgPiAkKEBEKS9jb25maWcudG9tbAotLSAKMi40My4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
