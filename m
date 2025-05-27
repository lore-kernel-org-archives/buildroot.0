Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6120C54F30
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 17:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF01D40848;
	Tue, 27 May 2025 17:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dP6oK-SZWOY; Tue, 27 May 2025 17:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE7440852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE7440852;
	Tue, 27 May 2025 17:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B269E19F
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D3160B73
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjJkehNmDPe8 for <buildroot@buildroot.org>;
 Tue, 27 May 2025 17:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0981E60B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0981E60B26
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0981E60B26
 for <buildroot@buildroot.org>; Tue, 27 May 2025 17:14:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so722975366b.3
 for <buildroot@buildroot.org>; Tue, 27 May 2025 10:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748366054; x=1748970854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AQP2nrd+zvwUXUstscQ9smh+TLVn1bz6K/S+3nQdqQ=;
 b=Oh/NFGlsLzE+XL1jimt6M3iMKT9ypei1LMIy0jjj2uc2TPw36ngbHqzIzfPq2kytHA
 A5S0Jv/Fw8ibC0C3jFlhP7Vdh1aZ3k4a7W97FQm33+C+Q19h3u6jOMiw3+zhQwbiKDpz
 Fx0CIZngGnPTZE2zBc859d+dUPKNWzwMWhNSyHrP0a+cDW9Gttd9RkthG/EP0eMKUuvl
 WCgqAUx79gudiZJ34zELEbKbzS+J4abIH4aiZsEC9Y2JkgTU/yXBT8jzoGa03uihcT/v
 F5EJ3X+XhgMcSWoNfrEkdY7iujCIEYlAvlHuvg71vjYp58sfxUMRaHqbiXhT3Hp/IiFZ
 8aJQ==
X-Gm-Message-State: AOJu0YzNu82oa5XWx/Y8IvDY6tHYlg7TOuYL0bAR5d/RS8ue/suZHAyk
 WcR+hITcGd5OlGN7xtFuaJ9aHC96D82pCqEXuvrFMyj/rCOevCs3bjXIlpG6
X-Gm-Gg: ASbGnctUPR2lIiaZ6pyDQXjRnhVGpaHu1UME0AyNUD703AREgD966flxoXGmsBhThyQ
 dgqtICJpBhEURlpGSJUugrfB1eGpvrpDWecfQHqMuLEs8E6r84VJxG6sVITwHqJDRuWxKgi1T9I
 nQaWqO2FYIttrIiTiYFA/4/gH1NMo48IOk7VwaYl3b3bVZFz3ou503G6qMKdKCke0YzqNxcHjf7
 H0PuKgDzCaCTc5B2x5nXwahyAC6Znu7F83FIdbVute5JRY9a6MP8z9yKRXZUbYPM4XagXvjUzfA
 zkqwXX3ha0yyRhKqa0aghb6io0cK0yCevlJwr04z44brq0wQPBQTGTRiSHVDpRGFgg==
X-Google-Smtp-Source: AGHT+IG5thDf9Tju1aEbwdQY8Xaf+4fjpEgVSmCv7UxFpEuE2r8hz+wAdJdN7wXLDXbOfUo++PobBA==
X-Received: by 2002:a17:907:7e9c:b0:ad2:4788:10b9 with SMTP id
 a640c23a62f3a-ad85b18be66mr1260224666b.33.1748366053470; 
 Tue, 27 May 2025 10:14:13 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89bb4ab07sm17151366b.168.2025.05.27.10.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:14:13 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: eric.le.bihan.dev@free.fr,
	Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 27 May 2025 19:13:58 +0200
Message-ID: <20250527171400.78560-3-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748366054; x=1748970854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AQP2nrd+zvwUXUstscQ9smh+TLVn1bz6K/S+3nQdqQ=;
 b=c8+EF4i4dwPa+WskOFwrPlaG+7uLMCM9oJt0SjIGeObxmHm41aEotNwr7ItVwpnQYi
 zf7QKRSKleUesPyGqwM3aQT2eIEjk/mVCp6YxJSX6ydxoQOgqxFkqyWGmubAw7bX07jr
 Ftp8VZ66AqamYo+Boay+NLBHQP99otuYMLooBe72FrCc8v74yFi3rVysFD1mcmr4zbX4
 klSLolNxFTRIcpOwOk/kGfIca26eljSlsy8Mqh9Rgg4QRVLuf14b/zXJAZsZ8izKs9+k
 IIx/6K1bYlePFfIT416yfapM1vmYPD2JcF55RSKYpKl6qd7VRSxqE7eiefTYrq6QQQX0
 YVnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c8+EF4i4
Subject: [Buildroot] [next,
 v5 3/3] DEVELOPERS: add Alexander Shirokov for uutils-coreutils
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

U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFNoaXJva292IDxzaGlyb2tvdmFsZXhzQGdtYWlsLmNv
bT4KLS0tCiBERVZFTE9QRVJTIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA3OGJiNTU1NTMw
Li43NzE2OTE2ZDIxIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAg
LTI5OTIsNiArMjk5Miw5IEBAIEY6CXBhY2thZ2UvbHJ6aXAvCiBOOglTYW0gVm9zcyA8c2FtLnZv
c3NAZ21haWwuY29tPgogRjoJcGFja2FnZS9yaXBncmVwLwogCitOOglBbGV4YW5kZXIgU2hpcm9r
b3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPgorRjoJcGFja2FnZS91dXRpbHMtY29yZXV0aWxz
LworCiBOOglTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+CiBGOglib2FyZC9hcm1hZGV1cy8KIEY6CWNvbmZpZ3MvYXJtYWRldXMqCi0tIAoyLjQ5
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
