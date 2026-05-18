Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3214FCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 07:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF936F9CA;
	Mon, 18 May 2026 07:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqYILGUN7J3x; Mon, 18 May 2026 07:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271E66FA13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779089453;
	bh=8buIG2nXBdgobwKjixN5PW5DYWYWIRNJuCYtRuXUkxc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CoFKrCm/mTEb/a1qlQnMtF2+TRRr8xCjtF9+ZFfJY8i/DPSqVlcXml5PiSbHnIiSQ
	 dvBU1VJUJm20rt4SYdw44HlB5mV3DpirxxzGGAcrlTHbsoYEITa+eTaaKnYT7YzV74
	 8em4d5CjI+y08GBumQ2kP3H+h7eTd2Frtv/BvlDD5m8bwrKxyM/BXzErve45Kta1MM
	 fSjru2003iVe1UO77GXFk+iApTMpsSaktXrPdIekjKrwjkXWrqGymySMTOVyl17yTD
	 wjJIb0/4/0USNfRE2CYuNdpbDZc09v4guphwfYDDewbCaH857Llz/5cgwoqMKJZDLi
	 tXN4jpogkdVEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271E66FA13;
	Mon, 18 May 2026 07:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC0E282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91B9442B75
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfKWLUbANLrG for <buildroot@buildroot.org>;
 Mon, 18 May 2026 07:30:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 889B142B68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889B142B68
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 889B142B68
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56662B9798EF; Mon, 18 May 2026 09:30:48 +0200 (CEST)
Message-ID: <2f56b903-1f24-4de1-b2cb-a41e36ae49ad@rnout.be>
Date: Mon, 18 May 2026 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260517213626.3730308-1-romain.naour@smile.fr>
 <20260517213626.3730308-2-romain.naour@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517213626.3730308-2-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779089448; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tFlUievIbDgSw82eAVIJqPNX+/aqlIhPvLcm5xWadGA=;
 b=YxkZZWYiMIWdSTAQcP1iI2RBkRoNagyn2B6r1ODsycDQ4iE+5SkWxU2OF9H85H4Ag6f2XB
 RWVat7LjRRUmziwnO65k4JFBnB+hhAzUTBNJDG+Z3JGu7EZXvsW+hsKjOQqSlG01yaLlcM
 g4v96yQuQULK8IznAv692uJIamoqf5RDGJHxID/NVfaHvLRbszTGT/xl5ceH+vqbJj2auC
 TKFAfZ5/NsnU5G2eoPHd41ZTq8Zi1UUACxkiZQiUsFJuC4Ur/S555VpZflYVS4j/enyKqp
 AEGHfhTM8/wWnwbIamvheLp2AbQAEV/bX2PeOcTTrYAP1u8hdp5PVuqA06dHGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YxkZZWYi
Subject: Re: [Buildroot] [PATCH 2/3] support/misc/gitlab-ci.yml.in: generate
 runtime test jobs with runner tags
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2026 23:36, Romain Naour via buildroot wrote:
> Retrieve the runner tier from the gitlab-runner.json previously added
> and create the runtime test job using .runtime_test_base and the
> corresponding .runner-<tier> tamplate.
> 
> Don't use Gitlab shared runners if we can't find the runner tier.

  Yeah, I think it's better to default to Tier1 and put the 
buildroot-runner-only explicitly.

  Regards,
  Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   support/misc/gitlab-ci.yml.in          | 29 ++++++++++++++++++++++++++
>   support/scripts/generate-gitlab-ci-yml | 11 ++++++++--
>   2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index ada36d0d60..1dcc83e58c 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -5,6 +5,35 @@ stages:
>   before_script:
>     - git config --global --add safe.directory ${CI_PROJECT_DIR}
>   
> +.runner-tier1:
> +    tags:
> +        - buildroot-runner
> +        - saas-linux-small-amd64
> +
> +.runner-tier2:
> +    tags:
> +        - buildroot-runner
> +        - saas-linux-medium-amd64
> +
> +.runner-tier3:
> +    tags:
> +        - buildroot-runner
> +        - saas-linux-large-amd64
> +
> +.runner-tier4:
> +    tags:
> +        - buildroot-runner
> +        - saas-linux-xlarge-amd64
> +
> +.runner-tier5:
> +    tags:
> +        - buildroot-runner
> +        - saas-linux-2xlarge-amd64
> +
> +.runner-buildroot-runner-only:
> +    tags:
> +        - buildroot-runner
> +
>   .check-check-package_base:
>       stage: test
>       script:
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 2d922b9eb2..37b927f142 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -24,7 +24,7 @@ _EOF_
>   gen_tests() {
>       local -a basics defconfigs runtimes
>       local do_basics do_defconfigs do_runtime do_testpkg
> -    local defconfigs_ext cfg tst
> +    local defconfigs_ext cfg runner tst
>   
>       basics=( check-package check-symbol DEVELOPERS package symbol )
>   
> @@ -133,7 +133,14 @@ gen_tests() {
>   
>       if ${do_runtime:-false}; then
>           printf 'runtime_test_download: { extends: .runtime_test_download }\n'
> -        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
> +        for test in "${runtimes[@]}"; do
> +            runner=($(jq -r -c ".tests[\"${test}\"] | .runner" ./support/testing/gitlab-runner.json))
> +            runner=${runner,,}
> +            if [ -z "${runner}" ]; then
> +                runner="buildroot-runner-only"
> +            fi
> +            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
> +        done
>       fi
>   
>       if [ -n "${do_testpkg}" ]; then

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
