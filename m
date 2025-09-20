Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB1CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 07:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B526F40E53;
	Sat, 20 Sep 2025 07:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zdYPh48Ckgi; Sat, 20 Sep 2025 07:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBAA441482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAA441482;
	Sat, 20 Sep 2025 07:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01614E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBEE983F55
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 498hjAn3s8zs for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 184FF83E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 184FF83E69
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 184FF83E69
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2697899a202so20645555ad.0
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 00:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758354437; x=1758959237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2mGxCKNPJ08Hj4HjOzf5m0gk/creg+Tmgrpl61/cng=;
 b=aXJIR0bnyePnInszTx13i/b9Ma1F74Cxurp6eutp78E5aHEWxOV51u5sIR3GExiq7k
 I8NgWxAytUF5jAySqNSZibALdUtNj6LQAe6QgOAr9ljGK1vcH16CgHGBnqJfI1bEHpKX
 m0rH8MpvIZyILUCyrl0I/IFwqPglSb3Fjtfrqx9pqBYLISnbVCuyoVxrtmp09u1MaNZK
 cGYtogZZCkpZQAo/nC+Vb5hhXW6Rq5T/moOGxsMKgrI2SjWDxNk+3elkFMePKLgV+M4a
 m/MVuYrZm1mibqa1So7GmWn6h5PenVgJ7ixoKUxtRzQ9u9OI+8uPTcp05I5PybRlpuis
 BXCw==
X-Gm-Message-State: AOJu0YynXdqt8ntnokcBQ/YeiEDGW/USINr8PkdP+X7yZS+rQy9ilKXb
 ge5Q3DihU7kkco9UsmIApjVKk0GICDPg3qEjmN6gYCNMGs+Xc6NuFyjwzW1HGQ==
X-Gm-Gg: ASbGnctZB8x8fz6PZPrKmpFqtyIwTXae4CCQrFXdP4wjGnnTWEF1Tpec1wZGaaU8Ei2
 heNkZCNwZo+JO3EAimDJSdde1h2BBlmlgf8nlzjs3J8jxiVgUEGh2xllunCfbq+Zj/3Zzn++PBK
 1Moe+LM6HQVUFJwAzp4EnLw71Gl79OktJRX0yo+wOLfZI4LUybE5cyTo9SkVJoiO186I+c6Wy30
 eRCndkSEDNipSdG56Tw+Uu/Tix6yQ7TpfbyGFyqRTW6Fnhzrwr9HnSW+/oxNXg0obA1Ky3sWvo4
 WiemJhgkt20I7HTrLm/b2c0FMSUQnR5yibOntB1fsROQgp+RXui4r2t6v3KmpUuZXkK+9I5pGlf
 wcLOjUFJJRVPD+0OiDhi64A==
X-Google-Smtp-Source: AGHT+IGMB42hrSyEPXY1moWeNGvzrlr/g9Y4uQGagqsSTU3gPWtx8VUGgZRfVwI9w2lYFDcV+xyiCg==
X-Received: by 2002:a17:902:dace:b0:272:56e:e296 with SMTP id
 d9443c01a7336-272056ee45dmr12984905ad.30.1758354437063; 
 Sat, 20 Sep 2025 00:47:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26989844036sm69466325ad.31.2025.09.20.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 00:47:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 93E454227236; Sat, 20 Sep 2025 14:47:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Date: Sat, 20 Sep 2025 14:47:09 +0700
Message-ID: <20250920074707.584930-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920074707.584930-4-bagasdotme@gmail.com>
References: <20250920074707.584930-4-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4570; i=bagasdotme@gmail.com;
 h=from:subject; bh=D5JDkxfYE/lZNqhvW3k50rNUoEDtCKjFapLc3iSXXZU=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhoxz0b+luM63sh3Z/HPpyjWHmj45hhz2E0nZxrYvx/SyZ
 OtGgevnOkpZGMS4GGTFFFmi18ruMubde8ksJqEIZg4rE8gQBi5OAZhIvwHDP+3pcaU1ha++b5et
 fBS26GDuxej6MrP4jX5v1AR6V63IXcfIMPn5y6PvRJSlE8Q89l3Js/kiJ+uwLsXo/ySr/TwpHQ5
 ZnAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758354437; x=1758959237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2mGxCKNPJ08Hj4HjOzf5m0gk/creg+Tmgrpl61/cng=;
 b=NfSNShGFeMePpy0foOWuwX9DY5iIiulppuKIQhBKKuEb8mDlJX3OIMHlCvC9FIqu0i
 Sr4wjhwlE72drOct8uJyNXd9xqN0MZx8V5w3I8mNyEV6dLMLiBu1G6nSaZ7tPx71nurW
 Y5rxgfwVvVEldOzsefxMzy8ZA5Vwh+TuNpgE6vgkba7WnCuXOEFFm1j2fSvb8qAxmRzl
 MxpSaVC0r4Tdp3I4q9d5jAb/nInKB7zO9XGcn0CjvLZdGvSvwcUhdUU0tssuthB06uex
 ndDdrhADqoN8qxNWH03CH5aMIhXPEwYBPm0Ggb8JG8Yl5vI5a94kfLhItVQoBoYrSSS0
 dH/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NfSNShGF
