Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011DBCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C637D60D7E;
	Fri, 12 Jun 2026 11:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5EsbPxKhDYz; Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A686360FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264278;
	bh=sO/JicHWTEyrsKgr1ttcJOOQ4A1qY7GUJ71+vlg5Oy4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QEDezUWq/hqtAixBhsZf83NRRf+DLuJ7EWTJKehQ8pMiXhXgtEiM497VubgZJI3mK
	 HGGbuNLhfaoS42E5xkzYe1v2aTMH9cqBMqfi3K9LMWUqO/ODhuwr0T1W/yBZimgT7V
	 om7Eiwu6A+6YL2vTYVlZqbpeSqjpY1BKpskDmU4omVFUFnqpYfTotJ4Q3zvG1DRtBU
	 3THU3kO+OeUtudR4pcXog1AfexdoXKS4enh0jpzGmwkyXDfeWq5pb8DdlhJqsNU656
	 2AUPTwB1xQoYw0KzspnYrIKmgTZuQ3VtALBXMmcdaHuPIeak7F10O1KuekiQ63heP/
	 mHrnQl4P37z+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A686360FA1;
	Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BDE12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D421832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b29xiv1_CvRT for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 004DA8330B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004DA8330B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 004DA8330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso8611785e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264272; x=1781869072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TGuUoDxJ4En2Vj33U5lD4BPzbqkcLYW4b2HuL/YMRxA=;
 b=ainEmrsSMXKysLMLNgQkaeCl5CuvqzWmIHoxVmsF/qvTnT0GZ62e0A+1uQOarNjgZ0
 2yFXGnje1C4BFgXhz86ZT+wSpN0rh9Vk7JOwKp5JgNtp2DiB9dHSlpMsKrtwOb6ZuG+O
 VN3dBhr+E2RvQpUhOstzHJ6cJH5cg/wq06TGcIMQZzcdn/q6JVsqarr4RPQ5C6GRDkoO
 QQ3OUSItLsFX7PXKTNTAA/Ts09F7Jk1x6lzI+b10HxuqA3poxOX0c1MnkgJgYkYIRnlO
 prHFwdvlKtAFRF+e95rUQkIrBE3EjFzDKbFUDrlmNOEWdnJk2p95XTdc5NZW/fMGGgAq
 GDiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+uwSOL2H/YiIvJVfCbnn4iuWEfbpNb/VkM7mrIg8GEEz9yWkWHQ9bVWH/TuyLpOmnyy5kVUd+mgo4=@buildroot.org
X-Gm-Message-State: AOJu0YwYS/zIt8d5zTtuDDSPPXVawii/uUVbfPJp/2p+2paXDyyC0X+E
 /lxKW5yLTuGrxM26I0/x0KXXTBy7cirtgiMMJ4D7RAztJKV5iKhfjMRLEn9Fxo5RvBGv+EC/L2L
 3nsIa
X-Gm-Gg: Acq92OHDPUO0PAmVDcvrcO7ZW5Xcx6Pw1OTH7sp5m1jFs3hVEisQv/1i1KEuhP/osRN
 0MX9e1OVnaSfK9k1xjid5SGlCan6XFWnJbOWI/PzUi2oGtxIE+txxrhK+zECF5q1AsIwtHDYa4N
 uGQarM39TPEFx6eilRxB9Fd07t+/Ema3BCzL7qVC1se4mDvf6MQ33QSFSHYoBb7g9St89+eJxOo
 +6oEb/t4lwmjlR6jVrN2Czse4Ceu0EPF4IPNz4QZpEmEkojvldTa8eotZL9GiznWu0j7f3L989/
 nVEE500C1iOteZgRkATnCkoulv5b3/AW8p3aqWdGGCBweUE9EAIMEtHgzpVT1MJY4tudw0HBCZ2
 2et/pj+ui8Glsm9C4HnWvI/t73VuG/tINLUE/pB5dXx1DkrJnCot7VTpGyR8/iChZaFAoekyNsK
 HNSAxN9lqwmP0paTw=
X-Received: by 2002:a05:600d:6452:20b0:490:3f7a:108b with SMTP id
 5b1f17b1804b1-490ec4fb540mr22619825e9.16.1781264271687; 
 Fri, 12 Jun 2026 04:37:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea7db9c6sm60757645e9.8.2026.06.12.04.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:51 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:50 +0200
