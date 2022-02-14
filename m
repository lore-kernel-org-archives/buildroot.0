Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFF0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0A6400B9;
	Mon, 14 Feb 2022 21:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKtXyhzlXvRB; Mon, 14 Feb 2022 21:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48373400D9;
	Mon, 14 Feb 2022 21:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D878C1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2730818C2
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMSBdXBScM_u for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:06:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C95C818C0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:06:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id c192so10311447wma.4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=w72ymDYNq+kjSeb1JtynTllEiPE1vjtCqbY7Pvqt/8w=;
 b=K1Z+aZKhEbNa174aM4slq5EZF/YDvZc6Kt262O/Gy5zEht2djS79sNJ9Un0MpSlQyM
 8xe4OiNuJWs6IM12mXeJ9qDuRHWjHEgFiA2jk+NYcBO8n9xZCKqJVgSgmy7iXVhwSUQ7
 aROQarVf7hGf0SgRq8y+RwgcPdgeeAYY5nTJqaoSK33GvmEKGSnH4Nm4e7VJXbJjoBuh
 W7mTSffirgzX1CAsvyARMYZIn9Yqs9nFzSUvNUgmmP+gcxtO3Y9urRcKc92ZZYNduv/0
 b3wO+eflZkT0bfBoeHY3Xkj8oR8ti+5hGaYz/WWMBv1TwnXB9niGRpIbaidqFolAF/or
 7Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w72ymDYNq+kjSeb1JtynTllEiPE1vjtCqbY7Pvqt/8w=;
 b=PVED+6/wOaVKoFTe68kYJS88QwSk82FlCzwHMn8HIi9VnHRWuF2j77AvzE2vy8b79L
 3Xi3BZVaysmf38/MwWZblvI5dWjyc/TJ5O/kaZlfTsLUwV1CRdJGIcYV4LWAJQEVVJD4
 qlHxPJ8KA3qwEQeW4G06TMJPAM0f2y1HuW3JDlVfy/PDnqGt6IsV+57/gNdIk/UTboeM
 y/EucUKaOLVTNryUVshlCFH8A3wSzpInFRpKGQJMsZe5d97y07xQCP0jfH6jS3ZAicur
 TiKQBVmzNrGfGV5Ws0QwFW9FagprWxX+B6BRVy7ajgNXj77Kr9nSF0NPXQTvR4yCwbr4
 4Z3g==
X-Gm-Message-State: AOAM531dZGPJgfSdqfgXqAWktN9fDpMB+awmy8SAVk84n50+sMulvpRd
 43x4n6x0sPTLGqdVXA6iQBW8C5fqmTwAhw==
X-Google-Smtp-Source: ABdhPJxiS4k2m9yLLOWMYR/7Osz4RizJvMiDpJFzq0d+hV+R2fyrvryML1MID6e8ljV4J4Duh8MYfw==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr521704wmi.118.1644872807739;
 Mon, 14 Feb 2022 13:06:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f9sm11371829wry.27.2022.02.14.13.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:06:47 -0800 (PST)