Subject: [Buildroot] [PATCH 1/2] package/readline: Fix sdk rootfs tarball
 generation
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

R2VuZXJhdGluZyByb290ZnMudGFyIHdoZW4gYnVpbGRpbmcgdGhlIHNkayBmYWlscyB3aXRoIHVu
ZGVmaW5lZApyZWZlcmVuY2UgZXJyb3Igb24gaG9zdCBsaWJyZWFkbGluZToKCuKQm1s3bT4+PiAg
IEdlbmVyYXRpbmcgZmlsZXN5c3RlbSBpbWFnZSByb290ZnMudGFy4pCbWzI3bQpta2RpciAtcCAv
aG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzCnJtIC1yZiAvaG9tZS9iYWdh
cy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhcgpta2RpciAtcCAv
aG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhcgpy
c3luYyAtYXVIIC0tZXhjbHVkZT0vVEhJU19JU19OT1RfWU9VUl9ST09UX0ZJTEVTWVNURU0gL2hv
bWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L3RhcmdldC8gL2hvbWUvYmFnYXMvcmVwby9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0CmVjaG8gJyMhL2Jp
bi9zaCcgPiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290
LWZzL3Rhci9mYWtlcm9vdAplY2hvICJzZXQgLWUiID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRy
b290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290CmVjaG8gImNob3duIC1o
IC1SIDA6MCAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290
LWZzL3Rhci90YXJnZXQiID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWls
ZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290ClBBVEg9Ii9ob21lL2JhZ2FzL3JlcG8vYnVpbGRy
b290L291dHB1dC9ob3N0L2JpbjovaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9zYmluOi9ob21lL2JhZ2FzLy5sb2NhbC9iaW46L2hvbWUvYmFnYXMvZ28vYmluOi9ob21lL2Jh
Z2FzLy5sb2NhbC9iaW46L2hvbWUvYmFnYXMvLmNhcmdvL2JpbjovaG9tZS9iYWdhcy8ubnZtL3Zl
cnNpb25zL25vZGUvdjIyLjE5LjAvYmluOi9ob21lL2JhZ2FzL2dvL2JpbjovdXNyL2xvY2FsL2Jp
bjovdXNyL2JpbjovdXNyL2xvY2FsL3NiaW46L3Vzci9iaW4vc2l0ZV9wZXJsOi91c3IvYmluL3Zl
bmRvcl9wZXJsOi91c3IvYmluL2NvcmVfcGVybCIgL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qv
c3VwcG9ydC9zY3JpcHRzL21rdXNlcnMgL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0
L2J1aWxkL2J1aWxkcm9vdC1mcy9mdWxsX3VzZXJzX3RhYmxlLnR4dCAvaG9tZS9iYWdhcy9yZXBv
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci90YXJnZXQgPj4gL2hvbWUv
YmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvZmFrZXJv
b3QKZWNobyAiL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL21ha2Vk
ZXZzIC1kIC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3Qt
ZnMvZnVsbF9kZXZpY2VzX3RhYmxlLnR4dCAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci90YXJnZXQiID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVp
bGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290CnByaW50ZiAnICAg
CXJtIC1yZiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290
LWZzL3Rhci90YXJnZXQvdXNyL2xpYi91ZGV2L2h3ZGIuZC8gL2hvbWUvYmFnYXMvcmVwby9idWls
ZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0L2V0Yy91ZGV2L2h3ZGIu
ZC9cbicgPj4gL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9v
dC1mcy90YXIvZmFrZXJvb3QKZWNobyAiZmluZCAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci90YXJnZXQvcnVuLyAtbWluZGVwdGggMSAtcHJ1
bmUgLXByaW50MCB8IHhhcmdzIC0wciBybSAtcmYgLS0iID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVp
bGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290CmVjaG8gImZpbmQg
L2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIv
dGFyZ2V0L3RtcC8gLW1pbmRlcHRoIDEgLXBydW5lIC1wcmludDAgfCB4YXJncyAtMHIgcm0gLXJm
IC0tIiA+PiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290
LWZzL3Rhci9mYWtlcm9vdApwcmludGYgJyAgIFxuJyA+PiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9vdApwcmludGYgJyAgIFxu
JyA+PiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZz
L3Rhci9mYWtlcm9vdApwcmludGYgJyAgIAkoY2QgL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qv
b3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0OyBmaW5kIC1wcmludDAgfCBMQ19B
TEw9QyBzb3J0IC16IHwgdGFyICAtLXBheC1vcHRpb249ZXh0aGRyLm5hbWU9JSVkL1BheEhlYWRl
cnMvJSVmLGF0aW1lOj0wLGN0aW1lOj0wIC1jZiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9v
dXRwdXQvaW1hZ2VzL3Jvb3Rmcy50YXIgLS1udWxsIC0teGF0dHJzLWluY2x1ZGU9J1wnJyonXCcn
IC0tbm8tcmVjdXJzaW9uIC1UIC0gLS1udW1lcmljLW93bmVyKVxuJyA+PiAvaG9tZS9iYWdhcy9y
ZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9vdApjaG1v
ZCBhK3ggL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1m
cy90YXIvZmFrZXJvb3QKUEFUSD0iL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2hv
c3QvYmluOi9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9ob3N0L3NiaW46L2hvbWUv
YmFnYXMvLmxvY2FsL2JpbjovaG9tZS9iYWdhcy9nby9iaW46L2hvbWUvYmFnYXMvLmxvY2FsL2Jp
bjovaG9tZS9iYWdhcy8uY2FyZ28vYmluOi9ob21lL2JhZ2FzLy5udm0vdmVyc2lvbnMvbm9kZS92
MjIuMTkuMC9iaW46L2hvbWUvYmFnYXMvZ28vYmluOi91c3IvbG9jYWwvYmluOi91c3IvYmluOi91
c3IvbG9jYWwvc2JpbjovdXNyL2Jpbi9zaXRlX3Blcmw6L3Vzci9iaW4vdmVuZG9yX3Blcmw6L3Vz
ci9iaW4vY29yZV9wZXJsIiBGQUtFUk9PVERPTlRUUllDSE9XTj0xIC9ob21lL2JhZ2FzL3JlcG8v
YnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi9mYWtlcm9vdCAtLSAvaG9tZS9iYWdhcy9yZXBvL2J1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9vdAovYmluL3NoOiBz
eW1ib2wgbG9va3VwIGVycm9yOiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9saWIvbGlicmVhZGxpbmUuc28uODogdW5kZWZpbmVkIHN5bWJvbDogVVAKbWFrZTogKioqIFtm
cy90YXIvdGFyLm1rOjM4OiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2Vz
L3Jvb3Rmcy50YXJdIEVycm9yIDEyNwoKRml4IGl0IGJ5IGFsc28gcGFzc2luZyB0aGUgc2FtZSBj
b25maWd1cmUgb3B0aW9ucyBhcyB0YXJnZXQgcmVhZGxpbmUKdG8gaG9zdCByZWFkbGluZS4KCkxp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9hTWpIUExKNXFIcF9UVGp1QGFy
Y2hpZS5tZS8KU2lnbmVkLW9mZi1ieTogQmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5j
b20+Ci0tLQogcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5tayB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVhZGxpbmUvcmVh
ZGxpbmUubWsgYi9wYWNrYWdlL3JlYWRsaW5lL3JlYWRsaW5lLm1rCmluZGV4IGY2OWNiZTQ1ZTIu
LjA3ODYwN2EwYzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmVhZGxpbmUvcmVhZGxpbmUubWsKKysr
IGIvcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5tawpAQCAtMTUsNiArMTUsMTAgQEAgUkVBRExJ
TkVfQ09ORl9PUFRTID0gXAogCS0tZGlzYWJsZS1pbnN0YWxsLWV4YW1wbGVzIFwKIAktLXdpdGgt
Y3Vyc2VzIFwKIAktLXdpdGgtc2hhcmVkLXRlcm1jYXAtbGlicmFyeQorSE9TVF9SRUFETElORV9D
T05GX09QVFMgPSBcCisJLS1kaXNhYmxlLWluc3RhbGwtZXhhbXBsZXMgXAorCS0td2l0aC1jdXJz
ZXMgXAorCS0td2l0aC1zaGFyZWQtdGVybWNhcC1saWJyYXJ5CiBSRUFETElORV9MSUNFTlNFID0g
R1BMLTMuMCsKIFJFQURMSU5FX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCiBSRUFETElORV9DUEVf
SURfVkVORE9SID0gZ251Ci0tIApBbiBvbGQgbWFuIGRvbGwuLi4ganVzdCB3aGF0IEkgYWx3YXlz
IHdhbnRlZCEgLSBDbGFyYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