Message-ID: <20260612113750.252068-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530175831.1806461-2-romain.naour@smile.fr>
References: <20260530175831.1806461-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264272; x=1781869072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGuUoDxJ4En2Vj33U5lD4BPzbqkcLYW4b2HuL/YMRxA=;
 b=LDBDjbk6oTonkm9B6+sREXkE9k2YaKyqBdvJD6i40wYHt8SI+naJEk5aFCEeASb58z
 /ToxQChxIKJ0ASefhQbOWFi5nbgA+u9v3E7z9e7qbyhoMXdqOnSB2BCNIbOyOXWMkvxx
 HPRP2iPO+BDFomjIVgaqFmgPeLIh0gnvp6aiXQrp6WmkXbjgqTHM2KTgLzzDeNdjMKza
 uDkWDSCMp85yez48jja/ZqF0GtJUyLLPDKgWxbCX8R0iBY/Mb1mq4wfEJi9Jy2/oBfjD
 Ekvk3LerRTIuHIJ6eB8Enuw+nlK2L87VEp/cllQUNYEz7KU3ufDhIN3AjXSU242AdabP
 /dbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LDBDjbk6
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: generate runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> We have our own GitLab-CI runner, but with only one we can't run many
> jobs in parallel so it takes a very long time before all the tests have
> completed. In addition, if that runner goes down, we have nothing at
> all.
> 
> GitLab offers the following machine types for hosted runners on Linux
> x86-64 [1]. The default is the "small" runner. Using a larger runner
> increases the "Cost factor" [2].
> 
> For opensource projects, the Cost factor is reduced to 0,5 (1 minute per
> 2 minutes of job time) whatever the runner type.
> 
> Runner Tag                                             vCPUs   Memory  Storage  Cost factor (OSS)
> saas-linux-small-amd64 (default)                           2     8 GB    30 GB     1 (0,5)
> saas-linux-medium-amd64                                    4    16 GB    50 GB     2 (0,5)
> saas-linux-large-amd64 (Premium and Ultimate only)         8    32 GB   100 GB     3 (0,5)
> saas-linux-xlarge-amd64 (Premium and Ultimate only)       16    64 GB   200 GB     6 (0,5)
> saas-linux-2xlarge-amd64 (Premium and Ultimate only)      32   128 GB   200 GB    12 (0,5)
> 
> Compute minutes consumed by a job is calculated by:
> 
>   Job duration / 60 * Cost factor
> 
> (Job duration: The time, in seconds, that a job took to run, not
> including time spent in the created or pending statuses.)
> 
> Thanks to the GitLab OSS program [3], Buildroot benefits from a free
> Ultimate subscription and can use GitLab shared runners tagged with
> saas-linux-{large, xlarge, 2xlarge}-amd64. In addition, we receive
> 50,000 free runner minutes per month.
> 
> In order to use one of those tags in Buildroot GitLab-CI jobs, we have
> to classify all tests by resource requirement, to make sure the job
> doesn't fail because it times out or has insufficient memory or disk
> space. While we usually shouldn't use the largest runner for
> everything, we can use larger runner without cost penalty thanks to
> the cost factor reduced to 0,5 for opensource projects. This will
> reduce the CI minute consumed by a CPU intensive job.
> 
> First we introduce some new templates used to add the corresponding
> runner tag to a runtime test job (reusing the GitLab terminology).
> 
>     .runner-{small,medium,large,xlarge,2xlarge}
> 
> Most of our tests are fast (checkpackage, test_external_bootlin...), so
> saas-linux-small-amd64 runner tag is enough. Default to this tag if
> nothing else is specified.
> 
> Add a comment next to the test class to provide the runner tag.
> This runner tag is retrieved when generating the
> generated-gitlab-ci.yml file used to create the child pipeline where
> the runtime test jobs are executed.
> 
> We use the list of runtime tests returned by node2:
> 
>   "tests.boot.test_edk2.TestEdk2.test_run"
> 
> We convert each element of this list to get the path to the test source
> file and the name of the test:
> 
>   "support/testing/tests/boot/test_edk2.py"
> 
>   TestEdk2
> 
> With that, we can grep into the test source file to retrieve the runner
> tag placed one line above the test class:
> 
>   # GitLab-runner: large
>   class TestEdk2(infra.basetest.BRTest):
> 
> Once the runner tag is retrieved, it's used to use the corresponding
> runner template to the runtime test job:
> 
>   tests.boot.test_edk2.TestEdk2.test_run: { extends: [ .runtime_test_base, .runner-large ]}
> 
> GitLab runners hosted by the Buildroot project should be able to run
> any jobs, so they should be tagged with Gitlab runner tags
> (saas-linux-{small,medium,large,xlarge,2xlarge}-amd64).
> A specific runner tag "buildroot-runner" can be used to allow running
> a job only on such runners.
> 
> If a test can't be executed by any shared GitLab-CI runners, we have
> to use a runner owned by the Buildroot project. In this case we have
> to use a specific template ".runner-buildroot-runner-only" in order to
> add the specific runner tag "buildroot-runner" to the job running the
> test. There is no such runtime test at the moment.
> 
> The proposed classification is based on a previous pipeline analysis
> [5]:
> 
>   - Tests lasting more than 3 hours will use 2xlarge runners.
>   - Tests lasting more than 2 hours will use xlarge runners.
>   - Tests lasting more than 1 hours will use large runners.
>   - Tests building a kernel or a toolchain will use medium runners.
>   - All other tests will use small runners when possible.
> 
> CI minute cost estimate:
> 
> tests.package.test_clang.TestClangCompilerRT.test_run lasts 4h25 on the
> Buildroot runner. If we this duration for 2xlarge runners, the CI
> minute consumed would be:
> 
>   (15900 / 60) * 0.5 = 133
> 
> With 6 jobs using a 2xlarge runners we used ~795 CI minutes.
> 
> tests.package.test_kmscube.TestKmsCube.test_run list 2h04 on the
> Buildroot runner. If we	this duration for xlarge runners, the CI
> minute consumed would be:
> 
>   (7440 / 60) * 0.5 = 62
> 
> With 4 jobs using a xlarge runners we used ~248 CI minutes.
> 
> tests.package.test_weston.TestWeston.test_run last 1h15 on th
> Buildroot runner. If we this duration for large runners, the CI
> minute consumed would be:
> 
>   (4500 / 60) * 0.5 = 37.5
> 
> With 28 jobs using a large runners we used ~1050 CI minutes.
> 
> tests.package.test_gstreamer1.TestGstreamer1.test_run last 46min on the
> Buildroot runner. If we this duration for large runners, the CI
> minute consumed would be:
> 
>   (2760 / 60) * 0.5 = 23
> 
> With 31 jobs using a medium runners we used ~713 CI minutes.
> 
> tests.package.test_python.TestPython3Py.test_run last 13min on the
> Buildroot runner. If we this duration for large runners, the CI
> minute consumed would be:
> 
>   (780 / 60) * 0.5 = 6.5
> 
> With 691 jobs using a medium runners we used ~4491 CI minutes.
> 
> In total, one pipeline for the runtime tests cost ~7297 CI minutes.
> After a first try [6], we are actually using 8000 CI minutes per
> pipeline.
> 
> We run such pipeline once a week (on Monday), one for each Buildroot
> releases every 3 month, one for each stable and LTS release per month,
> and one for each release candidate (3).
> 
> Worst case (release month):
> (4 weeks + 1 release + 1 stable + 1 LTS + 3 release candidate) * 8000 CI
> minutes: 80000 CI minutes / 50000.
> 
> So we would spend the minutes very quickly in the worst case senario.
> We have to keep one pipeline under 5000 CI minutes.
> 
> [1] https://docs.gitlab.com/ci/runners/hosted_runners/linux/#machine-types-available-for-linux---x86-64
> [2] https://docs.gitlab.com/ci/pipelines/compute_minutes/#cost-factors
>     https://docs.gitlab.com/ci/pipelines/compute_minutes/#compute-usage-calculation
>     https://docs.gitlab.com/ci/pipelines/compute_minutes/#cost-factors-of-hosted-runners-for-gitlabcom
> [3] https://gitlab.com/buildroot.org/gitlab-oss
> [4] https://docs.gitlab.com/ci/runners/hosted_runners/#gitlabcom-hosted-runner-workflow
> [5] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2416603721
> [6] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562421098
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> [Arnout:
>  - simplify parsing of test_file and test_name;
>  - match the entire test_name instead of substring;
>  - assume "small" by default;
>  - remove the "small" tags;
>  - use "gitlab-runner" instead of "Gitlab-runner".
> ]
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v3: fix CI minute cost estimate
>     rework the commit log
>     No change in the commit itself
> ---
>  support/misc/gitlab-ci.yml.in                 | 24 +++++++++++++++++++
>  support/scripts/generate-gitlab-ci-yml        | 12 ++++++++--
>  support/testing/tests/boot/test_edk2.py       |  1 +
>  support/testing/tests/boot/test_grub.py       |  3 +++
>  support/testing/tests/init/test_systemd.py    | 23 ++++++++++++++++++
>  support/testing/tests/package/test_aichat.py  |  1 +
>  support/testing/tests/package/test_bcc.py     |  1 +
>  support/testing/tests/package/test_bitcoin.py |  1 +
>  support/testing/tests/package/test_clang.py   |  1 +
>  .../package/test_distribution_registry.py     |  1 +
>  .../tests/package/test_docker_compose.py      |  2 ++
>  .../testing/tests/package/test_dosfstools.py  |  1 +
>  .../testing/tests/package/test_firewalld.py   |  2 ++
>  .../testing/tests/package/test_fluidsynth.py  |  1 +
>  support/testing/tests/package/test_flutter.py |  1 +
>  support/testing/tests/package/test_fwts.py    |  1 +
>  .../tests/package/test_glslsandbox_player.py  |  1 +
>  support/testing/tests/package/test_glxinfo.py |  1 +
>  .../testing/tests/package/test_gnuradio.py    |  1 +
>  .../testing/tests/package/test_gstreamer1.py  |  1 +
>  support/testing/tests/package/test_kmscube.py |  1 +
>  .../testing/tests/package/test_libcamera.py   |  1 +
>  .../testing/tests/package/test_llama_cpp.py   |  1 +
>  support/testing/tests/package/test_mender.py  |  1 +
>  support/testing/tests/package/test_mesa3d.py  |  1 +
>  support/testing/tests/package/test_nodejs.py  |  3 +++
>  .../testing/tests/package/test_openblas.py    |  1 +
>  support/testing/tests/package/test_openjdk.py |  1 +
>  .../tests/package/test_perl_dbd_mysql.py      |  1 +
>  .../tests/package/test_python_pyqt5.py        |  1 +
>  .../tests/package/test_python_scipy.py        |  1 +
>  support/testing/tests/package/test_rust.py    |  1 +
>  .../package/test_uboot_openssl_pkgconfig.py   |  1 +
>  support/testing/tests/package/test_weston.py  |  1 +
>  support/testing/tests/package/test_wine.py    |  1 +
>  support/testing/tests/package/test_xen.py     |  2 ++
>  support/testing/tests/package/test_zfs.py     |  3 +++
>  .../tests/toolchain/test_aarch64_64k.py       |  3 +++
>  38 files changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index ada36d0d60..81c380a4ed 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -5,6 +5,30 @@ stages:
>  before_script:
>    - git config --global --add safe.directory ${CI_PROJECT_DIR}
>  
> +.runner-small:
> +    tags:
> +        - saas-linux-small-amd64
> +
> +.runner-medium:
> +    tags:
> +        - saas-linux-medium-amd64
> +
> +.runner-large:
> +    tags:
> +        - saas-linux-large-amd64
> +
> +.runner-xlarge:
> +    tags:
> +        - saas-linux-xlarge-amd64
> +
> +.runner-2xlarge:
> +    tags:
> +        - saas-linux-2xlarge-amd64
> +
> +.runner-buildroot-runner-only:
> +    tags:
> +        - buildroot-runner
> +
>  .check-check-package_base:
>      stage: test
>      script:
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index be2b8f0fe9..2a8c9be5f5 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -24,7 +24,7 @@ _EOF_
>  gen_tests() {
>      local -a basics defconfigs runtimes
>      local do_basics do_defconfigs do_runtime do_testpkg
> -    local defconfigs_ext cfg tst
> +    local defconfigs_ext cfg runner tst
>  
>      basics=( check-package check-symbol DEVELOPERS package symbol )
>  
> @@ -133,7 +133,15 @@ gen_tests() {
>  
>      if ${do_runtime:-false}; then
>          printf 'runtime_test_download: { extends: .runtime_test_download }\n'
> -        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
> +        for test in "${runtimes[@]}"; do
> +            test_file=$(echo "${test}" | tr '.' '/' | sed 's%\(.*/test_[^/]*\)/.*test_run$%support/testing/\1.py%g')
> +            test_name=$(echo "${test}" | sed 's/.test_run$//g' | sed 's/.*\.//')
> +            runner=$(grep -w -B 1 "${test_name}" "${test_file}" | head -1 | sed -n 's/^.*# gitlab-runner: \(.*\)/\1/p' ) || true
> +            if [ -z "${runner}" ]; then
> +                runner="small"
> +            fi
> +            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
> +        done
>      fi
>  
>      if [ -n "${do_testpkg}" ]; then
> diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
> index 8489e82860..452697e085 100644
> --- a/support/testing/tests/boot/test_edk2.py
> +++ b/support/testing/tests/boot/test_edk2.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestEdk2(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> index e873683b5a..8f081f927b 100644
> --- a/support/testing/tests/boot/test_grub.py
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -32,6 +32,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
>          self.emulator.login()
>  
>  
> +# gitlab-runner: large
>  class TestGrubX8664EFI(infra.basetest.BRTest):
>      config = \
>          """
> @@ -84,6 +85,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
>          self.assertRunOk(cmd)
>  
>  
> +# gitlab-runner: large
>  class TestGrubAArch64EFI(infra.basetest.BRTest):
>      config = \
>          """
> @@ -125,6 +127,7 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
>          self.assertRunOk(cmd)
>  
>  
> +# gitlab-runner: large
>  class TestGrubRiscV64EFI(infra.basetest.BRTest):
>      scripts = [
>          "board/qemu/post-image.sh",
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index 893cc17408..472a65db57 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -65,6 +65,7 @@ class InitSystemSystemdBase(InitSystemBase):
>          self.check_network("eth0")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -77,6 +78,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
>          self.check_systemd("squashfs")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -88,6 +90,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
>          self.check_systemd("ext2")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -101,6 +104,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
>          self.check_systemd("squashfs")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
>      config = TestInitSystemSystemdRoIfupdown.config + \
>          """
> @@ -117,6 +121,7 @@ class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown)
>          self.assertEqual(len(out), 1)
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
>      config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
>          """
> @@ -124,6 +129,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupd
>          """
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -136,6 +142,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
>          self.check_systemd("ext2")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
>      config = TestInitSystemSystemdRwIfupdown.config + \
>          """
> @@ -152,6 +159,7 @@ class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown)
>          self.assertEqual(len(out), 1)
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
>      config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
>          """
> @@ -159,6 +167,7 @@ class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupd
>          """
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -188,6 +197,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
>          self.check_systemd("squashfs")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
>      config = InitSystemSystemdBase.config + \
>          """
> @@ -257,6 +267,7 @@ class InitSystemSystemdBaseFactory():
>          self.assertEqual(out[0], "foobar")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoNetworkdFactory(
>      InitSystemSystemdBaseFactory,
>      TestInitSystemSystemdRoNetworkd,
> @@ -265,6 +276,7 @@ class TestInitSystemSystemdRoNetworkdFactory(
>          TestInitSystemSystemdRoNetworkd.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownFactory(
>      InitSystemSystemdBaseFactory,
>      TestInitSystemSystemdRoIfupdown,
> @@ -273,6 +285,7 @@ class TestInitSystemSystemdRoIfupdownFactory(
>          TestInitSystemSystemdRoIfupdown.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
>      InitSystemSystemdBaseFactory,
>      TestInitSystemSystemdRoIfupdownDbusbroker,
> @@ -281,6 +294,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
>          TestInitSystemSystemdRoIfupdownDbusbroker.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
>      InitSystemSystemdBaseFactory,
>      TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
> @@ -289,6 +303,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
>          TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoFullFactory(
>      InitSystemSystemdBaseFactory,
>      TestInitSystemSystemdRoFull,
> @@ -348,6 +363,7 @@ class InitSystemSystemdBaseOverlayfs():
>          self.assertEqual(out[0], "foobar")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoNetworkdOverlayfs(
>      InitSystemSystemdBaseOverlayfs,
>      TestInitSystemSystemdRoNetworkd,
> @@ -356,6 +372,7 @@ class TestInitSystemSystemdRoNetworkdOverlayfs(
>          TestInitSystemSystemdRoNetworkd.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownOverlayfs(
>      InitSystemSystemdBaseOverlayfs,
>      TestInitSystemSystemdRoIfupdown,
> @@ -364,6 +381,7 @@ class TestInitSystemSystemdRoIfupdownOverlayfs(
>          TestInitSystemSystemdRoIfupdown.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
>      InitSystemSystemdBaseOverlayfs,
>      TestInitSystemSystemdRoIfupdownDbusbroker,
> @@ -372,6 +390,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
>          TestInitSystemSystemdRoIfupdownDbusbroker.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
>      InitSystemSystemdBaseOverlayfs,
>      TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
> @@ -380,6 +399,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
>          TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoFullOverlayfs(
>      InitSystemSystemdBaseOverlayfs,
>      TestInitSystemSystemdRoFull,
> @@ -388,6 +408,7 @@ class TestInitSystemSystemdRoFullOverlayfs(
>          TestInitSystemSystemdRoFull.config
>  
>  
> +# gitlab-runner: medium
>  class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
>      @classmethod
>      def gen_config(cls, overlaydir: str) -> str:
> @@ -402,6 +423,7 @@ class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
>          self.assertRunOk("grep '^other-var-backing-store /run/buildroot/mounts/var tmpfs' /proc/mounts")
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
>      TestInitSystemSystemdRoFullOverlayfs,
>      InitSystemSystemdBaseOverlayfsVarBacking,
> @@ -415,6 +437,7 @@ class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
>          self.check_var_mounted()
>  
>  
> +# gitlab-runner: medium
>  class TestInitSystemSystemdRoFullOverlayfsVarBackingFstab(
>      TestInitSystemSystemdRoFullOverlayfs,
>      InitSystemSystemdBaseOverlayfsVarBacking,
> diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
> index 50c07f87dc..009d6e98a3 100644
> --- a/support/testing/tests/package/test_aichat.py
> +++ b/support/testing/tests/package/test_aichat.py
> @@ -5,6 +5,7 @@ import time
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestAiChat(infra.basetest.BRTest):
>      rootfs_overlay = \
>          infra.filepath("tests/package/test_aichat/rootfs-overlay")
> diff --git a/support/testing/tests/package/test_bcc.py b/support/testing/tests/package/test_bcc.py
> index 51f175a5b4..b98c37077d 100644
> --- a/support/testing/tests/package/test_bcc.py
> +++ b/support/testing/tests/package/test_bcc.py
> @@ -4,6 +4,7 @@ import time
>  import infra.basetest
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestBcc(infra.basetest.BRTest):
>      # This test is using a Kernel >= 5.2, so it will use
>      # CONFIG_IKHEADERS. Those Kernel headers are unpacked from
> diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
> index a942504af4..186240b280 100644
> --- a/support/testing/tests/package/test_bitcoin.py
> +++ b/support/testing/tests/package/test_bitcoin.py
> @@ -5,6 +5,7 @@ import time
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestBitcoin(infra.basetest.BRTest):
>      # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
>      # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
> index bc44a5804a..439e5b9cd2 100644
> --- a/support/testing/tests/package/test_clang.py
> +++ b/support/testing/tests/package/test_clang.py
> @@ -5,6 +5,7 @@ import infra.basetest
>  FUZZ_TIMEOUT = 120
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestClangCompilerRT(infra.basetest.BRTest):
>      br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
>      # Without this option the test fails due to insufficient address space for 64-bit allocator
> diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
> index 35942db29c..66e0b5d39d 100644
> --- a/support/testing/tests/package/test_distribution_registry.py
> +++ b/support/testing/tests/package/test_distribution_registry.py
> @@ -3,6 +3,7 @@ import os
>  import time
>  
>  
> +# gitlab-runner: large
>  class TestDistributionRegistry(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
> index db7e50914c..ad9a46ac16 100644
> --- a/support/testing/tests/package/test_docker_compose.py
> +++ b/support/testing/tests/package/test_docker_compose.py
> @@ -76,11 +76,13 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
>          self.python_docker_test()
>  
>  
> +# gitlab-runner: large
>  class TestDockerComposeRunc(BaseTestDockerCompose):
>      def test_run(self):
>          self.do_test()
>  
>  
> +# gitlab-runner: large
>  class TestDockerComposeCrun(BaseTestDockerCompose):
>      config = BaseTestDockerCompose.config + """
>          BR2_PACKAGE_CRUN=y
> diff --git a/support/testing/tests/package/test_dosfstools.py b/support/testing/tests/package/test_dosfstools.py
> index f32ff81c01..a63dbad38f 100644
> --- a/support/testing/tests/package/test_dosfstools.py
> +++ b/support/testing/tests/package/test_dosfstools.py
> @@ -4,6 +4,7 @@ import subprocess
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestDosFsTools(infra.basetest.BRTest):
>      # This test needs a Kernel with vfat and NLS support. The vfat
>      # filesystem also needs character set conversion libraries, since
> diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
> index 1093873b38..9a1bd41f62 100644
> --- a/support/testing/tests/package/test_firewalld.py
> +++ b/support/testing/tests/package/test_firewalld.py
> @@ -4,6 +4,7 @@ import time
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestFirewalldSystemd(infra.basetest.BRTest):
>      """Build the kernel as firewalld requires several the nftable options."""
>  
> @@ -62,6 +63,7 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
>          self.assertEqual(exit_code, 0)
>  
>  
> +# gitlab-runner: large
>  class TestFirewalldSysVInit(infra.basetest.BRTest):
>      """Build the kernel as firewalld requires several nftable options."""
>  
> diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
> index 909c878b75..7ebbf5e642 100644
> --- a/support/testing/tests/package/test_fluidsynth.py
> +++ b/support/testing/tests/package/test_fluidsynth.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestFluidsynth(infra.basetest.BRTest):
>      # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
>      # armv5 and based on qemu versatilepb which is limited to 256MB of
> diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
> index 19406b7cb1..95cccb529d 100644
> --- a/support/testing/tests/package/test_flutter.py
> +++ b/support/testing/tests/package/test_flutter.py
> @@ -5,6 +5,7 @@ import infra.basetest
>  from ..graphics_base import GraphicsBase
>  
>  
> +# gitlab-runner: xlarge
>  class TestFlutter(infra.basetest.BRTest, GraphicsBase):
>      config = f"""
>          BR2_aarch64=y
> diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
> index a58f9ccb80..86ae99ac9f 100644
> --- a/support/testing/tests/package/test_fwts.py
> +++ b/support/testing/tests/package/test_fwts.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestFwts(infra.basetest.BRTest):
>      kernel_fragment = \
>          infra.filepath("tests/package/test_fwts/linux-efi-test.fragment")
> diff --git a/support/testing/tests/package/test_glslsandbox_player.py b/support/testing/tests/package/test_glslsandbox_player.py
> index f72ac2adce..669292ca75 100644
> --- a/support/testing/tests/package/test_glslsandbox_player.py
> +++ b/support/testing/tests/package/test_glslsandbox_player.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestGlslsandboxPlayer(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
> index 8680477b15..2c3181d9fb 100644
> --- a/support/testing/tests/package/test_glxinfo.py
> +++ b/support/testing/tests/package/test_glxinfo.py
> @@ -5,6 +5,7 @@ import infra.basetest
>  GLXINFO_TIMEOUT = 120
>  
>  
> +# gitlab-runner: large
>  class TestGlxinfo(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_gnuradio.py b/support/testing/tests/package/test_gnuradio.py
> index 1fc0479d21..9b8ab2f558 100644
> --- a/support/testing/tests/package/test_gnuradio.py
> +++ b/support/testing/tests/package/test_gnuradio.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestGnuradio(infra.basetest.BRTest):
>      # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
>      # not include: BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
> index 82829dab98..3b2899b9fe 100644
> --- a/support/testing/tests/package/test_gstreamer1.py
> +++ b/support/testing/tests/package/test_gstreamer1.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestGstreamer1(infra.basetest.BRTest):
>      # This test creates a full, yet simple, Gstreamer pipeline which
>      # encodes/decodes a video, using only plugins from Base and Good
> diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
> index 4a0eb07c32..1e75948c20 100644
> --- a/support/testing/tests/package/test_kmscube.py
> +++ b/support/testing/tests/package/test_kmscube.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: xlarge
>  class TestKmsCube(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
> index c785e340d6..bc52498a75 100644
> --- a/support/testing/tests/package/test_libcamera.py
> +++ b/support/testing/tests/package/test_libcamera.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestLibCamera(infra.basetest.BRTest):
>      # A specific configuration is needed for testing libcamera:
>      # a kernel config fragment enables v4l2 vimc driver.
> diff --git a/support/testing/tests/package/test_llama_cpp.py b/support/testing/tests/package/test_llama_cpp.py
> index 4462be0a5b..682ee0b172 100644
> --- a/support/testing/tests/package/test_llama_cpp.py
> +++ b/support/testing/tests/package/test_llama_cpp.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: medium
>  class TestLlamaCpp(infra.basetest.BRTest):
>      config = """
>          BR2_aarch64=y
> diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
> index 0c83c5644e..14440c9527 100644
> --- a/support/testing/tests/package/test_mender.py
> +++ b/support/testing/tests/package/test_mender.py
> @@ -57,6 +57,7 @@ class TestMenderRO(TestMenderInfra):
>          self.run_mender_test()
>  
>  
> +# gitlab-runner: large
>  class TestMenderSystemd(TestMenderInfra):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
> index f5133c2eef..24fc6df59e 100644
> --- a/support/testing/tests/package/test_mesa3d.py
> +++ b/support/testing/tests/package/test_mesa3d.py
> @@ -4,6 +4,7 @@ import infra.basetest
>  RUSTICL_TIMEOUT = 180
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestMesa3DRusticl(infra.basetest.BRTest):
>      config = """
>          BR2_aarch64=y
> diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
> index 2884529c6e..0e679a0ddd 100644
> --- a/support/testing/tests/package/test_nodejs.py
> +++ b/support/testing/tests/package/test_nodejs.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestNodeJSBasic(infra.basetest.BRTest):
>      config = \
>          """
> @@ -28,6 +29,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
>          self.assertRunOk("node sample_nodejs_basic.js")
>  
>  
> +# gitlab-runner: large
>  class TestNodeJSModuleHostBin(infra.basetest.BRTest):
>      config = \
>          """
> @@ -55,6 +57,7 @@ class TestNodeJSModuleHostBin(infra.basetest.BRTest):
>          self.assertRunOk("node sample_nodejs_module.js")
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_openblas.py b/support/testing/tests/package/test_openblas.py
> index 9cfe08ef2c..edfd08c55c 100644
> --- a/support/testing/tests/package/test_openblas.py
> +++ b/support/testing/tests/package/test_openblas.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestOpenBLAS(infra.basetest.BRTest):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
> index 0dc69b7c49..d57bc0a711 100644
> --- a/support/testing/tests/package/test_openjdk.py
> +++ b/support/testing/tests/package/test_openjdk.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestOpenJdk(infra.basetest.BRTest):
>      br2_external = [infra.filepath("tests/package/br2-external/openjdk")]
>      config = \
> diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
> index 93551b420f..b9dfd97347 100644
> --- a/support/testing/tests/package/test_perl_dbd_mysql.py
> +++ b/support/testing/tests/package/test_perl_dbd_mysql.py
> @@ -2,6 +2,7 @@ from tests.package.test_perl import TestPerlBase
>  import os
>  
>  
> +# gitlab-runner: xlarge
>  class TestPerlDBDmysql(TestPerlBase):
>      """
>      package:
> diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
> index 65130f9c03..fd933ba560 100644
> --- a/support/testing/tests/package/test_python_pyqt5.py
> +++ b/support/testing/tests/package/test_python_pyqt5.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestPythonPyQt5(infra.basetest.BRTest):
>      # We use a specific configuration for:
>      # - using Aarch64, to have more than 256MB memory,
> diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
> index 608a3f6e87..af7aa8f0c0 100644
> --- a/support/testing/tests/package/test_python_scipy.py
> +++ b/support/testing/tests/package/test_python_scipy.py
> @@ -3,6 +3,7 @@ import os
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> +# gitlab-runner: large
>  class TestPythonPy3SciPy(TestPythonPackageBase):
>      __test__ = True
>      # Need to use a different toolchain than the default due to
> diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
> index 763125ca20..5602aee3e7 100644
> --- a/support/testing/tests/package/test_rust.py
> +++ b/support/testing/tests/package/test_rust.py
> @@ -35,6 +35,7 @@ class TestRustBin(TestRustBase):
>          self.assertRunOk("rg Buildroot /etc/issue")
>  
>  
> +# gitlab-runner: 2xlarge
>  class TestRust(TestRustBase):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
> index 55a45f44fc..6d6be9fa7b 100644
> --- a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
> +++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
>      config = infra.basetest.MINIMAL_CONFIG + \
>          """
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index c4a522c95b..1b25d5ac5e 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -5,6 +5,7 @@ import infra.basetest
>  from ..graphics_base import GraphicsBase
>  
>  
> +# gitlab-runner: large
>  class TestWeston(infra.basetest.BRTest, GraphicsBase):
>      config = \
>          """
> diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
> index 8c7b80f522..77f233fef4 100644
> --- a/support/testing/tests/package/test_wine.py
> +++ b/support/testing/tests/package/test_wine.py
> @@ -3,6 +3,7 @@ import os
>  import infra.basetest
>  
>  
> +# gitlab-runner: large
>  class TestWine(infra.basetest.BRTest):
>      # Wine depends on i386 architecture. The pre-build runtime test
>      # Kernel (for armv5) cannot be used. The config also uses a ext4
> diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
> index 23efb2055d..8793ec6762 100644
> --- a/support/testing/tests/package/test_xen.py
> +++ b/support/testing/tests/package/test_xen.py
> @@ -149,6 +149,7 @@ class TestXenBase(infra.basetest.BRTest):
>          self.assertRunOk("brctl show")
>  
>  
> +# gitlab-runner: large
>  class TestXenAarch64(TestXenBase):
>      # Test Xen on 64b Arm.
>      # Boot flow: Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
> @@ -189,6 +190,7 @@ class TestXenAarch64(TestXenBase):
>          self.run_xen_test(arch="aarch64", options=qemu_opts)
>  
>  
> +# gitlab-runner: large
>  class TestXenArmv7(TestXenBase):
>      # Test Xen on 32b Arm v7.
>      # Boot flow: Qemu Devicetree -> U-Boot -> Xen -> Linux
> diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
> index 384fad7e33..ba9c8d3e90 100644
> --- a/support/testing/tests/package/test_zfs.py
> +++ b/support/testing/tests/package/test_zfs.py
> @@ -63,6 +63,7 @@ class TestZfsBase(infra.basetest.BRTest):
>              self.assertRunOk(cmd, timeout=self.timeout)
>  
>  
> +# gitlab-runner: medium
>  class TestZfsGlibc(TestZfsBase):
>      config = TestZfsBase.config + \
>          """
> @@ -73,6 +74,7 @@ class TestZfsGlibc(TestZfsBase):
>          TestZfsBase.base_test_run(self)
>  
>  
> +# gitlab-runner: large
>  class TestZfsUclibc(TestZfsBase):
>      # The Bootling aarch64 uclibc stable 2025.08-1 needs to be
>      # rebuild with uClibc-ng 1.0.55.
> @@ -92,6 +94,7 @@ class TestZfsUclibc(TestZfsBase):
>          TestZfsBase.base_test_run(self)
>  
>  
> +# gitlab-runner: medium
>  class TestZfsMusl(TestZfsBase):
>      config = TestZfsBase.config + \
>          """
> diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
> index 7cdbdb9faf..9962fea813 100644
> --- a/support/testing/tests/toolchain/test_aarch64_64k.py
> +++ b/support/testing/tests/toolchain/test_aarch64_64k.py
> @@ -42,6 +42,7 @@ class TestAarch64Pages64kBase(infra.basetest.BRTest):
>          self.assertEqual(2 ** order * 64 * 1024, size)
>  
>  
> +# gitlab-runner: large
>  class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
>      __test__ = True
>      config = TestAarch64Pages64kBase.config + \
> @@ -50,6 +51,7 @@ class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
>          """
>  
>  
> +# gitlab-runner: large
>  class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
>      __test__ = True
>      config = TestAarch64Pages64kBase.config + \
> @@ -58,6 +60,7 @@ class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
>          """
>  
>  
> +# gitlab-runner: large
>  class TestAarch64Pages64kMusl(TestAarch64Pages64kBase):
>      __test__ = True
>      config = TestAarch64Pages64kBase.config + \
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
