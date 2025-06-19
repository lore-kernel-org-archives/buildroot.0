Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5483C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FE06084F;
	Thu, 19 Jun 2025 13:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPA00Gs2OfaL; Thu, 19 Jun 2025 13:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C3260B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C3260B4B;
	Thu, 19 Jun 2025 13:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29EEFE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BECA605F0
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-LGAUZ-Hl49 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 164E76084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 164E76084F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 164E76084F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:53:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so5891085e9.1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 06:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750341208; x=1750946008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pS23MqvRlc+wIMVfBf8NdiBXkhuotrzq0iL++PXSerM=;
 b=sqUF+9o4ouErARzNjlosno130cubwNEoOewslS21dySVVJeOhqBp8QUb+yHLai6mgy
 PqhxYRmPM8GvbPCLXNeOpn/3LLS9c2aMy1O9sraoBWXi6T1kpkh4pSOSLu830mOWbT6l
 CDkVH1rut87Lt9NknyTh/Uv+nQ2qfXyOaaJVGob2fQ8a4i3DRHPp1o0/QjQNkYelBXE1
 CuQEhh/h+jXwiI0+G4AAXTRU4AR8t2kAFf4ss/Tf6Ik+pLMIfFWVGrYcTOdZgX3f1Ir1
 zzFBJ/lSYBE6KKqGtMs+KgOyKpaDurQA+ZsMmc87rC6xwE9NBjlPdTepRoJ8pmkiJuYp
 wHKg==
X-Gm-Message-State: AOJu0YzoMgXUZnXqi/oKJNcN2Tkx2lhEbIftoMVwpgQPGxBsiGAPHu+F
 ybrBCKVi3MpiztaL0eTcLxVed+j6UhAZea898t8x8POK1fVQaI/kll8dmFplagJwy3IrF2TaUHR
 kAvVH
X-Gm-Gg: ASbGncvfw65zv0mD7OCInWUAFbT7ncyd3Yd92ednCBdX1qaSk+cHf94JBFvJpJJMMLr
 QOqu0lgpCC4xsCeSI55r4BYuMyMNOzCNS6UNevKJGnH86F+9q4FyLL6DDraJiX0eMM0h8cWcz2O
 fsTp8q47J69ELeHl2S8az7EQehl2LKWXj0AcHnmxYk/b8d+xR+twLEq2BPIwXRN+yXatkW8hyzk
 TlhZWqZ5digKP3NQE/I45OuqLsb3mefUeM84i/h2difnldyfYyoKCkN2hXO2m6ixM6E1BZWqeyC
 OA6vpouYfWOoksdwGjMyiE91UKYyhxtzC0K0U1rzgB5UnrsQuELs+TlsX8yLS60cIfYGJawlXvi
 MzS/ALGGjkYQ=
X-Google-Smtp-Source: AGHT+IETrUAH5bRxbHfHo1PdJAM3wf38qCcv9T0ySvAdBOGFOsfKK30oMDBQbNm8cpVWUwqBJGjPdQ==
X-Received: by 2002:a05:600c:3f0c:b0:450:d07e:ee14 with SMTP id
 5b1f17b1804b1-4533cb3be4bmr222429495e9.17.1750341207828; 
 Thu, 19 Jun 2025 06:53:27 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97b501sm29551665e9.2.2025.06.19.06.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 06:53:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 19 Jun 2025 15:53:18 +0200
