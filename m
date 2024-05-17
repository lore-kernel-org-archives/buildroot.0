Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E3C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 15:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576C38236B;
	Fri, 17 May 2024 15:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHXrbTvTi5lP; Fri, 17 May 2024 15:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2080382386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2080382386;
	Fri, 17 May 2024 15:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C29B1BF2FA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458C94062E
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C23KbARlJu6u for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 15:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B87204061C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87204061C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87204061C
 for <buildroot@buildroot.org>; Fri, 17 May 2024 15:38:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AF91B13F880;
 Fri, 17 May 2024 17:38:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 17:38:13 +0200
Date: Fri, 17 May 2024 17:38:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <Zkd55Rd7ckidGUhs@landeda>
References: <20240517145347.269607-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145347.269607-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715960296;
 bh=oPIBNe1MVB5T0f+2dyZ7DDj6l0m07+kTR1a1iKU9mOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4F45TwqZ8Ffxg48OLXGV8pXmw2+sPhdZOuc64t5pvr0VRv14f88KE83imfR1uWGI
 jZm4asrhH92dnZJbrm0otmJ8wOck4ZHuHjr8XZIP8JiyrMLkRfxaZV2mQ56/eJYBuF
 mVrNbljyNZ77F5TFjHQv0Qc0mIrhXGfz8MckO1f03/c8aMuOJiS7Fq9rcCD0YOVovS
 qfG6asb2ju9TXYG4IH5+ZQZbaPWckldKoqgOkvPkwx0yIKakWxeN+dK6mqTj9PMwN/
 TG5Cpk4n82rwdmNfrDO347IeB9EOtNEmwlQDftiB6Cb+ClVqBtj2hqID6DaBEAyxWo
 cpHB33pHMS0sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N4F45Twq
Subject: Re: [Buildroot] [PATCH]
 package/go-bootstrap-stage3/go-bootstrap-stage3: fix go-bootstrap when
 parent dir contains invalid .git
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2024-05-17 16:53 +0200, Romain Naour spake thusly:
> Since go-bootstrap-stage3 package has been added to Buildroot [1], all
> tests using go are failing only on Gitlab-ci jobs. The build succeed
> if we use docker-run script.
> 
> Since the issue is only trigged by Gitlab-ci environment, the issue
> is related to the ownership of the (buildroot) git tree, see [2].
> go seems to ignore the .gitconfig set by before_script.
> 
> Anyway, go should not try to use git to retrieve some info since we
> are not building it from the go repository.
> 
> go package was already patched for a similar issue when building
> host-go within docker [3]. Apply the same patch to go-bootstrap-stage3
> to disable VCS support.
> 
> See
> http://lists.busybox.net/pipermail/buildroot/2024-May/691273.html
> 
> [1] f00eb37de9b4b0ddbdeb5c7ebae48c883c27e132
> [2] a016b693f7830f3c8ae815851d3204b8b6e99821
> [3] bc8e70a08ba083d978c828e31442a7645c9099d7
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307649 (tests.fs.test_oci.TestOci)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823 (tests.package.test_docker_compose.TestDockerCompose)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6833308175 (tests.package.test_mender.TestMender)
> 
> Runtime tested:
> https://gitlab.com/kubu93/buildroot/-/jobs/6860670292
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

(You had a duplicated go-bootstrap-stage3 in the title, so I removed
it).

Regards,
Yann E. MORIN.

> ---
>  ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> 
> diff --git a/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> new file mode 100644
> index 0000000000..58f4581b02
> --- /dev/null
> +++ b/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> @@ -0,0 +1,71 @@
> +From 6b05378097c6a386ed9912d2471976dc39504e86 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@aperture.us>
> +Date: Thu, 27 Jul 2023 21:28:47 -0700
> +Subject: [PATCH] cmd/dist: set buildvcs=false when building go-bootstrap
> +
> +When building go-bootstrap as part of the make.bash process, the cmd/dist
> +invokes the bootstrap Go compiler to build the go_bootstrap tool:
> +
> +${GOROOT_BOOTSTRAP}/bin/go install -tags=math_big_pure_go compiler_bootstrap purego bootstrap/cmd/...
> +
> +If there is an invalid .git directory in a parent of ${GOROOT_BOOTSTRAP},
> +make.bash will fail. Reproduction of the issue:
> +
> +  mkdir go-issue-61620
> +  cd ./go-issue-61620
> +  wget https://go.dev/dl/go1.19.11.src.tar.gz
> +  mkdir go-bootstrap
> +  tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
> +  cd ./go-bootstrap/src/
> +  bash make.bash
> +  cd ../../
> +  wget https://go.dev/dl/go1.20.6.src.tar.gz
> +  mkdir go
> +  tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
> +  printf "gitdir: ../../does/not/exist/.git" > ./.git
> +  cd ./go/src/
> +  GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
> +
> +The build fails with the following error:
> +
> +  Building Go toolchain1 using [snip]/go-1.19.10.
> +  error obtaining VCS status: exit status 128
> +    Use -buildvcs=false to disable VCS stamping.
> +  go tool dist: FAILED: [snip]/go-1.19.10/bin/go install -tags=math_big_pure_go \
> +    compiler_bootstrap purego bootstrap/cmd/...: exit status 1
> +
> +This change unconditionally sets -buildvcs=false when compiling go-bootstrap. We
> +don't need the revision information in those binaries anyway. Setting this flag
> +was previously not done as we were unsure if the go-bootstrap compiler would be
> +new enough to support the buildvcs build flag. Since Go 1.20.x, Go 1.19.x is the
> +minimum version for go-bootstrap, and supports -buildvcs=false. We can now set
> +-buildvcs=false without worrying about compatibility.
> +
> +Related: https://github.com/golang/go/issues/54852
> +Fixes: https://github.com/golang/go/issues/61620
> +
> +Upstream: https://github.com/golang/go/pull/61621
> +
> +Signed-off-by: Christian Stewart <christian@aperture.us>
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + src/cmd/dist/buildtool.go | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> +index a528d7aa76..3b411d6ebb 100644
> +--- a/src/cmd/dist/buildtool.go
> ++++ b/src/cmd/dist/buildtool.go
> +@@ -221,6 +221,9 @@ func bootstrapBuildTools() {
> + 	cmd := []string{
> + 		pathf("%s/bin/go", goroot_bootstrap),
> + 		"install",
> ++		// Fixes cases where an invalid .git is present in a parent of GOROOT_BOOTSTRAP.
> ++		// See: https://github.com/golang/go/issues/61620
> ++		"-buildvcs=false",
> + 		"-tags=math_big_pure_go compiler_bootstrap purego",
> + 	}
> + 	if vflag > 0 {
> +--
> +2.41.0
> +
> -- 
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
