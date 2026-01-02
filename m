Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2899FA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2FEA40820;
	Fri,  2 Jan 2026 16:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0DdrGeRARnI; Fri,  2 Jan 2026 16:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F5640827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767369833;
	bh=K6L67EEhYKS+IqvbwOS3jVcoJmfjD/abxhED6F37Xog=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mw/+KaWsDxQ8mbilIEGw29EYgN1nXP4SXEsYMbeSxhsf+eNHkXTaSaLYyORYubNxK
	 iXIFqRvC/gPei+boSSK6rvEZfoouMsXaLGGNsi+WtdVih9KhVOdMXdc45tTjBtsBEi
	 oKkn3oAAT0+gqJsS1nZMB0O5TsfiSMcTDYsLji2O3rOar3AftdMCJ4wAACb1hBFFLw
	 AMLe6gf5ifj7AAqogvHR7sjk3SbzM01F58pPIpncMGgEgpEKWacOzV3/VqFQK30iVq
	 kwU5HQaWG7CiohpcmJJXwKLcywleR4qfWwXo81ib8+RBG2vaQ+vo0mD2RN8IRkuCHf
	 wgm2sew70A7bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F5640827;
	Fri,  2 Jan 2026 16:03:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97386351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E3F1810FA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skh8fqp-BZt3 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 16:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41AED80ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41AED80ECF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41AED80ECF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:03:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so130877845e9.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 08:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767369829; x=1767974629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fux0TZgPRGaxRz/mrEHR3FaL/0en9dyPOm+LG4QXkNo=;
 b=aPYBAPY0WT5RvcizbpgqtVN+cZULMW3yfob/DlrlffvB+D3f1fSGLlBflSSUnZDtnM
 q+1pdPF3MagnlXwhvDfaNyjAD3etYPKT0ox1r8CkSBpZKIKZjQRViUByTlQfA+x7lbXA
 RDJocYagMfcDfu6XJ6JX2rBRGszmJtlYFL5eTTPBUrkfjDvkJW4GSDnCKx22J8hhLPpF
 S7wH9+RqhHwVix8DzfHUNb6J9Br+dlQbCKZfUD3hy0mEXy/HkGo38kLn5E03+KUAomAK
 g5nrtZ2B+qhllHatgdcDe/z/Vu1xOsbVmNX3JrgVChPhDb+i+TDN0kmYjlwHgpTsxnTJ
 sgvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq7GT+sIAC4rt5lV86a4txbOxg/Jq7a6Y8QhOZG5Zp7Konraqd5E4ecSYmf+rXm5TzjrZIa2zs/f4=@buildroot.org
X-Gm-Message-State: AOJu0Yx3foBabm1C67bUV48kLVGemxWAxmGO8aadzcWiB3+fESJsBuwa
 sj+CQ3K7WablW6npXo7q/jUSBdvmbb6sLV7QEi+FpPszxwN6hYuNYOVeqMPg4Espq40=
X-Gm-Gg: AY/fxX5tX8KKSYq4Z0sXazJkQiATd+K7wQfxMOeERVTXbdQTkjkqiE3Ykp79zXl37kS
 nmcrCbzSfoN+dHqGy0NggJo3ODinVfQYQfjk4Idf0WdS4jIVirFH7PmWQ+8nyu/NUo9+IKFLHiW
 Qk+6YmHdRBnFnL2uiFVlkxMDui+Mipi6hPs2NW9Agt86pUbzGF+fIAm0c5vt+r+JxHUlSIbS46k
 Wtbq9MZSCF7eqg3TIlthMskNn7244BiOOxNMpUK8U7CML/CQoy6Wg9l9H4/vTjVqzYOnZkJW1PP
 oOqmTDT2jbLjYPcqpjOKmeHaQqhj7320l15wCjBlFbYE53ljr1Pgzhteke/9GKiNyytFcT+fCUJ
 SQmQdVcMfZvmJ/mG5DLMZo4uSHZ322aLDZgaPLCUCTXbbbIWOZc49BP1fLq4CyYd4xd4BHUl5GT
 cEWhN9tVlbDVgdmbUpXMLR48fM5hHbcYQbxIM=