Message-ID: <20250619135318.406138-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aFKx2lzT2l+lmXtM@yuce-lenovo>
References: <aFKx2lzT2l+lmXtM@yuce-lenovo>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750341208; x=1750946008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS23MqvRlc+wIMVfBf8NdiBXkhuotrzq0iL++PXSerM=;
 b=Eu3kB9jrYcsh1nQPns+2eUtQKGaUk6TjEirVrrkhyO3J3dxsQokAg06oBvb9M7u4BF
 yxGIFvKtqQ9iEqgTu+Nf3hJAKqSqGDfHYAzlKOOhkfv/FoUJI6eKUPNqHutygdSGsv1v
 UmD8Ddrv56BvFMeEtIogn4XFpXLICLYOwz1pBuzyYtbMYZeAl2zPjtmMCiSDuPJN/3q2
 PhjPNa13wGbTLBOyyt1UO1GnnKUrgh/vkWXlYYw2Hxr3Jn6x7Zvt3b0RCmo5dvrYUM+W
 KamkqbUffjQzdN6NtxXATK34MlvP4c3aAYGqo9PRY5/0sB1DjWAVVWc+Wu7t0SgnmxxW
 ywbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Eu3kB9jr
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/jq: security patch for
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
> Security patch have been fetched from the Nixpkgs [1].
> 
> Fixes the following CVE:
> - CVE-2025-48060: jq is a command-line JSON processor. In versions up to
>  and including 1.7.1, a heap-buffer-overflow is present in function
>   in the jq_fuzz_execute harness from oss-fuzz. This
>  crash happens on file jv.c, line 1456 . As of
>  time of publication, no patched versions are available.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48060
> 
> [1] https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/jq/0003-CVE-2025-48060.patch | 50 ++++++++++++++++++++++++++++
>  package/jq/jq.mk                     |  3 ++
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/jq/0003-CVE-2025-48060.patch
> 
> diff --git a/package/jq/0003-CVE-2025-48060.patch b/package/jq/0003-CVE-2025-48060.patch
> new file mode 100644
> index 0000000000..f2905274f2
> --- /dev/null
> +++ b/package/jq/0003-CVE-2025-48060.patch
> @@ -0,0 +1,50 @@
> +From d73a79035e1d24011a3363d52bf36b4eaea67aa6 Mon Sep 17 00:00:00 2001
> +From: itchyny <itchyny@cybozu.co.jp>
> +Date: Sat, 31 May 2025 11:46:40 +0900
> +Subject: [PATCH 5/5] Fix heap buffer overflow when formatting an empty string
> +
> +The `jv_string_empty` did not properly null-terminate the string data,
> +which could lead to a heap buffer overflow. The test case of
> +GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
> +but another case (`0[[]|implode]`) was still vulnerable. This commit
> +ensures string data is properly null-terminated, and fixes CVE-2025-48060.
> +
> +CVE: CVE-2025-48060
> +Upstream: https://github.com/LordGrimmauld/nixpkgs/blob/df21c79bfbb4d5ea50a49231bb8f91ab7afa051d/pkgs/by-name/jq/jq/0005-Fix-heap-buffer-overflow-when-formatting-an-empty-st.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +Signed-off-by: Yuce Kurum <yuce.kurum@mind.be>
> +---
> + src/jv.c      | 1 +
> + tests/jq.test | 4 ++++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/src/jv.c b/src/jv.c
> +index 6e8cdd3..3303286 100644
> +--- a/src/jv.c
> ++++ b/src/jv.c
> +@@ -1121,6 +1121,7 @@ static jv jvp_string_empty_new(uint32_t length) {
> +   jvp_string* s = jvp_string_alloc(length);
> +   s->length_hashed = 0;
> +   memset(s->data, 0, length);
> ++  s->data[length] = 0;
> +   jv r = {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
> +   return r;
> + }
> +diff --git a/tests/jq.test b/tests/jq.test
> +index 10b20e3..680706b 100644
> +--- a/tests/jq.test
> ++++ b/tests/jq.test
> +@@ -2042,6 +2042,10 @@ map(try implode catch .)
> + [123,["a"],[nan]]
> + ["implode input must be an array","string (\"a\") can't be imploded, unicode codepoint needs to be numeric","number (null) can't be imploded, unicode codepoint needs to be numeric"]
> + 
> ++try 0[implode] catch .
> ++[]
> ++"Cannot index number with string \"\""
> ++
> + # walk
> + walk(.)
> + {"x":0}
> +-- 
> +2.49.0
> +
> diff --git a/package/jq/jq.mk b/package/jq/jq.mk
> index dbd69f0b16..e21e4376ea 100644
> --- a/package/jq/jq.mk
> +++ b/package/jq/jq.mk
> @@ -17,6 +17,9 @@ JQ_IGNORE_CVES += CVE-2024-23337
>  # 0002-CVE-2024-53427.patch
>  JQ_IGNORE_CVES += CVE-2024-53427
>  
> +# 0003-CVE-2025-48060.patch
> +JQ_IGNORE_CVES += CVE-2025-48060
> +
>  # uses c99 specific features
>  JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>  HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
