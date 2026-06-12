Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B961CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA2E66139B;
	Fri, 12 Jun 2026 11:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vD-lzGzq2Uq; Fri, 12 Jun 2026 11:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2524613AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264307;
	bh=w0X+H6T6U3DR00vmfA4O81W2VsqCtBBT/HFfmYJad1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ci5va2LXkYQKwONlr1WZzsJgjCxWULdb1O/ne3C11OxuuRBUAT0/UIEpPvhBe0eHG
	 ASBfIobwihvxexeXwBXQ2p0l4Z8dw2k+gHZRnStGjm3XChVwIj4J3T/uW+wJKXArem
	 Sl6DfKcTNn6tmt+pCUimM5mlz0fgP5Nl8IxjUPV9g3H9StGED4lxEvvxb5zFym36+H
	 lhjgVuDZbx6CshAoCsszbrWk/uCUKnAeMObO4CozGTPBCuPdNSsJ538dQ+O9+vqEGN
	 b+p0zuQ+olWdalM+t0cQXs8u4ekv0iV7jGfyciuO1ewBiSj7ptpgYqD+36RUZ/TvdL
	 yD+aA2+0LFGIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2524613AA;
	Fri, 12 Jun 2026 11:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D1112F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF9A040664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYbsX-3HogqL for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B11864066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B11864066F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B11864066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso487499f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264292; x=1781869092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xm3cgo8ql8VCguRFWCwEKEYWPhfFWVDFKRYJJrfTLCc=;
 b=TNQ5qyxmN1Q7gszZob0qCEqiO4ZwhQ92fUEJ45i2lixFE7337G0+bzdUOObetxSsws
 X77d21lJV3nt5wzpAPQxbnW6QUiTqqRSk3JQWfiDT/xwnFYZ+gCqxeuIxLHNy5207XIE
 toTaeNp+wEJPPMUi5ORCeUqnKE9nIC0uiHWoCHyprzyXN6tCGEk0TR0mND8rqQh6wOzi
 mlQl8TVHQ641eGE7Zo2JCB195hI9fLZO7l+DkRZjq5CwJgA3kDal5zdTiPCeKkYFNfm6
 3EsvRT3RedKeDtFh5VuMs/pNaGIQ7+UdPxkufI8AMvM/jSqHGxyftTsSJ+baJuyI291k
 CjHw==
X-Gm-Message-State: AOJu0YzxWsQFwZggI0ceIlgBgEQXYGpYBI5NJNnpAdCjx4nKwtM39Ko0
 tvBEhpqL5qzwzUaNtXb5Y3oW6GWgSU+fk5O9UdRgAIiLLS7Vl8AEKm7SzgPVybip6J5YyZdHvXq
 B0iuI
X-Gm-Gg: Acq92OEddpuMdQUWxZdUmAHXIh3xh2VKwEPLL0FAh+KpoqeLS0v27Io2TCoizQ2cuBy
 Al4e0BbwGi610TpVkOejBNOcQtpKU118rw6kw8V/cmzs4KbM4NfDkyQvEURQGvBXnGwb3s0h+AM
 wgWThdxNczuwFPYm1ml62GgjiIxG1rGq1OWRS7/3V2u987MwwWEzh85LgDaDfQDb6fNeLomcv6L
 SJm/nTDQru5Or3/52OIlxEnuejWX3d+NqWq5eskCvzVy42a6GnwaUd+yWk3urlcNTa3bBMesOzL
 uFoPlqt5eD4tLcjmZfVC9ZSTCB0lGs176522wG18YCoNKcdVpo6OJISZGJGRua5UibGz2IL8E2w
 RPTl8iKF5h+CJTwcadxPIsP5coE1R4GwaaDnVn0PpIy/J5ybFrzPJHoVWEAx+LiBjvZMmHRDv4Q
 OcfbUNBuwF4H7mqVc=
X-Received: by 2002:a05:6000:4601:b0:45f:f142:d571 with SMTP id
 ffacd0b85a97d-4606da66d86mr3541938f8f.13.1781264291769; 
 Fri, 12 Jun 2026 04:38:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0bbfsm5010987f8f.23.2026.06.12.04.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:11 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:10 +0200
