Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD36C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B659C40444;
	Sun, 14 Jul 2024 16:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jtr0b9GPVAJ6; Sun, 14 Jul 2024 16:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE964027C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AE964027C;
	Sun, 14 Jul 2024 16:42:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0DB61BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2E44027C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuiBo7DA74Wg for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B20740242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B20740242
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B20740242
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:41:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-36796aee597so2114940f8f.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720975315; x=1721580115;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTcFNetzAC5XhDVqk/708FhRszr+Sqoe8KLeYj7+ktY=;
 b=hNS26OXKaLNt6hfeViPSMnBW/2p6Vhtr66uEm3/vzZFEWk6MGu3Tgy82+2x5d/1AsR
 ZXQ9bTsV3GOTx1P4TsiCIuFdk6YFBoZgbScKXQTOha1XqtPqyeU0tVgKuM6Q3mHGzKvb
 +dlguIMPra62uAjyMMmEnWLJ2Cr4+O0R1PVUH0J4PeP/JUboRH/czrHDwCOl1850T6oc
 BnIVH8GM7u8pj18HuDqpNlg6mYiYVrne1cigHjyIpaxl/sp0EnHLNKsselmVgO2q+QYO
 3DUG80YUDgp9tsLG/1Jx8Eclm7dElCS1EkTqwmxSXJVV5plwnZXcrKkIoIio8h7tb9Y5
 vzeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUstIMkXYpYP93C0Azm2DWYw8tduZiN/PNhArMB10zBKm+ipi7rw9aX53kJ84NAjUPbIY39qppx6edkUF+Q0FSn8ozNO1CAeg==
X-Gm-Message-State: AOJu0Yx/QOXf9TJW3EPWWoCR5az2o578RISoIM0+E6GqJWghhMrVUCiq
 lM0haDc+8M2oUTzdwSHi6n0ZFgKknAKlX0QNNKuzuyIdtKivDUq4j2laJb4XgMCXLqKW3+iyMpK
 oXR0=
X-Google-Smtp-Source: AGHT+IFt0tOG+96ZY/Q30B5sbrA1vFt+0tvuZKmoY4KnlLXg9Wc15YxmzJ5L8IilG29PYNhLZ6VFMA==
X-Received: by 2002:adf:e5c3:0:b0:367:96aa:af79 with SMTP id
 ffacd0b85a97d-367cead9082mr10867107f8f.58.1720975314824; 
 Sun, 14 Jul 2024 09:41:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafb939sm4196971f8f.89.2024.07.14.09.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 09:41:54 -0700 (PDT)
Message-ID: <96550245-ea02-4448-97e0-6a4fc91cc81c@mind.be>
Date: Sun, 14 Jul 2024 18:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <cover.1677104777.git.ckhardin@gmail.com>
 <cf471549729217bc79a9fc16bd74d3eb5918389e.1677104777.git.ckhardin@gmail.com>
Content-Language: en-GB
In-Reply-To: <cf471549729217bc79a9fc16bd74d3eb5918389e.1677104777.git.ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720975315; x=1721580115; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QTcFNetzAC5XhDVqk/708FhRszr+Sqoe8KLeYj7+ktY=;
 b=MErblDKasnA+r+76s8VjESamdlgHOGFKwy65BQxIZOhktfru4/z6K/uHr8aSqDjvxk
 mvvc5bh6UJX24QqHNjPL6PKaWT4uVemDdRjlvazIBeIxPbaofTtzAg9kZfLGl7EGqSyy
 UImmen5XAxxeOWH625OjMybQeQhUt3yZeH5wmGdpBRj6JaKJYBlVg4WHqKgoql8cORHk
 i0VjYwqe/MwJ/m+pvPfT4sjw50lGZezaD28iS0Ug+p3J+H4ZZalHvRaX+wfxQ+ZR8rRC
 /3bg4inb54Xivofa2tz1GqvtYNk/uKk6Eg6acnDDD2R2FTYH3qM+b01Rvg4WgwuTSruG
 hECQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MErblDKa
Subject: Re: [Buildroot] [PATCH v2 1/3] support/download: add a helper scipt
 to generate scmversions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Charles,

  Sorry that it took so long to get back to this. I can imagine that you're no 
longer motivated to work on this, but perhaps someone else is willing to pick it up.

  We discussed this in the BR hackaton and we think there should be a better way 
to achieve this.

On 22/02/2023 23:30, Charles Hardin wrote:
> Primarily focused on uboot and linux, getting the scmversion from
> the custom repository references is required for change control
> tracking off of different builds and pipelines. So, extend the
> download framework to generate these files while the locks are
> being held for the generation to avoid the git information from
> changes during the download process.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> 
> wip scmversion
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>   package/pkg-download.mk     |  1 +
>   support/download/dl-wrapper |  5 +--
>   support/download/git        | 10 ++++++
>   support/download/hg         | 10 ++++++
>   support/download/scmversion | 63 +++++++++++++++++++++++++++++++++++++
>   support/download/svn        | 10 ++++++
>   6 files changed, 97 insertions(+), 2 deletions(-)
>   create mode 100755 support/download/scmversion
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 0718f21aad..333a53ce7e 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -119,6 +119,7 @@ define DOWNLOAD
>   		-n '$($(2)_BASENAME_RAW)' \
>   		-N '$($(2)_RAWNAME)' \
>   		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
> +		$(if $($(2)_SCMVERSION),-s) \

  It's a pity that we need all this forwarding of arguments, but that's how the 
