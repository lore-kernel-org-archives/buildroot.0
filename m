Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B487CC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B36A83DF5;
	Fri,  1 Aug 2025 15:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlCQbBA7_QfY; Fri,  1 Aug 2025 15:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C95B84211
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C95B84211;
	Fri,  1 Aug 2025 15:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E26160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8694C41312
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LjjNhX4rw3k for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C54641264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C54641264
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C54641264
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1070623f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060853; x=1754665653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7H3UBV1UxPF3RMNgXyRFne8rNhBryWHsmcCn8Uy7zc=;
 b=gnEjVJ6nE9jT2x9KATTk1vrRwX/hZYzXOa4zuaHpHOF43oF4aIGs2/AL7+Q4DgRtn0
 Jd3MrRu3cwesIeFFP81Bk3QWdRMR/WVHklrjm3zQksaC9xGELaGlAmqI0IfpJJt1Y9H+
 F0lwGpPpi4jR7ExllxRxoiemLVa1pkEB+s7Nlr/qowuHjE9stOV+RWrblPrdV4nyLoqh
 Ujtr5+HiAH+UvkVSzWy2mwOnkSPzySxLxHavXv5RDOsuIs6w/Vt6jQHHKxU9Lkx+w1Cd
 n50Mls/zZ2OvcoMHqqWfjVDUNzbtlyJz2bUoXNCChvyado/u29CJGu3L+PpmCXDWE8Nx
 OJCw==
X-Gm-Message-State: AOJu0YzStycZyP7qO2eN5XHiCmqvjX2g575zOsM73BnMzqb1p9D8FXmf
 BLlhJicYbuhewoeji5QZ9U0kiOA4B6JLlS3XSKIfl0dXnnAb7jmbQtv4KW3U7/WpHLHCaRv059D
 MkMBx
X-Gm-Gg: ASbGncvsDyzhKKW0vwE8V66jNDRtLI3KdBJgAWtSYCO1MN9Wz/Ew7eoYBs32qFDKw4p
 KCkomTMTcOEI3ICqyB5P/cLJ9xTnagy0lrbD+bOpOehl+C83SuOpk1pEFzhEMRRfbQ6xyULC8l5
 i8r3NfE/FFY9tsDjSMr3xCvaNMF9WLW2U/qgRcrpas3sl+akd1HXWNTSlIx2lke4ZNpx3Mk66vK
 6MudK65Yc5IFDjPFeVG2DZ3FF3oKqRpuscF4SL/vKWgeotpn4t52JsmzzRv7a4bqn+B39OeWYir
 ShT6ihVzn5mrT3KPABxEbNi+NB7yVmJQ2x0RIW1NItTKZAU/f52ka5aB8Uu7pmzqnwmk163wQ9S
 iAa9u23duz5GnBfOEad6KN5Cln6Ing/+z0/SRTa75eEUVASLUy94Bp0zjzbUZwqNw0Nn3gNGfrJ
 hKNHkfAtLX
X-Google-Smtp-Source: AGHT+IFJqVN2aug/iK2atBJdlOeL/AMILr3EHb5zNTim5bI3yuKVbyc5iUYeExJXpdyuOpQluNboSA==
X-Received: by 2002:a05:6000:250c:b0:3b7:8410:22b5 with SMTP id
 ffacd0b85a97d-3b8d947139amr109908f8f.13.1754060853072; 
 Fri, 01 Aug 2025 08:07:33 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  1 Aug 2025 15:07:16 +0000
Message-Id: <20250801150722.4003476-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150722.4003476-1-raphael.melotte@mind.be>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060853; x=1754665653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7H3UBV1UxPF3RMNgXyRFne8rNhBryWHsmcCn8Uy7zc=;
 b=UiOgjFAfHOee4gKmu21isv7iHTUE05QPuvom7Fe5KoXuEDXyH28stL4sr21Jdb9JmI
 +4YR4+6vty8FtWAPDJ8a0j/tJxqoWSgKrZTXj1XQy5T7uUuvHm62xIZu1YhonaxHYyuy
 SEa50ZygI6oXB/QmBFgiPT4tKVCOYm3SF/uOGUPQPOfri8wZNg1RI2YfqLwEL57HkPIk
 2c/PGmmv68/PhFdyotgT6qzYZL86pSTMkX6N9UcIi9XByvP9Uzf1uv6lW1iuzUo11Dya
 IzXTCG4mLQJfMKefpdOFPIw15aXu5pCMYj9o6OLg7g/rilnI7Xm+cHmhz68knwFK0QV9
 7R6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UiOgjFAf
Subject: [Buildroot] [PATCH 3/6] package/mupdf: skip installing docs to the
 target
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgJ2luc3RhbGwnIHRhcmdldCBjb21wcmlzZXMgJ2luc3RhbGwtbGlicycsICdp
bnN0YWxsLWFwcHMnCmFuZCAnaW5zdGFsbC1kb2NzJy4KCkluIG91ciBjYXNlIHdlIGRvbid0IHdh
bnQgdG8gaW5zdGFsbCBkb2N1bWVudGF0aW9uIHRvIHRoZSB0YXJnZXQsIHNvCmp1c3QgcnVuIHRo
ZSBvdGhlciB0d28uCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9tdXBkZi9tdXBkZi5tayB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCmluZGV4IDZiNjY2
MDMzZWIuLjZmZGJmNTlmMDUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKKysr
IGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawpAQCAtNjgsNyArNjgsNyBAQCBlbmRlZgogCiBkZWZp
bmUgTVVQREZfSU5TVEFMTF9UQVJHRVRfQ01EUwogCSQoTVVQREZfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkgJChNVVBERl9NQUtFX09QVFMpIFwKLQkJREVTVERJUj0iJChUQVJHRVRfRElSKSIg
aW5zdGFsbAorCQlERVNURElSPSIkKFRBUkdFVF9ESVIpIiBpbnN0YWxsLWxpYnMgaW5zdGFsbC1h
cHBzCiBlbmRlZgogCiAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
