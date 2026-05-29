Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FC8CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7534B84161;
	Fri, 29 May 2026 10:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCnG54WimaMv; Fri, 29 May 2026 10:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEDA83D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780050122;
	bh=U/QC8G17Lx3ZJHxcfIUCGFxlswrUy4KusYdLW1nurig=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JgCnZDf8FhPPHyalzHpxiZ4eIFrVZPW5AB/Y5LiRRfjoRcJ/PvYVvfh60eBkBMUxT
	 euho4i1H6Z7hrlwaets3EoNSxqoc/af7i537iSoRyHOP8Ogs1yaTr7p9gQ+aq32BI7
	 psKa3okt7YoUshQSJs2s6Qo1uCzg+fpNPeuDw760Vs01RZaT2UZfs/5jRbOYno0YM6
	 04IVwMyy12uPDUaLdNZXFg9+v8NWTGfNqAxrzVurTX7XMutBbeYHaLj/cmnCwDMa3l
	 5A5VAjEUvHaiihHNxATXP8tPiJAQP/p50KoiSuADznpG14OetldtDhn+gLcpN5pwEJ
	 ExjuUx1Fn2liQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEDA83D76;
	Fri, 29 May 2026 10:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4E78F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D8383C7B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cKreoE3RRMT for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89F9683C65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F9683C65
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89F9683C65
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:21:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso91837395e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 03:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780050115; x=1780654915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS1J1VlmYQAfyJmAhuyQOlncCnuTeoibabPfukoGDBM=;
 b=OyjBQ6TQiI115vHmDx/Gh8f0fa15/PoplfLSfDOIaBOiiy/f6cyDo+4MJ+7+xrzDSU
 R9zcaJVutlq43koSYs+27S8Dc04ZsS+Z4japKQSqEdhFpLv/9FjsEEJ30sA8elsvEYHI
 FYp3HT9LD3+8Na+wzPjUO5nq2KKT1ifqmSz8NmNN2wgF7insKl/Dq868GOaHXwvwlqVp
 LW8kfvocXkQyhOzMK+scqJ7pi0bEyNwyVyLzhVQ2E1vbWwNAiA/gsxQkp45pE/785gef
 FHtNH/hN3gOwozbZtR3/0r7CrEt8Bmle48VirXL0arssiceaFxK3tF1+oJZKHxJ5mPr5
 IsaQ==
X-Gm-Message-State: AOJu0YzPiwoa6HfMSi8LK+AuBNNo79cNL1fkfU3chOQmK5EosKJ/F/Ts
 vCMX9rbCj0+GgEPalvdODT9AY7kENF8CSqphK7Z76mdfOl6/LVxlCRoF9Nm1dHex9Cozp6BYXUw
 oRHnS
X-Gm-Gg: Acq92OGk9NNrgTjADvSVN7rX7GuTjpBpBmtAiO7uv1FSBbn4BDqVcOYjNKPssy2rsHt
 ZSESl1Woj2GtXTNBtnasbxlpaA0BBoZQeUUj9bzujUp+GxYx3LNQJiTpjkqdlgsk1Edt6wGamw4
 hh6KW6uPKNIXyYvq845BRVcdYiHlsgFt05zidJJ8+/ggcO40TKIqgMPwezVGiaDodA/hOE4w2kS
 wk6c0BWWjQcFHzfL9O3/nqxuBzwohdIbqn1ZTo+olY4OwZhR4+bR4Ez2DRXUeO+rFIkRdv0p7pD
 vvg4XvpXObCiYCap+GZ0DkXyLZ52fFGyN20EloFWbQYIXUDpHmf0LS9ZzF/CAejurolNE8ZdGJb
 i2hIhpau4NEJZ2I5TDCZ8ku93pYNqIj85Te6O5zGZCkq1r7JCy3E9WEtka6T5S5FIFy+3mSTzrZ
 esldH5GDwc9OfMIaE8in8Lmxwbk7j8dOoYjLHUzDo6wxz2F19NxMHBpm9kiHWh14f1nHbIqmJjC
 UWYGHtZ0yh0ou3d9YXyl3gbsP36XlG1eGgi
X-Received: by 2002:a05:600c:4589:b0:490:50e8:45c3 with SMTP id
 5b1f17b1804b1-4909c028fccmr45247575e9.0.1780050114508; 
 Fri, 29 May 2026 03:21:54 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1049f8sm11349445e9.18.2026.05.29.03.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 03:21:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 29 May 2026 12:21:44 +0200
Message-ID: <20260529102144.1446114-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780050115; x=1780654915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bS1J1VlmYQAfyJmAhuyQOlncCnuTeoibabPfukoGDBM=;
 b=KYvm73ecf4VqvMP78jbIv9Z+JG++aUXTLLNlAuR1c7fZ+k2z5U0YcUfuFmHRE/a7xr
 7YZguF+1T/Xvnf3mJ91T9gaBB3JocQwE1QNh5ZQdylDKZzLd+GfjHZAgzcaJWhaeIq4N
 /s+4psEiYAJ2nwOf9tnzrUlrhkBXGwgjpJwyg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KYvm73ec
Subject: [Buildroot] [RFC v2] support/testing: generate runtime test jobs
 with runner tags
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GitLab offers the following machine types for hosted runners on Linux
x86-64 [1]. Using a lager runner increase the "Cost factor" [2]:

Runner Tag                                             vCPUs   Memory  Storage  Cost factor
saas-linux-small-amd64 (default)                           2     8 GB    30 GB     1
saas-linux-medium-amd64                                    4    16 GB    50 GB     2
saas-linux-large-amd64 (Premium and Ultimate only)         8    32 GB   100 GB     3
saas-linux-xlarge-amd64 (Premium and Ultimate only)       16    64 GB   200 GB     6
saas-linux-2xlarge-amd64 (Premium and Ultimate only)      32   128 GB   200 GB    12

Compute minute consumed by a job is calculated by:

  Job duration / 60 * Cost factor

(Job duration: The time, in seconds, that a job took to run, not
including time spent in the created or pending statuses.)

Thanks to GitLab OSS program [3], Buildroot benefit a free Ultimate
subscription and can use Gitlab shared runners tagged with
saas-linux-{large, xlarge, 2xlarge}-amd64.

For opensource project, the Cost factor is reduced by 0,5 (1 minute per
2 minutes of job time).

In order to use one of thoses tags in Buildroot Gitlab-CI jobs, we have
to classify all tests by resource requirement.

First we introduce some new templates used to add the corresponding
runner tag to a runtime test job (reuse the Gitlab terminology).

    .runner-{small,medium,large,xlarge,2xlarge}

Most of our tests are fast (checkpackage, test_external_bootlin...), so
saas-linux-small-amd64 runner tag is enough. Since untagged jobs run on
the small Linux x86-64 runner [4], we don't want to use Gitlab shared
runners if the runner tag is missing. Indeed, shared Gitlab-CI runners
time out after 3 hours but some of our tests requires more time to
finish. Some tests may also requires more storage due to download
sources and generated files, so such test must use a runner that
provide more storage.

Gitlab runners owned by the Buildroot project should still run any
jobs, so a specific runner tag "buildroot-runner" is used to allow
running a job such runners. The "buildroot-runner" tag is used in
addition to Gitlab ones to run a job on the Buildroot runner or on a
shared Gitalb-CI runner.

If a test can't be executed by any shared Gitlab-CI runners, we have
to use a runner owned by the Buildroot project. In this case we have
to use a specific template "buildroot-runner-only".

The proposed classification is based on a previous pipeline analysis
[5]:

  - Tests lasting more than 3 hours will use 2xlarge runners.
  - Tests lasting more than 2 hours will use xlarge runners.
  - Tests lasting more than 1 hours will use large runners.
  - Tests building a kernel or a toolchain will use medium runners.
  - All other tests will use small runners when posible.

CI minute cost estimate:

tests.package.test_clang.TestClangCompilerRT.test_run lasts 4h25 on the
Buildroot runner. If we this duration for 2xlarge runners, the CI
minute consumed would be:

  (265 / 60) * 12 * 0.5 = 26,5

With 6 jobs using a 2xlarge runners we used ~160 CI minutes.

tests.package.test_kmscube.TestKmsCube.test_run list 2h04 on the
Buildroot runner. If we	this duration for xlarge runners, the CI
minute consumed would be:

  (124 / 60) * 6 * 0.5 = 6,2

With 4 jobs using a xlarge runners we used ~37 CI minutes.

tests.package.test_weston.TestWeston.test_run last 1h15 on th
Buildroot runner. If we this duration for large runners, the CI
minute consumed would be:

  (75 / 60) * 3 * 0.5 = 1.87

With 28 jobs using a large runners we used ~53 CI minutes.

tests.package.test_gstreamer1.TestGstreamer1.test_run last 46min on the
Buildroot runner. If we this duration for large runners, the CI
minute consumed would be:

  (46 / 60) * 2 * 0.5 = 0.76

With 31 jobs using a medium runners we used ~24 CI minutes.

tests.package.test_python.TestPython3Py.test_run last 13min on the
Buildroot runner. If we this duration for large runners, the CI
minute consumed would be:

  (13 / 60) * 1 * 0.5 = 0.1

With 691 jobs using a medium runners we used ~69 CI minutes.

In total, one pipeline for the runtime tests cost ~350 CI minutes.

We run such pipeline once a week (on Monday), one for each Buildroot
releases every 3 month, one for each stable and LTS release per month,
and one for each release candidate (3).

Worst case (realse month):
(4 weeks + 1 release + 1 stable + 1 LTS + 3 release candidate) * 350 CI
minutes: 3500 CI minutes / 50000.

So we should be able to run our pipeline without exhausting our CI
minutes credit.

Add a comment next to the test class to provide the runner tag.
This runner tag is retrieved when generating the
generated-gitlab-ci.yml file used to create the child pipeline where
the runtime test jobs are executed.

We use the list of runtime tests returned by node2:

  "tests.boot.test_optee_os.TestOptee.test_run"

We convert each element of this list to get the path to the test source
file and the name of the test:

  "./support/testing/tests/boot/test_optee_os.py"

  TestOptee

With that, we can grep into the test source file to retrieve the runner
tag placed one line above the test class:

  # Gitlab-runner: small
  class TestOptee(infra.basetest.BRTest):

Once the runner tag retrieved, it's used to use the corresponding
runner template to the runtime test job:

  tests.boot.test_optee_os.TestOptee.test_run: { extends: [ .runtime_test_base, .runner-small ]}

[1] https://docs.gitlab.com/ci/runners/hosted_runners/linux/#machine-types-available-for-linux---x86-64
[2] https://docs.gitlab.com/ci/pipelines/compute_minutes/#cost-factors
    https://docs.gitlab.com/ci/pipelines/compute_minutes/#compute-usage-calculation
    https://docs.gitlab.com/ci/pipelines/compute_minutes/#cost-factors-of-hosted-runners-for-gitlabcom
[3] https://gitlab.com/buildroot.org/gitlab-oss
[4] https://docs.gitlab.com/ci/runners/hosted_runners/#gitlabcom-hosted-runner-workflow
[5] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2416603721

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Note: When enabled, Gitlab Shared runner will be used by pipeline
      generated from the master branch and from all active stable
      branches. So this commit must be backported to all active
      stable branches first. (check if there is any missing runner
      tag).

v2:
  Rework based on Arnout review:
  - Use Gitlab terminology (small,medium,large...)
  - Add a comment next to the test class to provide the runner tag.
    (python nose2 can't export anything else that the list of tests
    and using a separate file (json) would be a burden to maintain).
  - Retrieve the runner tag when generating the generated-gitlab-ci.yml
    file used to create the child pipeline where the runtime test jobs
    are executed.
  - Rework the commit log
---
 support/misc/gitlab-ci.yml.in                 |  29 +++
 support/scripts/generate-gitlab-ci-yml        |  13 +-
 support/testing/tests/boot/test_atf.py        |   1 +
 support/testing/tests/boot/test_edk2.py       |   7 +
 support/testing/tests/boot/test_grub.py       |   4 +
 support/testing/tests/boot/test_optee_os.py   |   1 +
 support/testing/tests/boot/test_syslinux.py   |   4 +
 support/testing/tests/core/test_bad_arch.py   |   1 +
 .../tests/core/test_file_capabilities.py      |   1 +
 support/testing/tests/core/test_hardening.py  |   6 +
 .../testing/tests/core/test_post_scripts.py   |   1 +
 .../testing/tests/core/test_root_password.py  |   1 +
 .../testing/tests/core/test_rootfs_overlay.py |   1 +
 support/testing/tests/core/test_selinux.py    |   5 +
 support/testing/tests/core/test_timezone.py   |   3 +
 support/testing/tests/download/test_git.py    |   2 +
 .../testing/tests/download/test_gitforge.py   |   2 +
 support/testing/tests/download/test_ssh.py    |   2 +
 support/testing/tests/fs/test_btrfs.py        |   1 +
 support/testing/tests/fs/test_cpio.py         |   7 +
 support/testing/tests/fs/test_erofs.py        |   1 +
 support/testing/tests/fs/test_ext.py          |   3 +
 support/testing/tests/fs/test_f2fs.py         |   1 +
 support/testing/tests/fs/test_iso9660.py      |   6 +
 support/testing/tests/fs/test_jffs2.py        |   1 +
 support/testing/tests/fs/test_oci.py          |   1 +
 support/testing/tests/fs/test_squashfs.py     |   3 +
 support/testing/tests/fs/test_ubi.py          |   1 +
 support/testing/tests/fs/test_xfs.py          |   1 +
 support/testing/tests/fs/test_yaffs2.py       |   1 +
 support/testing/tests/init/test_busybox.py    |   4 +
 support/testing/tests/init/test_none.py       |   1 +
 support/testing/tests/init/test_openrc.py     |   3 +
 support/testing/tests/init/test_systemd.py    |  23 ++
 .../tests/init/test_systemd_selinux.py        |   2 +
 support/testing/tests/package/test_4th.py     |   1 +
 support/testing/tests/package/test_acl.py     |   1 +
 support/testing/tests/package/test_acpica.py  |   1 +
 support/testing/tests/package/test_aichat.py  |   1 +
 support/testing/tests/package/test_apache.py  |   1 +
 support/testing/tests/package/test_atftp.py   |   1 +
 support/testing/tests/package/test_atop.py    |   1 +
 support/testing/tests/package/test_attr.py    |   1 +
 support/testing/tests/package/test_audit.py   |   1 +
 support/testing/tests/package/test_avocado.py |   1 +
 support/testing/tests/package/test_bash.py    |   1 +
 support/testing/tests/package/test_bat.py     |   1 +
 support/testing/tests/package/test_bats.py    |   1 +
 support/testing/tests/package/test_bc.py      |   1 +
 support/testing/tests/package/test_bcc.py     |   1 +
 support/testing/tests/package/test_bitcoin.py |   1 +
 .../testing/tests/package/test_bmap_tools.py  |   2 +
 support/testing/tests/package/test_brotli.py  |   1 +
 .../testing/tests/package/test_btrfs_progs.py |   1 +
 support/testing/tests/package/test_bzip2.py   |   1 +
 support/testing/tests/package/test_clang.py   |   1 +
 support/testing/tests/package/test_connman.py |   1 +
 .../testing/tests/package/test_coremark.py    |   1 +
 support/testing/tests/package/test_crudini.py |   1 +
 .../testing/tests/package/test_cryptsetup.py  |   1 +
 .../testing/tests/package/test_ddrescue.py    |   1 +
 .../testing/tests/package/test_dieharder.py   |   1 +
 .../package/test_distribution_registry.py     |   1 +
 .../testing/tests/package/test_dmidecode.py   |   1 +
 .../tests/package/test_docker_compose.py      |   2 +
 .../testing/tests/package/test_dos2unix.py    |   1 +
 .../testing/tests/package/test_dosfstools.py  |   1 +
 support/testing/tests/package/test_dpdk.py    |   1 +
 .../testing/tests/package/test_dropbear.py    |   1 +
 support/testing/tests/package/test_dtbocfg.py |   1 +
 support/testing/tests/package/test_dtc.py     |   1 +
 support/testing/tests/package/test_dust.py    |   1 +
 support/testing/tests/package/test_ed.py      |   1 +
 support/testing/tests/package/test_ethtool.py |   1 +
 .../testing/tests/package/test_execline.py    |   1 +
 .../testing/tests/package/test_exfatprogs.py  |   1 +
 support/testing/tests/package/test_file.py    |   1 +
 .../testing/tests/package/test_firewalld.py   |   2 +
 support/testing/tests/package/test_flac.py    |   1 +
 .../testing/tests/package/test_fluidsynth.py  |   1 +
 support/testing/tests/package/test_flutter.py |   1 +
 support/testing/tests/package/test_fping.py   |   1 +
 support/testing/tests/package/test_fwts.py    |   1 +
 support/testing/tests/package/test_gawk.py    |   1 +
 support/testing/tests/package/test_gdb.py     |   5 +
 .../testing/tests/package/test_ghostscript.py |   1 +
 support/testing/tests/package/test_git.py     |   1 +
 .../tests/package/test_glslsandbox_player.py  |   1 +
 support/testing/tests/package/test_glxinfo.py |   1 +
 support/testing/tests/package/test_gnupg2.py  |   1 +
 support/testing/tests/package/test_gnuplot.py |   1 +
 .../testing/tests/package/test_gnuradio.py    |   1 +
 support/testing/tests/package/test_go.py      |   2 +
 support/testing/tests/package/test_gpsd.py    |   1 +
 .../testing/tests/package/test_gst1_python.py |   1 +
 .../testing/tests/package/test_gstreamer1.py  |   1 +
 .../tests/package/test_gumbo_parser.py        |   1 +
 support/testing/tests/package/test_gzip.py    |   1 +
 support/testing/tests/package/test_highway.py |   1 +
 support/testing/tests/package/test_hwloc.py   |   1 +
 .../testing/tests/package/test_hyperfine.py   |   1 +
 support/testing/tests/package/test_iozone.py  |   1 +
 support/testing/tests/package/test_iperf.py   |   1 +
 support/testing/tests/package/test_iperf3.py  |   1 +
 .../testing/tests/package/test_iproute2.py    |   1 +
 .../testing/tests/package/test_iptables.py    |   1 +
 support/testing/tests/package/test_iputils.py |   1 +
 support/testing/tests/package/test_ipython.py |   1 +
 .../testing/tests/package/test_jailhouse.py   |   1 +
 support/testing/tests/package/test_jq.py      |   1 +
 support/testing/tests/package/test_kexec.py   |   1 +
 support/testing/tests/package/test_kmod.py    |   1 +
 support/testing/tests/package/test_kmscube.py |   1 +
 support/testing/tests/package/test_kvmtool.py |   1 +
 support/testing/tests/package/test_lame.py    |   1 +
 support/testing/tests/package/test_less.py    |   1 +
 .../testing/tests/package/test_libcamera.py   |   1 +
 support/testing/tests/package/test_libcurl.py |   1 +
 .../testing/tests/package/test_libftdi1.py    |   1 +
 .../testing/tests/package/test_libgpgme.py    |   1 +
 .../package/test_libiio_bindings_python.py    |   1 +
 support/testing/tests/package/test_libjxl.py  |   1 +
 support/testing/tests/package/test_libldns.py |   1 +
 .../testing/tests/package/test_libshdata.py   |   1 +
 .../testing/tests/package/test_lighttpd.py    |   1 +
 support/testing/tests/package/test_links.py   |   1 +
 .../testing/tests/package/test_llama_cpp.py   |   1 +
 support/testing/tests/package/test_lpeg.py    |   2 +
 support/testing/tests/package/test_lrzip.py   |   1 +
 support/testing/tests/package/test_lrzsz.py   |   1 +
 support/testing/tests/package/test_lsof.py    |   1 +
 .../testing/tests/package/test_lsqlite3.py    |   2 +
 .../tests/package/test_ltp_testsuite.py       |   1 +
 support/testing/tests/package/test_ltrace.py  |   1 +
 support/testing/tests/package/test_lua.py     |   3 +
 .../testing/tests/package/test_lua_argon2.py  |   2 +
 .../testing/tests/package/test_lua_augeas.py  |   2 +
 .../testing/tests/package/test_lua_cffi.py    |   1 +
 .../testing/tests/package/test_lua_cqueues.py |   2 +
 .../testing/tests/package/test_lua_curl.py    |   2 +
 support/testing/tests/package/test_lua_gd.py  |   2 +
 .../testing/tests/package/test_lua_http.py    |   2 +
 .../testing/tests/package/test_lua_inotify.py |   2 +
 .../testing/tests/package/test_lua_lgdbm.py   |   1 +
 .../tests/package/test_lua_lightningmdb.py    |   1 +
 .../tests/package/test_lua_lrexlib_pcre2.py   |   2 +
 .../testing/tests/package/test_lua_lunix.py   |   2 +
 .../testing/tests/package/test_lua_lyaml.py   |   2 +
 .../tests/package/test_lua_periphery.py       |   2 +
 .../testing/tests/package/test_lua_sdl2.py    |   2 +
 .../testing/tests/package/test_lua_utf8.py    |   2 +
 .../testing/tests/package/test_lua_zlib.py    |   2 +
 .../testing/tests/package/test_luaexpat.py    |   2 +
 .../tests/package/test_luafilesystem.py       |   2 +
 support/testing/tests/package/test_lualdap.py |   2 +
 support/testing/tests/package/test_luaossl.py |   2 +
 .../testing/tests/package/test_luaposix.py    |   2 +
 support/testing/tests/package/test_luasec.py  |   2 +
 .../testing/tests/package/test_luasocket.py   |   2 +
 .../testing/tests/package/test_luasyslog.py   |   2 +
 support/testing/tests/package/test_luvi.py    |   1 +
 support/testing/tests/package/test_lvm2.py    |   1 +
 support/testing/tests/package/test_lxc.py     |   1 +
 support/testing/tests/package/test_lynis.py   |   1 +
 support/testing/tests/package/test_lz4.py     |   1 +
 support/testing/tests/package/test_lzip.py    |   1 +
 support/testing/tests/package/test_lzlib.py   |   1 +
 support/testing/tests/package/test_lzop.py    |   1 +
 support/testing/tests/package/test_make.py    |   1 +
 support/testing/tests/package/test_mariadb.py |   1 +
 support/testing/tests/package/test_mawk.py    |   1 +
 support/testing/tests/package/test_mdadm.py   |   1 +
 .../testing/tests/package/test_memcached.py   |   1 +
 support/testing/tests/package/test_mender.py  |   3 +
 support/testing/tests/package/test_mesa3d.py  |   1 +
 .../testing/tests/package/test_micropython.py |   1 +
 .../testing/tests/package/test_mosquitto.py   |   1 +
 .../testing/tests/package/test_msr_tools.py   |   1 +
 support/testing/tests/package/test_mtd.py     |   1 +
 support/testing/tests/package/test_mtools.py  |   1 +
 support/testing/tests/package/test_mtr.py     |   1 +
 support/testing/tests/package/test_ncdu.py    |   1 +
 support/testing/tests/package/test_ndctl.py   |   1 +
 support/testing/tests/package/test_netcat.py  |   1 +
 support/testing/tests/package/test_netdata.py |   1 +
 support/testing/tests/package/test_netsnmp.py |   1 +
 .../testing/tests/package/test_nftables.py    |   2 +
 .../tests/package/test_nginx_modsecurity.py   |   1 +
 support/testing/tests/package/test_ngrep.py   |   1 +
 support/testing/tests/package/test_nmap.py    |   1 +
 support/testing/tests/package/test_nodejs.py  |   3 +
 support/testing/tests/package/test_ntp.py     |   1 +
 support/testing/tests/package/test_nu.py      |   1 +
 support/testing/tests/package/test_numactl.py |   1 +
 .../tests/package/test_oath_toolkit.py        |   1 +
 support/testing/tests/package/test_octave.py  |   1 +
 .../testing/tests/package/test_openblas.py    |   1 +
 support/testing/tests/package/test_openjdk.py |   1 +
 support/testing/tests/package/test_openocd.py |   1 +
 support/testing/tests/package/test_openssh.py |   2 +
 support/testing/tests/package/test_opkg.py    |   1 +
 .../testing/tests/package/test_opus_tools.py  |   1 +
 support/testing/tests/package/test_parted.py  |   1 +
 support/testing/tests/package/test_patch.py   |   1 +
 .../testing/tests/package/test_pciutils.py    |   1 +
 .../testing/tests/package/test_perftest.py    |   1 +
 support/testing/tests/package/test_perl.py    |   2 +
 .../tests/package/test_perl_class_load.py     |   1 +
 .../tests/package/test_perl_dbd_mysql.py      |   1 +
 .../tests/package/test_perl_encode_detect.py  |   1 +
 .../tests/package/test_perl_gdgraph.py        |   1 +
 .../tests/package/test_perl_html_parser.py    |   1 +
 .../package/test_perl_io_socket_multicast.py  |   1 +
 .../tests/package/test_perl_io_socket_ssl.py  |   1 +
 .../tests/package/test_perl_libwww_perl.py    |   1 +
 .../package/test_perl_lwp_protocol_https.py   |   1 +
 .../tests/package/test_perl_mail_dkim.py      |   1 +
 .../testing/tests/package/test_perl_x10.py    |   1 +
 .../tests/package/test_perl_xml_libxml.py     |   1 +
 .../testing/tests/package/test_php_apcu.py    |   1 +
 support/testing/tests/package/test_php_lua.py |   2 +
 support/testing/tests/package/test_php_pam.py |   1 +
 .../tests/package/test_php_pecl_dbus.py       |   1 +
 support/testing/tests/package/test_pigz.py    |   1 +
 support/testing/tests/package/test_pixz.py    |   1 +
 support/testing/tests/package/test_podman.py  |   5 +
 support/testing/tests/package/test_polkit.py  |   2 +
 .../testing/tests/package/test_postgresql.py  |   1 +
 support/testing/tests/package/test_pppd.py    |   1 +
 support/testing/tests/package/test_proj.py    |   1 +
 support/testing/tests/package/test_prosody.py |   2 +
 support/testing/tests/package/test_pv.py      |   1 +
 support/testing/tests/package/test_python.py  |   3 +
 .../tests/package/test_python_aexpect.py      |   1 +
 .../tests/package/test_python_apscheduler.py  |   1 +
 .../testing/tests/package/test_python_argh.py |   1 +
 .../tests/package/test_python_asn1crypto.py   |   1 +
 .../tests/package/test_python_attrs.py        |   1 +
 .../tests/package/test_python_augeas.py       |   1 +
 .../tests/package/test_python_autobahn.py     |   1 +
 .../tests/package/test_python_automat.py      |   1 +
 .../testing/tests/package/test_python_avro.py |   1 +
 .../tests/package/test_python_bitstring.py    |   1 +
 .../tests/package/test_python_boto3.py        |   1 +
 .../tests/package/test_python_botocore.py     |   1 +
 .../testing/tests/package/test_python_can.py  |   1 +
 .../testing/tests/package/test_python_cbor.py |   1 +
 .../tests/package/test_python_click.py        |   1 +
 .../tests/package/test_python_cloudpickle.py  |   1 +
 .../tests/package/test_python_colorzero.py    |   1 +
 .../tests/package/test_python_constantly.py   |   1 +
 .../tests/package/test_python_construct.py    |   1 +
 .../testing/tests/package/test_python_crc.py  |   1 +
 .../tests/package/test_python_crccheck.py     |   1 +
 .../tests/package/test_python_cryptography.py |   1 +
 .../tests/package/test_python_dbus_fast.py    |   1 +
 .../tests/package/test_python_dbus_next.py    |   1 +
 .../tests/package/test_python_dicttoxml2.py   |   1 +
 .../tests/package/test_python_diskcache.py    |   1 +
 .../tests/package/test_python_distro.py       |   1 +
 .../tests/package/test_python_django.py       |   1 +
 .../tests/package/test_python_dtschema.py     |   1 +
 .../tests/package/test_python_evdev.py        |   1 +
 .../test_python_farama_notifications.py       |   1 +
 .../tests/package/test_python_fastapi.py      |   1 +
 .../tests/package/test_python_flask.py        |   1 +
 .../package/test_python_flask_expects_json.py |   1 +
 .../testing/tests/package/test_python_fs.py   |   1 +
 .../testing/tests/package/test_python_git.py  |   1 +
 .../tests/package/test_python_gitdb2.py       |   1 +
 .../tests/package/test_python_gnupg.py        |   1 +
 .../tests/package/test_python_gobject.py      |   1 +
 .../tests/package/test_python_gpiozero.py     |   1 +
 .../tests/package/test_python_gymnasium.py    |   1 +
 .../testing/tests/package/test_python_hid.py  |   1 +
 .../testing/tests/package/test_python_hkdf.py |   1 +
 .../package/test_python_humanfriendly.py      |   1 +
 .../tests/package/test_python_hwdata.py       |   1 +
 .../tests/package/test_python_incremental.py  |   1 +
 .../tests/package/test_python_iptables.py     |   1 +
 .../testing/tests/package/test_python_jc.py   |   1 +
 .../tests/package/test_python_jmespath.py     |   1 +
 .../package/test_python_magic_wormhole.py     |   1 +
 .../testing/tests/package/test_python_mako.py |   2 +
 .../tests/package/test_python_memray.py       |   1 +
 .../tests/package/test_python_midiutil.py     |   1 +
 .../package/test_python_minimalmodbus.py      |   1 +
 .../tests/package/test_python_ml_dtypes.py    |   1 +
 .../tests/package/test_python_mpmath.py       |   1 +
 .../tests/package/test_python_msgpack.py      |   1 +
 .../tests/package/test_python_munch.py        |   1 +
 .../package/test_python_networkmanager_goi.py |   1 +
 .../tests/package/test_python_paho_mqtt.py    |   1 +
 .../tests/package/test_python_passlib.py      |   1 +
 .../tests/package/test_python_pathspec.py     |   1 +
 .../tests/package/test_python_pexpect.py      |   1 +
 .../tests/package/test_python_pyalsa.py       |   1 +
 .../tests/package/test_python_pybind.py       |   1 +
 .../tests/package/test_python_pydantic.py     |   1 +
 .../package/test_python_pydantic_settings.py  |   1 +
 .../tests/package/test_python_pyfatfs.py      |   1 +
 .../tests/package/test_python_pymupdf.py      |   1 +
 .../tests/package/test_python_pynacl.py       |   1 +
 .../tests/package/test_python_pyndiff.py      |   1 +
 .../tests/package/test_python_pyproj.py       |   1 +
 .../tests/package/test_python_pyqt5.py        |   1 +
 .../tests/package/test_python_pyroute2.py     |   1 +
 .../tests/package/test_python_pysmb.py        |   1 +
 .../tests/package/test_python_pytest.py       |   1 +
 .../package/test_python_pytest_asyncio.py     |   1 +
 .../tests/package/test_python_pyusb.py        |   1 +
 .../tests/package/test_python_pyyaml.py       |   1 +
 .../tests/package/test_python_qrcode.py       |   1 +
 .../tests/package/test_python_requests.py     |   1 +
 .../tests/package/test_python_rpi_gpio.py     |   1 +
 .../testing/tests/package/test_python_rsa.py  |   1 +
 .../tests/package/test_python_rtoml.py        |   1 +
 .../tests/package/test_python_ruamel_yaml.py  |   1 +
 .../tests/package/test_python_s3transfer.py   |   1 +
 .../tests/package/test_python_scipy.py        |   1 +
 .../testing/tests/package/test_python_scp.py  |   1 +
 .../tests/package/test_python_sdbus.py        |   1 +
 .../package/test_python_sdbus_modemmanager.py |   1 +
 .../test_python_sdbus_networkmanager.py       |   1 +
 .../package/test_python_sdbus_systemd.py      |   1 +
 .../tests/package/test_python_segno.py        |   1 +
 .../tests/package/test_python_serial.py       |   1 +
 .../package/test_python_service_identity.py   |   1 +
 .../tests/package/test_python_smmap2.py       |   1 +
 .../tests/package/test_python_spake2.py       |   1 +
 .../tests/package/test_python_sympy.py        |   1 +
 .../tests/package/test_python_tftpy.py        |   2 +
 .../tests/package/test_python_transitions.py  |   1 +
 .../testing/tests/package/test_python_treq.py |   1 +
 .../tests/package/test_python_twisted.py      |   1 +
 .../tests/package/test_python_txaio.py        |   1 +
 .../tests/package/test_python_txtorcon.py     |   1 +
 .../tests/package/test_python_tzlocal.py      |   1 +
 .../tests/package/test_python_ubjson.py       |   1 +
 .../test_python_unittest_xml_reporting.py     |   1 +
 .../tests/package/test_python_urllib3.py      |   1 +
 .../tests/package/test_python_uvloop.py       |   1 +
 .../tests/package/test_python_varlink.py      |   1 +
 .../tests/package/test_python_waitress.py     |   1 +
 .../tests/package/test_python_whitenoise.py   |   1 +
 .../tests/package/test_python_xmodem.py       |   1 +
 .../tests/package/test_python_yamllint.py     |   1 +
 support/testing/tests/package/test_quazip.py  |   2 +
 .../testing/tests/package/test_rasdaemon.py   |   1 +
 .../testing/tests/package/test_rdma_core.py   |   1 +
 support/testing/tests/package/test_redis.py   |   1 +
 support/testing/tests/package/test_rings.py   |   2 +
 support/testing/tests/package/test_rrdtool.py |   1 +
 .../testing/tests/package/test_rt_tests.py    |   1 +
 support/testing/tests/package/test_ruby.py    |   1 +
 support/testing/tests/package/test_rust.py    |   3 +
 support/testing/tests/package/test_s6.py      |   1 +
 .../tests/package/test_s6_networking.py       |   1 +
 .../tests/package/test_s6_portable_utils.py   |   1 +
 support/testing/tests/package/test_s6_rc.py   |   1 +
 support/testing/tests/package/test_screen.py  |   1 +
 support/testing/tests/package/test_sed.py     |   1 +
 support/testing/tests/package/test_skopeo.py  |   1 +
 .../testing/tests/package/test_snagboot.py    |   1 +
 support/testing/tests/package/test_socat.py   |   1 +
 support/testing/tests/package/test_sox.py     |   1 +
 support/testing/tests/package/test_sqlite.py  |   1 +
 support/testing/tests/package/test_strace.py  |   1 +
 .../testing/tests/package/test_stress_ng.py   |   1 +
 support/testing/tests/package/test_sudo.py    |   1 +
 support/testing/tests/package/test_swipl.py   |   1 +
 .../testing/tests/package/test_syslog_ng.py   |   1 +
 support/testing/tests/package/test_tcl.py     |   1 +
 support/testing/tests/package/test_tcpdump.py |   1 +
 .../tests/package/test_tesseract_ocr.py       |   1 +
 support/testing/tests/package/test_tio.py     |   1 +
 support/testing/tests/package/test_tmux.py    |   1 +
 .../testing/tests/package/test_trace_cmd.py   |   1 +
 support/testing/tests/package/test_tree.py    |   1 +
 .../testing/tests/package/test_turbolua.py    |   1 +
 .../package/test_uboot_openssl_pkgconfig.py   |   1 +
 .../testing/tests/package/test_uboot_tools.py |   2 +
 support/testing/tests/package/test_unbound.py |   1 +
 support/testing/tests/package/test_usbip.py   |   1 +
 .../testing/tests/package/test_usbutils.py    |   1 +
 .../tests/package/test_vorbis_tools.py        |   1 +
 support/testing/tests/package/test_weston.py  |   1 +
 support/testing/tests/package/test_wget.py    |   1 +
 support/testing/tests/package/test_which.py   |   1 +
 support/testing/tests/package/test_wine.py    |   1 +
 support/testing/tests/package/test_xen.py     |   2 +
 .../testing/tests/package/test_xfsprogs.py    |   1 +
 support/testing/tests/package/test_xvisor.py  |   1 +
 support/testing/tests/package/test_xxhash.py  |   1 +
 support/testing/tests/package/test_xz.py      |   1 +
 support/testing/tests/package/test_z3.py      |   1 +
 support/testing/tests/package/test_zbar.py    |   1 +
 support/testing/tests/package/test_zchunk.py  |   1 +
 .../testing/tests/package/test_zerofree.py    |   1 +
 support/testing/tests/package/test_zfs.py     |   3 +
 support/testing/tests/package/test_zip.py     |   1 +
 support/testing/tests/package/test_zstd.py    |   1 +
 .../tests/toolchain/test_aarch64_64k.py       |   3 +
 .../testing/tests/toolchain/test_external.py  |   5 +
 .../tests/toolchain/test_external_arm.py      |   3 +
 .../tests/toolchain/test_external_bootlin.py  | 218 ++++++++++++++++++
 .../testing/tests/utils/test_check_package.py |   1 +
 .../tests/utils/test_get_developers.py        |   1 +
 408 files changed, 800 insertions(+), 2 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index ada36d0d60..d804e94400 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -5,6 +5,35 @@ stages:
 before_script:
   - git config --global --add safe.directory ${CI_PROJECT_DIR}
 
