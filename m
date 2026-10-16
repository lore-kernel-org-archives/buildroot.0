Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CADCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7099B40D2E;
	Fri, 16 Oct 2026 15:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1VVYOzoRJgR; Fri, 16 Oct 2026 15:06:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5CE78409F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163183;
	b=NyE6QuvYEpBEyVebnem6r5C6JgcoQS67zIevB9EJwoyrRBE4KjOTcYT6L9iZ/y/CdP+4
	 YulKSjohb5Z7CF9R6nN892zFvsls3SEpMCFYa/uakgqefvp4+7N8UBlQJZabmnWlB3Zmw
	 OH2YDEXJR6sa9H/CbhNrnYeF69do2A7OZ3Pmmuu6ptihqb1ZXiWG/hZDo1NPyee7r0FJ1
	 Zy2/uRPvPMoCzd9uIwi5Z3b8vcx/lUZnYhnr0MHm0wZ0yeSRYF+1Fs5U2yHsYbWbxzaAE
	 f/9xoKPFjWtIZjd9wEsOcdHxOYy77kiFMQO9qo06hFA1QnWbhSRmxwzUhsw1CYLbREw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6pwhFS2SPrmxzrk6zXhkd8w4u7L7eynerzm21AwtZLc=;
	b=Ev8/5xDLzvmiWscu2Rq+iyqNQIryxWPUvTAwic+1ArVvwvkeLDzUVsATPoOvt7AERzo5
	 DmuECy/0JXxtsa3qUE3s7+yzex2i0n/SSngGXmLTOe87uAvK9npTOItPfmebp3SH093PZ
	 8831h9+6AQuib+N9l/RkWp2K93FeuSXQXzkSvefL7Yht/DGA3j9H3i5681S+vSZ7MhYVy
	 E4CU4gg4kEgn80Iefvp1ou+UtwNE6MKf5Vheta0nTud3b6j5NXMF4brPjQqU3OkXgfGOM
	 Yx69IRCYYjBc6hGrCGQneFFi0SP5GR94ycpvu69PWpAbuDvuScGIoq4O1NeAUEVy6ww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163183;
	bh=6pwhFS2SPrmxzrk6zXhkd8w4u7L7eynerzm21AwtZLc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L7rVh8p5RqguhvklbS25pONa8EokEf/k+U/OLkeg8yF7YWOvJoKDBKqHN+mMHWKF+
	 3jsf6xz1StD+Y8Td8fA9swFod9324Uw0AYHm5VQqxorZzgabmvD5IhJEI153aczwAs
	 BoAxNK9fS1tPwCXyYba7Ny5+flOacjfobXNk1zdrWMwnBBHDBvbXdSXBRJ0V+4445n
	 dlo0oPxR1ZmDeR8tcFCE2G5joACVeUrxgHxvQrGaBdDRh3NqTZfZU0d/lYtoCxQY1y
	 g5sQGXHdDf7vxudhRFBJ8/C7f7VvWuy246GF5JrEOc6k6sEsTLYEOi41Tfbx+CPKMD
	 oziNRDEXS5JDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE78409F8;
	Fri, 16 Oct 2026 15:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 541C2255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 393FF40CF8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO50kftxhDAQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E741340C76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163179;
 b=DbIe6QbZWnuFAC6jhCUttKnyiNFuciSx1Ei619gFeh6VAR3Xelwh7k9v+L04rfkNrhHF
 LvsWvrfUC529bnyoeIy4JAdawaUraCeHKguNkjXI27xgy1gGxuitu/lZ7LV4BqKpURVl7
 iJJRQ7I8IRM3JQJAwZ15zE59Zmo1ayOS8WgvvzKmmSO0ZN7LDJqnejP/0He6qEUa7yY5K
 aVZ4A+LjrOcqpbqNKQrjdvbNcaIx9t3jewCx9JBXktPbfhX9UpIAQWhtVrNwKrFtzBMvc
 YMJ+w7b4fqi1F1scLTfE5/DrMhiCaC1e+Lu/ydrhszbe3X99ulZ3c+gsgptN6d5ycOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163179;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ag1fWmjNpALxkZ9Xw+o+lcOroiGx2QOetvQUp5sNgh4=;
 b=HD81QQFhemQ8GgPqm5Dbw/IAezNG3LGSssYcPb3DSEz4++dQox1UDnjnGH4hV50NMA5A
 30BgeoObOn3GhFV32JGuIFXea701ERk6RhaqKjv64P1pnuAMq1FWc/GH/HWM10crZbVBw
 rUsFx728cWr0pMkZ6ZS629zzSVkdegj9NAQgwcPHHqczahdrAd3ZQFJy27idU+oFE2Eje
 Df5XPhFkcfng3gdmSMDyXRILQU6HpyQ0TnPATnCDT/hVLu2LAsBERoO1kP1qAlmuj1uJU
 zavyUlh3HndnaHBdYCzIFxClVE9MmwEB/8cF1yPfLE42KsfQvXdym8/j4QsuP7tTwMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P3S6uYCo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E741340C76
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so434285e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163177; x=1792767977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ag1fWmjNpALxkZ9Xw+o+lcOroiGx2QOetvQUp5sNgh4=;
 b=g6SMn5imAYibtjlVIKEXtmMgn77Ax8JO5T8zlPfOkIfWKmZf69Mi05CnsskXb3eOY7
 NqH2mSZtbgF+/kRotuQvXzi5EeJYjZrzHI1NL58qpUKd60kkc9Zqus+1v6B0kruSTAbo
 /fGZxskWBl3LeMI6EGEGCu6W+yZwHR4OK/6vADet9gXQwwzrbI/V9g9n/LMZ7HvS0gZT
 Fhu8M4iim+C+8px3u9LXx+Wl08HKr6sjY9xaRyXF6cxmX2iqBJEsRyqjUuAnUtAbnUHi
 y/Cscfx+VBhAR+ytDtJ0lhBGBJKcn1IYvE49LzV6EahKRG6Wm448Z7nVjyBVKko6HDRx
 dmeA==
