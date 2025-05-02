Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86092C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 13:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48ED641711;
	Fri,  2 May 2025 13:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcUdENqhL8Ew; Fri,  2 May 2025 13:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC9741785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC9741785;
	Fri,  2 May 2025 13:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 910C51A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53CD941769
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNgdRtzX9T7p for <buildroot@buildroot.org>;
 Fri,  2 May 2025 13:29:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03ECD4156C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03ECD4156C
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03ECD4156C
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30bf7d0c15eso19332231fa.0
 for <buildroot@buildroot.org>; Fri, 02 May 2025 06:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192579; x=1746797379;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=753ajf10YzZxbQ2PfQKPytbxIFhJP81MRf/Vem/freo=;
 b=mkcgPgysLYu8BzKVJUrrgyzsyWvs6J0naiO56YYJmH5Q4LIzFIThGinK3kZN0MbMs2
 IXyMOd5KMmZKM9Xpv9KRTKDuAxek60gNfZURyqoOVenZi+7cLV6SMQxjuVtVsJlG3rHv
 xEG9ynOsl/8nbVvrheO+wYcj52UxCPl9/vKmSXG4wnnvBdst/yDkqK/4hfLT5xIn2wc7
 NcjEiGPGwYEFVjpE36FxotNVccPgSZ04S28NT1Pi/SA7sw9mdRZSANnyx3WP2c49lIBO
 y5yrCzzRb/zbRplfi2Py5mYKJmB3mPg14SZVvzOolrSPTX8H8Tb0hNqG/pnLd/yGDZeb
 5EIA==
X-Gm-Message-State: AOJu0YxcBTgyo9pZHbv2Iu3+fgXoZ42qzSEQBmOROsXjYc+TkcH1jl/s
 Lx5bDwtjFZa+8Br3sjvA4n7aYU0/5JYKIOgv2SMhLxGgw+J0SqrddV5yQKfe
X-Gm-Gg: ASbGncuT3/g4NhV9ObMNKZBLHyGAZWQoUJAZF61qt/cFep2rd8HzvE6nwhTvKCnBlmp
 7k9ZeBIWXVDmm+XoAdkczDBxXI/F6sy4qqYSBeQuEmKlxAA1gMbI8eGve8Cmu4kq/1Z9qQWg0Hd
 U2oFHF5r9lZiH3WlTDj8sxIUmGkl1AC+JNdifRd+OhVMxcN57Uir0u2Et6u55rohB3mNmkZkDbW
 ngLbudqEZjexyTpkZUO2UKhsI7ZafONQxiUba3OSyHAbTpMIoA5WcawufkZ4wkwQOYQ9/m14Cj/
 TCETFpMjldG5dsynpT0CMyVaytqFZyh+KINS1qOZdgBcT7LGayfNvKSJybdQj7tuq9I+bxy5
X-Google-Smtp-Source: AGHT+IHNtS0k8Rjl2qeJQctBkfjDDmUfflp/x5JURyY06sZK93q6VUECLRrED3FMnFOym96PKnLu8Q==
X-Received: by 2002:a2e:9a12:0:b0:30d:e104:a944 with SMTP id
 38308e7fff4ca-320c5cdbec6mr7522201fa.40.1746192578762; 
 Fri, 02 May 2025 06:29:38 -0700 (PDT)
Received: from tollan.addiva.ad (b106.broadband9.quicknet.se.
 [194.132.233.106]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad8c3fcsm3370691fa.88.2025.05.02.06.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:29:38 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri,  2 May 2025 15:29:22 +0200
Message-ID: <20250502132924.3775738-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502132924.3775738-1-lazzer@gmail.com>
References: <20250502132924.3775738-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746192579; x=1746797379; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=753ajf10YzZxbQ2PfQKPytbxIFhJP81MRf/Vem/freo=;
 b=Y/6DVXofGgFH8x55k/memaNC4v5cHfDS1FGcuVcdSoHz4BOq98g3Zoxhi1EYs46YFB
 GJqaDHrLWZ+GQcjY6qRdaMqwThcF3h1rlxPjm5XgtFw7TerbG5BJpOawXtvtXPupj/C4
 dQoSgZUi75TKuCfLIO8Md0CZvxrP9nme9nIsYSP6v663veA5jVS4JFNMtLwUotaj9rjO
 VMFtMiqt81MWBX4VxRjuIZax2adse72EsmL9Rb8eLN+wufLIK+eGLryzGm4IM5ZaRyEx
 D6KpkUN0U7rPo49723LeBAfPUt0aEayU2GOyl4tBQeJt2kpesk7yGAPeyFQCdhYrrlSa
 byng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y/6DVXof
Subject: [Buildroot] [PATCH 2/4] package/libyang: bump to version 3.12.2
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

Q2hhbmdlbG9nOgogb3B0aW9uYWwgeHhoYXNoIGZhc3RlciBoYXNpbmcgZnVuY3Rpb24KIHN1cHBv
cnQgZm9yIG1ldGFkYXRhIGluIGRpZmYKIGxvdHMgb2Ygb3B0aW1pemF0aW9ucyBhbmQgZml4ZXMK
ClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0K
IHBhY2thZ2UvbGlieWFuZy9saWJ5YW5nLmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYnlhbmcvbGli
eWFuZy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcuaGFzaCBiL3Bh
Y2thZ2UvbGlieWFuZy9saWJ5YW5nLmhhc2gKaW5kZXggZTAzMjc4YWRmZC4uOTIyMWU5MzU0NCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcuaGFzaAorKysgYi9wYWNrYWdlL2xp
YnlhbmcvbGlieWFuZy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgNzdhMGFhYWViM2RmNzIwYWViNzBkNjg5NmUzMmUyYzJiZTA5OWQ0OGRmNzNlM2Nm
YjUyNTY3MDUxYWYzZTQ0YiAgbGlieWFuZy0yLjEuMTQ4LnRhci5negorc2hhMjU2ICBhMmFlOTRj
ZTQzZDhiNGIwODRmNjdjMDU5MDJmOTdjYmMwZWM4ODJkMzhlZjVkZGYxZDYwMTY1OWY2NGQ1YzY2
ICBsaWJ5YW5nLTMuMTIuMi50YXIuZ3oKIHNoYTI1NiAgMGI3ZWM0Mzc0N2QyMTFhMWU0OWM1MzU4
OGIwODIyMDYyOTQ3YmFiNmJkY2M5NTIzODU3OGJlYWIzNGNiYTViYiAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsgYi9wYWNrYWdlL2xpYnlhbmcvbGlieWFu
Zy5tawppbmRleCBmY2EwY2Q2M2Y4Li45NGY5YmEzYjhhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xp
YnlhbmcvbGlieWFuZy5taworKysgYi9wYWNrYWdlL2xpYnlhbmcvbGlieWFuZy5tawpAQCAtNCw3
ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQllBTkdfVkVSU0lPTiA9
IDIuMS4xNDgKK0xJQllBTkdfVkVSU0lPTiA9IDMuMTIuMgogTElCWUFOR19TSVRFID0gJChjYWxs
IGdpdGh1YixDRVNORVQsbGlieWFuZyx2JChMSUJZQU5HX1ZFUlNJT04pKQogTElCWUFOR19MSUNF
TlNFID0gQlNELTMtQ2xhdXNlCiBMSUJZQU5HX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoy
LjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
