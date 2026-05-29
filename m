Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086B5CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD7E421FD;
	Fri, 29 May 2026 08:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZlTE2H8GxuD; Fri, 29 May 2026 08:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD79242207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043354;
	bh=oqwV1GBvZUIIqQrSARbYbhbg40wFghNP0BjCVf2iYFU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dsvQoUPE03zkye85whqTa0xMedKX9rHOaTeIv9mp3+yWHaMaOZz8oA96TyPSkKO8I
	 Wu3sIkiFp8M21cnQD1LlkKpTvn/rqJDdrBRgrzUJUIhfsd5QXN56BFscWmgF8hcPuc
	 F0N7BhqofaqpZ+DaRpkFeIe2ZeEMC8fj4tMXb459ZwVgQQ/YuyGE3haJxlDQ4pkxw3
	 AlBIU5Yf3gHGa/tNNjrWpDyYp4+F/Z1NFFOUgJOK0zjiWfDRERmIXCnnzItW02gpfz
	 2mzFdDX6Wn8Q3HmZxn6fL7lolVU55QAdK7JmAuyz1S6lwCXRziZrGHkFxtz5j8g8Q5
	 /WrhcKrw2HubQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD79242207;
	Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72231288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FEE421FE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJEYOwRrdXNq for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6143B421F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6143B421F3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6143B421F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso59440625e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043348; x=1780648148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y1uLjZWRhyuJuq07nnxULlZidhFPr1ndmfPnBnsKDE4=;
 b=ZiIPIH4m3fALf+aTrCb+r62BukmJeoJAGATNTw6q9XLTwg7hQk5M/Is2pKllAZlF6E
 KIWIut9W66Q+k8qjtE0S8tzWzZdMJUL1w5L7cyybk92x8leDhDCgNECx6yYUeDPrTipL
 9j0bmdMd7Qs6uSLdpuqbavbN1PLxJ17JEtjSZZr7WQh9k0jZ846iMqqsHzvOQeipueU+
 ta4s1dx9/OSgSCF4UCQZyLa+krxCwTKuRE6774TDMQYvHTamB+RvtLC4btIDWQ+bMKP1
 EqnA9S6WXK5vYunPIlUT3mBd5WpoPzriuG6nH7sw5V+1PwPGCoGW4AF9lS/z30uG1sj7
 iezA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+X6N6qdLvk17b44GxgSrUpcKe424gW+WVuLuAC/NDLJ/QrcEXERaYEVO6iRQw2eTbFBVqDyG3GmG0=@buildroot.org
X-Gm-Message-State: AOJu0Yxo8+OqERhRQwkCaGvN4GwU/mt20gkjhj+R/LcDsvQhFbOCTGuS
 BXtdjyXIqdJZqMWkhIZ6tHY1cj7fDTBKzYPWfhmvhZ8+ECbWWQgPOcTF2ekqbdfRCXs=
X-Gm-Gg: Acq92OHUu9G4pWqyumMQed2u+XPYCR/Dtqd7QFxrE4c135QCP15AvpSLLlclttKSoQo
 gDXFiDq7Rnhi6XDAUnjyRonzSpK7syhgtmyWM07jJc6kmNHGWONlNxsLBZ3ntphI7Rq6CqSuZ3y
 7GgD4YK7BDv0fpCj5L9BFYZuiL47y1qfXaL3PFGg5rz/+Q06v/uVf5ieEEuDTnRTNh/06I6jm2W
 hXWqsv2PRm4JPnz1u3ugOyGc35tzeOOVrG2MMmvzjscsX/zF/GcoDDJLof6C3gx2gfHYGgM8LWK
 omlzI7qLQwF5T/XEvyet+cU7W+AeQYqq85xdX2OBMGOjwykeDepDJqVTDeRfWD6FC7UIDQ2OgU5
 ccu+8Sv/dNMeCXcJPyKEprqpILNZBx6+KlKmeZosFYlewfqFVicKS8a/oqwjqZkhBIT5lDAsWhd
 7w3GDjN0QNYDbjtiG2WLvsWfquGMLwWQ2KCvjGEoAnDXUbsAdd9Q5YW+l5MgbVTnCOW77w
X-Received: by 2002:a05:600c:2d54:b0:489:e126:b757 with SMTP id
 5b1f17b1804b1-4909c0af7ffmr20459695e9.25.1780043348346; 
 Fri, 29 May 2026 01:29:08 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm1935182f8f.26.2026.05.29.01.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:08 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:07 +0200
