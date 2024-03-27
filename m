Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EADCC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 15:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB832815E7;
	Wed, 27 Mar 2024 15:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGFF6531DbQv; Wed, 27 Mar 2024 15:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB7F81E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB7F81E87;
	Wed, 27 Mar 2024 15:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0181BF418
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ABC3815E7
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 15:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPFRCNgbsYAX for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 15:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=cleger@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F40788131F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40788131F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F40788131F
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:06:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41401ee5828so5812385e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711552016; x=1712156816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOtuOvLSpHh/2RaHoUPEFbL4zOsfxdAeTUyAFL+5tg0=;
 b=SuaAc2U/woigz7bE25X4T35oH39o+4IItHqPpw9hwp6+L1Ejs+faqR12MN3WJHOEYj
 0oMTBW9Dx1LzqXJigE6t5EbS/D8AdueeRH0QoTnm9UyqpON6BJtVM41ZUMWOhrT+hueF
 8lNZ+h5y3UAAp76NM3ROoPjsPCw9smzm7N14pGFDVP7u3TbdzRv+hM5mCAGjDhwbZoie
 laxBrL1s8ZYvX3GjT/Yt+oq9ZA4m7pBAO4m6gto+VN2TQZw1VNcZxTnbFOLbAsIjQDxK
 Epen4V3LYty3S72zQF4u8uSbQmC5mJuUvug4Pda5FY0EIsgpqvHB1RZAGiSsMhw4VfrW
 wbqw==
X-Gm-Message-State: AOJu0YwgJln5KGn7ET+EMNtdR7Au2joaK5FXrAjjgmf/opvi46J6mkoV
 eSCZqntjPM0D7iVJAySqFBvrnDhqKTx984il9/DXd3YGYje3v05+w4kpu72Y7ZUWTLh1Y69BDa3
 gmY0=
X-Google-Smtp-Source: AGHT+IE2YvDgCr+gvr1PDRRjPP53Ix4wFce9C8ZugK8/PHEL/yvNobT+VMO+NlZLDnNlRTbjpm+dPQ==
X-Received: by 2002:a05:600c:1da1:b0:414:b16a:e1f2 with SMTP id
 p33-20020a05600c1da100b00414b16ae1f2mr107422wms.2.1711552016005; 
 Wed, 27 Mar 2024 08:06:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9678:f1de:fff7:3af5])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c00cf00b00414041032casm2766172wmm.1.2024.03.27.08.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 08:06:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 16:06:12 +0100
Message-ID: <20240327150616.39345-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327150616.39345-1-cleger@rivosinc.com>
References: <20240327150616.39345-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711552016; x=1712156816;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOtuOvLSpHh/2RaHoUPEFbL4zOsfxdAeTUyAFL+5tg0=;
 b=XxSW6q2X7PHo8yjouAPGVlRWRJMasCXgxsRXkqssLa5px8PvUWf3bWr46n3Q//LeKO
 EFOJpsr4814E0k1aFOKgFPK1gy7tqqQuCM/O8pBtSjOjZC+ETV/gLF7b/NfrRjGwQ6Lz
 m5FT25oq8w99FqGQIcM+a/3kIWHTufiJj+02KBU1Cgs4I1j/Cjx3TSRUZgCdU9QHfqB6
 +/Ku2T2f56FMrMjpJzhlDvb182p/kXEYfc9UHBCSxrXuOA/mDtx7pBJLx3yloDeGWBMk
 PMS7mdfMd0RzwKkDGchLD9zVkn/QfWhdMovajk5QHd1hr7H8ULtd9dX/ZMfNICiDGZC/
 nBAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XxSW6q2X
Subject: [Buildroot] [PATCH 1/2] package/kvmtool: bump package version to
 4d2c017f41
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgdmVyc2lvbiBkYXRlcyBiYWNrIHRvIDIwMTcgYW5kIGlzIGxhY2tpbmcgcmlz
Y3Ygc3VwcG9ydC4KQnVtcCB0aGUgdmVyc2lvbiB0byBhIG1vcmUgcmVjZW50IG9uZSAoNGQyYzAx
N2Y0MSkgd2hpY2ggc3VwcG9ydHMgcmlzY3YKYW5kIGNvbnRhaW5zIGEgbGFyZ2UgbnVtYmVyIG9m
IHVwZGF0ZXMgYXMgd2VsbCBhIENWRSBmaXhlcy4gU2luY2UKa3ZtdG9vbCBkb2VzIG5vdCBzZWVt
cyB0byBoYXZlIHJlbGVhc2VzLCBqdXN0IGJ1bXAgdG8gdGhlIGN1cnJlbnQgZ2l0CkhFQUQuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQog
cGFja2FnZS9rdm10b29sL2t2bXRvb2wuaGFzaCB8IDIgKy0KIHBhY2thZ2Uva3ZtdG9vbC9rdm10
b29sLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoIGIvcGFj
a2FnZS9rdm10b29sL2t2bXRvb2wuaGFzaAppbmRleCA4NzQ3YWUxZDIxLi5mYTk3YmI5Y2E1IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoCisrKyBiL3BhY2thZ2Uva3Zt
dG9vbC9rdm10b29sLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNo
YTI1NiAgZTJlYjJjZDhiMzFkMjQ0ODRlMzA5NTkyM2NmZThjMzZkNGI5Mjc0MWI3Njk2NWNhZmFl
ZDZiZTM4MzUzNjljNiAga3ZtdG9vbC1mNzdkNjQ2YmEwMWQwNGJlNWFhZDk0NDlhYzAwNzE5YzA0
M2ZlMzZlLWJyMS50YXIuZ3oKK3NoYTI1NiAgNDU4Y2RlZmIzZjg2OWQ4MTY3YTk3NmQ2NzEyNWQ3
NzJiNGNiYTM3OTBkMzg5OGJkN2VlODU4Y2RlYTgzOTExMyAga3ZtdG9vbC00ZDJjMDE3ZjQxNTMz
YjBlNTFlMDBmNjg5MDUwYzI2MTkwYTE1MzE4LWJyMS50YXIuZ3oKIHNoYTI1NiAgMGQ1YmYzNDZk
ZjllNjM1YTI5ZGNkZGRmODMyZGM1YjAwMmNhNmNkYzFjNWM5YzZjNTY3ZDJhNjFiYjBjNWMxNSAg
Q09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm10b29sL2t2bXRvb2wubWsgYi9wYWNrYWdl
L2t2bXRvb2wva3ZtdG9vbC5tawppbmRleCAyYmNkNTU2ZjliLi43ZmVjNjY0M2Y4IDEwMDY0NAot
LS0gYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5taworKysgYi9wYWNrYWdlL2t2bXRvb2wva3Zt
dG9vbC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUtW
TVRPT0xfVkVSU0lPTiA9IGY3N2Q2NDZiYTAxZDA0YmU1YWFkOTQ0OWFjMDA3MTljMDQzZmUzNmUK
K0tWTVRPT0xfVkVSU0lPTiA9IDRkMmMwMTdmNDE1MzNiMGU1MWUwMGY2ODkwNTBjMjYxOTBhMTUz
MTgKIEtWTVRPT0xfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3dpbGwva3ZtdG9vbC5naXQKIEtWTVRPT0xfU0lURV9NRVRIT0QgPSBnaXQKIEtW
TVRPT0xfREVQRU5ERU5DSUVTID0gXAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
