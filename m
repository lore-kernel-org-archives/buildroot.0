Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C68DCD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2739F41B23;
	Fri, 15 May 2026 13:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4nfjWCqpt3X; Fri, 15 May 2026 13:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F9E41B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852010;
	bh=A4pN4UXENuprjhNpcgenDqBX9ZnYKQ/0Abuz4DX67/A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=efD9ZEr0eiB4XAZBfOAoqO+Yp9JycnDvDcN/YlYIw7eYlziizfooFEWpx8d6b/HhK
	 kCsL/VjfnZ0EHabI/6uuuV5BaN/3wEV5FIGSz4034ltbyhBK7Je93mg/lRI2MOWEqa
	 fCvzJT7TkkDEU8T3BmLAYtO0A2LDqP3WjnzeKqxcHuznj7hhxJ7/MTtqLV1yUgLOFv
	 lBvamTSPPWI2p2Ld9XPxoy5Jx6tnq3x/PmNOcPneT+324a+wUg17oDT5waQpFAQfRN
	 0HmJp/E2deBikiM15xlXAbrxM1zYphKeAU9mBeZ8XBPcuL2JuQjnZ+9CTeskD5O+Bl
	 wvMa8BBHgoung==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F9E41B2F;
	Fri, 15 May 2026 13:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F04236F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1026A61549
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45i6eJw3K3QB for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E97E661545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97E661545
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E97E661545
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so50820065e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852003; x=1779456803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=djwzz4NbdPNdyoodxKFS62gxFj84K/uKaIADBiuoZsM=;
 b=MZEeYFoEx31z9jfE9G6NYodycMoZqw0/MHrpWonHJ+g2kO2oVPOGUgDZdY10xP3ruB
 xVtPnSdpFJw2pJ0xPDNm+drPEcjT3eJr1FJUTT2fw9yC5AI4gZzAmmIQGjjgx+I3KxNq
 ATsZyeiqnYa/V0WmEN9sWjmWDWV7AKuN8NIfAkjsVpqrwmqDYaNKRCq/n4WiUMKuKEsa
 7oF9+kKY1ERoDsZOlgBC2ALRUzFFu5gTubT73oJ9Ax/JyDWHxvCnkitDvn+l8Ls1NMtQ
 nP1WkAa3XfLSCIr88fH96zFaFbOOJBJ0g/f3KJf5VYfx0+D6PCFiBCVBfFB0gAuOoUyZ
 Wjmg==
X-Gm-Message-State: AOJu0YzOB1meg5KcuZ7InI1VONIs0RdN5kzGbKiiD5seY4Cf31DxOw+b
 /Y/Zm5pB163NXGSjPP5gFcQd8MRiucmqjKmGqPBVw5YEeNJHqLmUHYqe9GzBE1Pbnw8=
X-Gm-Gg: Acq92OHSKr6hNP21VOYDiOORgAB7uZLDEdmSaVTBZFVcaPDneBl7BaJ9Ro5jsgQZWsF
 ukbasPwPr7yj8hy2VBduguUyB891vYQHByuA4tJ/uey7exKmFawF7ZE5PpQ40tl5tKjGF0L8zMg
 HFp0FXbZSyjD0fRrSUxZ2UcJPUP1Mji/s6jBn0vhv25FAtqpziRjCCYgwHLBmmiwLgAraLhR90O
 5V/ghNV7C1zr5+RquqT/AeUlG7Q8O5UXN3uapv3mg2p1FFjIGIiV5jidoqrqr+DfAgo7J5FNeTw
 /DjOFoaZ7fYCjY7JFezZkwuN6bToAK9emNjoOd8gm2u0ZfD3Aen9UvVw790jU/aki8rvFtJJLlu
 MIf2ryK8X9GTsRg1Yc1bLlNwLYv7VevAdKoVkg+hw0rp20RwToCD2kmueDqTsWpzNgEng5Ng9kA
 s8RPXoNjJH9AI0ltV4huuhwrqDHrGEdvIB/F24th+ms3fk
X-Received: by 2002:a05:600c:8b18:b0:48e:526e:1011 with SMTP id
 5b1f17b1804b1-48fe65130c6mr57546095e9.25.1778852002909; 
 Fri, 15 May 2026 06:33:22 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab671sm62115855e9.1.2026.05.15.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:22 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:21 +0200
Message-ID: <20260515133321.315134-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512093117.154895-1-thomas.perale@mind.be>
References: <20260512093117.154895-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852003; x=1779456803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djwzz4NbdPNdyoodxKFS62gxFj84K/uKaIADBiuoZsM=;
 b=ZMUPArUoXuW7RfxlZzLMKUrsnGMxJFhKnAutODSic/T89Ai9ZkMZQpDGGEQAeaHv5n
 L1omGWpYFprdPuhKzPQje9SMVb6ocOfu6XsXY4/7Eib7Xdhq169aro0NEihmQSUk3PHO
 rbEbzw6LG7wJ74zW9UAkJJYz8AqR/n6isJK4Ru5sxKjePTUgqaS/7xmEcfAtbSMv81+Y
 dFxZc9yN8Nl11bS9KwBIT9K3AMGSL/bbQbE4PA1Wcygp1PSev+GebKOsS1CXbu4X5Ake
 lfnLjq/sKzypk22aH6Uqu9sLP1LjP4Z3mybkSUF7MrOIm4V1YJsaE+WWfXe4G8tSWirm
 zeAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZMUPArUo
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/sqlite: patch
 CVE-2025-70873
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
> - CVE-2025-70873:
>     An information disclosure issue in the zipfileInflate function in the
>     zipfile extension in SQLite v3.51.1 and earlier allows attackers to
>     obtain heap memory via supplying a crafted ZIP file.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-70873
>   - https://sqlite.org/src/info/9766b47beb9ec72f
>   - https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/sqlite/0002-CVE-2025-70873.patch | 30 ++++++++++++++++++++++++
>  package/sqlite/sqlite.mk                 |  3 +++
>  2 files changed, 33 insertions(+)
>  create mode 100644 package/sqlite/0002-CVE-2025-70873.patch
> 
> diff --git a/package/sqlite/0002-CVE-2025-70873.patch b/package/sqlite/0002-CVE-2025-70873.patch
> new file mode 100644
> index 0000000000..a5b8c901a5
> --- /dev/null
> +++ b/package/sqlite/0002-CVE-2025-70873.patch
> @@ -0,0 +1,30 @@
> +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Sat, 6 Dec 2025 20:41:24 +0000
> +Subject: [PATCH] In the zipfile extension, only return as many bytes as
> + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
> + 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
> + ZLIB is available, so that tests get run on unix platforms.
> +
> +Upstream: https://sqlite.org/src/info/9766b47beb9ec72f
> +Upstream: https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a
> +CVE: CVE-2025-70873
> +[thomas: backport to 3.50.4]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + shell.c |  2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/shell.c b/shell.c
> +index de401b89ec..e2640fd874 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -11184,7 +11184,7 @@ static void zipfileInflate(
> +       if( err!=Z_STREAM_END ){
> +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
> +       }else{
> +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
> ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
> +         aRes = 0;
> +       }
> +     }
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 667ee8d70e..1335d0dbb2 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
>  SQLITE_CPE_ID_VENDOR = sqlite
>  SQLITE_INSTALL_STAGING = YES
>  
> +# 0002-CVE-2025-70873.patch
> +SQLITE_IGNORE_CVES += CVE-2025-70873
> +
>  ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
>  endif
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
