Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3508AC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:29:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC15604AC
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AC15604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A39F40019;
	Sat, 28 Aug 2021 15:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3g6aJD1OlzXW; Sat, 28 Aug 2021 15:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 689A64012A;
	Sat, 28 Aug 2021 15:29:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7391BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE4A605B0
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHodh38QGKS9 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64157605FC
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:29:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z4so15258345wrr.6
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfrcDvSm0q5rzS9R8fszkqb6Li4RvWunV4R1Yp3AuFI=;
 b=ZQk9ExkzyoYOJrcuqxVOxSZR8ZE+Ai+pMCS8UnK5Cl1HVwyiMQ24IcRjyD8n7HLb2R
 vlU/zFliQ+49a6DSZy3Dulv6UoVidbydWtKTslVEDgg8ARuT5S2ykDmnEIomII4m1DC+
 /Z0PjoNT2iLLrpv31S7W1bXTbHd0J9dp9x9CdSmoFpnUYBC0+CoBaSDcJsevcEN1sNjC
 +rGcc6t9c+5p5v2EKxnbUgxs3EO2pPu0DrDJGzKkVEF1WKjtNakXZyBghO0BRX+U7KnN
 fLnuzYKnJT2zM5EAuwh5W73ctOuJ4rjQQZi6SPYo8z5PIAMnMZ8tnlp2bV+ydfRnn6cw
 PyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DfrcDvSm0q5rzS9R8fszkqb6Li4RvWunV4R1Yp3AuFI=;
 b=M64h1SczcL3Fb4u8W0XLBOOpquOnSDi2iJK+LnyPx72hy9cPl0ixhe4LWjjHQQafNB
 mvYrxSb68e3qBaidZfka5f5QMZ2YbkIUJ3W/yKWbiNOMHabSh3Ea/Vb0HjosVrNkSK7Q
 lTVSLUWvFNUvX65mPxWmk4uZFMnkyiK81lkO2LOXVyQ2+oEG1y9oSMzPiO1jj9kNNeyU
 93yroyyzzMnr4Nbp165kAnlqIP67YSTDmJIZeghzpZ9n9X5RL+p6yL67SpN2WuYqJUHi
 n1El/fIMbk0xwmtG2Si1oi/CpqssMFvVBbpM0xsNkMq9tOjQzRoH9qynJSAiPqtvrhyD
 mexw==
X-Gm-Message-State: AOAM531b/VtW3BzGD4q1Jh4m5eAiIqircejRP7TZB0d/1rLZT/HIWKNK
 +GJ6rTxZAlUmnH8+QQ2teVsZppC4LiG+WQ==
X-Google-Smtp-Source: ABdhPJwz5kyIrM6ET9p0d78ltNQi4d7eu4+tAPc8bRcEb7s4jBELJBYddMSXWGJeilEDMtdtTmHwRw==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr16784718wrz.242.1630164575485; 
 Sat, 28 Aug 2021 08:29:35 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id p11sm9005564wma.16.2021.08.28.08.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 08:29:35 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210821134646.1163359-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6276ce0c-a3e5-b0d5-b6e7-73aa924bb83d@mind.be>
Date: Sat, 28 Aug 2021 17:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821134646.1163359-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v6 for-next 1/2] utils/test-pkg: add mode to
 only prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 15:46, Romain Naour wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, running test-pkg is only done locally on the developpers
> machine.
> 
> In a follow up commit, we'll add the possibility to run test-pkg in a
> gitlab-ci pipeline and, to speed up things, with one job per buildable
> configuration.
> 
> As such, we will need that test-pkg only ever prepares the
> configuration, and that it does not build them.
> 
> Add such a mode, with a new option, --prepare-only
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Both applied to next, thanks.

 Regards,
 Arnout

> ---
> v6: Remove terse option for --prepare-only (Arnout)
>     rename local variable "defer" to "prepare-only"
> v5: split off from the next patch into this patch
> ---
>  utils/test-pkg | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 54c6c5e8fe..526b95b1fb 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -12,13 +12,13 @@ do_clean() {
>  
>  main() {
>      local o O opts
> -    local cfg dir pkg random toolchains_csv toolchain all number mode
> +    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
>      local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
>      local -a toolchains
>      local pkg_br_name
>  
>      o='hakc:d:n:p:r:t:'
> -    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
> @@ -27,6 +27,7 @@ main() {
>      keep=0
>      number=0
>      mode=0
> +    prepare_only=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
>      while [ ${#} -gt 0 ]; do
>          case "${1}" in
> @@ -39,6 +40,9 @@ main() {
>          (-k|--keep)
>              keep=1; shift 1
>              ;;
> +        (--prepare-only)
> +            prepare_only=1; shift 1
> +            ;;
>          (-c|--config-snippet)
>              cfg="${2}"; shift 2
>              ;;
> @@ -127,7 +131,7 @@ main() {
>          toolchain="$(basename "${toolchainconfig}" .config)"
>          build_dir="${dir}/${toolchain}"
>          printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
> -        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
> +        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
>          case ${ret} in
>          (0) printf "OK\n";;
>          (1) : $((nb_skip++)); printf "SKIPPED\n";;
> @@ -147,6 +151,7 @@ build_one() {
>      local toolchainconfig="${2}"
>      local cfg="${3}"
>      local pkg="${4}"
> +    local prepare_only="${5}"
>  
>      mkdir -p "${dir}"
>  
> @@ -170,6 +175,11 @@ build_one() {
>      # Remove file, it's empty anyway.
>      rm -f "${dir}/missing.config"
>  
> +    # Defer building the job to the caller (e.g. a gitlab pipeline)
> +    if [ ${prepare_only} -eq 1 ]; then
> +        return 0
> +    fi
> +
>      if [ -n "${pkg}" ]; then
>          if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
>              return 2
> @@ -257,6 +267,10 @@ Options:
>          Note: the logfile and configuration is always retained, even without
>          this option.
>  
> +    --prepare-only
> +        Only prepare the .config files, but do not build them. Output the
> +        list of build directories to stdout, and the status on stderr.
> +
>  Example:
>  
>      Testing libcec would require a config snippet that contains:
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