Message-ID: <20260612113810.253161-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602202443.54352-1-thomas.perale@mind.be>
References: <20260602202443.54352-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264292; x=1781869092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm3cgo8ql8VCguRFWCwEKEYWPhfFWVDFKRYJJrfTLCc=;
 b=BXrpJ1nUAU3ry5pULxkORKKiqAcib2FqnqnfKDdZApXEeBJbTHnuARb5CT0swjvUNu
 0kDehDeA48/fOF2UuSoK61dV0/wmB7X13JGjfTxjIPO+Z4c/81TOuYfwYK9lUnJd1EpI
 Mf6gPwX1DdIjGc9ww+cA55KlahK6rjB/NNSrtElnYCnKhWqmHqdnLpZ7Nn5Rou3bDAvt
 thdEbgnLwYXnl3Mz8qC32ZrYDaCocb2VxZA2FPgFpFEavRpptZgJ+BkiWx3U9uDtlvdS
 koyjMW1lchF1yH7hYYOFWjLAtQzZgTNUc/uwqPCi6vHgePTmNf+hsXwYQjPjM3nkZd+V
 EuTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BXrpJ1nU
Subject: Re: [Buildroot] [PATCH] package/unzip: patch CVE-2021-4217
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
> The patch is provided thanks to the Ubuntu community.
> 
> - CVE-2021-4217:
>     A flaw was found in unzip. The vulnerability occurs due to improper
>     handling of Unicode strings, which can lead to a null pointer
>     dereference. This flaw allows an attacker to input a specially crafted
>     zip file, leading to a crash or code execution.
> 
> For more information, see:
>  - https://www.cve.org/CVERecord?id=CVE-2021-4217
>  - https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
>  - https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...erence-and-use-of-uninitialized-data.patch | 57 +++++++++++++++++++
>  package/unzip/unzip.mk                        |  3 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> 
> diff --git a/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> new file mode 100644
> index 0000000000..4f9c4c1858
> --- /dev/null
> +++ b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> @@ -0,0 +1,57 @@
> +From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
> +From: Nils Bars <nils.bars@t-online.de>
> +Date: Mon, 17 Jan 2022 16:53:16 +0000
> +Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
> +
> +This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
> +to read as many bytes as indicated by the extra field length attribute.
> +Furthermore, this fixes a null pointer dereference if an archive contains an
> +`EF_UNIPATH` extra field but does not have a filename set.
> +
> +Upstream: https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> +CVE: CVE-2021-4217
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + fileio.c  | 5 ++++-
> + process.c | 6 +++++-
> + 2 files changed, 9 insertions(+), 2 deletions(-) 
> + 
> +diff --git a/fileio.c b/fileio.c
> +index 14460f3..1dc319e 100644
> +--- a/fileio.c
> ++++ b/fileio.c
> +@@ -2310,8 +2310,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
> +             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
> +                       (G.inptr-G.inbuf) + length);
> +         } else {
> +-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
> ++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
> ++            if (bytes_read == 0)
> +                 return PK_EOF;
> ++            if (bytes_read != length)
> ++                return PK_ERR;
> +             /* Looks like here is where extra fields are read */
> +             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
> +             {
> +diff --git a/process.c b/process.c
> +index 5f8f6c6..de843a5 100644
> +--- a/process.c
> ++++ b/process.c
> +@@ -2067,10 +2067,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
> +           G.unipath_checksum = makelong(offset + ef_buf);
> +           offset += 4;
> + 
> ++          if (!G.filename_full) {
> ++            /* Check if we have a unicode extra section but no filename set */
> ++            return PK_ERR;
> ++          }
> ++
> +           /*
> +            * Compute 32-bit crc
> +            */
> +-
> +           chksum = crc32(chksum, (uch *)(G.filename_full),
> +                          strlen(G.filename_full));
> + 
> +-- 
> +2.25.1
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> index 5436c7a46c..129b749a9e 100644
> --- a/package/unzip/unzip.mk
> +++ b/package/unzip/unzip.mk
> @@ -51,6 +51,9 @@ UNZIP_IGNORE_CVES += CVE-2019-13232
>  # 0028-cve-2022-0529-and-cve-2022-0530.patch
>  UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
>  
> +# 0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> +UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
> +
>  # unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
>  # necessary, redefining it on the command line causes some warnings.
>  UNZIP_TARGET_CFLAGS = \
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
