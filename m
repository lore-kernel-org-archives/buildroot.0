Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD7C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF056149C;
	Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJLaoZ_KqUPg; Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDE461478
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDE461478;
	Fri, 11 Jul 2025 10:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EEB41E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EF8E60E34
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Aad8OIe6wen for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA1DD61420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1DD61420
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA1DD61420
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so19493415e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230682; x=1752835482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iJ8mkHXF0tOl92q6t/tYFqIZcaTGu+XCOSy077tKZc=;
 b=A4z9MGEAr4qxpe+xy+Um7N86I1TZZTY9bmB/mTlh6P1S457bBGiReB6g3W1/uz9jNr
 OVSfn3j3fYYDTt4kxeHAaJcyx93C2RsW41IYZHeyX2DWRw+iwJKD5SCCQd00Qmc0npj6
 DAG7fuAlBSC7pUaGfW6hNECoaTy2bTe5OAFu/sDJxSHHtG0eBD9tVHw3gfRiRQQPjr0J
 8fqLUlkZevpShUld7WHLfG5PtjQSWTuE+0OP29fX1mtM3epE+lyBhygKw+j7NL9GT3k7
 BfRP8rrNx3Ca41ykv+k7x0ddlYbl+upUBLV0QOLm1+UFwDybdoxJXcilGvK2Xo2CqU2f
 hUGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHB+/GbsYPFDi1gqz1NgDikrfKpOXKF7fGMaa5XWzJwg8cdYTVbCO5zHYvRmupPzNzAqOKV+7ynVk=@buildroot.org
X-Gm-Message-State: AOJu0Yz+7owOs/aLYyT74uyVO+jUqrOm2toJyjLY2NL231Ba3shgVGxo
 6bCcj5LNc+ar4PXocURkLmXFuBiKqHgc3frW5/gTl7LquShNd05xceezpGfQHANDCzQ=
X-Gm-Gg: ASbGnctohKq9kNZ7ytEVMnyN6Qh5x4paxZSeVW1TkEwrIdQT8NKHKrXBAPAHmjD27Ef
 0d9fWtFzb+AFNxvZ6WxiQkMezBmtu454MxhS1eR9hBPlTVQQRjZl7vAV6DzFZTD3o8KX6PzgRDS
 pJogtdQ2WMQ3nCI2dYatkHyuzJkc3M9MpHqdWojETdZ9uic7DNn5TbLf/4f5a4jHYiJRtdXPZ2n
 4asyyUib6Wdaced5ztCUprZPPqCsPFwNB1A3bx6BzfmKNlVc3Z9xWvJsIdJU39MQqY03R2XUE22
 dqWafNumcUITk9TGNaFFRmmOcI97cm5DI66ysdh2ZlNo2KZl75vlovzFBj3YptKMKSDvMj6Hx8A
 MtisHIpqaRRWsqA==
X-Google-Smtp-Source: AGHT+IGdkjyBW2yAeQKpKyfFgz5vgUbtEzvj0PnWQ6Vr1/DxG3iJOiqNJluyYnkW+ORUDMp3iB9lUQ==
X-Received: by 2002:a05:600c:8287:b0:450:cd25:e68f with SMTP id
 5b1f17b1804b1-454f425e794mr20306955e9.27.1752230681792; 
 Fri, 11 Jul 2025 03:44:41 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f13ec67asm4187305e9.4.2025.07.11.03.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:41 -0700 (PDT)
To: James Knight <git@jdknight.me>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:40 +0200
Message-ID: <20250711104440.823599-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701185642.2173-1-git@jdknight.me>
References: <20250701185642.2173-1-git@jdknight.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230682; x=1752835482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iJ8mkHXF0tOl92q6t/tYFqIZcaTGu+XCOSy077tKZc=;
 b=TPSLxU0k4RMX5GbshJVNSW4+hP9YKUawrWxeEeVToF7PeIrzYBXmolBkNcAb8vWUqe
 Lls8pgZt2kCukganhF1/VviK1Hp/xlhfNnmDN2r7QM5mFB6E10F3l+YRetCPv/H5da08
 zI/LspWMLbFUG/X6qYyX75RqhkfHNPxLhbm3FGZP/ZPs/FcjHonj21Ee2ur3RqykbJZE
 6+N11qkdVWdSbJdDs0zh/cul7fClpOZWE9Pyub8TA56vkBBHcXCFOolcLI3ms28jZmJR
 OneCF4F9w4b3KlRlajbOZzo5z6CJ7bdYBptZHwF/fWt+z8czBakykpcGpVTDU3twvavb
 iXuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TPSLxU0k
Subject: Re: [Buildroot] [PATCH 1/1] utils/check-package: handle missing
 files
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
> When running check-package before completing commits for a change, if
> any files are setup for removal, check-package will throw
> FileNotFoundError exceptions instead of generating a warning state. For
> example:
> 
>  $ utils/docker-run make check-package
>  Traceback (most recent call last):
>    ...
>  FileNotFoundError: [Errno 2] No such file or directory: 'package/.../0001-some-removed-patch.patch'
>  make: *** [Makefile:1264: check-package] Error 1
> 
> This commit will now catch FileNotFoundError and populate a warning
> message:
> 
>  $ utils/docker-run make check-package
>  package/.../0001-some-removed-patch.patch: missing; unstaged file removal?
>  package/.../0002-another-removed-patch.patch: missing; unstaged file removal?
>  427843 lines processed
>  3 warnings generated
>  make: *** [Makefile:1264: check-package] Error 1
> 
> Signed-off-by: James Knight <git@jdknight.me>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  utils/check-package | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index a5ecc2eed8..8781d21d8f 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -257,18 +257,23 @@ def check_file_using_lib(fname):
>          nwarnings += warn
>  
>      lastline = ""
> -    with open(fname, "r", errors="surrogateescape") as f:
> -        for lineno, text in enumerate(f):
> -            nlines += 1
> -            for name, cf in objects:
> -                if cf.disable.search(lastline):
> -                    continue
> -                line_sts = cf.check_line(lineno + 1, text)
> -                warn, fail = print_warnings(line_sts, name in xfail)
> -                if fail > 0:
> -                    failed.add(name)
> -                nwarnings += warn
> -            lastline = text
> +    try:
> +        with open(fname, "r", errors="surrogateescape") as f:
> +            for lineno, text in enumerate(f):
> +                nlines += 1
> +                for name, cf in objects:
> +                    if cf.disable.search(lastline):
> +                        continue
> +                    line_sts = cf.check_line(lineno + 1, text)
> +                    warn, fail = print_warnings(line_sts, name in xfail)
> +                    if fail > 0:
> +                        failed.add(name)
> +                    nwarnings += warn
> +                lastline = text
> +    except FileNotFoundError:
> +        print(f"{fname}: missing; unstaged file removal?")
> +        nwarnings += 1
> +        return nwarnings, nlines
>  
>      for name, cf in objects:
>          warn, fail = print_warnings(cf.after(), name in xfail)
> -- 
> 2.49.0.windows.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