+.runner-small:
+    tags:
+        - buildroot-runner
+        - saas-linux-small-amd64
+
+.runner-medium:
+    tags:
+        - buildroot-runner
+        - saas-linux-medium-amd64
+
+.runner-large:
+    tags:
+        - buildroot-runner
+        - saas-linux-large-amd64
+
+.runner-xlarge:
+    tags:
+        - buildroot-runner
+        - saas-linux-xlarge-amd64
+
+.runner-2xlarge:
+    tags:
+        - buildroot-runner
+        - saas-linux-2xlarge-amd64
+
+.runner-buildroot-runner-only:
+    tags:
+        - buildroot-runner
+
 .check-check-package_base:
     stage: test
     script:
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2d922b9eb2..aaea0ac206 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -24,7 +24,7 @@ _EOF_
 gen_tests() {
     local -a basics defconfigs runtimes
     local do_basics do_defconfigs do_runtime do_testpkg
-    local defconfigs_ext cfg tst
+    local defconfigs_ext cfg runner tst
 
     basics=( check-package check-symbol DEVELOPERS package symbol )
 
@@ -133,7 +133,16 @@ gen_tests() {
 
     if ${do_runtime:-false}; then
         printf 'runtime_test_download: { extends: .runtime_test_download }\n'
-        printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
+        for test in "${runtimes[@]}"; do
+            test_file=$(echo "${test}" | sed 's/.test_run$//g' | sed -n 's/\(test_.*\)\..*$/\1/p' | tr '.' '/' | sed -e 's/^/.\/support\/testing\//' | sed -e 's/$/.py/')
+            test_name=$(echo "${test}" | sed 's/.test_run$//g' | sed 's/.*\.//')
+            runner=$(grep -C 1 "${test_name}" "${test_file}" | head -1 | sed -n 's/^.*# Gitlab-runner: \(.*\)/\1/p' ) || true
+            runner=${runner,,}
+            if [ -z "${runner}" ]; then
+                runner="buildroot-runner-only"
+            fi
+            printf '%s: { extends: [ .runtime_test_base, .runner-%s ]}\n' "${test}" "${runner}"
+        done
     fi
 
     if [ -n "${do_testpkg}" ]; then
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 02d0c74b84..02fed21ac0 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestATFAllwinner(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 8489e82860..7282f23711 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestEdk2(infra.basetest.BRTest):
     config = \
         """
@@ -75,6 +76,7 @@ class TestEdk2BuildBase(infra.basetest.BRTest):
                   flush=True)
 
 
+# Gitlab-runner: small
 class TestEdk2BuildArmVirtQemu(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """
@@ -86,6 +88,7 @@ class TestEdk2BuildArmVirtQemu(TestEdk2BuildBase):
         self.assertBinariesExist("QEMU_EFI.fd", "QEMU_VARS.fd")
 
 
+# Gitlab-runner: small
 class TestEdk2BuildArmVirtQemuKernel(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """
@@ -97,6 +100,7 @@ class TestEdk2BuildArmVirtQemuKernel(TestEdk2BuildBase):
         self.assertBinariesExist("QEMU_EFI.fd", "QEMU_VARS.fd")
 
 
+# Gitlab-runner: small
 class TestEdk2BuildArmSgi575(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """
@@ -108,6 +112,7 @@ class TestEdk2BuildArmSgi575(TestEdk2BuildBase):
         self.assertBinariesExist("BL33_AP_UEFI.fd")
 
 
+# Gitlab-runner: small
 class TestEdk2BuildArmVexpressFvpAarch64(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """
@@ -119,6 +124,7 @@ class TestEdk2BuildArmVexpressFvpAarch64(TestEdk2BuildBase):
         self.assertBinariesExist("FVP_AARCH64_EFI.fd")
 
 
+# Gitlab-runner: small
 class TestEdk2BuildQemuSbsa(TestEdk2BuildBase):
     # This configuration is not exactly identical to the configuration built
     # during TestEdk2, as we use the latest arm-trusted-firmware version, among
@@ -136,6 +142,7 @@ class TestEdk2BuildQemuSbsa(TestEdk2BuildBase):
         self.assertBinariesExist("SBSA_FLASH0.fd", "SBSA_FLASH1.fd", "fip.bin")
 
 
+# Gitlab-runner: small
 class TestEdk2BuildSolidrunArmada80x0mcbin(TestEdk2BuildBase):
     config = TestEdk2BuildBase.base_config + \
         """
diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index e873683b5a..c4b3e82a78 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGrubi386BIOS(infra.basetest.BRTest):
     config = \
         """
@@ -32,6 +33,7 @@ class TestGrubi386BIOS(infra.basetest.BRTest):
         self.emulator.login()
 
 
+# Gitlab-runner: large
 class TestGrubX8664EFI(infra.basetest.BRTest):
     config = \
         """
@@ -84,6 +86,7 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: large
 class TestGrubAArch64EFI(infra.basetest.BRTest):
     config = \
         """
@@ -125,6 +128,7 @@ class TestGrubAArch64EFI(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: large
 class TestGrubRiscV64EFI(infra.basetest.BRTest):
     scripts = [
         "board/qemu/post-image.sh",
diff --git a/support/testing/tests/boot/test_optee_os.py b/support/testing/tests/boot/test_optee_os.py
index 5f5cd17464..cdd22322f8 100644
--- a/support/testing/tests/boot/test_optee_os.py
+++ b/support/testing/tests/boot/test_optee_os.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOptee(infra.basetest.BRTest):
     # A custom configuration is needed to enable OP-TEE support in the
     # Kernel. This config is inspired from:
diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 17fe904263..87f7a33f76 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -33,6 +33,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
         """
 
 
+# Gitlab-runner: small
 class TestSysLinuxX86LegacyBios(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_toolchain_config + \
@@ -43,6 +44,7 @@ class TestSysLinuxX86LegacyBios(TestSysLinuxBase):
         pass
 
 
+# Gitlab-runner: small
 class TestSysLinuxX86EFI(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_toolchain_config + \
@@ -53,6 +55,7 @@ class TestSysLinuxX86EFI(TestSysLinuxBase):
         pass
 
 
+# Gitlab-runner: small
 class TestSysLinuxX86_64LegacyBios(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_64_toolchain_config + \
@@ -63,6 +66,7 @@ class TestSysLinuxX86_64LegacyBios(TestSysLinuxBase):
         pass
 
 
+# Gitlab-runner: small
 class TestSysLinuxX86_64EFI(TestSysLinuxBase):
     config = \
         TestSysLinuxBase.x86_64_toolchain_config + \
diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
index c96a7152af..5bd77c151a 100644
--- a/support/testing/tests/core/test_bad_arch.py
+++ b/support/testing/tests/core/test_bad_arch.py
@@ -2,6 +2,7 @@ import infra
 import infra.basetest
 
 
+# Gitlab-runner: small
 class DetectBadArchTest(infra.basetest.BRConfigTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG
     br2_external = [infra.filepath("tests/core/br2-external/detect-bad-arch")]
diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index f57a7cee69..2ad6164bc7 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestFileCapabilities(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 2daafbd883..6e2c210acc 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -28,6 +28,7 @@ class TestHardeningBase(infra.basetest.BRTest):
         return json.loads(ret)
 
 
+# Gitlab-runner: small
 class TestRelro(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
@@ -42,6 +43,7 @@ class TestRelro(TestHardeningBase):
             self.assertEqual(out[filepath]["pie"], "yes")
 
 
+# Gitlab-runner: small
 class TestRelroPartial(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
@@ -57,6 +59,7 @@ class TestRelroPartial(TestHardeningBase):
             self.assertEqual(out[filepath]["pie"], "no")
 
 
+# Gitlab-runner: small
 class TestSspNone(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
@@ -70,6 +73,7 @@ class TestSspNone(TestHardeningBase):
             self.assertEqual(out[filepath]["canary"], "no")
 
 
+# Gitlab-runner: small
 class TestSspStrong(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
@@ -83,6 +87,7 @@ class TestSspStrong(TestHardeningBase):
             self.assertEqual(out[filepath]["canary"], "yes")
 
 
+# Gitlab-runner: small
 class TestFortifyNone(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
@@ -96,6 +101,7 @@ class TestFortifyNone(TestHardeningBase):
             self.assertEqual(out[filepath]["fortified"], "0")
 
 
+# Gitlab-runner: small
 class TestFortifyConserv(TestHardeningBase):
     config = TestHardeningBase.config + \
         """
diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
index bc61f4af58..6e7a63483b 100644
--- a/support/testing/tests/core/test_post_scripts.py
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -4,6 +4,7 @@ import csv
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPostScripts(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/core/test_root_password.py b/support/testing/tests/core/test_root_password.py
index aefcd3605c..7040cc715c 100644
--- a/support/testing/tests/core/test_root_password.py
+++ b/support/testing/tests/core/test_root_password.py
@@ -3,6 +3,7 @@ import infra.basetest
 from crypt import crypt
 
 
+# Gitlab-runner: small
 class TestRootPassword(infra.basetest.BRTest):
     password = "foo"
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
index fedd40d8ac..ce10e05d50 100644
--- a/support/testing/tests/core/test_rootfs_overlay.py
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -8,6 +8,7 @@ def compare_file(file1, file2):
     return subprocess.call(["cmp", file1, file2])
 
 
+# Gitlab-runner: small
 class TestRootfsOverlay(infra.basetest.BRTest):
 
     rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index e72431211d..265c5ba2ef 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -19,6 +19,7 @@ class TestSELinuxInfra(infra.basetest.BRTest):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestSELinuxExtraModules(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
@@ -37,6 +38,7 @@ class TestSELinuxExtraModules(TestSELinuxInfra):
         self.assertEqual(out[2].strip(), "tor_t")
 
 
+# Gitlab-runner: small
 class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
@@ -51,6 +53,7 @@ class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
         self.assertEqual(out[2].strip(), "buildroot_test_t")
 
 
+# Gitlab-runner: small
 class TestSELinuxSetBooleans(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
@@ -69,6 +72,7 @@ class TestSELinuxSetBooleans(TestSELinuxInfra):
         self.assertEqual(bools["user_all_users_send_syslog"], "false")
 
 
+# Gitlab-runner: small
 class TestSELinuxCustomGit(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
@@ -81,6 +85,7 @@ class TestSELinuxCustomGit(TestSELinuxInfra):
         pass
 
 
+# Gitlab-runner: small
 class TestSELinuxPackage(TestSELinuxInfra):
     br2_external = [infra.filepath("tests/core/test_selinux/br2_external")]
     config = TestSELinuxInfra.config + \
diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index bfb9604f66..2f14660790 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -28,6 +28,7 @@ def boot_armv5_cpio(emulator, builddir):
     emulator.run("date -s @3600")
 
 
+# Gitlab-runner: small
 class TestNoTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -47,6 +48,7 @@ class TestNoTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "Universal")
 
 
+# Gitlab-runner: small
 class TestAllTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -67,6 +69,7 @@ class TestAllTimezone(infra.basetest.BRTest):
         self.assertEqual(tz[0].strip(), "CET")
 
 
+# Gitlab-runner: small
 class TestNonDefaultLimitedTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 0cbb74a061..b6b66fd4b9 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -55,6 +55,7 @@ class GitTestBase(infra.basetest.BRConfigTest):
                      env)
 
 
+# Gitlab-runner: small
 class TestGitHash(GitTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
 
@@ -69,6 +70,7 @@ class TestGitHash(GitTestBase):
         self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
+# Gitlab-runner: small
 class TestGitRefs(GitTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/git-refs")]
 
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index e1ac35ec67..ca35157cf1 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -31,6 +31,7 @@ class GitforgeTestBase(infra.basetest.BRConfigTest):
                      env)
 
 
+# Gitlab-runner: small
 class TestGitHub(GitforgeTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/github")]
 
@@ -40,6 +41,7 @@ class TestGitHub(GitforgeTestBase):
         self.check_download("github-release")
 
 
+# Gitlab-runner: small
 class TestGitLab(GitforgeTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/gitlab")]
 
diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
index 126002a355..15f26d96f6 100644
--- a/support/testing/tests/download/test_ssh.py
+++ b/support/testing/tests/download/test_ssh.py
@@ -48,6 +48,7 @@ BR2_BACKUP_SITE=""
                      env)
 
 
+# Gitlab-runner: small
 class TestSCP(SSHTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/ssh")]
 
@@ -55,6 +56,7 @@ class TestSCP(SSHTestBase):
         self.download_package("scp")
 
 
+# Gitlab-runner: small
 class TestSFTP(SSHTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/ssh")]
 
diff --git a/support/testing/tests/fs/test_btrfs.py b/support/testing/tests/fs/test_btrfs.py
index 90b868a955..f4b1bcd8c9 100644
--- a/support/testing/tests/fs/test_btrfs.py
+++ b/support/testing/tests/fs/test_btrfs.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBtrfs(infra.basetest.BRTest):
     kern_frag = \
         infra.filepath("tests/fs/test_btrfs/linux-btrfs.fragment")
diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 172af579bb..b3a7a79a38 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -15,6 +15,7 @@ def boot_img(emulator, builddir):
     return exit_code
 
 
+# Gitlab-runner: small
 class TestCpioFull(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -67,6 +68,7 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestCpioDracutUclibc(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
@@ -77,6 +79,7 @@ class TestCpioDracutUclibc(TestCpioDracutBase):
         self.check_dracut()
 
 
+# Gitlab-runner: small
 class TestCpioDracutGlibc(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
@@ -87,6 +90,7 @@ class TestCpioDracutGlibc(TestCpioDracutBase):
         self.check_dracut()
 
 
+# Gitlab-runner: small
 class TestCpioDracutMusl(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
@@ -97,6 +101,7 @@ class TestCpioDracutMusl(TestCpioDracutBase):
         self.check_dracut()
 
 
+# Gitlab-runner: small
 class TestCpioDracutUclibcMergedUsr(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
@@ -108,6 +113,7 @@ class TestCpioDracutUclibcMergedUsr(TestCpioDracutBase):
         self.check_dracut()
 
 
+# Gitlab-runner: small
 class TestCpioDracutGlibcMergedUsr(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
@@ -119,6 +125,7 @@ class TestCpioDracutGlibcMergedUsr(TestCpioDracutBase):
         self.check_dracut()
 
 
+# Gitlab-runner: small
 class TestCpioDracutMuslMergedUsr(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
         """
diff --git a/support/testing/tests/fs/test_erofs.py b/support/testing/tests/fs/test_erofs.py
index 47c75262e0..4a086cf9fd 100644
--- a/support/testing/tests/fs/test_erofs.py
+++ b/support/testing/tests/fs/test_erofs.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestErofs(infra.basetest.BRTest):
     kern_frag = \
         infra.filepath("tests/fs/test_erofs/linux-erofs.fragment")
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 7612ad2b30..fa8d10204b 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -37,6 +37,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
     return exit_code
 
 
+# Gitlab-runner: small
 class TestExt2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -58,6 +59,7 @@ class TestExt2(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestExt3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -78,6 +80,7 @@ class TestExt3(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestExt4(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index dee862a9e2..12d9a7d7c1 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -10,6 +10,7 @@ def dumpf2fs_getprop(out, prop):
             return fields[1].strip()
 
 
+# Gitlab-runner: small
 class TestF2FS(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index b2edcac460..9e30cc9432 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -40,6 +40,7 @@ def test_touch_file(emulator):
 # Grub 2
 
 
+# Gitlab-runner: small
 class TestIso9660Grub2External(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -60,6 +61,7 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -81,6 +83,7 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestIso9660Grub2Internal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -105,6 +108,7 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
 # Syslinux
 
 
+# Gitlab-runner: small
 class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -124,6 +128,7 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -144,6 +149,7 @@ class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index 1806bd7e3c..26ab384315 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -11,6 +11,7 @@ def jffs2dump_find_file(files_list, fname):
     return False
 
 
+# Gitlab-runner: small
 class TestJffs2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 38ed168b62..9ffe1b4122 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -3,6 +3,7 @@ import shutil
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOci(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 0ceb4cab58..924a77352b 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSquashfs(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -35,6 +36,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestSquashfsMinBlocksize(TestSquashfs):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -46,6 +48,7 @@ class TestSquashfsMinBlocksize(TestSquashfs):
     expected_blocksize_in_bytes = 4*1024
 
 
+# Gitlab-runner: small
 class TestSquashfsMaxBlocksize(TestSquashfs):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 564a436d42..f98c3bcf31 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestUbi(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/fs/test_xfs.py b/support/testing/tests/fs/test_xfs.py
index 7e4a617baf..dc1d018799 100644
--- a/support/testing/tests/fs/test_xfs.py
+++ b/support/testing/tests/fs/test_xfs.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestXfs(infra.basetest.BRTest):
     kern_frag = \
         infra.filepath("tests/fs/test_xfs/linux-xfs.fragment")
diff --git a/support/testing/tests/fs/test_yaffs2.py b/support/testing/tests/fs/test_yaffs2.py
index b60e90e660..f6f95a571a 100644
--- a/support/testing/tests/fs/test_yaffs2.py
+++ b/support/testing/tests/fs/test_yaffs2.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestYaffs2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         infra.basetest.MINIMAL_CONFIG + \
diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
index 3be4dea35f..6929022759 100644
--- a/support/testing/tests/init/test_busybox.py
+++ b/support/testing/tests/init/test_busybox.py
@@ -12,6 +12,7 @@ class InitSystemBusyboxBase(InitSystemBase):
         super(InitSystemBusyboxBase, self).check_init("/bin/busybox")
 
 
+# Gitlab-runner: small
 class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -25,6 +26,7 @@ class TestInitSystemBusyboxRo(InitSystemBusyboxBase):
         self.check_network("eth0", 1)
 
 
+# Gitlab-runner: small
 class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -37,6 +39,7 @@ class TestInitSystemBusyboxRw(InitSystemBusyboxBase):
         self.check_network("eth0", 1)
 
 
+# Gitlab-runner: small
 class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
@@ -51,6 +54,7 @@ class TestInitSystemBusyboxRoNet(InitSystemBusyboxBase):
         self.check_network("eth0")
 
 
+# Gitlab-runner: small
 class TestInitSystemBusyboxRwNet(InitSystemBusyboxBase):
     config = InitSystemBusyboxBase.config + \
         """
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index 5bfcc3d5c9..383b46afc2 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -4,6 +4,7 @@ import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
 
+# Gitlab-runner: small
 class TestInitSystemNone(InitSystemBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index a1eb8fe213..a1303e76e1 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -21,6 +21,7 @@ class InitSystemOpenrcBase(InitSystemBase):
         self.assertEqual(len(output), 0)
 
 
+# Gitlab-runner: small
 class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
     config = InitSystemOpenrcBase.config + \
         """
@@ -34,6 +35,7 @@ class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
         self.check_init()
 
 
+# Gitlab-runner: small
 class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
     config = InitSystemOpenrcBase.config + \
         """
@@ -46,6 +48,7 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
         self.check_init()
 
 
+# Gitlab-runner: small
 class TestInitSystemOpenrcMergedUsrFull(InitSystemOpenrcBase):
     config = InitSystemOpenrcBase.config + \
         """
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 893cc17408..51f5250129 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -65,6 +65,7 @@ class InitSystemSystemdBase(InitSystemBase):
         self.check_network("eth0")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -77,6 +78,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -88,6 +90,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -101,6 +104,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
     config = TestInitSystemSystemdRoIfupdown.config + \
         """
@@ -117,6 +121,7 @@ class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown)
         self.assertEqual(len(out), 1)
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
     config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
         """
@@ -124,6 +129,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupd
         """
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -136,6 +142,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
     config = TestInitSystemSystemdRwIfupdown.config + \
         """
@@ -152,6 +159,7 @@ class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown)
         self.assertEqual(len(out), 1)
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
     config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
         """
@@ -159,6 +167,7 @@ class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupd
         """
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -188,6 +197,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -257,6 +267,7 @@ class InitSystemSystemdBaseFactory():
         self.assertEqual(out[0], "foobar")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkdFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoNetworkd,
@@ -265,6 +276,7 @@ class TestInitSystemSystemdRoNetworkdFactory(
         TestInitSystemSystemdRoNetworkd.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdown,
@@ -273,6 +285,7 @@ class TestInitSystemSystemdRoIfupdownFactory(
         TestInitSystemSystemdRoIfupdown.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdownDbusbroker,
@@ -281,6 +294,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
         TestInitSystemSystemdRoIfupdownDbusbroker.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
@@ -289,6 +303,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
         TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoFullFactory(
     InitSystemSystemdBaseFactory,
     TestInitSystemSystemdRoFull,
@@ -348,6 +363,7 @@ class InitSystemSystemdBaseOverlayfs():
         self.assertEqual(out[0], "foobar")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoNetworkdOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoNetworkd,
@@ -356,6 +372,7 @@ class TestInitSystemSystemdRoNetworkdOverlayfs(
         TestInitSystemSystemdRoNetworkd.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdown,
@@ -364,6 +381,7 @@ class TestInitSystemSystemdRoIfupdownOverlayfs(
         TestInitSystemSystemdRoIfupdown.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdownDbusbroker,
@@ -372,6 +390,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
         TestInitSystemSystemdRoIfupdownDbusbroker.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
@@ -380,6 +399,7 @@ class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
         TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfs(
     InitSystemSystemdBaseOverlayfs,
     TestInitSystemSystemdRoFull,
@@ -388,6 +408,7 @@ class TestInitSystemSystemdRoFullOverlayfs(
         TestInitSystemSystemdRoFull.config
 
 
+# Gitlab-runner: medium
 class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
     @classmethod
     def gen_config(cls, overlaydir: str) -> str:
@@ -402,6 +423,7 @@ class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
         self.assertRunOk("grep '^other-var-backing-store /run/buildroot/mounts/var tmpfs' /proc/mounts")
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
     TestInitSystemSystemdRoFullOverlayfs,
     InitSystemSystemdBaseOverlayfsVarBacking,
@@ -415,6 +437,7 @@ class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
         self.check_var_mounted()
 
 
+# Gitlab-runner: medium
 class TestInitSystemSystemdRoFullOverlayfsVarBackingFstab(
     TestInitSystemSystemdRoFullOverlayfs,
     InitSystemSystemdBaseOverlayfsVarBacking,
diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index c3ed09d0f1..c22f2ae814 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -52,6 +52,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         self.assertEqual(out[0], "system_u:system_r:init_t\0")
 
 
+# Gitlab-runner: small
 class TestSELinuxSystemdExt4(TestSELinuxSystemd):
     config = TestSELinuxSystemd.config + \
         """
@@ -64,6 +65,7 @@ class TestSELinuxSystemdExt4(TestSELinuxSystemd):
         self.run_tests("ext4")
 
 
+# Gitlab-runner: small
 class TestSELinuxSystemdSquashfs(TestSELinuxSystemd):
     config = TestSELinuxSystemd.config + \
         """
diff --git a/support/testing/tests/package/test_4th.py b/support/testing/tests/package/test_4th.py
index c020c825b3..f785240ded 100644
--- a/support/testing/tests/package/test_4th.py
+++ b/support/testing/tests/package/test_4th.py
@@ -4,6 +4,7 @@ from math import sqrt
 import infra.basetest
 
 
+# Gitlab-runner: small
 class Test4th(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
index e4827c7bec..7d1a22a6a7 100644
--- a/support/testing/tests/package/test_acl.py
+++ b/support/testing/tests/package/test_acl.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAcl(infra.basetest.BRTest):
     # Note: this test requires a Kernel with a filesystem on /tmp
     # supporting ACLs. This is the case for the basetest reference
diff --git a/support/testing/tests/package/test_acpica.py b/support/testing/tests/package/test_acpica.py
index adfb93d504..c890a5c2b0 100644
--- a/support/testing/tests/package/test_acpica.py
+++ b/support/testing/tests/package/test_acpica.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAcpica(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
index 50c07f87dc..6465093279 100644
--- a/support/testing/tests/package/test_aichat.py
+++ b/support/testing/tests/package/test_aichat.py
@@ -5,6 +5,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestAiChat(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_aichat/rootfs-overlay")
diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
index f29f4e2524..d4091d259c 100644
--- a/support/testing/tests/package/test_apache.py
+++ b/support/testing/tests/package/test_apache.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestApache(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_atftp.py b/support/testing/tests/package/test_atftp.py
index 95e76c07cb..19ddfffe34 100644
--- a/support/testing/tests/package/test_atftp.py
+++ b/support/testing/tests/package/test_atftp.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAtftp(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 5a96684799..085ae504ce 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -17,6 +17,7 @@ BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 = \
     """
 
 
+# Gitlab-runner: small
 class TestAtop(infra.basetest.BRTest):
     config = BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 + \
         """
diff --git a/support/testing/tests/package/test_attr.py b/support/testing/tests/package/test_attr.py
index 1b43f7daf6..ff3b7c7e7d 100644
--- a/support/testing/tests/package/test_attr.py
+++ b/support/testing/tests/package/test_attr.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAttr(infra.basetest.BRTest):
     # Note: this test uses extended attributes (xattr). We use a ext4
     # rootfs (which fully supports xattrs). Note that tmpfs has
diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
index f68a4b6831..b8aa0eab33 100644
--- a/support/testing/tests/package/test_audit.py
+++ b/support/testing/tests/package/test_audit.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAudit(infra.basetest.BRTest):
     # This test needs a Kernel with the audit support (the builtin
     # test Kernel does not have this support). Since the audit support
diff --git a/support/testing/tests/package/test_avocado.py b/support/testing/tests/package/test_avocado.py
index 7e83c86464..47557b2a20 100644
--- a/support/testing/tests/package/test_avocado.py
+++ b/support/testing/tests/package/test_avocado.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestAvocado(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
index 7ec6e85ef9..4d76599bc0 100644
--- a/support/testing/tests/package/test_bash.py
+++ b/support/testing/tests/package/test_bash.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBash(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_bat.py b/support/testing/tests/package/test_bat.py
index 018d0e002f..d676111966 100644
--- a/support/testing/tests/package/test_bat.py
+++ b/support/testing/tests/package/test_bat.py
@@ -2,6 +2,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBat(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
             """
diff --git a/support/testing/tests/package/test_bats.py b/support/testing/tests/package/test_bats.py
index 5136484ebe..d387b693fc 100644
--- a/support/testing/tests/package/test_bats.py
+++ b/support/testing/tests/package/test_bats.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBats(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_bc.py b/support/testing/tests/package/test_bc.py
index 46e2612b93..06519d7cfc 100644
--- a/support/testing/tests/package/test_bc.py
+++ b/support/testing/tests/package/test_bc.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBc(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_bcc.py b/support/testing/tests/package/test_bcc.py
index 51f175a5b4..4126202c13 100644
--- a/support/testing/tests/package/test_bcc.py
+++ b/support/testing/tests/package/test_bcc.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: 2xlarge
 class TestBcc(infra.basetest.BRTest):
     # This test is using a Kernel >= 5.2, so it will use
     # CONFIG_IKHEADERS. Those Kernel headers are unpacked from
diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index a942504af4..1316d2634a 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -5,6 +5,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestBitcoin(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
index a179027633..f1d44495e1 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -45,6 +45,7 @@ class TestBmapTools(BRTest):
         self.assertRunOk(cmd, timeout=20)
 
 
+# Gitlab-runner: small
 class TestPy3BmapTools(TestBmapTools):
     __test__ = True
     config = TestBmapTools.config + \
@@ -53,6 +54,7 @@ class TestPy3BmapTools(TestBmapTools):
         """
 
 
+# Gitlab-runner: small
 class TestHostBmapTools(BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_brotli.py b/support/testing/tests/package/test_brotli.py
index 779b956cb3..1f637bb3a5 100644
--- a/support/testing/tests/package/test_brotli.py
+++ b/support/testing/tests/package/test_brotli.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestBrotli(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_btrfs_progs.py b/support/testing/tests/package/test_btrfs_progs.py
index a53efa9438..e9a4009290 100644
--- a/support/testing/tests/package/test_btrfs_progs.py
+++ b/support/testing/tests/package/test_btrfs_progs.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestBtrfsProgs(infra.basetest.BRTest):
     # This test needs a Kernel with btrfs support.
     kern_frag = \
diff --git a/support/testing/tests/package/test_bzip2.py b/support/testing/tests/package/test_bzip2.py
index 4b7ae8180f..6081d8a3d3 100644
--- a/support/testing/tests/package/test_bzip2.py
+++ b/support/testing/tests/package/test_bzip2.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestBzip2(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index bc44a5804a..9c1a95b49a 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -5,6 +5,7 @@ import infra.basetest
 FUZZ_TIMEOUT = 120
 
 
+# Gitlab-runner: 2xlarge
 class TestClangCompilerRT(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
     # Without this option the test fails due to insufficient address space for 64-bit allocator
diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
index 6fef95104c..3698f2d720 100644
--- a/support/testing/tests/package/test_connman.py
+++ b/support/testing/tests/package/test_connman.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestConnMan(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_coremark.py b/support/testing/tests/package/test_coremark.py
index 8bd2f32143..aeb92860ad 100644
--- a/support/testing/tests/package/test_coremark.py
+++ b/support/testing/tests/package/test_coremark.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestCoreMark(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
index 470a714eb6..b7e08ab85f 100644
--- a/support/testing/tests/package/test_crudini.py
+++ b/support/testing/tests/package/test_crudini.py
@@ -33,6 +33,7 @@ class TestCrudiniBase(TestPythonPackageBase):
         self.assertEqual(out, ['this-is-the-magic-value'])
 
 
+# Gitlab-runner: small
 class TestCrudiniPy3(TestCrudiniBase):
     __test__ = True
     config = TestCrudiniBase.config + \
diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
index e409ea93e6..d928487ec3 100644
--- a/support/testing/tests/package/test_cryptsetup.py
+++ b/support/testing/tests/package/test_cryptsetup.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestCryptSetup(infra.basetest.BRTest):
     # A specific configuration is needed for using cryptsetup:
     # - A kernel config fragment enables all the parts needed for
diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index bd34694737..d44d6d13aa 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDdrescue(infra.basetest.BRTest):
 
     # A specific configuration is needed for testing ddrescue:
diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
index de09b383b4..53bf908b55 100644
--- a/support/testing/tests/package/test_dieharder.py
+++ b/support/testing/tests/package/test_dieharder.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDieharder(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
index 35942db29c..d2c1c9adb1 100644
--- a/support/testing/tests/package/test_distribution_registry.py
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -3,6 +3,7 @@ import os
 import time
 
 
+# Gitlab-runner: large
 class TestDistributionRegistry(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
index 087075a7bb..8aacd6eaea 100644
--- a/support/testing/tests/package/test_dmidecode.py
+++ b/support/testing/tests/package/test_dmidecode.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDmidecode(infra.basetest.BRTest):
     # We use a x86_64 arch for this dmidecode test because aarch64
     # SMBIOS is not supported in non-UEFI use-cases (and using a UEFI
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index db7e50914c..ce253d0417 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -76,11 +76,13 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         self.python_docker_test()
 
 
+# Gitlab-runner: large
 class TestDockerComposeRunc(BaseTestDockerCompose):
     def test_run(self):
         self.do_test()
 
 
+# Gitlab-runner: large
 class TestDockerComposeCrun(BaseTestDockerCompose):
     config = BaseTestDockerCompose.config + """
         BR2_PACKAGE_CRUN=y
diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
index af5850ae3e..e1733266bd 100644
--- a/support/testing/tests/package/test_dos2unix.py
+++ b/support/testing/tests/package/test_dos2unix.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDos2Unix(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_dosfstools.py b/support/testing/tests/package/test_dosfstools.py
index f32ff81c01..6e378fd056 100644
--- a/support/testing/tests/package/test_dosfstools.py
+++ b/support/testing/tests/package/test_dosfstools.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestDosFsTools(infra.basetest.BRTest):
     # This test needs a Kernel with vfat and NLS support. The vfat
     # filesystem also needs character set conversion libraries, since
diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
index 6f55cddee8..e35a5c7021 100644
--- a/support/testing/tests/package/test_dpdk.py
+++ b/support/testing/tests/package/test_dpdk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDPDK(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index 2dd9070231..74da776f3d 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDropbear(infra.basetest.BRTest):
     passwd = "testpwd"
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
index 32f6229e25..33f777b606 100644
--- a/support/testing/tests/package/test_dtbocfg.py
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDtbocfg(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_dtc.py b/support/testing/tests/package/test_dtc.py
index 47a1d75916..4b4ab357f5 100644
--- a/support/testing/tests/package/test_dtc.py
+++ b/support/testing/tests/package/test_dtc.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDtc(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_dust.py b/support/testing/tests/package/test_dust.py
index 8243024981..e729b39184 100644
--- a/support/testing/tests/package/test_dust.py
+++ b/support/testing/tests/package/test_dust.py
@@ -2,6 +2,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestDust(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ed.py b/support/testing/tests/package/test_ed.py
index eee5f8c4fc..9ccc587138 100644
--- a/support/testing/tests/package/test_ed.py
+++ b/support/testing/tests/package/test_ed.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestEd(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ethtool.py b/support/testing/tests/package/test_ethtool.py
index 7a2627c6e9..291709018b 100644
--- a/support/testing/tests/package/test_ethtool.py
+++ b/support/testing/tests/package/test_ethtool.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestEthtool(infra.basetest.BRTest):
     # This ethtool test uses an emulated Intel e1000e adapted (which
     # is well supported by Qemu, the Kernel and ethtool). We are not
diff --git a/support/testing/tests/package/test_execline.py b/support/testing/tests/package/test_execline.py
index 15ff92d762..4695aa40bd 100644
--- a/support/testing/tests/package/test_execline.py
+++ b/support/testing/tests/package/test_execline.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestExecline(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_exfatprogs.py b/support/testing/tests/package/test_exfatprogs.py
index 1b0b117b00..f8f30040fc 100644
--- a/support/testing/tests/package/test_exfatprogs.py
+++ b/support/testing/tests/package/test_exfatprogs.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestExfatProgs(infra.basetest.BRTest):
     # This test needs a Kernel with exfat support.
     kern_frag = \
diff --git a/support/testing/tests/package/test_file.py b/support/testing/tests/package/test_file.py
index 84eadc5ead..6a05875d5b 100644
--- a/support/testing/tests/package/test_file.py
+++ b/support/testing/tests/package/test_file.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestFile(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
index 1093873b38..ae1dfa251a 100644
--- a/support/testing/tests/package/test_firewalld.py
+++ b/support/testing/tests/package/test_firewalld.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestFirewalldSystemd(infra.basetest.BRTest):
     """Build the kernel as firewalld requires several the nftable options."""
 
@@ -62,6 +63,7 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: large
 class TestFirewalldSysVInit(infra.basetest.BRTest):
     """Build the kernel as firewalld requires several nftable options."""
 
diff --git a/support/testing/tests/package/test_flac.py b/support/testing/tests/package/test_flac.py
index 9ee7bc1c0d..30e551a298 100644
--- a/support/testing/tests/package/test_flac.py
+++ b/support/testing/tests/package/test_flac.py
@@ -1,6 +1,7 @@
 from tests.package.test_audio_codec_base import TestAudioCodecBase
 
 
+# Gitlab-runner: small
 class TestFlac(TestAudioCodecBase):
     __test__ = True
     config = TestAudioCodecBase.config + \
diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
index 909c878b75..4fcff1ac65 100644
--- a/support/testing/tests/package/test_fluidsynth.py
+++ b/support/testing/tests/package/test_fluidsynth.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestFluidsynth(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
     # armv5 and based on qemu versatilepb which is limited to 256MB of
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 19406b7cb1..8b532dd2e0 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -5,6 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
+# Gitlab-runner: xlarge
 class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
index 507c4ce73b..505ace64b6 100644
--- a/support/testing/tests/package/test_fping.py
+++ b/support/testing/tests/package/test_fping.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestFping(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_fwts.py b/support/testing/tests/package/test_fwts.py
index a58f9ccb80..d482b1b91e 100644
--- a/support/testing/tests/package/test_fwts.py
+++ b/support/testing/tests/package/test_fwts.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestFwts(infra.basetest.BRTest):
     kernel_fragment = \
         infra.filepath("tests/package/test_fwts/linux-efi-test.fragment")
diff --git a/support/testing/tests/package/test_gawk.py b/support/testing/tests/package/test_gawk.py
index 7d737a9600..1a39f0575e 100644
--- a/support/testing/tests/package/test_gawk.py
+++ b/support/testing/tests/package/test_gawk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGawk(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 324052efdb..3413705935 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -27,6 +27,7 @@ class BaseGdb(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestGdbHostOnlyDefault(BaseGdb):
     config = \
         infra.basetest.MINIMAL_CONFIG + \
@@ -41,6 +42,7 @@ class TestGdbHostOnlyDefault(BaseGdb):
         self.verify_host_gdb()
 
 
+# Gitlab-runner: small
 class TestGdbHostOnlyAllFeatures(BaseGdb):
     config = \
         infra.basetest.MINIMAL_CONFIG + \
@@ -58,6 +60,7 @@ class TestGdbHostOnlyAllFeatures(BaseGdb):
         self.verify_host_gdb()
 
 
+# Gitlab-runner: small
 class TestGdbserverOnly(BaseGdb):
     config = \
         """
@@ -74,6 +77,7 @@ class TestGdbserverOnly(BaseGdb):
         self.verify_gdbserver()
 
 
+# Gitlab-runner: small
 class TestGdbFullTarget(BaseGdb):
     config = \
         """
@@ -91,6 +95,7 @@ class TestGdbFullTarget(BaseGdb):
         self.verify_gdb()
 
 
+# Gitlab-runner: small
 class TestGdbArc(BaseGdb):
     config = \
         """
diff --git a/support/testing/tests/package/test_ghostscript.py b/support/testing/tests/package/test_ghostscript.py
index 3c6c16ef2c..9d9f3e5876 100644
--- a/support/testing/tests/package/test_ghostscript.py
+++ b/support/testing/tests/package/test_ghostscript.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGhostscript(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_ghostscript/rootfs-overlay")
diff --git a/support/testing/tests/package/test_git.py b/support/testing/tests/package/test_git.py
index 878c4c8092..ae642882ad 100644
--- a/support/testing/tests/package/test_git.py
+++ b/support/testing/tests/package/test_git.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGit(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_glslsandbox_player.py b/support/testing/tests/package/test_glslsandbox_player.py
index f72ac2adce..1fec01ba9b 100644
--- a/support/testing/tests/package/test_glslsandbox_player.py
+++ b/support/testing/tests/package/test_glslsandbox_player.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: xlarge
 class TestGlslsandboxPlayer(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 8680477b15..814b785cc8 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -5,6 +5,7 @@ import infra.basetest
 GLXINFO_TIMEOUT = 120
 
 
+# Gitlab-runner: large
 class TestGlxinfo(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 2b18f54fa3..d0cad6c255 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGnupg2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_gnuplot.py b/support/testing/tests/package/test_gnuplot.py
index a225540537..c23a2be35a 100644
--- a/support/testing/tests/package/test_gnuplot.py
+++ b/support/testing/tests/package/test_gnuplot.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGnuplot(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_gnuplot/rootfs-overlay")
diff --git a/support/testing/tests/package/test_gnuradio.py b/support/testing/tests/package/test_gnuradio.py
index 1fc0479d21..72b44088a1 100644
--- a/support/testing/tests/package/test_gnuradio.py
+++ b/support/testing/tests/package/test_gnuradio.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestGnuradio(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include: BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
index 6ca436851b..d8d66fee40 100644
--- a/support/testing/tests/package/test_go.py
+++ b/support/testing/tests/package/test_go.py
@@ -13,6 +13,7 @@ class TestGoBase(infra.basetest.BRTest):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestGoBin(TestGoBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -27,6 +28,7 @@ class TestGoBin(TestGoBase):
         self.assertRunOk("/opt/bin/flanneld -h")
 
 
+# Gitlab-runner: small
 class TestGoSource(TestGoBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index 59b3fe7d3e..3cd55d4aa3 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGpsd(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_gpsd/rootfs-overlay")
diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index e5fe71b7d9..decb870a82 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -2,6 +2,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestGst1Python(TestPythonPackageBase):
     __test__ = True
     config = \
diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
index 82829dab98..83d7240a7b 100644
--- a/support/testing/tests/package/test_gstreamer1.py
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestGstreamer1(infra.basetest.BRTest):
     # This test creates a full, yet simple, Gstreamer pipeline which
     # encodes/decodes a video, using only plugins from Base and Good
diff --git a/support/testing/tests/package/test_gumbo_parser.py b/support/testing/tests/package/test_gumbo_parser.py
index efa8ec91a7..2c4d4c5ebb 100644
--- a/support/testing/tests/package/test_gumbo_parser.py
+++ b/support/testing/tests/package/test_gumbo_parser.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestGumboParser(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/gumbo-parser")]
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/package/test_gzip.py b/support/testing/tests/package/test_gzip.py
index 1d5f374853..3a85f57595 100644
--- a/support/testing/tests/package/test_gzip.py
+++ b/support/testing/tests/package/test_gzip.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestGzip(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_highway.py b/support/testing/tests/package/test_highway.py
index f32363e26f..3cb486c551 100644
--- a/support/testing/tests/package/test_highway.py
+++ b/support/testing/tests/package/test_highway.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHighway(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_hwloc.py b/support/testing/tests/package/test_hwloc.py
index 2a776c4038..e2ffe57315 100644
--- a/support/testing/tests/package/test_hwloc.py
+++ b/support/testing/tests/package/test_hwloc.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHWLoc(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_hyperfine.py b/support/testing/tests/package/test_hyperfine.py
index 4db62c7116..5a85e33943 100644
--- a/support/testing/tests/package/test_hyperfine.py
+++ b/support/testing/tests/package/test_hyperfine.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHyperfine(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_iozone.py b/support/testing/tests/package/test_iozone.py
index 9a9843df56..a9f5463a56 100644
--- a/support/testing/tests/package/test_iozone.py
+++ b/support/testing/tests/package/test_iozone.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIozone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_iperf.py b/support/testing/tests/package/test_iperf.py
index 31f04d9896..456ec5dab4 100644
--- a/support/testing/tests/package/test_iperf.py
+++ b/support/testing/tests/package/test_iperf.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIperf(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_iperf3.py b/support/testing/tests/package/test_iperf3.py
index 9aac4c6fd0..5376147638 100644
--- a/support/testing/tests/package/test_iperf3.py
+++ b/support/testing/tests/package/test_iperf3.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIperf3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
index 91d9006e23..35e1c0351a 100644
--- a/support/testing/tests/package/test_iproute2.py
+++ b/support/testing/tests/package/test_iproute2.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIpRoute2(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 6e4db0ac06..e64fb3e319 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIptables(infra.basetest.BRTest):
     # The iptables package has _LINUX_CONFIG_FIXUPS, so we cannot use
     # the runtime test pre-built Kernel. We need to compile a Kernel
diff --git a/support/testing/tests/package/test_iputils.py b/support/testing/tests/package/test_iputils.py
index 5f4ba9873b..4f0acd54fb 100644
--- a/support/testing/tests/package/test_iputils.py
+++ b/support/testing/tests/package/test_iputils.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestIputils(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index 50b00da7c2..e37ac76bdd 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -8,6 +8,7 @@ from tests.package.test_python import TestPythonBase
 #              does, so this test ends up being a false-negative
 
 
+# Gitlab-runner: small
 class TestIPythonPy3(TestPythonBase):
     config = TestPythonBase.config + \
         """
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
index 4634fc4de2..db5fe237ba 100644
--- a/support/testing/tests/package/test_jailhouse.py
+++ b/support/testing/tests/package/test_jailhouse.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestJailhouse(infra.basetest.BRTest):
     # This test uses a specific configuration, mainly for matching the
     # requirements of the Jailhouse Qemu inmate demo. We also use the
diff --git a/support/testing/tests/package/test_jq.py b/support/testing/tests/package/test_jq.py
index 67420abb6b..ed0b9315b7 100644
--- a/support/testing/tests/package/test_jq.py
+++ b/support/testing/tests/package/test_jq.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestJq(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_jq/rootfs-overlay")
diff --git a/support/testing/tests/package/test_kexec.py b/support/testing/tests/package/test_kexec.py
index 51d43b0572..4a33d2f36a 100644
--- a/support/testing/tests/package/test_kexec.py
+++ b/support/testing/tests/package/test_kexec.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestKexec(infra.basetest.BRTest):
 
     # A specific configuration is needed for using kexec:
diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 3c06589b2b..f8b6a7d456 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestKmod(infra.basetest.BRTest):
     # This test uses the "virtio_net" driver compiled as a module, and
     # compressed modules to test that kmod can handle them. We need to
diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
index 4a0eb07c32..cf7ff8cfb4 100644
--- a/support/testing/tests/package/test_kmscube.py
+++ b/support/testing/tests/package/test_kmscube.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: xlarge
 class TestKmsCube(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_kvmtool.py b/support/testing/tests/package/test_kvmtool.py
index d6859172bd..aa3fe5fc0e 100644
--- a/support/testing/tests/package/test_kvmtool.py
+++ b/support/testing/tests/package/test_kvmtool.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestKvmTool(infra.basetest.BRTest):
     # This test passes the Buildroot image directory to the emulated
     # guest using the 9p virtiofs. This guest enables the
diff --git a/support/testing/tests/package/test_lame.py b/support/testing/tests/package/test_lame.py
index bffb11672b..033adcc6ad 100644
--- a/support/testing/tests/package/test_lame.py
+++ b/support/testing/tests/package/test_lame.py
@@ -1,6 +1,7 @@
 from tests.package.test_audio_codec_base import TestAudioCodecBase
 
 
+# Gitlab-runner: small
 class TestLame(TestAudioCodecBase):
     __test__ = True
     config = TestAudioCodecBase.config + \
diff --git a/support/testing/tests/package/test_less.py b/support/testing/tests/package/test_less.py
index 3d8c4fc94c..5651f84fa0 100644
--- a/support/testing/tests/package/test_less.py
+++ b/support/testing/tests/package/test_less.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLess(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index c785e340d6..9e519d2eac 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestLibCamera(infra.basetest.BRTest):
     # A specific configuration is needed for testing libcamera:
     # a kernel config fragment enables v4l2 vimc driver.
diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
index 076a5388ca..62031ffadf 100644
--- a/support/testing/tests/package/test_libcurl.py
+++ b/support/testing/tests/package/test_libcurl.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLibCurl(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_libftdi1.py b/support/testing/tests/package/test_libftdi1.py
index 5c29dea04f..93345d0278 100644
--- a/support/testing/tests/package/test_libftdi1.py
+++ b/support/testing/tests/package/test_libftdi1.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Libftdi1(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
index b497891249..a255f9e711 100644
--- a/support/testing/tests/package/test_libgpgme.py
+++ b/support/testing/tests/package/test_libgpgme.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLibGpgme(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
index e8cf5c3d13..4f5aeb5e33 100644
--- a/support/testing/tests/package/test_libiio_bindings_python.py
+++ b/support/testing/tests/package/test_libiio_bindings_python.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestLibiioBindingsPython(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_libjxl.py b/support/testing/tests/package/test_libjxl.py
index dd87281f09..1959fd0f3d 100644
--- a/support/testing/tests/package/test_libjxl.py
+++ b/support/testing/tests/package/test_libjxl.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLibJXL(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG is not used as it is armv5
     # and the image encoding would take too long (several minutes).
diff --git a/support/testing/tests/package/test_libldns.py b/support/testing/tests/package/test_libldns.py
index 6c1a4da3f2..736a048029 100644
--- a/support/testing/tests/package/test_libldns.py
+++ b/support/testing/tests/package/test_libldns.py
@@ -2,6 +2,7 @@ import infra.basetest
 import os
 
 
+# Gitlab-runner: small
 class TestLibLdns(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_libshdata.py b/support/testing/tests/package/test_libshdata.py
index 80b032ac69..2ac0258195 100644
--- a/support/testing/tests/package/test_libshdata.py
+++ b/support/testing/tests/package/test_libshdata.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLibshdata(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lighttpd.py b/support/testing/tests/package/test_lighttpd.py
index 54dd68bcda..153e31ea24 100644
--- a/support/testing/tests/package/test_lighttpd.py
+++ b/support/testing/tests/package/test_lighttpd.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLighttpd(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_links.py b/support/testing/tests/package/test_links.py
index ed52bb2d5f..1cf9e140bc 100644
--- a/support/testing/tests/package/test_links.py
+++ b/support/testing/tests/package/test_links.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLinks(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_links/rootfs-overlay")
diff --git a/support/testing/tests/package/test_llama_cpp.py b/support/testing/tests/package/test_llama_cpp.py
index 4462be0a5b..a3b3310282 100644
--- a/support/testing/tests/package/test_llama_cpp.py
+++ b/support/testing/tests/package/test_llama_cpp.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: medium
 class TestLlamaCpp(infra.basetest.BRTest):
     config = """
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_lpeg.py b/support/testing/tests/package/test_lpeg.py
index 4e1ee343bf..adc2f61256 100644
--- a/support/testing/tests/package/test_lpeg.py
+++ b/support/testing/tests/package/test_lpeg.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLPeg(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLPeg(TestLuaBase):
         self.module_test("re")
 
 
+# Gitlab-runner: small
 class TestLuajitLPeg(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lrzip.py b/support/testing/tests/package/test_lrzip.py
index 31559d4e87..2216c4495d 100644
--- a/support/testing/tests/package/test_lrzip.py
+++ b/support/testing/tests/package/test_lrzip.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestLrzip(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_lrzsz.py b/support/testing/tests/package/test_lrzsz.py
index 23b4cdc531..5c97b06643 100644
--- a/support/testing/tests/package/test_lrzsz.py
+++ b/support/testing/tests/package/test_lrzsz.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLrzsz(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
index b0478dfbb7..297bf8fa6b 100644
--- a/support/testing/tests/package/test_lsof.py
+++ b/support/testing/tests/package/test_lsof.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLsof(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lsqlite3.py b/support/testing/tests/package/test_lsqlite3.py
index d874774647..62412ed9f2 100644
--- a/support/testing/tests/package/test_lsqlite3.py
+++ b/support/testing/tests/package/test_lsqlite3.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLsqlite3(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLsqlite3(TestLuaBase):
         self.module_test("lsqlite3")
 
 
+# Gitlab-runner: small
 class TestLuajitLsqlite3(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
index 58e3af19ed..3f8fc54818 100644
--- a/support/testing/tests/package/test_ltp_testsuite.py
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLtpTestsuite(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ltrace.py b/support/testing/tests/package/test_ltrace.py
index 9ef64ba5dd..7d3ee80e39 100644
--- a/support/testing/tests/package/test_ltrace.py
+++ b/support/testing/tests/package/test_ltrace.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLtrace(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lua.py b/support/testing/tests/package/test_lua.py
index 9703dffbd4..4d27e994a4 100644
--- a/support/testing/tests/package/test_lua.py
+++ b/support/testing/tests/package/test_lua.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLuaBase(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -34,6 +35,7 @@ class TestLuaBase(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestLua(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -46,6 +48,7 @@ class TestLua(TestLuaBase):
         self.g_version_test('Lua 5.4')
 
 
+# Gitlab-runner: small
 class TestLuajit(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_argon2.py b/support/testing/tests/package/test_lua_argon2.py
index 8a2a57e659..474aaa01cf 100644
--- a/support/testing/tests/package/test_lua_argon2.py
+++ b/support/testing/tests/package/test_lua_argon2.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaArgon2(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaArgon2(TestLuaBase):
         self.module_test("argon2")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaArgon2(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_augeas.py b/support/testing/tests/package/test_lua_augeas.py
index 2a612b6d32..414e074cce 100644
--- a/support/testing/tests/package/test_lua_augeas.py
+++ b/support/testing/tests/package/test_lua_augeas.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaAugeas(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLuaAugeas(TestLuaBase):
         self.module_test("augeas")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaAugeas(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_cffi.py b/support/testing/tests/package/test_lua_cffi.py
index 32547a4ae1..3a9dc78d2d 100644
--- a/support/testing/tests/package/test_lua_cffi.py
+++ b/support/testing/tests/package/test_lua_cffi.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaCffi(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_cqueues.py b/support/testing/tests/package/test_lua_cqueues.py
index e823651c32..9265d56f1e 100644
--- a/support/testing/tests/package/test_lua_cqueues.py
+++ b/support/testing/tests/package/test_lua_cqueues.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaCqueues(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -30,6 +31,7 @@ class TestLuaLuaCqueues(TestLuaBase):
         self.module_test("cqueues.thread")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaCqueues(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_curl.py b/support/testing/tests/package/test_lua_curl.py
index 0813039483..5dd426395f 100644
--- a/support/testing/tests/package/test_lua_curl.py
+++ b/support/testing/tests/package/test_lua_curl.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuacURL(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLuacURL(TestLuaBase):
         self.module_test("lcurl")
 
 
+# Gitlab-runner: small
 class TestLuajitLuacURL(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_gd.py b/support/testing/tests/package/test_lua_gd.py
index f79f2086a1..fa12b3ad6c 100644
--- a/support/testing/tests/package/test_lua_gd.py
+++ b/support/testing/tests/package/test_lua_gd.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaGD(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -16,6 +17,7 @@ class TestLuaLuaGD(TestLuaBase):
         self.module_test("gd")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaGD(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_http.py b/support/testing/tests/package/test_lua_http.py
index ba6096a1b1..85cbe410c5 100644
--- a/support/testing/tests/package/test_lua_http.py
+++ b/support/testing/tests/package/test_lua_http.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaHttp(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -19,6 +20,7 @@ class TestLuaHttp(TestLuaBase):
         self.module_test("http.websocket")
 
 
+# Gitlab-runner: small
 class TestLuajitHttp(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_inotify.py b/support/testing/tests/package/test_lua_inotify.py
index c951a9c5d6..a57baf55db 100644
--- a/support/testing/tests/package/test_lua_inotify.py
+++ b/support/testing/tests/package/test_lua_inotify.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaInotify(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaInotify(TestLuaBase):
         self.module_test("inotify")
 
 
+# Gitlab-runner: small
 class TestLuajitInotify(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_lgdbm.py b/support/testing/tests/package/test_lua_lgdbm.py
index 4ccf759992..29de63f0db 100644
--- a/support/testing/tests/package/test_lua_lgdbm.py
+++ b/support/testing/tests/package/test_lua_lgdbm.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLgdbm(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_lightningmdb.py b/support/testing/tests/package/test_lua_lightningmdb.py
index cc5b82043b..9b80bbc361 100644
--- a/support/testing/tests/package/test_lua_lightningmdb.py
+++ b/support/testing/tests/package/test_lua_lightningmdb.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLightningmdb(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_lrexlib_pcre2.py b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
index 07a1a3e03b..dd9f07786b 100644
--- a/support/testing/tests/package/test_lua_lrexlib_pcre2.py
+++ b/support/testing/tests/package/test_lua_lrexlib_pcre2.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLrexlibPCRE2(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLrexlibPCRE2(TestLuaBase):
         self.module_test("rex_pcre2")
 
 
+# Gitlab-runner: small
 class TestLuajitLrexlibPCRE2(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_lunix.py b/support/testing/tests/package/test_lua_lunix.py
index ae0e3b260d..92ad5536a3 100644
--- a/support/testing/tests/package/test_lua_lunix.py
+++ b/support/testing/tests/package/test_lua_lunix.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLunix(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLunix(TestLuaBase):
         self.module_test("unix")
 
 
+# Gitlab-runner: small
 class TestLuajitLunix(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_lyaml.py b/support/testing/tests/package/test_lua_lyaml.py
index ece3c675a2..eee400b264 100644
--- a/support/testing/tests/package/test_lua_lyaml.py
+++ b/support/testing/tests/package/test_lua_lyaml.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaLyaml(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLuaLyaml(TestLuaBase):
         self.module_test("lyaml")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaLyaml(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_periphery.py b/support/testing/tests/package/test_lua_periphery.py
index 5b93e36e39..c19d6a7802 100644
--- a/support/testing/tests/package/test_lua_periphery.py
+++ b/support/testing/tests/package/test_lua_periphery.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaperiphery(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaperiphery(TestLuaBase):
         self.module_test("periphery")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaperiphery(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_sdl2.py b/support/testing/tests/package/test_lua_sdl2.py
index b9aad15f45..1c9b81443d 100644
--- a/support/testing/tests/package/test_lua_sdl2.py
+++ b/support/testing/tests/package/test_lua_sdl2.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaSDL2(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -22,6 +23,7 @@ class TestLuaLuaSDL2(TestLuaBase):
         self.module_test("SDL.ttf")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaSDL2(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_utf8.py b/support/testing/tests/package/test_lua_utf8.py
index 5946a439cf..e5b080dbaf 100644
--- a/support/testing/tests/package/test_lua_utf8.py
+++ b/support/testing/tests/package/test_lua_utf8.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaUtf8(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaUtf8(TestLuaBase):
         self.module_test("lua-utf8")
 
 
+# Gitlab-runner: small
 class TestLuajitUtf8(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lua_zlib.py b/support/testing/tests/package/test_lua_zlib.py
index 6089daa2e8..aae556f6c8 100644
--- a/support/testing/tests/package/test_lua_zlib.py
+++ b/support/testing/tests/package/test_lua_zlib.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuazlib(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuazlib(TestLuaBase):
         self.module_test("zlib")
 
 
+# Gitlab-runner: small
 class TestLuajitLuazlib(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luaexpat.py b/support/testing/tests/package/test_luaexpat.py
index c71c3fadb3..ccd9f373b9 100644
--- a/support/testing/tests/package/test_luaexpat.py
+++ b/support/testing/tests/package/test_luaexpat.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaExpat(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaExpat(TestLuaBase):
         self.module_test("lxp")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaExpat(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luafilesystem.py b/support/testing/tests/package/test_luafilesystem.py
index a84c1f300c..cf52c8c431 100644
--- a/support/testing/tests/package/test_luafilesystem.py
+++ b/support/testing/tests/package/test_luafilesystem.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaFileSystem(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaFileSystem(TestLuaBase):
         self.module_test("lfs")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaFileSystem(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lualdap.py b/support/testing/tests/package/test_lualdap.py
index 2ec0d58228..b1fa065357 100644
--- a/support/testing/tests/package/test_lualdap.py
+++ b/support/testing/tests/package/test_lualdap.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaLdap(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaLdap(TestLuaBase):
         self.module_test("lualdap")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaLdap(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luaossl.py b/support/testing/tests/package/test_luaossl.py
index f9f9ab4ee6..9cf50de603 100644
--- a/support/testing/tests/package/test_luaossl.py
+++ b/support/testing/tests/package/test_luaossl.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaossl(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLuaossl(TestLuaBase):
         self.module_test("_openssl")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaossl(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luaposix.py b/support/testing/tests/package/test_luaposix.py
index 2918ee61b5..a57f3d2543 100644
--- a/support/testing/tests/package/test_luaposix.py
+++ b/support/testing/tests/package/test_luaposix.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaPosix(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -42,6 +43,7 @@ class TestLuaLuaPosix(TestLuaBase):
         self.module_test("posix")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaPosix(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luasec.py b/support/testing/tests/package/test_luasec.py
index f87326362d..6dbca3aba7 100644
--- a/support/testing/tests/package/test_luasec.py
+++ b/support/testing/tests/package/test_luasec.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaSec(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaLuaSec(TestLuaBase):
         self.module_test("ssl")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaSec(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luasocket.py b/support/testing/tests/package/test_luasocket.py
index 3d21df1de4..b12ebfb196 100644
--- a/support/testing/tests/package/test_luasocket.py
+++ b/support/testing/tests/package/test_luasocket.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuaSocket(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -15,6 +16,7 @@ class TestLuaLuaSocket(TestLuaBase):
         self.module_test("socket")
 
 
+# Gitlab-runner: small
 class TestLuajitLuaSocket(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
index 158b95cb06..1d572b4834 100644
--- a/support/testing/tests/package/test_luasyslog.py
+++ b/support/testing/tests/package/test_luasyslog.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLuasyslog(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -14,6 +15,7 @@ class TestLuaLuasyslog(TestLuaBase):
         self.module_test("logging.syslog")
 
 
+# Gitlab-runner: small
 class TestLuajitLuasyslog(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_luvi.py b/support/testing/tests/package/test_luvi.py
index b9d43fe266..0de68af38d 100644
--- a/support/testing/tests/package/test_luvi.py
+++ b/support/testing/tests/package/test_luvi.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLuvi(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lvm2.py b/support/testing/tests/package/test_lvm2.py
index 75ea3fa449..a9055e5174 100644
--- a/support/testing/tests/package/test_lvm2.py
+++ b/support/testing/tests/package/test_lvm2.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLvm2(infra.basetest.BRTest):
     # The lvm2 package has _LINUX_CONFIG_FIXUPS, so we cannot use
     # the runtime test pre-built Kernel. We need to compile a Kernel
diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 5d5f2fb9b4..25d5c83dc7 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLxc(infra.basetest.BRTest):
     config = \
             """
diff --git a/support/testing/tests/package/test_lynis.py b/support/testing/tests/package/test_lynis.py
index bed4023e64..8fc63fa3ea 100644
--- a/support/testing/tests/package/test_lynis.py
+++ b/support/testing/tests/package/test_lynis.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestLynis(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_lz4.py b/support/testing/tests/package/test_lz4.py
index 988200250a..a1a0fe4c12 100644
--- a/support/testing/tests/package/test_lz4.py
+++ b/support/testing/tests/package/test_lz4.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestLz4(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_lzip.py b/support/testing/tests/package/test_lzip.py
index 374e9e79e0..237e9ecc57 100644
--- a/support/testing/tests/package/test_lzip.py
+++ b/support/testing/tests/package/test_lzip.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestLzip(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_lzlib.py b/support/testing/tests/package/test_lzlib.py
index 84e767913f..e6563086a5 100644
--- a/support/testing/tests/package/test_lzlib.py
+++ b/support/testing/tests/package/test_lzlib.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaLzlib(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_lzop.py b/support/testing/tests/package/test_lzop.py
index 8d20ece3d6..22415a93ac 100644
--- a/support/testing/tests/package/test_lzop.py
+++ b/support/testing/tests/package/test_lzop.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestLzop(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_make.py b/support/testing/tests/package/test_make.py
index 2ec62826be..65cea1263d 100644
--- a/support/testing/tests/package/test_make.py
+++ b/support/testing/tests/package/test_make.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMake(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_make/rootfs-overlay")
diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index d40ffdba96..583ffcfde2 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMariaDB(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_mawk.py b/support/testing/tests/package/test_mawk.py
index 5caf77c116..539fb5c5ee 100644
--- a/support/testing/tests/package/test_mawk.py
+++ b/support/testing/tests/package/test_mawk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMawk(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
index 095d0fd8be..2b5d052f96 100644
--- a/support/testing/tests/package/test_mdadm.py
+++ b/support/testing/tests/package/test_mdadm.py
@@ -5,6 +5,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMdadm(infra.basetest.BRTest):
     # This test creates a dm-raid volume with mdadm. A specific Kernel
     # need to be built with a config fragment enabling this support.
diff --git a/support/testing/tests/package/test_memcached.py b/support/testing/tests/package/test_memcached.py
index 2d00e47ab4..655dab9597 100644
--- a/support/testing/tests/package/test_memcached.py
+++ b/support/testing/tests/package/test_memcached.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMemcached(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
     BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 0c83c5644e..e7eaf4b470 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -33,6 +33,7 @@ class TestMenderInfra(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestMenderRW(TestMenderInfra):
     def test_run(self):
         TestMenderInfra.base_test_run(self)
@@ -42,6 +43,7 @@ class TestMenderRW(TestMenderInfra):
         self.run_mender_test()
 
 
+# Gitlab-runner: small
 class TestMenderRO(TestMenderInfra):
     config = \
         """
@@ -57,6 +59,7 @@ class TestMenderRO(TestMenderInfra):
         self.run_mender_test()
 
 
+# Gitlab-runner: large
 class TestMenderSystemd(TestMenderInfra):
     config = \
         """
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
index f5133c2eef..eaae05677c 100644
--- a/support/testing/tests/package/test_mesa3d.py
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -4,6 +4,7 @@ import infra.basetest
 RUSTICL_TIMEOUT = 180
 
 
+# Gitlab-runner: 2xlarge
 class TestMesa3DRusticl(infra.basetest.BRTest):
     config = """
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
index cc0e5854c8..4995e0a9ae 100644
--- a/support/testing/tests/package/test_micropython.py
+++ b/support/testing/tests/package/test_micropython.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMicroPython(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
diff --git a/support/testing/tests/package/test_mosquitto.py b/support/testing/tests/package/test_mosquitto.py
index 6b256e5e27..e1f6c0fead 100644
--- a/support/testing/tests/package/test_mosquitto.py
+++ b/support/testing/tests/package/test_mosquitto.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMosquitto(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_msr_tools.py b/support/testing/tests/package/test_msr_tools.py
index d098b29aa2..72373cbd74 100644
--- a/support/testing/tests/package/test_msr_tools.py
+++ b/support/testing/tests/package/test_msr_tools.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMsrTools(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_mtd.py b/support/testing/tests/package/test_mtd.py
index bdb09c39ec..4aa3368514 100644
--- a/support/testing/tests/package/test_mtd.py
+++ b/support/testing/tests/package/test_mtd.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMtd(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
index 23ec08b6d6..c308094bf7 100644
--- a/support/testing/tests/package/test_mtools.py
+++ b/support/testing/tests/package/test_mtools.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMtools(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_mtr.py b/support/testing/tests/package/test_mtr.py
index d78b33a31a..e65c2d951e 100644
--- a/support/testing/tests/package/test_mtr.py
+++ b/support/testing/tests/package/test_mtr.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestMtr(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ncdu.py b/support/testing/tests/package/test_ncdu.py
index cbbb27f751..d791accd1f 100644
--- a/support/testing/tests/package/test_ncdu.py
+++ b/support/testing/tests/package/test_ncdu.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNcdu(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ndctl.py b/support/testing/tests/package/test_ndctl.py
index 6cb44b2de2..6d36344de3 100644
--- a/support/testing/tests/package/test_ndctl.py
+++ b/support/testing/tests/package/test_ndctl.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNdctl(infra.basetest.BRTest):
     kern_frag = \
         infra.filepath("tests/package/test_ndctl/linux-pmem.fragment")
diff --git a/support/testing/tests/package/test_netcat.py b/support/testing/tests/package/test_netcat.py
index 88d58a72f3..e0b83a1575 100644
--- a/support/testing/tests/package/test_netcat.py
+++ b/support/testing/tests/package/test_netcat.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNetCat(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
index 42bcbcdc6f..a4e3982f1d 100644
--- a/support/testing/tests/package/test_netdata.py
+++ b/support/testing/tests/package/test_netdata.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNetdata(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_netsnmp.py b/support/testing/tests/package/test_netsnmp.py
index 9561e49828..994bd788c2 100644
--- a/support/testing/tests/package/test_netsnmp.py
+++ b/support/testing/tests/package/test_netsnmp.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNetSNMP(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_netsnmp/rootfs-overlay")
diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
index 2622c7e822..4e48d752a6 100644
--- a/support/testing/tests/package/test_nftables.py
+++ b/support/testing/tests/package/test_nftables.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNftables(infra.basetest.BRTest):
     config = \
         """
@@ -112,6 +113,7 @@ class TestNftables(infra.basetest.BRTest):
         self.nftables_test(prog="/root/nft.py")
 
 
+# Gitlab-runner: small
 class TestNftablesInit(TestNftables):
     config = TestNftables.config + \
         """
diff --git a/support/testing/tests/package/test_nginx_modsecurity.py b/support/testing/tests/package/test_nginx_modsecurity.py
index 3903d46bcc..b4e849a86e 100644
--- a/support/testing/tests/package/test_nginx_modsecurity.py
+++ b/support/testing/tests/package/test_nginx_modsecurity.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNginxModsecurity(infra.basetest.BRTest):
     overlay = infra.filepath("tests/package/test_nginx_modsecurity/overlay")
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/package/test_ngrep.py b/support/testing/tests/package/test_ngrep.py
index 29aaa55c2c..a7fedeb0a3 100644
--- a/support/testing/tests/package/test_ngrep.py
+++ b/support/testing/tests/package/test_ngrep.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNgrep(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_nmap.py b/support/testing/tests/package/test_nmap.py
index 92b085ece9..675dde26fb 100644
--- a/support/testing/tests/package/test_nmap.py
+++ b/support/testing/tests/package/test_nmap.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNmap(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 2884529c6e..b35afbaf0e 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: 2xlarge
 class TestNodeJSBasic(infra.basetest.BRTest):
     config = \
         """
@@ -28,6 +29,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
+# Gitlab-runner: large
 class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
@@ -55,6 +57,7 @@ class TestNodeJSModuleHostBin(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_module.js")
 
 
+# Gitlab-runner: 2xlarge
 class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_ntp.py b/support/testing/tests/package/test_ntp.py
index 13fff6419b..bc29fe3045 100644
--- a/support/testing/tests/package/test_ntp.py
+++ b/support/testing/tests/package/test_ntp.py
@@ -5,6 +5,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNtp(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_ntp/rootfs-overlay")
diff --git a/support/testing/tests/package/test_nu.py b/support/testing/tests/package/test_nu.py
index 14ddacfbc8..39ac00cb8e 100644
--- a/support/testing/tests/package/test_nu.py
+++ b/support/testing/tests/package/test_nu.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNu(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it doesn't
     # support a host rustc which is necessary for nushell
diff --git a/support/testing/tests/package/test_numactl.py b/support/testing/tests/package/test_numactl.py
index 218f53c262..a2f893223c 100644
--- a/support/testing/tests/package/test_numactl.py
+++ b/support/testing/tests/package/test_numactl.py
@@ -4,6 +4,7 @@ import re
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestNumaCtl(infra.basetest.BRTest):
     # A specific configuration is needed for testing numactl:
     # - This test uses a x86_64 config, which has mature NUMA support.
diff --git a/support/testing/tests/package/test_oath_toolkit.py b/support/testing/tests/package/test_oath_toolkit.py
index 92c0845614..5ee168f45d 100644
--- a/support/testing/tests/package/test_oath_toolkit.py
+++ b/support/testing/tests/package/test_oath_toolkit.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOathToolKit(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 4b269e3af0..5d6c0dcab2 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOctave(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include gfortran.
diff --git a/support/testing/tests/package/test_openblas.py b/support/testing/tests/package/test_openblas.py
index 9cfe08ef2c..4edda39aa4 100644
--- a/support/testing/tests/package/test_openblas.py
+++ b/support/testing/tests/package/test_openblas.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestOpenBLAS(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 0dc69b7c49..6b4f368d75 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestOpenJdk(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/openjdk")]
     config = \
diff --git a/support/testing/tests/package/test_openocd.py b/support/testing/tests/package/test_openocd.py
index fe4d203073..0f26c4b57b 100644
--- a/support/testing/tests/package/test_openocd.py
+++ b/support/testing/tests/package/test_openocd.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOpenOCD(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index a28c28f797..ddbca91c0e 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -31,6 +31,7 @@ class TestOpensshBase(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestOpenSshuClibc(TestOpensshBase):
     config = \
         TestOpensshBase.opensshconfig + \
@@ -46,6 +47,7 @@ class TestOpenSshuClibc(TestOpensshBase):
         self.openssh_test()
 
 
+# Gitlab-runner: small
 class TestOpenSshGlibc(TestOpensshBase):
 
     config = \
diff --git a/support/testing/tests/package/test_opkg.py b/support/testing/tests/package/test_opkg.py
index e47879cad6..41f6cbbeeb 100644
--- a/support/testing/tests/package/test_opkg.py
+++ b/support/testing/tests/package/test_opkg.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestOpkg(infra.basetest.BRTest):
     # The snmpd service is used as an example for this test of a set of files
     # that can be archived up and deployed/removed to test opkg
diff --git a/support/testing/tests/package/test_opus_tools.py b/support/testing/tests/package/test_opus_tools.py
index 89b76fb954..18dd0d7119 100644
--- a/support/testing/tests/package/test_opus_tools.py
+++ b/support/testing/tests/package/test_opus_tools.py
@@ -1,6 +1,7 @@
 from tests.package.test_audio_codec_base import TestAudioCodecBase
 
 
+# Gitlab-runner: small
 class TestOpusTools(TestAudioCodecBase):
     __test__ = True
     config = TestAudioCodecBase.config + \
diff --git a/support/testing/tests/package/test_parted.py b/support/testing/tests/package/test_parted.py
index ca585b7e02..d2fec71864 100644
--- a/support/testing/tests/package/test_parted.py
+++ b/support/testing/tests/package/test_parted.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestParted(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_patch.py b/support/testing/tests/package/test_patch.py
index 67ecb0497a..b4979a1144 100644
--- a/support/testing/tests/package/test_patch.py
+++ b/support/testing/tests/package/test_patch.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPatch(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_patch/rootfs-overlay")
diff --git a/support/testing/tests/package/test_pciutils.py b/support/testing/tests/package/test_pciutils.py
index 3221b0cfd1..268da5d1a1 100644
--- a/support/testing/tests/package/test_pciutils.py
+++ b/support/testing/tests/package/test_pciutils.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPCIUtils(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
index 08089456c2..71a92962e3 100644
--- a/support/testing/tests/package/test_perftest.py
+++ b/support/testing/tests/package/test_perftest.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPerftest(infra.basetest.BRTest):
 
     config = \
diff --git a/support/testing/tests/package/test_perl.py b/support/testing/tests/package/test_perl.py
index ae3f105919..7857c028b5 100644
--- a/support/testing/tests/package/test_perl.py
+++ b/support/testing/tests/package/test_perl.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPerlBase(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -22,6 +23,7 @@ class TestPerlBase(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestPerl(TestPerlBase):
     config = TestPerlBase.config + \
         """
diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
index 0422970027..af627ad5da 100644
--- a/support/testing/tests/package/test_perl_class_load.py
+++ b/support/testing/tests/package/test_perl_class_load.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlClassLoad(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
index 93551b420f..27031a15b3 100644
--- a/support/testing/tests/package/test_perl_dbd_mysql.py
+++ b/support/testing/tests/package/test_perl_dbd_mysql.py
@@ -2,6 +2,7 @@ from tests.package.test_perl import TestPerlBase
 import os
 
 
+# Gitlab-runner: xlarge
 class TestPerlDBDmysql(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_encode_detect.py b/support/testing/tests/package/test_perl_encode_detect.py
index 4b33fee011..6b0530de99 100644
--- a/support/testing/tests/package/test_perl_encode_detect.py
+++ b/support/testing/tests/package/test_perl_encode_detect.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlEncodeDetect(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_gdgraph.py b/support/testing/tests/package/test_perl_gdgraph.py
index 23ddbca4ae..a40afe8852 100644
--- a/support/testing/tests/package/test_perl_gdgraph.py
+++ b/support/testing/tests/package/test_perl_gdgraph.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlGDGraph(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_html_parser.py b/support/testing/tests/package/test_perl_html_parser.py
index 6431633482..4e31cdc2fb 100644
--- a/support/testing/tests/package/test_perl_html_parser.py
+++ b/support/testing/tests/package/test_perl_html_parser.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlHTMLParser(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_io_socket_multicast.py b/support/testing/tests/package/test_perl_io_socket_multicast.py
index 48a086a6f7..f6b635ef52 100644
--- a/support/testing/tests/package/test_perl_io_socket_multicast.py
+++ b/support/testing/tests/package/test_perl_io_socket_multicast.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlIOSocketMulticast(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_io_socket_ssl.py b/support/testing/tests/package/test_perl_io_socket_ssl.py
index 80835fdcc1..c6f5047bfa 100644
--- a/support/testing/tests/package/test_perl_io_socket_ssl.py
+++ b/support/testing/tests/package/test_perl_io_socket_ssl.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlIOSocketSSL(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
index 4dcfa06f15..35a67daecb 100644
--- a/support/testing/tests/package/test_perl_libwww_perl.py
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerllibwwwperl(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_lwp_protocol_https.py b/support/testing/tests/package/test_perl_lwp_protocol_https.py
index 35437459a1..9be7828b71 100644
--- a/support/testing/tests/package/test_perl_lwp_protocol_https.py
+++ b/support/testing/tests/package/test_perl_lwp_protocol_https.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlLWPProtocolhttps(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
index cd9e75795b..082e4809da 100644
--- a/support/testing/tests/package/test_perl_mail_dkim.py
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlMailDKIM(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_x10.py b/support/testing/tests/package/test_perl_x10.py
index b587804a99..a727e9593b 100644
--- a/support/testing/tests/package/test_perl_x10.py
+++ b/support/testing/tests/package/test_perl_x10.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlX10(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_perl_xml_libxml.py b/support/testing/tests/package/test_perl_xml_libxml.py
index faace5dd03..fbbfbf5588 100644
--- a/support/testing/tests/package/test_perl_xml_libxml.py
+++ b/support/testing/tests/package/test_perl_xml_libxml.py
@@ -1,6 +1,7 @@
 from tests.package.test_perl import TestPerlBase
 
 
+# Gitlab-runner: small
 class TestPerlXMLLibXML(TestPerlBase):
     """
     package:
diff --git a/support/testing/tests/package/test_php_apcu.py b/support/testing/tests/package/test_php_apcu.py
index 7c149a5e47..a5cea06aeb 100644
--- a/support/testing/tests/package/test_php_apcu.py
+++ b/support/testing/tests/package/test_php_apcu.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPhpApcu(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_php_lua.py b/support/testing/tests/package/test_php_lua.py
index e3c57938fc..2393e60c3f 100644
--- a/support/testing/tests/package/test_php_lua.py
+++ b/support/testing/tests/package/test_php_lua.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPhpLuaLua(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -33,6 +34,7 @@ class TestPhpLuaLua(infra.basetest.BRTest):
         self.assertEqual(output[2][0:25], "lua extension version => ")
 
 
+# Gitlab-runner: small
 class TestPhpLuaLuajit(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_php_pam.py b/support/testing/tests/package/test_php_pam.py
index c4c1412e10..258145db46 100644
--- a/support/testing/tests/package/test_php_pam.py
+++ b/support/testing/tests/package/test_php_pam.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPhpPam(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_php_pecl_dbus.py b/support/testing/tests/package/test_php_pecl_dbus.py
index 65f34dfbb7..d1dee23df5 100644
--- a/support/testing/tests/package/test_php_pecl_dbus.py
+++ b/support/testing/tests/package/test_php_pecl_dbus.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPhpPeclDbus(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_pigz.py b/support/testing/tests/package/test_pigz.py
index 92a4170265..49fb2491ee 100644
--- a/support/testing/tests/package/test_pigz.py
+++ b/support/testing/tests/package/test_pigz.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestPigz(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_pixz.py b/support/testing/tests/package/test_pixz.py
index 6620bd4a82..cfd9c6d4f8 100644
--- a/support/testing/tests/package/test_pixz.py
+++ b/support/testing/tests/package/test_pixz.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestPixz(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..e1f6a54952 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -211,11 +211,13 @@ class PodmanBase(infra.basetest.BRTest):
         self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
 
 
+# Gitlab-runner: small
 class TestPodmanIptables(PodmanBase):
     def test_run(self):
         self.do_test()
 
 
+# Gitlab-runner: small
 class TestPodmanNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
@@ -225,6 +227,7 @@ class TestPodmanNftables(PodmanBase):
         self.do_test()
 
 
+# Gitlab-runner: small
 class TestPodmanTini(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_INIT_TINI=y
@@ -234,6 +237,7 @@ class TestPodmanTini(PodmanBase):
         self.do_test()
 
 
+# Gitlab-runner: small
 class TestPodmanSlirpIptables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
@@ -243,6 +247,7 @@ class TestPodmanSlirpIptables(PodmanBase):
         self.do_test()
 
 
+# Gitlab-runner: small
 class TestPodmanSlirpNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3414fd5159..1f84fdd188 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -27,6 +27,7 @@ class TestPolkitInfra(infra.basetest.BRTest):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestPolkitSystemd(TestPolkitInfra):
     config = \
         """
@@ -59,6 +60,7 @@ class TestPolkitSystemd(TestPolkitInfra):
             self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestPolkitInitd(TestPolkitInfra):
     config = TestPolkitInfra.config
 
diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
index bd41fc3f1b..8430a3d39f 100644
--- a/support/testing/tests/package/test_postgresql.py
+++ b/support/testing/tests/package/test_postgresql.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPostgreSQL(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
index 015f10f02d..63c418748c 100644
--- a/support/testing/tests/package/test_pppd.py
+++ b/support/testing/tests/package/test_pppd.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPppd(infra.basetest.BRTest):
     # This test needs a Kernel with ppp support.
     kern_frag = \
diff --git a/support/testing/tests/package/test_proj.py b/support/testing/tests/package/test_proj.py
index ed23c229fd..9013e6480a 100644
--- a/support/testing/tests/package/test_proj.py
+++ b/support/testing/tests/package/test_proj.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestProj(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_prosody.py b/support/testing/tests/package/test_prosody.py
index 8ef8ff95ff..e6e4767d81 100644
--- a/support/testing/tests/package/test_prosody.py
+++ b/support/testing/tests/package/test_prosody.py
@@ -17,6 +17,7 @@ class TestProsody(TestLuaBase):
         self.assertIn("Prosody is running", output[0])
 
 
+# Gitlab-runner: small
 class TestProsodyLua51(TestProsody):
     config = TestLuaBase.config + \
         """
@@ -33,6 +34,7 @@ class TestProsodyLua51(TestProsody):
         self.prosody_test()
 
 
+# Gitlab-runner: small
 class TestProsodyLuajit(TestProsody):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_pv.py b/support/testing/tests/package/test_pv.py
index cfa3c29392..b185a3d38d 100644
--- a/support/testing/tests/package/test_pv.py
+++ b/support/testing/tests/package/test_pv.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPv(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index e815376d21..8c8507edc3 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -42,6 +42,7 @@ class TestPythonBase(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+# Gitlab-runner: small
 class TestPython3Pyc(TestPythonBase):
     config = TestPythonBase.config + \
         """
@@ -56,6 +57,7 @@ class TestPython3Pyc(TestPythonBase):
         self.zlib_test()
 
 
+# Gitlab-runner: small
 class TestPython3Py(TestPythonBase):
     config = TestPythonBase.config + \
         """
@@ -71,6 +73,7 @@ class TestPython3Py(TestPythonBase):
         self.zlib_test()
 
 
+# Gitlab-runner: small
 class TestPython3PyPyc(TestPythonBase):
     config = TestPythonBase.config + \
         """
diff --git a/support/testing/tests/package/test_python_aexpect.py b/support/testing/tests/package/test_python_aexpect.py
index 5b018399b3..23bd956fcd 100644
--- a/support/testing/tests/package/test_python_aexpect.py
+++ b/support/testing/tests/package/test_python_aexpect.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Aexpect(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_apscheduler.py b/support/testing/tests/package/test_python_apscheduler.py
index 19eb8c9b41..88947aec1e 100644
--- a/support/testing/tests/package/test_python_apscheduler.py
+++ b/support/testing/tests/package/test_python_apscheduler.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Apscheduler(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_argh.py b/support/testing/tests/package/test_python_argh.py
index 887d9acd46..9277599f78 100644
--- a/support/testing/tests/package/test_python_argh.py
+++ b/support/testing/tests/package/test_python_argh.py
@@ -27,6 +27,7 @@ class TestPythonArgh(TestPythonPackageBase):
         self.assertEqual(exit_code, 2)
 
 
+# Gitlab-runner: small
 class TestPythonPy3Argh(TestPythonArgh):
     __test__ = True
     config = TestPythonArgh.config + \
diff --git a/support/testing/tests/package/test_python_asn1crypto.py b/support/testing/tests/package/test_python_asn1crypto.py
index 97df3d3ac8..48c5cbe470 100644
--- a/support/testing/tests/package/test_python_asn1crypto.py
+++ b/support/testing/tests/package/test_python_asn1crypto.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Asn1Crypto(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_attrs.py b/support/testing/tests/package/test_python_attrs.py
index 38831b24ef..f68b6161cd 100644
--- a/support/testing/tests/package/test_python_attrs.py
+++ b/support/testing/tests/package/test_python_attrs.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Attrs(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_augeas.py b/support/testing/tests/package/test_python_augeas.py
index c1424668d6..8f3b372c87 100644
--- a/support/testing/tests/package/test_python_augeas.py
+++ b/support/testing/tests/package/test_python_augeas.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonAugeas(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index f785b1af97..9e70937fbd 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Autobahn(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_automat.py b/support/testing/tests/package/test_python_automat.py
index 6ee4ea7618..a6cdcb70cc 100644
--- a/support/testing/tests/package/test_python_automat.py
+++ b/support/testing/tests/package/test_python_automat.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Automat(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_avro.py b/support/testing/tests/package/test_python_avro.py
index 6eee2760da..bd91aac2b0 100644
--- a/support/testing/tests/package/test_python_avro.py
+++ b/support/testing/tests/package/test_python_avro.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonAvro(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_bitstring.py b/support/testing/tests/package/test_python_bitstring.py
index bd358a2fc5..1f6131c676 100644
--- a/support/testing/tests/package/test_python_bitstring.py
+++ b/support/testing/tests/package/test_python_bitstring.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Bitstring(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index e5fbc386b9..f9d7525fdf 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPy3Boto3(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_botocore.py b/support/testing/tests/package/test_python_botocore.py
index 0f3dc93a37..6f726492c8 100644
--- a/support/testing/tests/package/test_python_botocore.py
+++ b/support/testing/tests/package/test_python_botocore.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPy3Botocore(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_can.py b/support/testing/tests/package/test_python_can.py
index dba5539c5d..7ce51b56de 100644
--- a/support/testing/tests/package/test_python_can.py
+++ b/support/testing/tests/package/test_python_can.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Can(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_cbor.py b/support/testing/tests/package/test_python_cbor.py
index 23a1e3e701..627f240d94 100644
--- a/support/testing/tests/package/test_python_cbor.py
+++ b/support/testing/tests/package/test_python_cbor.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Cbor(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_click.py b/support/testing/tests/package/test_python_click.py
index 0ee9702cce..ea11e96948 100644
--- a/support/testing/tests/package/test_python_click.py
+++ b/support/testing/tests/package/test_python_click.py
@@ -26,6 +26,7 @@ class TestPythonClick(TestPythonPackageBase):
         self.assertEqual(exit_code, 2)
 
 
+# Gitlab-runner: small
 class TestPythonPy3Click(TestPythonClick):
     __test__ = True
     config = TestPythonClick.config + \
diff --git a/support/testing/tests/package/test_python_cloudpickle.py b/support/testing/tests/package/test_python_cloudpickle.py
index b28080f02e..b7ae5f0dff 100644
--- a/support/testing/tests/package/test_python_cloudpickle.py
+++ b/support/testing/tests/package/test_python_cloudpickle.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Cloudpickle(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_colorzero.py b/support/testing/tests/package/test_python_colorzero.py
index d67f77bdd4..ff97207c53 100644
--- a/support/testing/tests/package/test_python_colorzero.py
+++ b/support/testing/tests/package/test_python_colorzero.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Colorzero(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_constantly.py b/support/testing/tests/package/test_python_constantly.py
index edcb9bfd69..a9da3b4bd7 100644
--- a/support/testing/tests/package/test_python_constantly.py
+++ b/support/testing/tests/package/test_python_constantly.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Constantly(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_construct.py b/support/testing/tests/package/test_python_construct.py
index 3c51dc31bb..8d0212049e 100644
--- a/support/testing/tests/package/test_python_construct.py
+++ b/support/testing/tests/package/test_python_construct.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Construct(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_crc.py b/support/testing/tests/package/test_python_crc.py
index 0b36580a44..ab21cc44b9 100644
--- a/support/testing/tests/package/test_python_crc.py
+++ b/support/testing/tests/package/test_python_crc.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Crc(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_crccheck.py b/support/testing/tests/package/test_python_crccheck.py
index d51bdc7c9f..bf42f52be4 100644
--- a/support/testing/tests/package/test_python_crccheck.py
+++ b/support/testing/tests/package/test_python_crccheck.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostPythonCrccheck(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-crccheck"]
 
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index ee8e75f885..2283ab7a40 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Cryptography(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_dbus_fast.py b/support/testing/tests/package/test_python_dbus_fast.py
index 5f67cfd8cc..685e9b170d 100644
--- a/support/testing/tests/package/test_python_dbus_fast.py
+++ b/support/testing/tests/package/test_python_dbus_fast.py
@@ -4,6 +4,7 @@ import textwrap
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3DBusFast(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_dbus_next.py b/support/testing/tests/package/test_python_dbus_next.py
index 3c597ad198..bbbb87eae7 100644
--- a/support/testing/tests/package/test_python_dbus_next.py
+++ b/support/testing/tests/package/test_python_dbus_next.py
@@ -4,6 +4,7 @@ import textwrap
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3DBusNext(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_dicttoxml2.py b/support/testing/tests/package/test_python_dicttoxml2.py
index 437518db7f..c1f556c0bb 100644
--- a/support/testing/tests/package/test_python_dicttoxml2.py
+++ b/support/testing/tests/package/test_python_dicttoxml2.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Dicttoxml2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_diskcache.py b/support/testing/tests/package/test_python_diskcache.py
index d8618c1681..0a6c49b212 100644
--- a/support/testing/tests/package/test_python_diskcache.py
+++ b/support/testing/tests/package/test_python_diskcache.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3DiskCache(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_distro.py b/support/testing/tests/package/test_python_distro.py
index c26f9c499e..cb234ada29 100644
--- a/support/testing/tests/package/test_python_distro.py
+++ b/support/testing/tests/package/test_python_distro.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Distro(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 29e8ee0b2e..773f0ce289 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -30,6 +30,7 @@ class TestPythonDjango(TestPythonPackageBase):
         self.assertEqual(exit_code, 0, "Timeout while waiting for django server")
 
 
+# Gitlab-runner: small
 class TestPythonPy3Django(TestPythonDjango):
     __test__ = True
     config = TestPythonDjango.config + \
diff --git a/support/testing/tests/package/test_python_dtschema.py b/support/testing/tests/package/test_python_dtschema.py
index e3a4a309c1..33c92568c9 100644
--- a/support/testing/tests/package/test_python_dtschema.py
+++ b/support/testing/tests/package/test_python_dtschema.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Dtschema(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_evdev.py b/support/testing/tests/package/test_python_evdev.py
index 162e53072e..0c7ad8c68e 100644
--- a/support/testing/tests/package/test_python_evdev.py
+++ b/support/testing/tests/package/test_python_evdev.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Evdev(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_farama_notifications.py b/support/testing/tests/package/test_python_farama_notifications.py
index d662ac077e..919d2cf5c5 100644
--- a/support/testing/tests/package/test_python_farama_notifications.py
+++ b/support/testing/tests/package/test_python_farama_notifications.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3FaramaNotifications(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_fastapi.py b/support/testing/tests/package/test_python_fastapi.py
index 85cdd0b65a..eb1d5e7a27 100644
--- a/support/testing/tests/package/test_python_fastapi.py
+++ b/support/testing/tests/package/test_python_fastapi.py
@@ -4,6 +4,7 @@ import time
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Fastapi(TestPythonPackageBase):
     """Test fastapi, uvicorn and pydantic2.
 
diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
index 32d9da34a5..1b5f89dd62 100644
--- a/support/testing/tests/package/test_python_flask.py
+++ b/support/testing/tests/package/test_python_flask.py
@@ -3,6 +3,7 @@ import os
 import time
 
 
+# Gitlab-runner: small
 class TestPythonPy3Flask(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
index 91b8bf21b7..1a022ca4fa 100644
--- a/support/testing/tests/package/test_python_flask_expects_json.py
+++ b/support/testing/tests/package/test_python_flask_expects_json.py
@@ -3,6 +3,7 @@ import os
 import time
 
 
+# Gitlab-runner: small
 class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_fs.py b/support/testing/tests/package/test_python_fs.py
index a53d8a64c8..5a7be8eeb9 100644
--- a/support/testing/tests/package/test_python_fs.py
+++ b/support/testing/tests/package/test_python_fs.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostPythonFs(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-fs"]
 
diff --git a/support/testing/tests/package/test_python_git.py b/support/testing/tests/package/test_python_git.py
index 4d5489e974..a2426f8506 100644
--- a/support/testing/tests/package/test_python_git.py
+++ b/support/testing/tests/package/test_python_git.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Git(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_gitdb2.py b/support/testing/tests/package/test_python_gitdb2.py
index 9e22df06b5..2a08ac6854 100644
--- a/support/testing/tests/package/test_python_gitdb2.py
+++ b/support/testing/tests/package/test_python_gitdb2.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Gitdb2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
index 8b438aed15..8fc2c83358 100644
--- a/support/testing/tests/package/test_python_gnupg.py
+++ b/support/testing/tests/package/test_python_gnupg.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3GnuPG(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index cd8a43252b..21848a7b47 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -2,6 +2,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
     config = \
diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
index 4fe155e6ce..5e2b838e8b 100644
--- a/support/testing/tests/package/test_python_gpiozero.py
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -14,6 +14,7 @@ class TestPythonGpiozero(TestPythonPackageBase):
         self.assertRunOk(cmd)
 
 
+# Gitlab-runner: small
 class TestPythonPy3Gpiozero(TestPythonGpiozero):
     __test__ = True
     config = TestPythonGpiozero.config + \
diff --git a/support/testing/tests/package/test_python_gymnasium.py b/support/testing/tests/package/test_python_gymnasium.py
index c36ce37dde..6cf0608d9f 100644
--- a/support/testing/tests/package/test_python_gymnasium.py
+++ b/support/testing/tests/package/test_python_gymnasium.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Gymnasium(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_hid.py b/support/testing/tests/package/test_python_hid.py
index 68cefa8682..0367083a3b 100644
--- a/support/testing/tests/package/test_python_hid.py
+++ b/support/testing/tests/package/test_python_hid.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonHid(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_hkdf.py b/support/testing/tests/package/test_python_hkdf.py
index e93c24ff60..25458f0cac 100644
--- a/support/testing/tests/package/test_python_hkdf.py
+++ b/support/testing/tests/package/test_python_hkdf.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Hkdf(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_humanfriendly.py b/support/testing/tests/package/test_python_humanfriendly.py
index 1e70992e92..c18ee6e1f2 100644
--- a/support/testing/tests/package/test_python_humanfriendly.py
+++ b/support/testing/tests/package/test_python_humanfriendly.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3HumanFriendly(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_hwdata.py b/support/testing/tests/package/test_python_hwdata.py
index 7028d1dd59..66e345009a 100644
--- a/support/testing/tests/package/test_python_hwdata.py
+++ b/support/testing/tests/package/test_python_hwdata.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonHwdata(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index 4c53d61321..d7caf4b74b 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Incremental(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_iptables.py b/support/testing/tests/package/test_python_iptables.py
index a2ba365fa7..45f9a7a34c 100644
--- a/support/testing/tests/package/test_python_iptables.py
+++ b/support/testing/tests/package/test_python_iptables.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Iptables(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_jc.py b/support/testing/tests/package/test_python_jc.py
index 974ce0c4b0..1863d7f265 100644
--- a/support/testing/tests/package/test_python_jc.py
+++ b/support/testing/tests/package/test_python_jc.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Jc(TestPythonPackageBase):
     __test__ = True
     # We deliberately run the test without the optional dependencies,
diff --git a/support/testing/tests/package/test_python_jmespath.py b/support/testing/tests/package/test_python_jmespath.py
index 80fd09fdde..13165d3cd1 100644
--- a/support/testing/tests/package/test_python_jmespath.py
+++ b/support/testing/tests/package/test_python_jmespath.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Jmespath(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index 180cff2e4a..5067aebb52 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -4,6 +4,7 @@ import time
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3MagicWormhole(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_mako.py b/support/testing/tests/package/test_python_mako.py
index ea8fe57a5b..f6fe914265 100644
--- a/support/testing/tests/package/test_python_mako.py
+++ b/support/testing/tests/package/test_python_mako.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Mako(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
@@ -12,6 +13,7 @@ class TestPythonPy3Mako(TestPythonPackageBase):
     timeout = 30
 
 
+# Gitlab-runner: small
 class TestPythonPy3MakoExt(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_memray.py b/support/testing/tests/package/test_python_memray.py
index aaf50bcaa4..e8c673ad62 100644
--- a/support/testing/tests/package/test_python_memray.py
+++ b/support/testing/tests/package/test_python_memray.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonMemray(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_midiutil.py b/support/testing/tests/package/test_python_midiutil.py
index 302fbfb1ed..f4e07e3f39 100644
--- a/support/testing/tests/package/test_python_midiutil.py
+++ b/support/testing/tests/package/test_python_midiutil.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3MidiUtil(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_minimalmodbus.py b/support/testing/tests/package/test_python_minimalmodbus.py
index 53813406de..952d1fc870 100644
--- a/support/testing/tests/package/test_python_minimalmodbus.py
+++ b/support/testing/tests/package/test_python_minimalmodbus.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Minimalmodbus(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_ml_dtypes.py b/support/testing/tests/package/test_python_ml_dtypes.py
index 8367107247..fbf8ef4a0b 100644
--- a/support/testing/tests/package/test_python_ml_dtypes.py
+++ b/support/testing/tests/package/test_python_ml_dtypes.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3MlDtypes(TestPythonPackageBase):
     __test__ = True
 
diff --git a/support/testing/tests/package/test_python_mpmath.py b/support/testing/tests/package/test_python_mpmath.py
index c20c910fbe..aff1e0c8e2 100644
--- a/support/testing/tests/package/test_python_mpmath.py
+++ b/support/testing/tests/package/test_python_mpmath.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3MpMath(TestPythonPackageBase):
     __test__ = True
 
diff --git a/support/testing/tests/package/test_python_msgpack.py b/support/testing/tests/package/test_python_msgpack.py
index e5876e400d..f07e7c789e 100644
--- a/support/testing/tests/package/test_python_msgpack.py
+++ b/support/testing/tests/package/test_python_msgpack.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3MsgPack(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_munch.py b/support/testing/tests/package/test_python_munch.py
index 6853bbaac7..936794df80 100644
--- a/support/testing/tests/package/test_python_munch.py
+++ b/support/testing/tests/package/test_python_munch.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Munch(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_networkmanager_goi.py b/support/testing/tests/package/test_python_networkmanager_goi.py
index e755569fc1..94bbb5af34 100644
--- a/support/testing/tests/package/test_python_networkmanager_goi.py
+++ b/support/testing/tests/package/test_python_networkmanager_goi.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3NetworkmanagerGoi(TestPythonPackageBase):
     __test__ = True
     # Can't use TestPythonPackageBase.config because we need headers
diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
index 217293e4ee..8c7247f95f 100644
--- a/support/testing/tests/package/test_python_paho_mqtt.py
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPahoMQTT(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_passlib.py b/support/testing/tests/package/test_python_passlib.py
index e12e86d91b..eca2f732fc 100644
--- a/support/testing/tests/package/test_python_passlib.py
+++ b/support/testing/tests/package/test_python_passlib.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Passlib(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pathspec.py b/support/testing/tests/package/test_python_pathspec.py
index 4e4a992bb3..5b4aa07284 100644
--- a/support/testing/tests/package/test_python_pathspec.py
+++ b/support/testing/tests/package/test_python_pathspec.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPathSpec(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pexpect.py b/support/testing/tests/package/test_python_pexpect.py
index 70037a7d3c..655c6fc43c 100644
--- a/support/testing/tests/package/test_python_pexpect.py
+++ b/support/testing/tests/package/test_python_pexpect.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pexpect(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pyalsa.py b/support/testing/tests/package/test_python_pyalsa.py
index 8046496526..f36e2413d9 100644
--- a/support/testing/tests/package/test_python_pyalsa.py
+++ b/support/testing/tests/package/test_python_pyalsa.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3PyAlsa(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pybind.py b/support/testing/tests/package/test_python_pybind.py
index c0af7331a2..6047ff811d 100644
--- a/support/testing/tests/package/test_python_pybind.py
+++ b/support/testing/tests/package/test_python_pybind.py
@@ -2,6 +2,7 @@ import infra
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPybind (TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pydantic.py b/support/testing/tests/package/test_python_pydantic.py
index 1369d82f59..1f68d5bd01 100644
--- a/support/testing/tests/package/test_python_pydantic.py
+++ b/support/testing/tests/package/test_python_pydantic.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pydantic(TestPythonPackageBase):
     __test__ = True
     config = """
diff --git a/support/testing/tests/package/test_python_pydantic_settings.py b/support/testing/tests/package/test_python_pydantic_settings.py
index 608cbbc5b1..22d1766c94 100644
--- a/support/testing/tests/package/test_python_pydantic_settings.py
+++ b/support/testing/tests/package/test_python_pydantic_settings.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3PydanticSettings(TestPythonPackageBase):
     __test__ = True
     config = """
diff --git a/support/testing/tests/package/test_python_pyfatfs.py b/support/testing/tests/package/test_python_pyfatfs.py
index ceb4e924a1..07a6b9a614 100644
--- a/support/testing/tests/package/test_python_pyfatfs.py
+++ b/support/testing/tests/package/test_python_pyfatfs.py
@@ -2,6 +2,7 @@ import infra.basetest
 import os
 
 
+# Gitlab-runner: small
 class TestHostPythonPyfatfs(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-pyfatfs",
                 "host-genimage",
diff --git a/support/testing/tests/package/test_python_pymupdf.py b/support/testing/tests/package/test_python_pymupdf.py
index 1af3efc8af..05b395165c 100644
--- a/support/testing/tests/package/test_python_pymupdf.py
+++ b/support/testing/tests/package/test_python_pymupdf.py
@@ -2,6 +2,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3PyMuPDF(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
index cef8a7e780..3d017022ba 100644
--- a/support/testing/tests/package/test_python_pynacl.py
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pynacl(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pyndiff.py b/support/testing/tests/package/test_python_pyndiff.py
index 86d6c38f8f..4888d3065d 100644
--- a/support/testing/tests/package/test_python_pyndiff.py
+++ b/support/testing/tests/package/test_python_pyndiff.py
@@ -2,6 +2,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPyNdiff(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_python_pyproj.py b/support/testing/tests/package/test_python_pyproj.py
index 2044d517c2..1c97648111 100644
--- a/support/testing/tests/package/test_python_pyproj.py
+++ b/support/testing/tests/package/test_python_pyproj.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pyproj(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
index 65130f9c03..6c77281c01 100644
--- a/support/testing/tests/package/test_python_pyqt5.py
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestPythonPyQt5(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_python_pyroute2.py b/support/testing/tests/package/test_python_pyroute2.py
index 2f54a2bd26..7e154965c0 100644
--- a/support/testing/tests/package/test_python_pyroute2.py
+++ b/support/testing/tests/package/test_python_pyroute2.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPyroute2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pysmb.py b/support/testing/tests/package/test_python_pysmb.py
index cc4c7fb1e5..b5ebc9d676 100644
--- a/support/testing/tests/package/test_python_pysmb.py
+++ b/support/testing/tests/package/test_python_pysmb.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pysmb(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pytest.py b/support/testing/tests/package/test_python_pytest.py
index 1a631adfd3..51eb59a950 100644
--- a/support/testing/tests/package/test_python_pytest.py
+++ b/support/testing/tests/package/test_python_pytest.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pytest(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pytest_asyncio.py b/support/testing/tests/package/test_python_pytest_asyncio.py
index e09abf2abb..0f02189197 100644
--- a/support/testing/tests/package/test_python_pytest_asyncio.py
+++ b/support/testing/tests/package/test_python_pytest_asyncio.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3PytestAsyncio(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pyusb.py b/support/testing/tests/package/test_python_pyusb.py
index 1e0dbba446..dfadbee028 100644
--- a/support/testing/tests/package/test_python_pyusb.py
+++ b/support/testing/tests/package/test_python_pyusb.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostPythonPyusb(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-pyusb"]
 
diff --git a/support/testing/tests/package/test_python_pyyaml.py b/support/testing/tests/package/test_python_pyyaml.py
index 9d0a351f72..4d640ee5c8 100644
--- a/support/testing/tests/package/test_python_pyyaml.py
+++ b/support/testing/tests/package/test_python_pyyaml.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Pyyaml(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_qrcode.py b/support/testing/tests/package/test_python_qrcode.py
index ca8a2b01f9..2853b3d3ee 100644
--- a/support/testing/tests/package/test_python_qrcode.py
+++ b/support/testing/tests/package/test_python_qrcode.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Qrcode(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
index fd55aa5476..a8bfeb40d2 100644
--- a/support/testing/tests/package/test_python_requests.py
+++ b/support/testing/tests/package/test_python_requests.py
@@ -2,6 +2,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Requests(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_rpi_gpio.py b/support/testing/tests/package/test_python_rpi_gpio.py
index c938ea39bb..7a39ae38ce 100644
--- a/support/testing/tests/package/test_python_rpi_gpio.py
+++ b/support/testing/tests/package/test_python_rpi_gpio.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3RpiGpio(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_rsa.py b/support/testing/tests/package/test_python_rsa.py
index 5ddfb51314..ee1fc0fbc6 100644
--- a/support/testing/tests/package/test_python_rsa.py
+++ b/support/testing/tests/package/test_python_rsa.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3RSA(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_rtoml.py b/support/testing/tests/package/test_python_rtoml.py
index aed2fbc59f..3f8bfd89ec 100644
--- a/support/testing/tests/package/test_python_rtoml.py
+++ b/support/testing/tests/package/test_python_rtoml.py
@@ -3,6 +3,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPy3rtoml(TestPythonPackageBase):
     __test__ = True
     config = \
diff --git a/support/testing/tests/package/test_python_ruamel_yaml.py b/support/testing/tests/package/test_python_ruamel_yaml.py
index b145da4b24..b5de904a38 100644
--- a/support/testing/tests/package/test_python_ruamel_yaml.py
+++ b/support/testing/tests/package/test_python_ruamel_yaml.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3RuamelYaml(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_s3transfer.py b/support/testing/tests/package/test_python_s3transfer.py
index 1578f3aa74..399ff5577d 100644
--- a/support/testing/tests/package/test_python_s3transfer.py
+++ b/support/testing/tests/package/test_python_s3transfer.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPy3S3transfer(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 608a3f6e87..faeccda2f7 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: large
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
     # Need to use a different toolchain than the default due to
diff --git a/support/testing/tests/package/test_python_scp.py b/support/testing/tests/package/test_python_scp.py
index be04c5684c..05160dee9c 100644
--- a/support/testing/tests/package/test_python_scp.py
+++ b/support/testing/tests/package/test_python_scp.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonSCP(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_sdbus.py b/support/testing/tests/package/test_python_sdbus.py
index 7163bbeed1..b52baf2f6d 100644
--- a/support/testing/tests/package/test_python_sdbus.py
+++ b/support/testing/tests/package/test_python_sdbus.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Sdbus(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
index 736c34b724..e43f4082d6 100644
--- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
     __test__ = True
     config = (
diff --git a/support/testing/tests/package/test_python_sdbus_networkmanager.py b/support/testing/tests/package/test_python_sdbus_networkmanager.py
index c10f73920d..8a75f3e3f4 100644
--- a/support/testing/tests/package/test_python_sdbus_networkmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_networkmanager.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
     __test__ = True
     # Can't use TestPythonPackageBase.config because we need headers
diff --git a/support/testing/tests/package/test_python_sdbus_systemd.py b/support/testing/tests/package/test_python_sdbus_systemd.py
index 9e97df6465..fcc9e53643 100644
--- a/support/testing/tests/package/test_python_sdbus_systemd.py
+++ b/support/testing/tests/package/test_python_sdbus_systemd.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3SdbusSystemd(TestPythonPackageBase):
     __test__ = True
     config = (
diff --git a/support/testing/tests/package/test_python_segno.py b/support/testing/tests/package/test_python_segno.py
index 75e7124399..d34e7ba41f 100644
--- a/support/testing/tests/package/test_python_segno.py
+++ b/support/testing/tests/package/test_python_segno.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Segno(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_serial.py b/support/testing/tests/package/test_python_serial.py
index c4b05a10fb..49c1e31e6e 100644
--- a/support/testing/tests/package/test_python_serial.py
+++ b/support/testing/tests/package/test_python_serial.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostPythonSerial(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-serial"]
 
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index 16ea943d41..c9b66b9626 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_smmap2.py b/support/testing/tests/package/test_python_smmap2.py
index a6434c5705..781281bbab 100644
--- a/support/testing/tests/package/test_python_smmap2.py
+++ b/support/testing/tests/package/test_python_smmap2.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Smmap2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_spake2.py b/support/testing/tests/package/test_python_spake2.py
index 0629772bc3..206a86ee31 100644
--- a/support/testing/tests/package/test_python_spake2.py
+++ b/support/testing/tests/package/test_python_spake2.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Spake2(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_sympy.py b/support/testing/tests/package/test_python_sympy.py
index e2106eb49a..eb015f7e6c 100644
--- a/support/testing/tests/package/test_python_sympy.py
+++ b/support/testing/tests/package/test_python_sympy.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3SymPy(TestPythonPackageBase):
     __test__ = True
 
diff --git a/support/testing/tests/package/test_python_tftpy.py b/support/testing/tests/package/test_python_tftpy.py
index 1dfbde0b67..204a49e808 100644
--- a/support/testing/tests/package/test_python_tftpy.py
+++ b/support/testing/tests/package/test_python_tftpy.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestPythonTftpy(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
@@ -12,6 +13,7 @@ class TestPythonTftpy(TestPythonPackageBase):
     sample_scripts = ["tests/package/sample_python_tftpy.py"]
 
 
+# Gitlab-runner: small
 class TestHostPythonTftpy(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-tftpy"]
 
diff --git a/support/testing/tests/package/test_python_transitions.py b/support/testing/tests/package/test_python_transitions.py
index ae64284720..7fa958ef9c 100644
--- a/support/testing/tests/package/test_python_transitions.py
+++ b/support/testing/tests/package/test_python_transitions.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonTransitions(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index bd472d3b39..182255e099 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -12,6 +12,7 @@ class TestPythonTreq(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestPythonPy3Treq(TestPythonTreq):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index e87312db13..788115cc8f 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -21,6 +21,7 @@ class TestPythonTwisted(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
+# Gitlab-runner: small
 class TestPythonPy3Twisted(TestPythonTwisted):
     __test__ = True
     config = TestPythonTwisted.config + \
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index 9acbb60d2f..b4616e8bfc 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Txaio(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 107f53c6a3..c02e5fa001 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_tzlocal.py b/support/testing/tests/package/test_python_tzlocal.py
index d7dac361bf..13e6ee88e1 100644
--- a/support/testing/tests/package/test_python_tzlocal.py
+++ b/support/testing/tests/package/test_python_tzlocal.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3TZLocal(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_ubjson.py b/support/testing/tests/package/test_python_ubjson.py
index a15dbd54b8..4251f58183 100644
--- a/support/testing/tests/package/test_python_ubjson.py
+++ b/support/testing/tests/package/test_python_ubjson.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Ubjson(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_unittest_xml_reporting.py b/support/testing/tests/package/test_python_unittest_xml_reporting.py
index 446c231a00..9c39b530bd 100644
--- a/support/testing/tests/package/test_python_unittest_xml_reporting.py
+++ b/support/testing/tests/package/test_python_unittest_xml_reporting.py
@@ -2,6 +2,7 @@ from tests.package.test_python import TestPythonPackageBase
 import os
 
 
+# Gitlab-runner: small
 class TestPythonPy3UnitTestXmlReporting(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_urllib3.py b/support/testing/tests/package/test_python_urllib3.py
index 54a94d5e65..1f440b8935 100644
--- a/support/testing/tests/package/test_python_urllib3.py
+++ b/support/testing/tests/package/test_python_urllib3.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Urllib3(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_uvloop.py b/support/testing/tests/package/test_python_uvloop.py
index c5079ba59c..76c600994d 100644
--- a/support/testing/tests/package/test_python_uvloop.py
+++ b/support/testing/tests/package/test_python_uvloop.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Uvloop(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_varlink.py b/support/testing/tests/package/test_python_varlink.py
index f8595582f5..049e873b3d 100644
--- a/support/testing/tests/package/test_python_varlink.py
+++ b/support/testing/tests/package/test_python_varlink.py
@@ -3,6 +3,7 @@ import os
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Varlink(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_waitress.py b/support/testing/tests/package/test_python_waitress.py
index 8024aaacfd..b1ac23009d 100644
--- a/support/testing/tests/package/test_python_waitress.py
+++ b/support/testing/tests/package/test_python_waitress.py
@@ -3,6 +3,7 @@ import time
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonWaitress(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_whitenoise.py b/support/testing/tests/package/test_python_whitenoise.py
index 5a76b6d5be..18629011e4 100644
--- a/support/testing/tests/package/test_python_whitenoise.py
+++ b/support/testing/tests/package/test_python_whitenoise.py
@@ -3,6 +3,7 @@ import time
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonPy3Whitenoise(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_xmodem.py b/support/testing/tests/package/test_python_xmodem.py
index b9feb78109..e1983151ee 100644
--- a/support/testing/tests/package/test_python_xmodem.py
+++ b/support/testing/tests/package/test_python_xmodem.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostPythonXmodem(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-python-xmodem"]
 
diff --git a/support/testing/tests/package/test_python_yamllint.py b/support/testing/tests/package/test_python_yamllint.py
index 226048ae87..c53d5c4033 100644
--- a/support/testing/tests/package/test_python_yamllint.py
+++ b/support/testing/tests/package/test_python_yamllint.py
@@ -1,6 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
+# Gitlab-runner: small
 class TestPythonYamllint(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
index 154481fe4a..83e900026f 100644
--- a/support/testing/tests/package/test_quazip.py
+++ b/support/testing/tests/package/test_quazip.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestQuazipQt6(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
@@ -23,6 +24,7 @@ class TestQuazipQt6(infra.basetest.BRTest):
         self.assertRunOk("/usr/bin/qztest", 120)
 
 
+# Gitlab-runner: small
 class TestQuazipQt5(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
index ec29f1785b..b8465f4094 100644
--- a/support/testing/tests/package/test_rasdaemon.py
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRasdaemon(infra.basetest.BRTest):
     config = f"""
         BR2_x86_64=y
diff --git a/support/testing/tests/package/test_rdma_core.py b/support/testing/tests/package/test_rdma_core.py
index 2815ebadb7..281f1b9f33 100644
--- a/support/testing/tests/package/test_rdma_core.py
+++ b/support/testing/tests/package/test_rdma_core.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRdmaCore(infra.basetest.BRTest):
 
     config = \
diff --git a/support/testing/tests/package/test_redis.py b/support/testing/tests/package/test_redis.py
index 2a333f46ad..90e0da0898 100644
--- a/support/testing/tests/package/test_redis.py
+++ b/support/testing/tests/package/test_redis.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRedis(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
     BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_rings.py b/support/testing/tests/package/test_rings.py
index be9765f185..4143e7436b 100644
--- a/support/testing/tests/package/test_rings.py
+++ b/support/testing/tests/package/test_rings.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuaRings(TestLuaBase):
     config = TestLuaBase.config + \
         """
@@ -13,6 +14,7 @@ class TestLuaRings(TestLuaBase):
         self.module_test("rings")
 
 
+# Gitlab-runner: small
 class TestLuajitRings(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_rrdtool.py b/support/testing/tests/package/test_rrdtool.py
index 431a867bf2..e85ee18a07 100644
--- a/support/testing/tests/package/test_rrdtool.py
+++ b/support/testing/tests/package/test_rrdtool.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRRDTool(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_rt_tests.py b/support/testing/tests/package/test_rt_tests.py
index 0795d7afd2..70d38f69f5 100644
--- a/support/testing/tests/package/test_rt_tests.py
+++ b/support/testing/tests/package/test_rt_tests.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRtTests(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_ruby.py b/support/testing/tests/package/test_ruby.py
index 5d4c0031fb..521b64cd42 100644
--- a/support/testing/tests/package/test_ruby.py
+++ b/support/testing/tests/package/test_ruby.py
@@ -2,6 +2,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestRuby(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 763125ca20..c2a2ec658c 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -14,6 +14,7 @@ class TestRustBase(infra.basetest.BRTest):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestRustBin(TestRustBase):
     config = \
         """
@@ -35,6 +36,7 @@ class TestRustBin(TestRustBase):
         self.assertRunOk("rg Buildroot /etc/issue")
 
 
+# Gitlab-runner: 2xlarge
 class TestRust(TestRustBase):
     config = \
         """
@@ -57,6 +59,7 @@ class TestRust(TestRustBase):
         self.assertRunOk("rg Buildroot /etc/issue")
 
 
+# Gitlab-runner: small
 class TestRustVendoring(infra.basetest.BRConfigTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_s6.py b/support/testing/tests/package/test_s6.py
index 0772831db8..f17babab9a 100644
--- a/support/testing/tests/package/test_s6.py
+++ b/support/testing/tests/package/test_s6.py
@@ -4,6 +4,7 @@ import textwrap
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestS6(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_s6_networking.py b/support/testing/tests/package/test_s6_networking.py
index bbbaefdf94..cb740a728b 100644
--- a/support/testing/tests/package/test_s6_networking.py
+++ b/support/testing/tests/package/test_s6_networking.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestS6Networking(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_s6_portable_utils.py b/support/testing/tests/package/test_s6_portable_utils.py
index d4df70cd51..8de505ca03 100644
--- a/support/testing/tests/package/test_s6_portable_utils.py
+++ b/support/testing/tests/package/test_s6_portable_utils.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestS6PortableUtils(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_s6_rc.py b/support/testing/tests/package/test_s6_rc.py
index 7551ba7b98..3b77851d03 100644
--- a/support/testing/tests/package/test_s6_rc.py
+++ b/support/testing/tests/package/test_s6_rc.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestS6Rc(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
index b6264d34df..4816634e5e 100644
--- a/support/testing/tests/package/test_screen.py
+++ b/support/testing/tests/package/test_screen.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestScreen(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_sed.py b/support/testing/tests/package/test_sed.py
index 0a0fdb890a..3cc06b2953 100644
--- a/support/testing/tests/package/test_sed.py
+++ b/support/testing/tests/package/test_sed.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSed(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
index f19703bef2..ad4267aa1d 100644
--- a/support/testing/tests/package/test_skopeo.py
+++ b/support/testing/tests/package/test_skopeo.py
@@ -3,6 +3,7 @@ import json
 import os
 
 
+# Gitlab-runner: small
 class TestSkopeo(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_snagboot.py b/support/testing/tests/package/test_snagboot.py
index 65fe196520..356ce09b8e 100644
--- a/support/testing/tests/package/test_snagboot.py
+++ b/support/testing/tests/package/test_snagboot.py
@@ -1,6 +1,7 @@
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestHostSnagboot(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-snagboot"]
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/package/test_socat.py b/support/testing/tests/package/test_socat.py
index 67b3244843..1b9e4fcfd5 100644
--- a/support/testing/tests/package/test_socat.py
+++ b/support/testing/tests/package/test_socat.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSoCat(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_sox.py b/support/testing/tests/package/test_sox.py
index 74f784a36f..17b7ae518d 100644
--- a/support/testing/tests/package/test_sox.py
+++ b/support/testing/tests/package/test_sox.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSox(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_sqlite.py b/support/testing/tests/package/test_sqlite.py
index 215703d7f2..0fc164f6c8 100644
--- a/support/testing/tests/package/test_sqlite.py
+++ b/support/testing/tests/package/test_sqlite.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSQLite(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_strace.py b/support/testing/tests/package/test_strace.py
index c1cba2173f..49dd16e9fe 100644
--- a/support/testing/tests/package/test_strace.py
+++ b/support/testing/tests/package/test_strace.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestStrace(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_stress_ng.py b/support/testing/tests/package/test_stress_ng.py
index 12fd6ec9e6..5f9fcd47be 100644
--- a/support/testing/tests/package/test_stress_ng.py
+++ b/support/testing/tests/package/test_stress_ng.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestStressNG(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_sudo.py b/support/testing/tests/package/test_sudo.py
index daba28a1ea..2247bf5ff6 100644
--- a/support/testing/tests/package/test_sudo.py
+++ b/support/testing/tests/package/test_sudo.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSudo(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
index 0f317bb617..5f89c95594 100644
--- a/support/testing/tests/package/test_swipl.py
+++ b/support/testing/tests/package/test_swipl.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSWIPL(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_swipl/rootfs-overlay")
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index 153c9f73e5..52c4b04f76 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestSyslogNg(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_tcl.py b/support/testing/tests/package/test_tcl.py
index ae94e80a92..577ea8f1d6 100644
--- a/support/testing/tests/package/test_tcl.py
+++ b/support/testing/tests/package/test_tcl.py
@@ -4,6 +4,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTcl(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
diff --git a/support/testing/tests/package/test_tcpdump.py b/support/testing/tests/package/test_tcpdump.py
index 42bfc96082..187fe07ad4 100644
--- a/support/testing/tests/package/test_tcpdump.py
+++ b/support/testing/tests/package/test_tcpdump.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTcpdump(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_tesseract_ocr.py b/support/testing/tests/package/test_tesseract_ocr.py
index 232025bad2..af91b93d46 100644
--- a/support/testing/tests/package/test_tesseract_ocr.py
+++ b/support/testing/tests/package/test_tesseract_ocr.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTesseractOcr(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_tio.py b/support/testing/tests/package/test_tio.py
index f7d612b9dd..8363b36cbb 100644
--- a/support/testing/tests/package/test_tio.py
+++ b/support/testing/tests/package/test_tio.py
@@ -4,6 +4,7 @@ import time
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTio(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
index f2c620d5ca..0d3fb251d6 100644
--- a/support/testing/tests/package/test_tmux.py
+++ b/support/testing/tests/package/test_tmux.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTmux(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
index 5d37aef375..f404aff591 100644
--- a/support/testing/tests/package/test_trace_cmd.py
+++ b/support/testing/tests/package/test_trace_cmd.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTraceCmd(infra.basetest.BRTest):
     # A specific configuration is needed for testing trace-cmd.
     # The function tracer need to be enabled in the Kernel.
diff --git a/support/testing/tests/package/test_tree.py b/support/testing/tests/package/test_tree.py
index 3865932642..fa97631ce5 100644
--- a/support/testing/tests/package/test_tree.py
+++ b/support/testing/tests/package/test_tree.py
@@ -5,6 +5,7 @@ import xml.etree.ElementTree as ET
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestTree(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_turbolua.py b/support/testing/tests/package/test_turbolua.py
index b8253c1bf4..3cd00a3891 100644
--- a/support/testing/tests/package/test_turbolua.py
+++ b/support/testing/tests/package/test_turbolua.py
@@ -1,6 +1,7 @@
 from tests.package.test_lua import TestLuaBase
 
 
+# Gitlab-runner: small
 class TestLuajitTurbolua(TestLuaBase):
     config = TestLuaBase.config + \
         """
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
index 55a45f44fc..1646ce2b1b 100644
--- a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
     config = infra.basetest.MINIMAL_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 5e5b44af30..d54819e1a7 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -27,6 +27,7 @@ def calc_hashes(data: bytes) -> dict[str, str]:
     }
 
 
+# Gitlab-runner: small
 class TestUbootTools(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_uboot_tools")
@@ -66,6 +67,7 @@ class TestUbootTools(infra.basetest.BRTest):
         self.assertIn("crc16-ccitt", reported)
 
 
+# Gitlab-runner: small
 class TestHostUbootTools(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-uboot-tools"]
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
diff --git a/support/testing/tests/package/test_unbound.py b/support/testing/tests/package/test_unbound.py
index c92719badc..c2cfaecd5c 100644
--- a/support/testing/tests/package/test_unbound.py
+++ b/support/testing/tests/package/test_unbound.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestUnbound(infra.basetest.BRTest):
     rootfs_overlay = \
         infra.filepath("tests/package/test_unbound/rootfs-overlay")
diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index da94d6f92c..17a7b6a6f6 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestUsbIp(infra.basetest.BRTest):
     # A specific configuration is needed for testing usbip, to
     # enable USB 2.0 and USBIP support in the Kernel.
diff --git a/support/testing/tests/package/test_usbutils.py b/support/testing/tests/package/test_usbutils.py
index 83c3f7f920..68979926d8 100644
--- a/support/testing/tests/package/test_usbutils.py
+++ b/support/testing/tests/package/test_usbutils.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestUsbUtils(infra.basetest.BRTest):
     # A specific configuration is needed for testing usbutils, to
     # enable USB 2.0 support in the Kernel.
diff --git a/support/testing/tests/package/test_vorbis_tools.py b/support/testing/tests/package/test_vorbis_tools.py
index edf186f31d..e13e7a0a0d 100644
--- a/support/testing/tests/package/test_vorbis_tools.py
+++ b/support/testing/tests/package/test_vorbis_tools.py
@@ -1,6 +1,7 @@
 from tests.package.test_audio_codec_base import TestAudioCodecBase
 
 
+# Gitlab-runner: small
 class TestVorbisTools(TestAudioCodecBase):
     __test__ = True
     config = TestAudioCodecBase.config + \
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index c4a522c95b..e2bd78ea5b 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -5,6 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
+# Gitlab-runner: large
 class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
index 7279b77667..53a27ab9c4 100644
--- a/support/testing/tests/package/test_wget.py
+++ b/support/testing/tests/package/test_wget.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestWget(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
index 38f528aa7f..dcb9435013 100644
--- a/support/testing/tests/package/test_which.py
+++ b/support/testing/tests/package/test_which.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestWhich(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
index 8c7b80f522..cb34473a1f 100644
--- a/support/testing/tests/package/test_wine.py
+++ b/support/testing/tests/package/test_wine.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: large
 class TestWine(infra.basetest.BRTest):
     # Wine depends on i386 architecture. The pre-build runtime test
     # Kernel (for armv5) cannot be used. The config also uses a ext4
diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 23efb2055d..3ebdd0b326 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -149,6 +149,7 @@ class TestXenBase(infra.basetest.BRTest):
         self.assertRunOk("brctl show")
 
 
+# Gitlab-runner: large
 class TestXenAarch64(TestXenBase):
     # Test Xen on 64b Arm.
     # Boot flow: Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
@@ -189,6 +190,7 @@ class TestXenAarch64(TestXenBase):
         self.run_xen_test(arch="aarch64", options=qemu_opts)
 
 
+# Gitlab-runner: large
 class TestXenArmv7(TestXenBase):
     # Test Xen on 32b Arm v7.
     # Boot flow: Qemu Devicetree -> U-Boot -> Xen -> Linux
diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
index 03191aa22b..7cf5549a0a 100644
--- a/support/testing/tests/package/test_xfsprogs.py
+++ b/support/testing/tests/package/test_xfsprogs.py
@@ -4,6 +4,7 @@ import subprocess
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestXfsProgs(infra.basetest.BRTest):
     # This test needs a Kernel with XFS support.
     kern_frag = \
diff --git a/support/testing/tests/package/test_xvisor.py b/support/testing/tests/package/test_xvisor.py
index 6872e22db9..1be65bf35f 100644
--- a/support/testing/tests/package/test_xvisor.py
+++ b/support/testing/tests/package/test_xvisor.py
@@ -4,6 +4,7 @@ import re
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestXvisor(infra.basetest.BRTest):
     # RISC-V 64bit is the "simplest" configuration to run
     # Xvisor into QEmu.
diff --git a/support/testing/tests/package/test_xxhash.py b/support/testing/tests/package/test_xxhash.py
index 00e0f245fc..2056f4b525 100644
--- a/support/testing/tests/package/test_xxhash.py
+++ b/support/testing/tests/package/test_xxhash.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestXxHash(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_xz.py b/support/testing/tests/package/test_xz.py
index 7776c1608f..11177a9d28 100644
--- a/support/testing/tests/package/test_xz.py
+++ b/support/testing/tests/package/test_xz.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestXz(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 30794a250b..76d1d332b8 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestZ3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_zbar.py b/support/testing/tests/package/test_zbar.py
index b840df089a..6aae289566 100644
--- a/support/testing/tests/package/test_zbar.py
+++ b/support/testing/tests/package/test_zbar.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# Gitlab-runner: small
 class TestZbar(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_zchunk.py b/support/testing/tests/package/test_zchunk.py
index c250b748ef..43b0682569 100644
--- a/support/testing/tests/package/test_zchunk.py
+++ b/support/testing/tests/package/test_zchunk.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestZchunk(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_zerofree.py b/support/testing/tests/package/test_zerofree.py
index 75eea346d3..ad67bab9b6 100644
--- a/support/testing/tests/package/test_zerofree.py
+++ b/support/testing/tests/package/test_zerofree.py
@@ -3,6 +3,7 @@ import infra.basetest
 import subprocess
 
 
+# Gitlab-runner: small
 class TestZerofree(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 384fad7e33..e7d1ec5381 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -63,6 +63,7 @@ class TestZfsBase(infra.basetest.BRTest):
             self.assertRunOk(cmd, timeout=self.timeout)
 
 
+# Gitlab-runner: medium
 class TestZfsGlibc(TestZfsBase):
     config = TestZfsBase.config + \
         """
@@ -73,6 +74,7 @@ class TestZfsGlibc(TestZfsBase):
         TestZfsBase.base_test_run(self)
 
 
+# Gitlab-runner: large
 class TestZfsUclibc(TestZfsBase):
     # The Bootling aarch64 uclibc stable 2025.08-1 needs to be
     # rebuild with uClibc-ng 1.0.55.
@@ -92,6 +94,7 @@ class TestZfsUclibc(TestZfsBase):
         TestZfsBase.base_test_run(self)
 
 
+# Gitlab-runner: medium
 class TestZfsMusl(TestZfsBase):
     config = TestZfsBase.config + \
         """
diff --git a/support/testing/tests/package/test_zip.py b/support/testing/tests/package/test_zip.py
index eb2e016988..67730df796 100644
--- a/support/testing/tests/package/test_zip.py
+++ b/support/testing/tests/package/test_zip.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestZip(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/package/test_zstd.py b/support/testing/tests/package/test_zstd.py
index 24dc5fb90d..d359c4f902 100644
--- a/support/testing/tests/package/test_zstd.py
+++ b/support/testing/tests/package/test_zstd.py
@@ -1,6 +1,7 @@
 from tests.package.test_compressor_base import TestCompressorBase
 
 
+# Gitlab-runner: small
 class TestZstd(TestCompressorBase):
     __test__ = True
     config = TestCompressorBase.config + \
diff --git a/support/testing/tests/toolchain/test_aarch64_64k.py b/support/testing/tests/toolchain/test_aarch64_64k.py
index 7cdbdb9faf..6476e5008f 100644
--- a/support/testing/tests/toolchain/test_aarch64_64k.py
+++ b/support/testing/tests/toolchain/test_aarch64_64k.py
@@ -42,6 +42,7 @@ class TestAarch64Pages64kBase(infra.basetest.BRTest):
         self.assertEqual(2 ** order * 64 * 1024, size)
 
 
+# Gitlab-runner: large
 class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -50,6 +51,7 @@ class TestAarch64Pages64kGlibc(TestAarch64Pages64kBase):
         """
 
 
+# Gitlab-runner: large
 class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
@@ -58,6 +60,7 @@ class TestAarch64Pages64kuClibc(TestAarch64Pages64kBase):
         """
 
 
+# Gitlab-runner: large
 class TestAarch64Pages64kMusl(TestAarch64Pages64kBase):
     __test__ = True
     config = TestAarch64Pages64kBase.config + \
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index aed3664a02..5312c9414a 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -37,6 +37,7 @@ class TestExternalToolchain(infra.basetest.BRTest):
             self.assertTrue(os.path.exists(interp_path))
 
 
+# Gitlab-runner: small
 class TestExternalToolchainArmGnu(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -69,6 +70,7 @@ class TestExternalToolchainArmGnu(TestExternalToolchain):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -95,6 +97,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestExternalToolchainCtngMusl(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -122,6 +125,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
@@ -147,6 +151,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         self.emulator.login()
 
 
+# Gitlab-runner: small
 class TestExternalToolchainCCache(TestExternalToolchainBuildrootuClibc):
     extraconfig = \
         """
diff --git a/support/testing/tests/toolchain/test_external_arm.py b/support/testing/tests/toolchain/test_external_arm.py
index 1f8e5b4e56..0b96b0804e 100644
--- a/support/testing/tests/toolchain/test_external_arm.py
+++ b/support/testing/tests/toolchain/test_external_arm.py
@@ -1,6 +1,7 @@
 from tests.toolchain.test_external import TestExternalToolchain
 
 
+# Gitlab-runner: small
 class TestExternalToolchainArmArm(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -15,6 +16,7 @@ class TestExternalToolchainArmArm(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainArmAarch64(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -28,6 +30,7 @@ class TestExternalToolchainArmAarch64(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainArmAarch64Be(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 6bcebf80c0..00b67bd4a4 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -3,6 +3,7 @@
 from tests.toolchain.test_external import TestExternalToolchain
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -17,6 +18,7 @@ class TestExternalToolchainBootlinAarch64GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64GlibcStable(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -31,6 +33,7 @@ class TestExternalToolchainBootlinAarch64GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -45,6 +48,7 @@ class TestExternalToolchainBootlinAarch64MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64MuslStable(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -59,6 +63,7 @@ class TestExternalToolchainBootlinAarch64MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -73,6 +78,7 @@ class TestExternalToolchainBootlinAarch64UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64UclibcStable(TestExternalToolchain):
     config = """
         BR2_aarch64=y
@@ -87,6 +93,7 @@ class TestExternalToolchainBootlinAarch64UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -101,6 +108,7 @@ class TestExternalToolchainBootlinAarch64beGlibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beGlibcStable(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -115,6 +123,7 @@ class TestExternalToolchainBootlinAarch64beGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -129,6 +138,7 @@ class TestExternalToolchainBootlinAarch64beMuslBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beMuslStable(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -143,6 +153,7 @@ class TestExternalToolchainBootlinAarch64beMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -157,6 +168,7 @@ class TestExternalToolchainBootlinAarch64beUclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinAarch64beUclibcStable(TestExternalToolchain):
     config = """
         BR2_aarch64_be=y
@@ -171,6 +183,7 @@ class TestExternalToolchainBootlinAarch64beUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArcle750dUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -186,6 +199,7 @@ class TestExternalToolchainBootlinArcle750dUclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArcle750dUclibcStable(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -201,6 +215,7 @@ class TestExternalToolchainBootlinArcle750dUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArclehs38GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -216,6 +231,7 @@ class TestExternalToolchainBootlinArclehs38GlibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArclehs38GlibcStable(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -231,6 +247,7 @@ class TestExternalToolchainBootlinArclehs38GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArclehs38UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -246,6 +263,7 @@ class TestExternalToolchainBootlinArclehs38UclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArclehs38UclibcStable(TestExternalToolchain):
     config = """
         BR2_arcle=y
@@ -261,6 +279,7 @@ class TestExternalToolchainBootlinArclehs38UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -277,6 +296,7 @@ class TestExternalToolchainBootlinArmv5eabiGlibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiGlibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -293,6 +313,7 @@ class TestExternalToolchainBootlinArmv5eabiGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -309,6 +330,7 @@ class TestExternalToolchainBootlinArmv5eabiMuslBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiMuslStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -325,6 +347,7 @@ class TestExternalToolchainBootlinArmv5eabiMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -341,6 +364,7 @@ class TestExternalToolchainBootlinArmv5eabiUclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv5eabiUclibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -357,6 +381,7 @@ class TestExternalToolchainBootlinArmv5eabiUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -373,6 +398,7 @@ class TestExternalToolchainBootlinArmv6eabihfGlibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfGlibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -389,6 +415,7 @@ class TestExternalToolchainBootlinArmv6eabihfGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -405,6 +432,7 @@ class TestExternalToolchainBootlinArmv6eabihfMuslBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfMuslStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -421,6 +449,7 @@ class TestExternalToolchainBootlinArmv6eabihfMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -437,6 +466,7 @@ class TestExternalToolchainBootlinArmv6eabihfUclibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv6eabihfUclibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -453,6 +483,7 @@ class TestExternalToolchainBootlinArmv6eabihfUclibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -469,6 +500,7 @@ class TestExternalToolchainBootlinArmv7eabihfGlibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfGlibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -485,6 +517,7 @@ class TestExternalToolchainBootlinArmv7eabihfGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -501,6 +534,7 @@ class TestExternalToolchainBootlinArmv7eabihfMuslBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfMuslStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -517,6 +551,7 @@ class TestExternalToolchainBootlinArmv7eabihfMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -533,6 +568,7 @@ class TestExternalToolchainBootlinArmv7eabihfUclibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7eabihfUclibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -549,6 +585,7 @@ class TestExternalToolchainBootlinArmv7eabihfUclibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -565,6 +602,7 @@ class TestExternalToolchainBootlinArmebv7eabihfGlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfGlibcStable(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -581,6 +619,7 @@ class TestExternalToolchainBootlinArmebv7eabihfGlibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -597,6 +636,7 @@ class TestExternalToolchainBootlinArmebv7eabihfMuslBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfMuslStable(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -613,6 +653,7 @@ class TestExternalToolchainBootlinArmebv7eabihfMuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -629,6 +670,7 @@ class TestExternalToolchainBootlinArmebv7eabihfUclibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmebv7eabihfUclibcStable(TestExternalToolchain):
     config = """
         BR2_armeb=y
@@ -645,6 +687,7 @@ class TestExternalToolchainBootlinArmebv7eabihfUclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7mUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -660,6 +703,7 @@ class TestExternalToolchainBootlinArmv7mUclibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinArmv7mUclibcStable(TestExternalToolchain):
     config = """
         BR2_arm=y
@@ -675,6 +719,7 @@ class TestExternalToolchainBootlinArmv7mUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -690,6 +735,7 @@ class TestExternalToolchainBootlinM68k68xxxGlibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxGlibcStable(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -705,6 +751,7 @@ class TestExternalToolchainBootlinM68k68xxxGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -720,6 +767,7 @@ class TestExternalToolchainBootlinM68k68xxxMuslBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxMuslStable(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -735,6 +783,7 @@ class TestExternalToolchainBootlinM68k68xxxMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -750,6 +799,7 @@ class TestExternalToolchainBootlinM68k68xxxUclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68k68xxxUclibcStable(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -765,6 +815,7 @@ class TestExternalToolchainBootlinM68k68xxxUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68kcoldfireUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -780,6 +831,7 @@ class TestExternalToolchainBootlinM68kcoldfireUclibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinM68kcoldfireUclibcStable(TestExternalToolchain):
     config = """
         BR2_m68k=y
@@ -795,6 +847,7 @@ class TestExternalToolchainBootlinM68kcoldfireUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -809,6 +862,7 @@ class TestExternalToolchainBootlinMicroblazebeGlibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -823,6 +877,7 @@ class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -837,6 +892,7 @@ class TestExternalToolchainBootlinMicroblazebeMuslBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -851,6 +907,7 @@ class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -865,6 +922,7 @@ class TestExternalToolchainBootlinMicroblazebeUclibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -879,6 +937,7 @@ class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -893,6 +952,7 @@ class TestExternalToolchainBootlinMicroblazeelGlibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -907,6 +967,7 @@ class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -921,6 +982,7 @@ class TestExternalToolchainBootlinMicroblazeelMuslBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -935,6 +997,7 @@ class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -949,6 +1012,7 @@ class TestExternalToolchainBootlinMicroblazeelUclibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMicroblazeelUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -963,6 +1027,7 @@ class TestExternalToolchainBootlinMicroblazeelUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -979,6 +1044,7 @@ class TestExternalToolchainBootlinMips32GlibcBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32GlibcStable(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -995,6 +1061,7 @@ class TestExternalToolchainBootlinMips32GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -1011,6 +1078,7 @@ class TestExternalToolchainBootlinMips32MuslBleedingEdge(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32MuslStable(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -1027,6 +1095,7 @@ class TestExternalToolchainBootlinMips32MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -1043,6 +1112,7 @@ class TestExternalToolchainBootlinMips32UclibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32UclibcStable(TestExternalToolchain):
     config = """
         BR2_mips=y
@@ -1059,6 +1129,7 @@ class TestExternalToolchainBootlinMips32UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1075,6 +1146,7 @@ class TestExternalToolchainBootlinMips32elGlibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elGlibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1091,6 +1163,7 @@ class TestExternalToolchainBootlinMips32elGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1107,6 +1180,7 @@ class TestExternalToolchainBootlinMips32elMuslBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elMuslStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1123,6 +1197,7 @@ class TestExternalToolchainBootlinMips32elMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1139,6 +1214,7 @@ class TestExternalToolchainBootlinMips32elUclibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32elUclibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1155,6 +1231,7 @@ class TestExternalToolchainBootlinMips32elUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1171,6 +1248,7 @@ class TestExternalToolchainBootlinMips32r5elGlibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elGlibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1187,6 +1265,7 @@ class TestExternalToolchainBootlinMips32r5elGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1203,6 +1282,7 @@ class TestExternalToolchainBootlinMips32r5elMuslBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elMuslStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1219,6 +1299,7 @@ class TestExternalToolchainBootlinMips32r5elMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1235,6 +1316,7 @@ class TestExternalToolchainBootlinMips32r5elUclibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r5elUclibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1251,6 +1333,7 @@ class TestExternalToolchainBootlinMips32r5elUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1267,6 +1350,7 @@ class TestExternalToolchainBootlinMips32r6elGlibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elGlibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1283,6 +1367,7 @@ class TestExternalToolchainBootlinMips32r6elGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1299,6 +1384,7 @@ class TestExternalToolchainBootlinMips32r6elMuslBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elMuslStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1315,6 +1401,7 @@ class TestExternalToolchainBootlinMips32r6elMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1331,6 +1418,7 @@ class TestExternalToolchainBootlinMips32r6elUclibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips32r6elUclibcStable(TestExternalToolchain):
     config = """
         BR2_mipsel=y
@@ -1347,6 +1435,7 @@ class TestExternalToolchainBootlinMips32r6elUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1364,6 +1453,7 @@ class TestExternalToolchainBootlinMips64n32GlibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32GlibcStable(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1381,6 +1471,7 @@ class TestExternalToolchainBootlinMips64n32GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1398,6 +1489,7 @@ class TestExternalToolchainBootlinMips64n32MuslBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32MuslStable(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1415,6 +1507,7 @@ class TestExternalToolchainBootlinMips64n32MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1432,6 +1525,7 @@ class TestExternalToolchainBootlinMips64n32UclibcBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64n32UclibcStable(TestExternalToolchain):
     config = """
         BR2_mips64=y
@@ -1449,6 +1543,7 @@ class TestExternalToolchainBootlinMips64n32UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1466,6 +1561,7 @@ class TestExternalToolchainBootlinMips64eln32GlibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32GlibcStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1483,6 +1579,7 @@ class TestExternalToolchainBootlinMips64eln32GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1500,6 +1597,7 @@ class TestExternalToolchainBootlinMips64eln32MuslBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32MuslStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1517,6 +1615,7 @@ class TestExternalToolchainBootlinMips64eln32MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1534,6 +1633,7 @@ class TestExternalToolchainBootlinMips64eln32UclibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64eln32UclibcStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1551,6 +1651,7 @@ class TestExternalToolchainBootlinMips64eln32UclibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1568,6 +1669,7 @@ class TestExternalToolchainBootlinMips64r6eln32GlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32GlibcStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1585,6 +1687,7 @@ class TestExternalToolchainBootlinMips64r6eln32GlibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1602,6 +1705,7 @@ class TestExternalToolchainBootlinMips64r6eln32MuslBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32MuslStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1619,6 +1723,7 @@ class TestExternalToolchainBootlinMips64r6eln32MuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1636,6 +1741,7 @@ class TestExternalToolchainBootlinMips64r6eln32UclibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinMips64r6eln32UclibcStable(TestExternalToolchain):
     config = """
         BR2_mips64el=y
@@ -1653,6 +1759,7 @@ class TestExternalToolchainBootlinMips64r6eln32UclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1667,6 +1774,7 @@ class TestExternalToolchainBootlinOpenriscGlibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscGlibcStable(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1681,6 +1789,7 @@ class TestExternalToolchainBootlinOpenriscGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1695,6 +1804,7 @@ class TestExternalToolchainBootlinOpenriscMuslBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscMuslStable(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1709,6 +1819,7 @@ class TestExternalToolchainBootlinOpenriscMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1723,6 +1834,7 @@ class TestExternalToolchainBootlinOpenriscUclibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinOpenriscUclibcStable(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -1737,6 +1849,7 @@ class TestExternalToolchainBootlinOpenriscUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1752,6 +1865,7 @@ class TestExternalToolchainBootlinPowerpc440fpGlibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpGlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1767,6 +1881,7 @@ class TestExternalToolchainBootlinPowerpc440fpGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1782,6 +1897,7 @@ class TestExternalToolchainBootlinPowerpc440fpMuslBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpMuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1797,6 +1913,7 @@ class TestExternalToolchainBootlinPowerpc440fpMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1812,6 +1929,7 @@ class TestExternalToolchainBootlinPowerpc440fpUclibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc440fpUclibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1827,6 +1945,7 @@ class TestExternalToolchainBootlinPowerpc440fpUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1842,6 +1961,7 @@ class TestExternalToolchainBootlinPowerpce300c3GlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3GlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1857,6 +1977,7 @@ class TestExternalToolchainBootlinPowerpce300c3GlibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1872,6 +1993,7 @@ class TestExternalToolchainBootlinPowerpce300c3MuslBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3MuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1887,6 +2009,7 @@ class TestExternalToolchainBootlinPowerpce300c3MuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1902,6 +2025,7 @@ class TestExternalToolchainBootlinPowerpce300c3UclibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce300c3UclibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1917,6 +2041,7 @@ class TestExternalToolchainBootlinPowerpce300c3UclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1932,6 +2057,7 @@ class TestExternalToolchainBootlinPowerpce500mcGlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcGlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1947,6 +2073,7 @@ class TestExternalToolchainBootlinPowerpce500mcGlibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1962,6 +2089,7 @@ class TestExternalToolchainBootlinPowerpce500mcMuslBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcMuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1977,6 +2105,7 @@ class TestExternalToolchainBootlinPowerpce500mcMuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -1992,6 +2121,7 @@ class TestExternalToolchainBootlinPowerpce500mcUclibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpce500mcUclibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc=y
@@ -2007,6 +2137,7 @@ class TestExternalToolchainBootlinPowerpce500mcUclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e5500GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2022,6 +2153,7 @@ class TestExternalToolchainBootlinPowerpc64e5500GlibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e5500GlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2037,6 +2169,7 @@ class TestExternalToolchainBootlinPowerpc64e5500GlibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e6500GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2052,6 +2185,7 @@ class TestExternalToolchainBootlinPowerpc64e6500GlibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e6500GlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2067,6 +2201,7 @@ class TestExternalToolchainBootlinPowerpc64e6500GlibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e6500MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2082,6 +2217,7 @@ class TestExternalToolchainBootlinPowerpc64e6500MuslBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64e6500MuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2097,6 +2233,7 @@ class TestExternalToolchainBootlinPowerpc64e6500MuslStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64power8GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2112,6 +2249,7 @@ class TestExternalToolchainBootlinPowerpc64power8GlibcBleedingEdge(TestExternalT
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64power8GlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2127,6 +2265,7 @@ class TestExternalToolchainBootlinPowerpc64power8GlibcStable(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64power8MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2142,6 +2281,7 @@ class TestExternalToolchainBootlinPowerpc64power8MuslBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64power8MuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc64=y
@@ -2157,6 +2297,7 @@ class TestExternalToolchainBootlinPowerpc64power8MuslStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64le=y
@@ -2172,6 +2313,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge(TestExterna
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64lepower8GlibcStable(TestExternalToolchain):
     config = """
         BR2_powerpc64le=y
@@ -2187,6 +2329,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8GlibcStable(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64lepower8MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_powerpc64le=y
@@ -2202,6 +2345,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8MuslBleedingEdge(TestExternal
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinPowerpc64lepower8MuslStable(TestExternalToolchain):
     config = """
         BR2_powerpc64le=y
@@ -2217,6 +2361,7 @@ class TestExternalToolchainBootlinPowerpc64lepower8MuslStable(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2234,6 +2379,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dGlibcStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2251,6 +2397,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dGlibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2268,6 +2415,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dMuslStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2285,6 +2433,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dMuslStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2302,6 +2451,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge(TestExternalTo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv32ilp32dUclibcStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2319,6 +2469,7 @@ class TestExternalToolchainBootlinRiscv32ilp32dUclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2337,6 +2488,7 @@ class TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dGlibcStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2355,6 +2507,7 @@ class TestExternalToolchainBootlinRiscv64lp64dGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2373,6 +2526,7 @@ class TestExternalToolchainBootlinRiscv64lp64dMuslBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dMuslStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2391,6 +2545,7 @@ class TestExternalToolchainBootlinRiscv64lp64dMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2409,6 +2564,7 @@ class TestExternalToolchainBootlinRiscv64lp64dUclibcBleedingEdge(TestExternalToo
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinRiscv64lp64dUclibcStable(TestExternalToolchain):
     config = """
         BR2_riscv=y
@@ -2427,6 +2583,7 @@ class TestExternalToolchainBootlinRiscv64lp64dUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinS390xz13GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_s390x=y
@@ -2442,6 +2599,7 @@ class TestExternalToolchainBootlinS390xz13GlibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinS390xz13GlibcStable(TestExternalToolchain):
     config = """
         BR2_s390x=y
@@ -2457,6 +2615,7 @@ class TestExternalToolchainBootlinS390xz13GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinS390xz13MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_s390x=y
@@ -2472,6 +2631,7 @@ class TestExternalToolchainBootlinS390xz13MuslBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinS390xz13MuslStable(TestExternalToolchain):
     config = """
         BR2_s390x=y
@@ -2487,6 +2647,7 @@ class TestExternalToolchainBootlinS390xz13MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2502,6 +2663,7 @@ class TestExternalToolchainBootlinShsh4GlibcBleedingEdge(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4GlibcStable(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2517,6 +2679,7 @@ class TestExternalToolchainBootlinShsh4GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2532,6 +2695,7 @@ class TestExternalToolchainBootlinShsh4MuslBleedingEdge(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4MuslStable(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2547,6 +2711,7 @@ class TestExternalToolchainBootlinShsh4MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2562,6 +2727,7 @@ class TestExternalToolchainBootlinShsh4UclibcBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4UclibcStable(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2577,6 +2743,7 @@ class TestExternalToolchainBootlinShsh4UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4aebGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2592,6 +2759,7 @@ class TestExternalToolchainBootlinShsh4aebGlibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4aebGlibcStable(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2607,6 +2775,7 @@ class TestExternalToolchainBootlinShsh4aebGlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4aebMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2622,6 +2791,7 @@ class TestExternalToolchainBootlinShsh4aebMuslBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinShsh4aebMuslStable(TestExternalToolchain):
     config = """
         BR2_sh=y
@@ -2637,6 +2807,7 @@ class TestExternalToolchainBootlinShsh4aebMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinSparc64GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sparc64=y
@@ -2652,6 +2823,7 @@ class TestExternalToolchainBootlinSparc64GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinSparc64GlibcStable(TestExternalToolchain):
     config = """
         BR2_sparc64=y
@@ -2667,6 +2839,7 @@ class TestExternalToolchainBootlinSparc64GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinSparcv8UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_sparc=y
@@ -2682,6 +2855,7 @@ class TestExternalToolchainBootlinSparcv8UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinSparcv8UclibcStable(TestExternalToolchain):
     config = """
         BR2_sparc=y
@@ -2697,6 +2871,7 @@ class TestExternalToolchainBootlinSparcv8UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2712,6 +2887,7 @@ class TestExternalToolchainBootlinX8664GlibcBleedingEdge(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664GlibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2727,6 +2903,7 @@ class TestExternalToolchainBootlinX8664GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2742,6 +2919,7 @@ class TestExternalToolchainBootlinX8664MuslBleedingEdge(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664MuslStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2757,6 +2935,7 @@ class TestExternalToolchainBootlinX8664MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2772,6 +2951,7 @@ class TestExternalToolchainBootlinX8664UclibcBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664UclibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2787,6 +2967,7 @@ class TestExternalToolchainBootlinX8664UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2802,6 +2983,7 @@ class TestExternalToolchainBootlinX8664v2GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2GlibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2817,6 +2999,7 @@ class TestExternalToolchainBootlinX8664v2GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2832,6 +3015,7 @@ class TestExternalToolchainBootlinX8664v2MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2MuslStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2847,6 +3031,7 @@ class TestExternalToolchainBootlinX8664v2MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2862,6 +3047,7 @@ class TestExternalToolchainBootlinX8664v2UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v2UclibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2877,6 +3063,7 @@ class TestExternalToolchainBootlinX8664v2UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2892,6 +3079,7 @@ class TestExternalToolchainBootlinX8664v3GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3GlibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2907,6 +3095,7 @@ class TestExternalToolchainBootlinX8664v3GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2922,6 +3111,7 @@ class TestExternalToolchainBootlinX8664v3MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3MuslStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2937,6 +3127,7 @@ class TestExternalToolchainBootlinX8664v3MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2952,6 +3143,7 @@ class TestExternalToolchainBootlinX8664v3UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v3UclibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2967,6 +3159,7 @@ class TestExternalToolchainBootlinX8664v3UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2982,6 +3175,7 @@ class TestExternalToolchainBootlinX8664v4GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4GlibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2997,6 +3191,7 @@ class TestExternalToolchainBootlinX8664v4GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3012,6 +3207,7 @@ class TestExternalToolchainBootlinX8664v4MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4MuslStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3027,6 +3223,7 @@ class TestExternalToolchainBootlinX8664v4MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3042,6 +3239,7 @@ class TestExternalToolchainBootlinX8664v4UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664v4UclibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3057,6 +3255,7 @@ class TestExternalToolchainBootlinX8664v4UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3072,6 +3271,7 @@ class TestExternalToolchainBootlinX8664corei7GlibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7GlibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3087,6 +3287,7 @@ class TestExternalToolchainBootlinX8664corei7GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3102,6 +3303,7 @@ class TestExternalToolchainBootlinX8664corei7MuslBleedingEdge(TestExternalToolch
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7MuslStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3117,6 +3319,7 @@ class TestExternalToolchainBootlinX8664corei7MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3132,6 +3335,7 @@ class TestExternalToolchainBootlinX8664corei7UclibcBleedingEdge(TestExternalTool
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX8664corei7UclibcStable(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -3147,6 +3351,7 @@ class TestExternalToolchainBootlinX8664corei7UclibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3162,6 +3367,7 @@ class TestExternalToolchainBootlinX86core2GlibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2GlibcStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3177,6 +3383,7 @@ class TestExternalToolchainBootlinX86core2GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3192,6 +3399,7 @@ class TestExternalToolchainBootlinX86core2MuslBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2MuslStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3207,6 +3415,7 @@ class TestExternalToolchainBootlinX86core2MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3222,6 +3431,7 @@ class TestExternalToolchainBootlinX86core2UclibcBleedingEdge(TestExternalToolcha
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86core2UclibcStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3237,6 +3447,7 @@ class TestExternalToolchainBootlinX86core2UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3252,6 +3463,7 @@ class TestExternalToolchainBootlinX86i686GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686GlibcStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3267,6 +3479,7 @@ class TestExternalToolchainBootlinX86i686GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3282,6 +3495,7 @@ class TestExternalToolchainBootlinX86i686MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686MuslStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3297,6 +3511,7 @@ class TestExternalToolchainBootlinX86i686MuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3312,6 +3527,7 @@ class TestExternalToolchainBootlinX86i686UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinX86i686UclibcStable(TestExternalToolchain):
     config = """
         BR2_i386=y
@@ -3327,6 +3543,7 @@ class TestExternalToolchainBootlinX86i686UclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_xtensa=y
@@ -3343,6 +3560,7 @@ class TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge(TestExternalToolc
         TestExternalToolchain.common_check(self)
 
 
+# Gitlab-runner: small
 class TestExternalToolchainBootlinXtensalx60UclibcStable(TestExternalToolchain):
     config = """
         BR2_xtensa=y
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 2125b34170..b2f7a2bdcc 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -21,6 +21,7 @@ def call_script(args, env, cwd):
     return out.splitlines(), err.splitlines()
 
 
+# Gitlab-runner: small
 class TestCheckPackage(unittest.TestCase):
     """Test the various ways the script can be called.
 
diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 195e421332..be5b2e18ef 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -41,6 +41,7 @@ def call_get_developers(cmd, args, env, cwd, developers_content, stdin_data=None
         return call_script([cmd, "-d", developers_file.name] + args, env, cwd, stdin_data)
 
 
+# Gitlab-runner: small
 class TestGetDevelopers(unittest.TestCase):
     """Test the various ways the script can be called in a simple top to bottom sequence."""
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