infra is built :-(

>   		$(if $($(2)_GIT_SUBMODULES),-r) \
>   		$(if $($(2)_GIT_LFS),-l) \
>   		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \


[snip]

> diff --git a/support/download/git b/support/download/git
> index 1a1c315f73..277c412e26 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -12,6 +12,7 @@ set -E
>   #
>   # Options:
>   #   -q          Be quiet.
> +#   -s          Generate an scmversion file
>   #   -r          Clone and archive sub-modules.
>   #   -o FILE     Generate archive in FILE.
>   #   -u URI      Clone from repository at URI.
> @@ -51,11 +52,13 @@ _on_error() {
>   }
>   
>   quiet=
> +scmversion=0
>   large_file=0
>   recurse=0
>   while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>       case "${OPT}" in
>       q)  quiet=-q; exec >/dev/null;;
> +    s)  scmversion=1;;
>       l)  large_file=1;;
>       r)  recurse=1;;
>       o)  output="${OPTARG}";;
> @@ -229,3 +232,10 @@ popd >/dev/null
>   # the state of the remote server. It also would generate large tarballs
>   # (gigabytes for some linux trees) when a full clone took place.
>   mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*"
> +
> +# If an scmversion is needed then generate the version information
> +if [ ${scmversion} -eq 1 ]; then
> +    post_process_unpack "${basename}" "${output}"
> +    support/download/scmversion "${git_cache}" "${basename}/.scmversion"
> +    post_process_repack "$(pwd)" "${basename}" "${output}"
> +fi

  AFAICS, there's no need to unpack like this. You can simply do it before the 
tarball is created (i.e. before the mk_tar_gz call).


[snip]

> diff --git a/support/download/scmversion b/support/download/scmversion
> new file mode 100755
> index 0000000000..16868a11e5
> --- /dev/null
> +++ b/support/download/scmversion
> @@ -0,0 +1,63 @@
> +#!/usr/bin/env bash
> +set -x
> +set -e
> +
> +# Helper to generate an scmversion in a dowload script before
> +# the tarball is created. Because the tarball has to exclude
> +# repository directories like .git and .hg to make reproducible
> +# archives on subsequent downloads the version information is
> +# not available during the builds for a script like setlocalversion
> +# to run.
> +#
> +# So, this is hook to call right before the make tarball gz that
> +# will generate a .scmversion file that will be included in an
> +# archive and then available during the build steps.
> +#
> +# Call it with:
> +#   $1: the path to the srctree (see mk_tar_gz in helpers)
> +#   $2: output file
> +#
> +# Because this can fail for a variety of reason, there is no exit
> +# code to avoid build breakage. It is assumed the scripts will be
> +# reproducible because they are based on the contents that get generated
> +
> +while getopts :q OPT; do
> +    case "${OPT}" in
> +    q)  exec >/dev/null;;
> +    \?) exit 1;;
> +    esac
> +done
> +shift $((OPTIND-1))
> +
> +srctree="${1}"
> +scmversion="${2}"
> +
> +# Bail early if no srctree or scmversion
> +if [ -z "${srctree}" -o -z "${scmversion}" ]; then
> +    exit 0
> +fi
> +
> +# Does the scmversion exist and readonly
> +if [ -f "${scmversion}" -a ! -w "${scmversion}" ]; then
> +    printf "WARNING: scmversion %s is readonly\n" "${scmversion}" >&2
> +    exit 0
> +fi
> +
> +#
> +# Generate the scmversion from some expected locations in srctree
> +# and fallback to the buildroot version of setlocalversion another
> +# script is not used
> +#
> +if [ -x "${srctree}/setlocalversion" ]; then
> +    res=$(cd "${srctree}"; ./setlocalversion)
> +elif [ -x "${srctree}/scripts/setlocalversion" ]; then
> +    res=$(cd "${srctree}"; ./scripts/setlocalversion)
> +elif [ -x "${srctree}/tools/setlocalversion" ]; then
> +    res=$(cd "${srctree}"; ./tools/setlocalversion)
> +fi
> +if [ -z "${res}" ]; then
> +    res=$("${0%/*}/../scripts/setlocalversion" "${srctree}")
> +fi

  This is where it gets hairy. We add all this complexity, and in the end we 
call a script that needs to do some heuristics to find out which script to call 
exactly.

  What we actually want is for the script that needs to be called to be 
specified in the .mk file, because there you know exactly what it should be 
called. Something like:

define UBOOT_SET_SCMVERSION
	./tools/setlocalversion > .scmversion
endef


  The trouble is how to pass that through the download infrastructure to make 
sure the git download helper can use it. You'll still need a new option for 
that. Then you can pass it trough (properly quoted) and finally in the git 
download helper:

if [ -n "${setscmversion}" ]; then
     eval "${setscmversion}"
fi


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