Message-ID: <cdff0d19-07b7-c91c-378e-b4161b52be79@mind.be>
Date: Mon, 14 Feb 2022 22:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Ygalu5jOo9skIxRc@waldemar-brodkorb.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <Ygalu5jOo9skIxRc@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/binutils: fixes glibc build
 compiled with -Os on x86
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2022 19:06, Waldemar Brodkorb wrote:
> See here:
> https://sourceware.org/bugzilla/show_bug.cgi?id=28870
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...OT32-relocations-against-ABS-symbols.patch | 46 ++++++++++++++++
>   ...OT32-relocations-against-ABS-symbols.patch | 53 +++++++++++++++++++
>   ...OT32-relocations-against-ABS-symbols.patch | 47 ++++++++++++++++
>   3 files changed, 146 insertions(+)
>   create mode 100644 package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
>   create mode 100644 package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
>   create mode 100644 package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> 
> diff --git a/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> new file mode 100644
> index 0000000000..e95eb1e7c5
> --- /dev/null
> +++ b/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> @@ -0,0 +1,46 @@
> +From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Mon, 7 Feb 2022 15:22:19 -0800
> +Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
> +
> +GOT32 relocations are allowed since absolute value + addend is stored in
> +the GOT slot.
> +
> +Tested on glibc 2.35 build with GCC 11.2 and -Os.
> +
> +bfd/
> +
> +	PR ld/28870
> +	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
> +	relocations.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> +index 7ac2411fc80..d00dc45677b 100644
> +--- a/bfd/elfxx-x86.c
> ++++ b/bfd/elfxx-x86.c
> +@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       irel = *rel;
> +
> +       /* Only allow relocations against absolute symbol, which can be
> +-	 resolved as absolute value + addend.  GOTPCREL relocations
> +-	 are allowed since absolute value + addend is stored in the
> +-	 GOT slot.  */
> ++	 resolved as absolute value + addend.  GOTPCREL and GOT32
> ++	 relocations are allowed since absolute value + addend is
> ++	 stored in the GOT slot.  */
> +       if (bed->target_id == X86_64_ELF_DATA)
> + 	{
> + 	  r_type &= ~R_X86_64_converted_reloc_bit;
> +@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       else
> + 	valid_p = (r_type == R_386_32
> + 		   || r_type == R_386_16
> +-		   || r_type == R_386_8);
> ++		   || r_type == R_386_8
> ++		   || r_type == R_386_GOT32
> ++		   || r_type == R_386_GOT32X);
> +
> +       if (valid_p)
> + 	*no_dynreloc_p = true;
> diff --git a/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> new file mode 100644
> index 0000000000..af96f1a0f0
> --- /dev/null
> +++ b/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> @@ -0,0 +1,53 @@
> +From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Mon, 7 Feb 2022 15:22:19 -0800
> +Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
> +
> +GOT32 relocations are allowed since absolute value + addend is stored in
> +the GOT slot.
> +
> +Tested on glibc 2.35 build with GCC 11.2 and -Os.
> +
> +bfd/
> +
> +	PR ld/28870
> +	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
> +	relocations.
> +
> +ld/
> +
> +	PR ld/28870
> +	* testsuite/ld-i386/i386.exp: Run pr28870.
> +	* testsuite/ld-i386/pr28870.d: New file.
> +	* testsuite/ld-i386/pr28870.s: Likewise.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> +index 7ac2411fc80..d00dc45677b 100644
> +--- a/bfd/elfxx-x86.c
> ++++ b/bfd/elfxx-x86.c
> +@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       irel = *rel;
> +
> +       /* Only allow relocations against absolute symbol, which can be
> +-	 resolved as absolute value + addend.  GOTPCREL relocations
> +-	 are allowed since absolute value + addend is stored in the
> +-	 GOT slot.  */
> ++	 resolved as absolute value + addend.  GOTPCREL and GOT32
> ++	 relocations are allowed since absolute value + addend is
> ++	 stored in the GOT slot.  */
> +       if (bed->target_id == X86_64_ELF_DATA)
> + 	{
> + 	  r_type &= ~R_X86_64_converted_reloc_bit;
> +@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       else
> + 	valid_p = (r_type == R_386_32
> + 		   || r_type == R_386_16
> +-		   || r_type == R_386_8);
> ++		   || r_type == R_386_8
> ++		   || r_type == R_386_GOT32
> ++		   || r_type == R_386_GOT32X);
> +
> +       if (valid_p)
> + 	*no_dynreloc_p = true;
> diff --git a/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> new file mode 100644
> index 0000000000..3e29282261
> --- /dev/null
> +++ b/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
> @@ -0,0 +1,47 @@
> +From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Mon, 7 Feb 2022 15:22:19 -0800
> +Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
> +
> +GOT32 relocations are allowed since absolute value + addend is stored in
> +the GOT slot.
> +
> +Tested on glibc 2.35 build with GCC 11.2 and -Os.
> +
> +bfd/
> +
> +	PR ld/28870
> +	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
> +	relocations.
> +
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> +index 7ac2411fc80..d00dc45677b 100644
> +--- a/bfd/elfxx-x86.c
> ++++ b/bfd/elfxx-x86.c
> +@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       irel = *rel;
> +
> +       /* Only allow relocations against absolute symbol, which can be
> +-	 resolved as absolute value + addend.  GOTPCREL relocations
> +-	 are allowed since absolute value + addend is stored in the
> +-	 GOT slot.  */
> ++	 resolved as absolute value + addend.  GOTPCREL and GOT32
> ++	 relocations are allowed since absolute value + addend is
> ++	 stored in the GOT slot.  */
> +       if (bed->target_id == X86_64_ELF_DATA)
> + 	{
> + 	  r_type &= ~R_X86_64_converted_reloc_bit;
> +@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
> +       else
> + 	valid_p = (r_type == R_386_32
> + 		   || r_type == R_386_16
> +-		   || r_type == R_386_8);
> ++		   || r_type == R_386_8
> ++		   || r_type == R_386_GOT32
> ++		   || r_type == R_386_GOT32X);
> +
> +       if (valid_p)
> + 	*no_dynreloc_p = true;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
