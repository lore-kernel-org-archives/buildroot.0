Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469D5CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D31BA61570;
	Thu, 25 Sep 2025 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ9rO5KQaRaQ; Thu, 25 Sep 2025 20:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC36615CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC36615CE;
	Thu, 25 Sep 2025 20:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BB9177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D672641275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GnlA6gOZRU6 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5A5440066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A5440066
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5A5440066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so874003f8f.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831418; x=1759436218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZ1h6/rLdwVAi938u9RweQ4FpR9bEDesFn13gzt68dQ=;
 b=ZMgspc42+fC9ZsfwShpCaGSSaKhntgBu7x0s4UW7BDaYsMpSSyjWvFwBOSerR3JG3B
 dJgdsEJfA+jSk0YXrkviQTIFhm5aw8rl2FcTy6josdVUcxCb3BqjcNJjNOTNrvEV6v7/
 lO96gWK/EAk9KkHpucf0x0vcqpXje1IS7PNR7yytX/692s9KbYfl6a53M0kKJRx63QEl
 VuhVXCCTJhnx3gBUVVM+BAAKPsM92c5OCDs5bDMoW16PXLRfTkMYkYljeYE1XvHfcPk5
 PgJq6QNV7pJS1m4uW4UgvN13Yb5oXf6kvjczI1llq66NNsy0LIQLNN2r1kz1V47WiUhY
 CuWw==
X-Gm-Message-State: AOJu0Yww79Jmmoqxwl/+u++jU2o6Z3YH2Ud5ad60MyMCWusKej1oZzfZ
 TwPEtkBGbEUONzeaCxscoBCH8R0Tan2KOXVR4Wfikxyb/9YxbUYxmMZtboc+XdLqRnA=
X-Gm-Gg: ASbGncsfx0VhUtbVS6Poue5lWrjOx1yg3cN47D+f2UyPSdBEEx50emfDqg0rGt+Cr3n
 Rx4K6smP0Ae6FfFn7+PkMEFj8LK/ShzdZqRjeC6X5gM44fcqqHiHszUrsB8HhmMcYfMffW+a/YH
 QadHKusbnRGLDOsmqYwe0pZDn4RszxZApd17PLFZKiAC/ymZiKREBoOt8thayObSvoy9qm5cfnl
 itHuMNZ8+JXCqKniLot6IYNxhhGqV70xw7LdlwWvj5oZ3oGz8OtBdWqZyJXsx0f2Jv4oqNS4Xzr
 1tF7dOYCxnHrY1CR4K+InyBvR7gLNTPp42Md5u2pseibieUIoF8b5P7jHjKXGX6nAwBAGzZiV85
 BRXnPE1cJXO+kCcLEQZvPnfsWwQ==
X-Google-Smtp-Source: AGHT+IHofGqnpL/ECYMeuFAVzcaqVFVKSkpOaouRvLsJJHLO9lGMf6/sq3K60sfNyT0wZ3z543j3qA==
X-Received: by 2002:a05:6000:2f87:b0:3e9:2fea:6795 with SMTP id
 ffacd0b85a97d-40e4b389223mr4988476f8f.53.1758831417845; 
 Thu, 25 Sep 2025 13:16:57 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fbb27sm4088863f8f.4.2025.09.25.13.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:57 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:57 +0200
Message-ID: <20250925201657.44129-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919065303.60285-1-thomas.perale@mind.be>
References: <20250919065303.60285-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831418; x=1759436218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZ1h6/rLdwVAi938u9RweQ4FpR9bEDesFn13gzt68dQ=;
 b=fImdL2XxshbjyuysiQJFmupyfNBXQeKvYYBx9SOsktfYxPGnTjCnC0H1AVm+cMva5E
 8HwCPiIRla1X92Q2rt6ItHIR0PbYmq9K8Jbeqf4jZFED5miLdSlfvBlNrE0iUlspl+D7
 Dpvu7yGtPtr429rdUQIvM3J+lm5NgRrD9XLUr0u5F2lzUEjgWxgOXAokzC/Mnp1j1vB/
 7PiYWyTLqdORVNI6VBPF9VBdWU71W/A8ArLDQIRCPG8OYPsv/SNxWGLA+RLhdR+v0ZOS
 LoYZJJ+v9DtKog1nnrJ3BL4E8+JIpK4QFQ3brrPwmd8zaxQf4aXnevuC6ku5UwIwbYM8
 HUgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fImdL2Xx
Subject: Re: [Buildroot] [PATCH 1/2] package/poco: add patch for
 CVE-2025-6375
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerability:
> 
> - CVE-2025-6375:
> 
> A vulnerability was found in poco up to 1.14.1. It has been rated as
> problematic. Affected by this issue is the function MultipartInputStream
> of the file Net/src/MultipartReader.cpp. The manipulation leads to null
> pointer dereference. The attack needs to be approached locally. The
> exploit has been disclosed to the public and may be used. Upgrading to
> version 1.14.2 is able to address this issue. The patch is identified as
> 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf. It is recommended to upgrade
> the affected component.
> 
> For more information see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2025-6375
>   - https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...-SEGV-at-Net-src-MultipartReader-cpp.patch | 34 +++++++++++++++++++
>  package/poco/poco.mk                          |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
> 
> diff --git a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
> new file mode 100644
> index 0000000000..cfb22d690a
> --- /dev/null
> +++ b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
> @@ -0,0 +1,34 @@
> +From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
> +Date: Wed, 16 Apr 2025 09:15:33 +0200
> +Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
> + (move assertion out of ctor)
> +
> +Upstream: https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
> +CVE: CVE-2025-6375
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + Net/src/MultipartReader.cpp | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
> +index f3a2f2bba2..f4aa27dd86 100644
> +--- a/Net/src/MultipartReader.cpp
> ++++ b/Net/src/MultipartReader.cpp
> +@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
> + 	_boundary(boundary),
> + 	_lastPart(false)
> + {
> +-	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
> + }
> + 
> + 
> +@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
> + 
> + int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
> + {
> +-	poco_assert_dbg (length >= _boundary.length() + 6);
> ++	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
> + 
> + 	static const int eof = std::char_traits<char>::eof();
> + 	std::streambuf& buf = *_istr.rdbuf();
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index ee740b2377..f7d9cdc009 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -11,6 +11,9 @@ POCO_LICENSE_FILES = LICENSE
>  POCO_CPE_ID_VENDOR = pocoproject
>  POCO_INSTALL_STAGING = YES
>  
> +# 0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
> +POCO_IGNORE_CVES += CVE-2025-6375
> +
>  POCO_DEPENDENCIES = \
>  	pcre2 \
>  	zlib \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
