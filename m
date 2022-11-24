Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16BCC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 14:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17268218C;
	Thu, 24 Nov 2022 14:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A17268218C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Mh7CWsOhEnp; Thu, 24 Nov 2022 14:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B290A821E7;
	Thu, 24 Nov 2022 14:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B290A821E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 094AD1BF966
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8BE240C89
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 14:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8BE240C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iW98DTul9rSk for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 14:35:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22114015A
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D22114015A
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 14:35:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ha10so4608976ejb.3
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 06:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XY819MH/KHy3MkgyWQS4hSyFD6Bprxolkq3MooDMqHI=;
 b=MyhWTrYLtMR21xbKJbyuHJSXt47R6d7o2PXj0mzeqKjNS95QlCfTf3rQ1VzkHszkqi
 gyabU60oiIq0EgN9JGYfsqaFB2szE2K92hEnyYn6NKIxO5TQBZT4kLguIQMYRtuoPHaW
 eDAETzfdP7x73z3nURPoq+byJ0hGV1ABEqbn9LY7IexkGv3snOTS9tJDtjniviVVzvU+
 TLsZG5Bue/m8Tzu5slf/GDENoav+A+qFr4eHSJvYte+kExAWqHK/rJMYgwUtgruCb/5V
 tqEEO3HyQCZW7DoBlWxCm+dsK/ngWMrhn3Rff4dQ1jFlvX2SSj9914bE4T9WJdnal6J2
 0ZyQ==
X-Gm-Message-State: ANoB5pkDqJo8DBYmDyRHjO8BMVTVL3wLoM8Lad0zYkv/h/oOxEdhpwQ/
 U1VrqSVmzWNldKGxwyzjOEiSzA==
X-Google-Smtp-Source: AA0mqf7mXj3EVZdc3MM00I2MBrDLEG/Hc2yhNhKNDFpA7jMCbfLtK/jP1cBKc2f49cFoM37fSRf5SA==
X-Received: by 2002:a17:907:2cc1:b0:7bb:df18:3c44 with SMTP id
 hg1-20020a1709072cc100b007bbdf183c44mr1072902ejc.202.1669300533782; 
 Thu, 24 Nov 2022 06:35:33 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 cw14-20020a056402228e00b00467481df198sm580271edb.48.2022.11.24.06.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 06:35:33 -0800 (PST)
Message-ID: <9e198280-ba2c-0006-8335-d5878fc75ba1@mind.be>
Date: Thu, 24 Nov 2022 15:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20221110184734.22425-1-brandon.maier@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221110184734.22425-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XY819MH/KHy3MkgyWQS4hSyFD6Bprxolkq3MooDMqHI=;
 b=gRLTd/gC4a+Gzg+sZ/Oco2LnWV9zoqLy5tkejQgiMbmInQ24y2MjOo/IVKsD6fIhE1
 FIpc+M/eHHADO+66q6B9Yk8LdogHAEHR/QS3rxbZ9IIFrF1YPIMMCdl1Qs4eFNjC09+G
 sxHQ2vSEMgfWxRd/b66RE7uBBz8OD9SZbv5jSNsEd9KEZgLg3oK9WQr7KDoiE+ldII4N
 2YSaE1bwOU291W8ReOWwulTN4EJOaVZMKxL7fu1PpIVfWVLpEdpUTEpqcg9u3KzeEdux
 lO/V2kk+l/Wvjdl7fexaRNQrvIa2FDITccbhsiQbcQSTSKWFLwa7vkaJBbUUdPvejTx1
 VyyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gRLTd/gC
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Brandon,

  I was going to apply, but I have a few comments/improvements that I prefer if 
you bring them to completion.

On 10/11/2022 19:47, Brandon Maier via buildroot wrote:
> The relocate-sdk.sh script does not work correctly when
> BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
> everything to point at $HOST_DIR, but each package will be pointing at
> its $(O)/per-package/*/host.
> 
> Before packing up the SDK, scrub the HOST_DIR to replace all matches of
> the per-package directory to point at the final HOST_DIR.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>   DEVELOPERS                 |  1 +
>   Makefile                   |  1 +
>   support/scripts/fix-perpkg | 31 +++++++++++++++++++++++++++++++
>   3 files changed, 33 insertions(+)
>   create mode 100755 support/scripts/fix-perpkg
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 81e6cd54ab..238f8754e3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -488,6 +488,7 @@ F:	package/ncdu/
>   
>   N:	Brandon Maier <brandon.maier@collins.com>
>   F:	package/vmtouch/
> +F:	support/scripts/fix-perpkg
>   
>   N:	Brock Williams <brock@cottonwoodcomputer.com>
>   F:	package/pdmenu/
> diff --git a/Makefile b/Makefile
> index 7c1c07a2e4..929042396a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -595,6 +595,7 @@ prepare-sdk: world
>   	@$(call MESSAGE,"Rendering the SDK relocatable")
>   	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
>   	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
> +	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-perpkg

  I'm not sure if it's really useful to make a separate script out of this - 
it's just a simple pipeline after all.

>   	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>   	mkdir -p $(HOST_DIR)/share/buildroot
>   	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> diff --git a/support/scripts/fix-perpkg b/support/scripts/fix-perpkg
> new file mode 100755
> index 0000000000..56d7d7a45d
> --- /dev/null
> +++ b/support/scripts/fix-perpkg
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env bash
> +
> +usage() {
> +	cat <<-EOF >&2
> +	Usage: fix-perpkg
> +
> +	This script rewrites file's PER_PACKAGE_DIR to point at the HOST_DIR
> +	before they are bundled into an SDK. So that relocate-sdk.sh can find
> +	and relocate them.
> +	EOF
> +	exit 1
> +}
> +
> +if [ "$#" -gt 1 ]; then
> +	usage
> +fi
> +
> +# Check if per-package-directories is disabled
> +if ! [ -e "$PER_PACKAGE_DIR" ]; then

  PER_PACKAGE_DIR is always set, even if per-package-directories is disabled, so 
the comment is wrong. I anyway don't think it's necessary to check for this - if 
PPD is disabled, then there will never be a match.

> +	exit
> +fi
> +
> +# Make sure `file` uses the right language
> +export LC_ALL=C
> +
> +# Replace the old path with the new one in all text files
> +grep -lr "${PER_PACKAGE_DIR}/[-_a-zA-Z0-9]\+/host" "${HOST_DIR}" \

  Check what is used in PPD_FIXUP_PATHS:

grep --binary-files=without-match -lr '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR)

  The --binary-files=without-match speeds things up a lot because it will 
immediately skip large binary files.

  PPD_FIXUP_PATHS also uses a shell loop instead of xargs; not sure which one is 
better.

> +	| file --mime-type -f - \
> +	| grep ': \+text/[-_a-zA-Z0-9]*$' \
> +	| sed 's|: \+text/[-_a-zA-Z0-9]*$||' \

  You can merge those two in a single

	| sed -n '/\(.*\): \+text\/[-_a-zA-Z0-9]*$/s//\1/p' \

> +	| xargs -r sed -i "s|${PER_PACKAGE_DIR}/[-_a-zA-Z0-9]\+/host|${HOST_DIR}|g"

  There is no constraint on package names containing only those symbols, so 
better use [^/]\+ instead.


  However, I think it would be better to refactor fix-perpkg against 
PPD_FIXUP_PATHS. It only differens in the replacement part of the final sed, so 
that can easily be done with a make function.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