Message-ID: <20260529082907.56522-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251204205412.2158168-1-bernd@kuhls.net>
References: <20251204205412.2158168-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043348; x=1780648148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1uLjZWRhyuJuq07nnxULlZidhFPr1ndmfPnBnsKDE4=;
 b=b9f5G679phDR9wxbr8qFbyLL0pPKohPGNpAFAW6+EsZCzPIRZorjFwDUXYINk9ub+o
 6CuNExiGADB9naHxMwPK+FKh2aVlht9s7ogG5+l5BJRV/dgK23p+2Kwm2MexpefB/El4
 o4W5eCbe47i5U+nTKX5x+Z6TOdbLgVUiLBborv5x0uqrqaAK7bWge1yk2G/8VzDKksBy
 G4Bb/ayHiMxk8O66hJCyGj/4ZpAkC+4DAsUGGz1u+EOYXK+D1tHbLdHJVJw1+HS2Kabe
 PHRjS5HMcOY9GPdRr8fcrTFuDvtUS+mwK5XrHShPTnGyjKme9WGzmYnmkbCvHuq2Hyxn
 Cqww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b9f5G679
Subject: Re: [Buildroot] [PATCH 1/2] package/go: security bump to version
 1.25.5
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
> Release notes:
> https://go.dev/doc/devel/release#go1.25.5
> https://groups.google.com/g/golang-announce/c/8FJoBkPddm4
> Fixes CVE-2025-61727 & CVE-2025-61729.
> 
> https://go.dev/doc/devel/release#go1.25.4
> https://groups.google.com/g/golang-announce/c/tVVHm9gnwl8
> 
> Updated _SITE because previous URL returns 403.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  .../go/go-bootstrap-stage2/go-bootstrap-stage2.mk  |  2 +-
>  .../go/go-bootstrap-stage3/go-bootstrap-stage3.mk  |  2 +-
>  .../go/go-bootstrap-stage4/go-bootstrap-stage4.mk  |  2 +-
>  package/go/go-src/go-src.mk                        |  2 +-
>  package/go/go.hash                                 | 14 +++++++-------
>  package/go/go.mk                                   |  2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
> index 98bf624b57..47e4d157eb 100644
> --- a/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
> +++ b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
> @@ -7,7 +7,7 @@
>  # Use last Go version that go-bootstrap-stage1 can build: v1.19.x
>  # See https://golang.org/doc/install/source#bootstrapFromSource
>  GO_BOOTSTRAP_STAGE2_VERSION = 1.19.13
> -GO_BOOTSTRAP_STAGE2_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_STAGE2_SITE = https://go.dev/dl
>  GO_BOOTSTRAP_STAGE2_SOURCE = go$(GO_BOOTSTRAP_STAGE2_VERSION).src.tar.gz
>  
>  GO_BOOTSTRAP_STAGE2_LICENSE = BSD-3-Clause
> diff --git a/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
> index bdc8459595..732888d305 100644
> --- a/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
> +++ b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
> @@ -7,7 +7,7 @@
>  # Use last Go version that go-bootstrap-stage2 can build: v1.21.x
>  # See https://go.dev/doc/go1.22#bootstrap
>  GO_BOOTSTRAP_STAGE3_VERSION = 1.21.8
> -GO_BOOTSTRAP_STAGE3_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_STAGE3_SITE = https://go.dev/dl
>  GO_BOOTSTRAP_STAGE3_SOURCE = go$(GO_BOOTSTRAP_STAGE3_VERSION).src.tar.gz
>  
>  GO_BOOTSTRAP_STAGE3_LICENSE = BSD-3-Clause
> diff --git a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> index db0c85e3d0..7c5beb1c9d 100644
> --- a/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> +++ b/package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
> @@ -7,7 +7,7 @@
>  # Use last Go version that go-bootstrap-stage3 can build: v1.23.x
>  # See https://go.dev/doc/go1.24#bootstrap
>  GO_BOOTSTRAP_STAGE4_VERSION = 1.23.12
> -GO_BOOTSTRAP_STAGE4_SITE = https://storage.googleapis.com/golang
> +GO_BOOTSTRAP_STAGE4_SITE = https://go.dev/dl
>  GO_BOOTSTRAP_STAGE4_SOURCE = go$(GO_BOOTSTRAP_STAGE4_VERSION).src.tar.gz
>  
>  GO_BOOTSTRAP_STAGE4_LICENSE = BSD-3-Clause
> diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
> index 9a18b6afe8..ead535f4e0 100644
> --- a/package/go/go-src/go-src.mk
> +++ b/package/go/go-src/go-src.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GO_SRC_VERSION = $(GO_VERSION)
> -GO_SRC_SITE = https://storage.googleapis.com/golang
> +GO_SRC_SITE = https://go.dev/dl
>  GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
>  GO_SRC_DL_SUBDIR = go
>  
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 1dc1b99756..7c689f9144 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
> -sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
> -sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
> -sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
> -sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
> -sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
> -sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
> +sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
> +sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
> +sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
> +sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
> +sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
> +sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
> +sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 85a40d4d36..c932baf018 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.3
> +GO_VERSION = 1.25.5
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
