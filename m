Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49055C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 13:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4A360E55;
	Tue, 15 Jul 2025 13:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_qoxAv_znsC; Tue, 15 Jul 2025 13:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BDD60FE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33BDD60FE3;
	Tue, 15 Jul 2025 13:50:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D496EDF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C645C60E55
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjqlvVQGU4yd for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 13:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE51D6107E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE51D6107E
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE51D6107E
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:50:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso10405775a12.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 06:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752587414; x=1753192214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMorhDtAUUBQtVG7s42E21Cj92H5fspFt9ODrhESwF4=;
 b=YIRyW1F6vr4THcgw9kAwG9yK1DUW/LUtyKyAR6Hebtt8mhni0GosiU2YV2X4/cU1DG
 SPfYH3ThlBMdDcnI1tNmHECVxxPdjf26QzMAjQDkIbHm+Vsu12xzXCIiSeytkQmwziiz
 ksRkG7C+gR7SkvqtOBquHCVFTt6tTB3Ddzzf3K+5NEWP2bRyrpGKaVCPFUussLcn5TRK
 K0H/K768DptlJfXbfTgkwID1WEpLv9Jq7WTh3XMgi6UMOuRh2lLdiMwQcEN+7I2t2VYR
 kmG5XGmYqSEI3gi5hQw6Lxl+sZlkJOk7Ls3I1B5tA9oNABYxXGqXFH2u3X9038UwiGRc
 HLjA==
X-Gm-Message-State: AOJu0YwxGzZEgradnQhNdMYQr3FxpfHsQvrcjvmwHTszACINmGijiZ1z
 hpf0AnG2viBMnUj0P1kbLjVfAzk5IE6D0rHMIbjg4zcRXkjT4MyTP14Jm5zMONc=
X-Gm-Gg: ASbGnctO/zsiFkXSXhkkyxsmyAAGU8u6yWK2m2YkhBYIm6gwRBxs8QWDeU9rjwASlgE
 4qn//JshygM34ZZs1zc5q9mpa5FVWQ8XKGimB9log5UA8a/ic+Dycy5LFULCAl7GT2ACRpshYgS
 wHszws/eCGsJYN+IVUjvI7JhgwaBMTso84kZnScTKWw3FbQrWz97cUpLs4ZD+l3vUTG+cGbKS9v
 w3411VcyXyvhIJiMGsRPjhatvndUfWdNnCr7aZjXhYAhj4ETzCuctWIJwUBA4kWkRzafYJGZusr
 xe3d7k39SHlUo1y+ziiiSniVAftvBXeBKokK8dTvZpYVH7IlimMYs/XpApo32M9lUVXxrKv0Twq
 3yGCHfTVzuXrM34Jj4tvBH1JkYZ+xEYZL9iJ2
X-Google-Smtp-Source: AGHT+IHOtYN3hByTJwyUTOEeiD7OO1yMy9qihF5Eoj4V7T0P9ob16gVcaWytfyqnsb6QiVdIXDe+Gw==
X-Received: by 2002:a17:907:9811:b0:ad5:2328:e39b with SMTP id
 a640c23a62f3a-ae6fbf20e29mr1830522266b.31.1752587414298; 
 Tue, 15 Jul 2025 06:50:14 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e94338sm1012058566b.35.2025.07.15.06.50.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:50:13 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 15:50:11 +0200
Message-ID: <20250715135012.813261-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715125737.798491-1-shirokovalexs@gmail.com>
References: <20250715125737.798491-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752587414; x=1753192214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMorhDtAUUBQtVG7s42E21Cj92H5fspFt9ODrhESwF4=;
 b=T+HYTXuiRWWqy6TBcIhYOhBAGvhAHKoOnlq5988v2GXlvU3LHWB1V8YeEJE4z6GDDX
 Nzjn93dSmgJI3Y82cH70nXvCTQM3O1xqKfxQrUiNzsN8CnyKK9vP7MgSJey6ATzqjzMy
 pC695EJ+5ApL6eEUeo5MbxHAOsXQ3C2uxOknr0VnRurKVhfsiYb6XgxDTE4ieqqD7Igi
 YYM02pETRvNW3FqvzM4vb7/SLvNsV9j2MRQKHD5hnTrIq04Hx8KaK/baMpEmOT1gWsly
 p61VRd3q0FB0k0g0ZqIk1mEUljT5orV7eval5trQQ/U7f77rz6CNKdde+HZGoZyggEO/
 u4pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T+HYTXui
Subject: [Buildroot] [1/1] package/nnn: new package
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

SGkgZXZlcnlvbmUsCgpMZXQgbWUgcHJvdmlkZSBzb21lIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQg
dGhlIG5ubiBwYWNrYWdlLgoKTW90aXZhdGlvbjoKCjEpIEkgZm91bmQgdGhlIHBhY2thZ2UgdXNl
ZnVsIGR1cmluZyBteSBwZXJzb25hbCB3b3JrIHdpdGggZGV2aWNlcy4gSSB0aG91Z2h0CkJ1aWxk
cm9vdCB3b3VsZCBiZSBhIGdyZWF0IHBsYWNlIHRvIHNoYXJlIHRoaXMgd29yayB0byBhdm9pZCBi
dWlsZGluZyB0aGUgYXBwCmFuZCBpdHMgZGVwZW5kZW5jaWVzIG1hbnVhbGx5LgoKMikgbm5uIG9m
dGVuIGxvb2tzIGFuZCBmZWVscyBsaWtlIGEgbGlnaHR3ZWlnaHQgdmVyc2lvbiBvZiByYW5nZXIs
IGJ1dCB3aXRob3V0CnRoZSBuZWVkIHRvIGJ1aWxkIGFuZCBzaGlwIFB5dGhvbi4gU28gSSBmaWd1
cmVkIGl04oCZZCBiZSBoYW5keSB0byBoYXZlIGEgZmlsZQptYW5hZ2VyIGxpa2UgdGhpcyB3aXRo
IG1pbmltYWwgZGVwZW5kZW5jaWVzLgoKVGVzdHM6CgoxKSBJJ3ZlIHRlc3RlZCBpdCBtYW51YWxs
eSB1c2luZyBRRU1VIChhYXJjaDY0KSwgUmFzcGJlcnJ5IFBpIDMsIGFuZCBPcmFuZ2UKUGkgWmVy
by4KCjIpIGh0dHBzOi8vZ2l0bGFiLmNvbS9hbGV4cy1zaC9ubm4tYnVpbGRyb290IC0gdGhpcyBp
cyBteSBHaXRMYWIgcHJvamVjdCB3aXRoCmEgY29uZmlndXJlZCBDSSBwaXBlbGluZSB0aGF0IGF1
dG9tYXRpY2FsbHkgcnVucyBjaGVja3MgYW5kIGJ1aWxkcyBpbWFnZXMgZm9yClFFTVUsIFJhc3Bi
ZXJyeSBQaSwgYW5kIE9yYW5nZSBQaS4gSSdtIHJlYWR5IHRvIG1ha2UgZnVydGhlciBtb2RpZmlj
YXRpb25zCmFuZC9vciBpbXByb3ZlbWVudHMgYXMgbmVlZGVkLiA6KQoKVGhhbmsgeW91IQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
