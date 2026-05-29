Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9293CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F33422AE;
	Fri, 29 May 2026 16:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5ZyJRm3IR9B; Fri, 29 May 2026 16:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77701422BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780073357;
	bh=FsVD43AI6AgU11TwG6G1x4onYwyeM+q129TYAWtvvLI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=s2KOEviMVovPDuDLiuTtMtpsyRmneIFiuYMuciKDCN1PvGUg2BoJ+hJFhTD14onMD
	 oiGl9wAByMBWMrANGaWx5bgwnsexykJRCLfBTteNdyLAhJ+/045n/mtELojTgxkyBN
	 ibroXbBqMiyLWM/bX8FIo5k9IYAe2dC1rwt37MRXlUlAfTwsK9jf+FyLbanJP83d4M
	 M/96KOc8Gw5tBxfbeLqVnkjt7WGeK1aeomxwxrEgNCKffFkSCtDPILmozQTsyoLWVc
	 y2IOIzOzH+NWaEaje3jR3Vtgrt+8Pe7MnJWtxfOE1VO41Mxb8DYrdCZ5Mt++5OIZKa
	 bwBVKoReAftwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77701422BD;
	Fri, 29 May 2026 16:49:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EBFBF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BCE46155B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cs_k0koFMuPb for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B15E61558
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B15E61558
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B15E61558
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:49:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C763B97C675; Fri, 29 May 2026 18:49:12 +0200 (CEST)
Message-ID: <8b009d4a-ecdd-46d2-8181-de8b694d401d@rnout.be>
Date: Fri, 29 May 2026 18:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260529102144.1446114-1-romain.naour@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529102144.1446114-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780073352; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=C7Hy97ew+KHyRGkhr4/hV2MKOkWX9u8MJpYmGrTC+Pk=;
 b=QcH1TLcFhyg1AsVv5A2aIAKQha06/HjofN759I+5DSBDszwitpkPTTw2UrAZvODeKyjp6w
 DyjSo4WlVg4CpJSySiZzY0OTiwJcL48LI2U4ChVwyeWVPRkjKB7bQyrFG+UufOJYAQk8Gk
 rDjaMj7N4cawEt7MQK5+nULLKnUgFZQC5HY9LR6C97aTa8O/hr/PiZi7czFdu9GZwq72jl
 R3djPrB4ms8mQG09lluPZM9noP2G9wBT2Ya+ylEvDussxnwUpIwgWzvtgcknowuTA5ExcT
 LiFQYG28+vts0uOKYhw/+wDX1ZkgC4TFFYewR5q+vnzYWkSfe5Ka/iQ7tQAc0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=QcH1TLcF
Subject: Re: [Buildroot] [RFC v2] support/testing: generate runtime test
 jobs with runner tags
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

  Applied to master with lots and lots of changes.

  I triggered a pipeline with all runtime tests:
https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562372787

Let's see how it goes!

On 29/05/2026 12:21, Romain Naour via buildroot wrote:
> GitLab offers the following machine types for hosted runners on Linux
> x86-64 [1]. Using a lager runner increase the "Cost factor" [2]:

  lager -> larger and a few additional spelling mistakes.

  I made some other changes to the commit message as well but nothing important.

> 
> Runner Tag                                             vCPUs   Memory  Storage  Cost factor
> saas-linux-small-amd64 (default)                           2     8 GB    30 GB     1
> saas-linux-medium-amd64                                    4    16 GB    50 GB     2
> saas-linux-large-amd64 (Premium and Ultimate only)         8    32 GB   100 GB     3
> saas-linux-xlarge-amd64 (Premium and Ultimate only)       16    64 GB   200 GB     6
> saas-linux-2xlarge-amd64 (Premium and Ultimate only)      32   128 GB   200 GB    12
> 
> Compute minute consumed by a job is calculated by:
> 
>    Job duration / 60 * Cost factor
> 
> (Job duration: The time, in seconds, that a job took to run, not
> including time spent in the created or pending statuses.)
> 
> Thanks to GitLab OSS program [3], Buildroot benefit a free Ultimate
> subscription and can use Gitlab shared runners tagged with
> saas-linux-{large, xlarge, 2xlarge}-amd64.
> 
> For opensource project, the Cost factor is reduced by 0,5 (1 minute per
> 2 minutes of job time).
> 
> In order to use one of thoses tags in Buildroot Gitlab-CI jobs, we have
> to classify all tests by resource requirement.
> 
> First we introduce some new templates used to add the corresponding
> runner tag to a runtime test job (reuse the Gitlab terminology).
> 
>      .runner-{small,medium,large,xlarge,2xlarge}
> 
> Most of our tests are fast (checkpackage, test_external_bootlin...), so
> saas-linux-small-amd64 runner tag is enough. Since untagged jobs run on
> the small Linux x86-64 runner [4], we don't want to use Gitlab shared
> runners if the runner tag is missing. Indeed, shared Gitlab-CI runners
> time out after 3 hours but some of our tests requires more time to
> finish. Some tests may also requires more storage due to download
> sources and generated files, so such test must use a runner that
> provide more storage.

  After some discussion on IRC and live in Nice, we decided that it's actually 
