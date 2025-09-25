Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89CDCAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4B661627;
	Thu, 25 Sep 2025 20:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36Puz4rQ4bLj; Thu, 25 Sep 2025 20:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1636161B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1636161B;
	Thu, 25 Sep 2025 20:17:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F87177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85A304129D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFfg7UGwVebb for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 695B941275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 695B941275
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 695B941275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso1189846f8f.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831438; x=1759436238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wqfXcodwqU5UIS/WNRseosr/OKhZULixZuwyG0uZOI=;
 b=K1npL+LskyPBoniXyIwCD+s3HM+aXX6pdklXddLyY0f5JpzHSJbZ4IjbIEvhy13bj8
 Hot+lOOmHsv/gBVfUnB9b9ONvb5cpqDgIjxoTDmpCJzfhm58tPrKwFPtLRP9m4bD6Z9k
 Y0j07vrUnx9HezVVbOt9FuuIxP5QwP+Ba8z15up0bapARPr11hp4Zx3wifjzLM/uWDss
 P+NN/jZmBhHdyQgGgjAkwOKBpc8X9fn0jI8ucxRx7W2Bk5QN+PK5qlCf18bMwcXEHcIJ
 WeEhK7Ku4saZxTGyjzDGbXhoP2kylPmxd1zKm9SNFS1UpIHjx+LpSFIMSpkNqD6/Eut3
 NnjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx/4//0251Y73nDRG0j4r5isxnRrjo1yYAACYpyQ0ZjYqgyvSDawKKNdaN2TaEsfwxqwf3nGRNh0E=@buildroot.org
X-Gm-Message-State: AOJu0Ywt6fLyLWgk4p5Vkyvx82m6mzSa498/yp8Z4JSgAJLIOJeHSJ9s
 ixr+MHwEDIOHDbqaPr+2CI446QKYXw5dnOVenJTkjPneLOfjKc9s9xo9wentP1nUYgnNIJpHHir
 cXfPlvZQ=
X-Gm-Gg: ASbGncs/EqdQg5jefi0+i1rSp7S75i9d5GtuIevP/caldIcH+y/wxw9JU0MwqvSCV39
 YXoDWMp54kQJM7KNhoQCEBcUCwWdtpNNZDneN8vPj0HMsEroe6mnkaFrdP1gNOg5mlIFggUQ3WG
 e13Vv7KZIIQYNuE5whAOntawg9zLXB33cCoiGuiS2u9jM+Y1Usith0NgklhcaXbZirZS6K1LfKL
 CYTJdUCQz5yOJx3+RjQnCMjGQz5pVcpvb7FDqR0R7oreji9ZDecIVhBm2I4kWljscQANc1aEuxW
 sKUrFnC9jkhjXJ55vu6Zz7Q8y2nbcJx8+xl9qLji8OI8bzBQIqEdlkAuSolPAy2kSV+ypjpLzzg
 TJKqXXGHkoSxX+0NpYhy1wsJnAw==
X-Google-Smtp-Source: AGHT+IGX/BAWjJXcBDby4kbd38m6Mg9rYCFjhrX9mEe20bwqp1TM1xlrkJLyCgCeqksvm8ExzMU64A==
X-Received: by 2002:adf:a314:0:b0:3e7:6424:1b47 with SMTP id
 ffacd0b85a97d-40f5f8e9dc6mr3330736f8f.6.1758831438388; 
 Thu, 25 Sep 2025 13:17:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb264sm4394638f8f.20.2025.09.25.13.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:18 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:17 +0200
Message-ID: <20250925201717.44835-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916010409.2547083-1-james.hilliard1@gmail.com>
References: <20250916010409.2547083-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831438; x=1759436238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wqfXcodwqU5UIS/WNRseosr/OKhZULixZuwyG0uZOI=;
 b=a/7/FgfJQqbioO57hGp1EroBvzeAgun+C2zdvNpTUkzyMJkUxLbi+CIfeQu1iy+NYW
 KnJui+TapyM/U25HO828emiRN+GwClaYH1MwGJWwHqgcjIKXHj34ERl/7naqVsLKHZSz
 LV8vc/tE012wpsniyMRkbMJQxP6aOti2fgYsbM3Q7V9WyQPKdDMC4le/MFiRxSHD8Z9c
 kmKAtYm5h6G4bYsdB4UrhuP4WY4I2ws5dcgUG/odbykCeZ1Kvs6U3fm4T2XoO3LFdJQ4
 peCJ+ew4f5VjLSymcwPb4tsgFffiH3deLgom1HNLugBl51Rcg7SM9+yjARol0Z9iUzvQ
 hYGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a/7/FgfJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump
 to version 4.15.0
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
>  package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
> index c422691dab..c86b6716a8 100644
> --- a/package/python-typing-extensions/python-typing-extensions.hash
> +++ b/package/python-typing-extensions/python-typing-extensions.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
> -md5  da52c877660b1760771ce7553f729c5d  typing_extensions-4.14.1.tar.gz
> -sha256  38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36  typing_extensions-4.14.1.tar.gz
> +md5  079e529d0b271647f3ec2720aee8fc65  typing_extensions-4.15.0.tar.gz
> +sha256  0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466  typing_extensions-4.15.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
> index 9ed8b71ff2..d181b973a5 100644
> --- a/package/python-typing-extensions/python-typing-extensions.mk
> +++ b/package/python-typing-extensions/python-typing-extensions.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TYPING_EXTENSIONS_VERSION = 4.14.1
> +PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
>  PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
> -PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/5a/da40306b885cc8c09109dc2e1abd358d5684b1425678151cdaed4731c822
> +PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
>  PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
>  PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
>  PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