X-Google-Smtp-Source: AGHT+IFMzaCGv1yykyr5y8ZkETGb15ssB3TXbPg8V09MeSKRUbh3hk7xxff59F22H1VTxQIKKa6y5g==
X-Received: by 2002:a05:6000:22c9:b0:430:f72e:c998 with SMTP id
 ffacd0b85a97d-4324e51081bmr57455003f8f.51.1767369828933; 
 Fri, 02 Jan 2026 08:03:48 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2a94sm85713773f8f.43.2026.01.02.08.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 08:03:48 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:03:48 +0100
Message-ID: <20260102160348.712155-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102150757.1480511-3-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-3-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767369829; x=1767974629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fux0TZgPRGaxRz/mrEHR3FaL/0en9dyPOm+LG4QXkNo=;
 b=Rtv2cWHl/mrluSycYw3WVD8J8O4GnU/J5fdnhEi8tkIsGtLZV7NokT9twN6OZw/jvR
 RiAQkR5yWu6CVfE2oGPmkkHXHUUACimoaKQ1H1dLcpujG+6qSfadTbtU+H0XeViUXHgR
 hgbaXrZSh78D/I1o7LIIMv3PWdXg8U+/DzREVJXx6xsJyRzbXeyP3GOb74Wwpso0GmtV
 /jLTS7Z/CHrN8VbrKqxn0dSn+mshzy7MrdxY8Yk8JXvp7XMBMlhk7vsWPQA6Tdip+8//
 Wq9yPKIyOwmfdtMhn4v9BAo4qh/PC0BVboJ6jtZekFh1q+a4CRkKbC4UgFS76CjHCpgq
 VBXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Rtv2cWHl
Subject: Re: [Buildroot] [PATCH 3/5] utils/generate-cyclonedx: add option to
 filter only target packages
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
> - Introduces the `--only-target-packages` argument to control package inclusion.
> - Ensures the generated SBOM includes only target components and their associated dependencies.
> - Excludes host-only packages from the SBOM output.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Tested-By: Thomas Perale <thomas.perale@mind.be>

> ---
>  utils/generate-cyclonedx | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 5de6afa39a..23176bc2c2 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -410,6 +410,8 @@ def main():
>                          default=(None if sys.stdin.isatty() else sys.stdin))
>      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                          default=sys.stdout)
> +    parser.add_argument("--only-target-packages", default=False, action='store_true',
> +                        help="This option includes only packages installed on the target (components and dependencies)")
>      parser.add_argument("--project-name", type=str, default="buildroot",
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> @@ -427,7 +429,8 @@ def main():
>      # Keep only packages with at least one download source defined
>      # (packages with _SITE variable in Buildroot makefile).
>      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> -                                if (len(v.get('downloads', [])) > 0)}
> +                                if (len(v.get('downloads', [])) > 0 and
> +                                    (not args.only_target_packages or v.get('install_target') is True))}

Maybe I did something wrong but here the issue is the same as the similar patch
that was sent for this feature. I still see references to 'host-' packages in
the dependencies even though they don't exist in the components.

Example for minidlna

```
    {
      "ref": "minidlna",
      "dependsOn": [
        "ffmpeg",
        "flac",
        "host-pkgconf",
        "host-skeleton",
        "host-xutil_makedepend",
        "jpeg",
        "libexif",
        "libid3tag",
        "libogg",
        "libvorbis",
        "skeleton",
        "sqlite",
        "toolchain",
        "zlib"
      ]
    },
```

All the 'host-' packages are not present in the components.

>  
>      # Show differences between original and filtered dictionary
>      print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
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