better to default to the small runner. It's better to run on a too small runner 
and increase it, rather than running on a too large runner and not noticing and 
wasting minutes.

[snip]
> The proposed classification is based on a previous pipeline analysis
> [5]:
> 
>    - Tests lasting more than 3 hours will use 2xlarge runners.
>    - Tests lasting more than 2 hours will use xlarge runners.
>    - Tests lasting more than 1 hours will use large runners.

  Of course, that depends also on whether it was originally on the Mind or the 
Smile runner... Anyway, if anything fails, we'll fix it.

>    - Tests building a kernel or a toolchain will use medium runners.
>    - All other tests will use small runners when posible.
> 
> CI minute cost estimate:
[snip]

> Worst case (realse month):
> (4 weeks + 1 release + 1 stable + 1 LTS + 3 release candidate) * 350 CI
> minutes: 3500 CI minutes / 50000.

  Great, that's actually much better than I expected. Probably not at the level 
that we could afford to do everything on xlarge, but still...

  And we definitely still have minutes left to do defconfigs on shared runners 
as well.

  It didn't take into account that some of the jobs that happen on every push 
will also be picked up by the SAAS runners. They don't take much, but still a 
couple of minutes.

  But still, best case (= a lot of pushes) we consume 5 minutes per day that 
way, so that's still only 150 minutes per month.


> So we should be able to run our pipeline without exhausting our CI
> minutes credit.
> 

[snip]
>   408 files changed, 800 insertions(+), 2 deletions(-)

  I made small the default and removed all the "small" tags, so only 38 files 
changed instead of 408 :-)

[snip]
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 2d922b9eb2..aaea0ac206 100755
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
> @@ -133,7 +133,16 @@ gen_tests() {
>   
>       if ${do_runtime:-false}; then
>           printf 'runtime_test_download: { extends: .runtime_test_download }\n'
> -        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
> +        for test in "${runtimes[@]}"; do
> +            test_file=$(echo "${test}" | sed 's/.test_run$//g' | sed -n 's/\(test_.*\)\..*$/\1/p' | tr '.' '/' | sed -e 's/^/.\/support\/testing\//' | sed -e 's/$/.py/')
> +            test_name=$(echo "${test}" | sed 's/.test_run$//g' | sed 's/.*\.//')

  I was able to simplify this to:

             test_file=$(echo "${test}" | tr '.' '/' | sed 
's%\(.*/test_[^/]*\)/.*test_run$%support/testing/\1.py%g')
             test_name=$(echo "${test}" | sed 's/.test_run$//g' | sed 's/.*\.//')


> +            runner=$(grep -C 1 "${test_name}" "${test_file}" | head -1 | sed -n 's/^.*# Gitlab-runner: \(.*\)/\1/p' ) || true

  This needs to match the whole word, because we have e.g. TestRust and 
TestRustBin in the same file. This actually resulted in buildroot-runner-only 
for TestRust.

  I changed this to:

             runner=$(grep -w -B 1 "${test_name}" "${test_file}" | head -1 | sed 
-n 's/^.*# gitlab-runner: \(.*\)/\1/p' ) || true

> +            runner=${runner,,}

  This is redundant, it's already lower case.

> +            if [ -z "${runner}" ]; then
> +                runner="buildroot-runner-only"

  I changed this to small.

> +            fi
> +            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
> +        done
>       fi
>   
>       if [ -n "${do_testpkg}" ]; then
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index 02d0c74b84..02fed21ac0 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -1,6 +1,7 @@
>   import infra.basetest
>   
>   
> +# Gitlab-runner: small

  I removed all of these.

  Also, I changed it to "gitlab-runner" lowercase. It's actually called GitLab, 
but for "technical names" I prefer to use all-lowercase.

  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