X-Gm-Message-State: AFq9FYIcX1KAFBYZlcIzqRGmmgLpkJ+E5ttnyycHIFO7ThEK1da45gSq
 arPyukZ/m3LWaZ71aTxq+ZTJSagcDpFfG/ATFLtn0KKrK/7iLV2WqmpDzq9uR499BuOd5dtHvgK
 pTeuWuFs=
X-Gm-Gg: AYBFou3WfWFypaS++k2kpxo1Evs8AvGeGF5TySBptH7oYVHWxW+BgFKt2GPKM5Lq1BE
 ssEHaTb9nFnPuVrzggA76wQtblzTzlLd/edRAVEWHlFPkujLFkvMqG/0pfix+gTEN1dFRN8AWgt
 eZYrj36atdb4FSyWEkbVMVDpNJiIhZ3+cHqfgNV++IuwNgoWmknzcNGfxGe3IXqRgDuhC4tBbuM
 hIxatt7BLgojE/NtX31fNj/rvbHr/+UOSJCq4BgCvmyPlcdGaxr8BTf8utQYj8azNg+v+zDvD6f
 TO2TZfXl8mQdsnCwgFazbXxfeBDSF/FqmMWuV/oCxizKDFZ+TmzncYD+ErFa1a2APFyuEtQsFLR
 h2vGc+LGvQ3hn7uX3s0TNDbLQeHrJXEoQ2/ogtMca5bj2anZHlGoQUeLju4Hbrso+upHhUvkvfz
 XV2SH1rLHbhJzuYvEDEswKTl96wAJcSS0jX3W1PLt3m5VcuPvcwNQaD3xE+NYrWz+2ubCOruUak
 l+fapVGD6ZYsaHvVCEJKX1PS/+Tk/KHiHpJzWfaAEk=
X-Received: by 2002:a05:600c:3e85:b0:4a0:25d5:e853 with SMTP id
 5b1f17b1804b1-4a1d7631660mr1419565e9.35.1792163176807; 
 Fri, 16 Oct 2026 08:06:16 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d7659805sm923165e9.7.2026.10.16.08.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:16 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:13 +0200
Message-ID: <20261016150615.76560-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011094214.682647-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/3] utils/generate-cyclonedx: avoid
 f-string usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The argparse library documentation [1] suggest the usage of
> 'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
> show the default value of every arguments.
> 
> Use this to avoid declaring this value ourself.
> 
> [1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 98009cef98..c292ef7840 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
>  
>  def main():
>      parser = argparse.ArgumentParser(
> -            description='''Create a CycloneDX SBoM for the Buildroot configuration.
> -                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
> -            '''
> -        )
> +        description='''Create a CycloneDX SBoM for the Buildroot configuration.
> +            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
> +        ''',
> +        formatter_class=argparse.ArgumentDefaultsHelpFormatter
> +    )
>      parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
>                          default=(None if sys.stdin.isatty() else sys.stdin))
>      parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                          default=sys.stdout)
> -    parser.add_argument("--virtual", default=False, action='store_true',
> +    parser.add_argument("--virtual", action='store_true',
>                          help="This option includes virtual packages to the CycloneDX output")
>      parser.add_argument("--project-name", type=str, default="buildroot",
> -                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> +                        help="Specify the project name to use in the SBOM metadata")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> -                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +                        help="Specify the project version to use in the SBOM metadata")
>      parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
>                          choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
> -                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
> +                        help="Set CycloneDX version")
>  
>      args = parser.parse_args()
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
