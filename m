Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F03CD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2205A6F868;
	Sun, 17 May 2026 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObsiFypxLDAd; Sun, 17 May 2026 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A543D6F863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779053800;
	bh=FncdIIU59RzCtTKJtGkuNSH99uz0sLJRDCNVoqDAo4Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fYArTvYjo+IaH+MSY7aZuxDZfS4rjJR90WeYItItEZMHH05tnfc8JrN3jjkXugUbH
	 lnVYlVG5obG6YxuYmWv6m3RJWqEk/PJkHInEfbQR2X8s+y4bHAbeRqlIysXftjsKgG
	 aY5b+fClj/6uhFaY3psIbr4EgfNtEjJkLhV4Bt/DnjIUvuQvhCImbgmd6+vDxmGl3a
	 YDXtaXbK4e6o/GZOlL1FzGwk0opUQo9U/EvkSmqbsRRuexE8RJyhgBibb/ioNRo5OP
	 wpb28u42xWmZCuVZTFdr+X1Pk33TRroXvQ6c6h3HKTa9Q0kaEoarS3WxqakKXlVJUF
	 mcRSGchKuFFCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A543D6F863;
	Sun, 17 May 2026 21:36:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A4B390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5F340634
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwlxLP03WGYq for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C851F40629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C851F40629
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C851F40629
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:36:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so796528f8f.0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779053791; x=1779658591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDnYlj1ZVKz5r1txslOWr3MwXhZ7JgeeJ03c0fg2nC4=;
 b=gXxCwcwGAJ7AofRQBLqzBPpPwYIYY3eWp4Om1wId2+KgUOAejewkgrFDYftE7T6F2K
 Zr6ywCeAUzpzo7C24kyIMJbFRdb5V83iziZxyNJJAdoU0lSZmhNIS0R8NVxe/WeFrLPy
 F/6ABdnMol0pkIgu2+PZ/0C5crqnrK2FKZAGR9PMkUVK98A1rtDUOSdqM7SUd0Gvi9wU
 Qq/xw+76sbzJa3wrkIArldHJz384si9BCFZV439V5237UO3QtV6zyz+ndt0iVj+nvgzM
 Fyd7bUxyLDg6IS0y1lsJTXX9INy8E80sL02DCELFNuJvkmaOZGCGpvICVPF7RXL8hi2B
 H6Xw==
X-Gm-Message-State: AOJu0YxFW1fKRsshdnwyPt39LkstJ3YciYSkaHGmikmHTwIlnU7swXkR
 OqR0+o+kgTEjdu4jE1wJLjzx6U2OKiYPKUVtoL8uEttgUeXWm622iyymxPdaO4AelrG4SSVD+cL
 HVDpKmIo=
X-Gm-Gg: Acq92OEvN/q5ENswkEj+Y0pPnjLjPZRWSSEmsG6O1RSrqno5f6x9IQw8+MaqMuKGw9E
 Kwl4oPbiI9OrZGvElNolczGgecWNRtn2/AHeq8tHq2v+eq/VcE49dX06Px4Q1ZT2MbBR8SgKm05
 kFWyLy9pJ6pJpwJu8JSzgr4uhHR6qXVIRWoXAIUcDRcv1t0V0iW5QZVekwA4kzn8zeAyOVzdTi1
 Rza0I4FfYFVC6HJTTPQm4Mcas0IEJGW6mxsDGqBM08WTQKlyZcm/eewKnVUjUSI8szEDDTbWsmC
 vWfVHF/6nrshsHn42CZjNc0JUi9NIAkYxRE24aswm52xxWuJXTaK+NI1vopAe/ygbpDLn56B+LW
 kczn5WmQb6E49WM59yQTC8GBUAOxx10jlMALQKyhphYNKe8tnjCWpR16bdFbm8+lCGo2XZLKJoW
 478f0ge3g/Qh6rovNVu1SwBdk9n7XjHAMWdZeLhV9xfdGyhGY+P2lpopoiKnINu1N/ud9S4i3/w
 oiHR5PAjYFac3AEI2HsbUb/5B4P07P/JZXt
X-Received: by 2002:a05:6000:2c10:b0:45d:7bf0:e61b with SMTP id
 ffacd0b85a97d-45e5c5e6af9mr20143986f8f.42.1779053791217; 
 Sun, 17 May 2026 14:36:31 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm30811870f8f.3.2026.05.17.14.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 14:36:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 May 2026 23:36:24 +0200
Message-ID: <20260517213626.3730308-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779053791; x=1779658591; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nDnYlj1ZVKz5r1txslOWr3MwXhZ7JgeeJ03c0fg2nC4=;
 b=y6EUVm9QuVbpxurv9EpwxFBT7XtN5XvlX+phcxpdbhayZYipXBm66dhFPkSABvBxkM
 lKT7eT1a/XeHEsuum32aN9KOUZZkYznENNfiedtx0tSqzEyzavwoI2etPk6gGH0ZzFO3
 GAzKAUVn4vhU8ZSzHNT+MdJp7Zr0jV3fswduM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=y6EUVm9Q
Subject: [Buildroot] [PATCH 1/3] support/testing: add gitlab-runner.json
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
x86-64 [1]:

Runner Tag						vCPUs	Memory	Storage
saas-linux-small-amd64 (default)			2	8 GB	30 GB
saas-linux-medium-amd64				4	16 GB	50 GB
saas-linux-large-amd64 (Premium and Ultimate only)	8	32 GB	100 GB
saas-linux-xlarge-amd64 (Premium and Ultimate only)	16	64 GB	200 GB
saas-linux-2xlarge-amd64 (Premium and Ultimate only)	32	128 GB	200 GB

Thanks to GitLab OSS program, Buildroot benefit a free Gold
subscription and can use Gitlab shared runners tagged with
saas-linux-{large, xlarge, 2xlarge}-amd64.

In order to use one of thoses tags in Buildroot Gitlab-CI jobs, we have
to classify all tests by ressource requirement.

Most of our tests are fast (checkpackage, test_external_bootlin...), so
saas-linux-small-amd64 runner tag is enough. Note that untagged jobs
run on the small Linux x86-64 runner [3].

Shared Gitlab-CI runners time out after 3 hours but some of our tests
requires more time to finish. Some tests may also requires more storage
due to download sources and generated files, so such test must use a
runner that provide more storage.

Introduce a "Tier list" that will be used to select the Runner Tag.

  Tier1 S (default)
  Tier2 M
  Tier3 L
  Tier4 XL
  Tier5 2XL

Gitlab runners owned by the Buildroot project can still run any
job using "buildroot-runner" tag. We expect such runners able to
run any jobs without any limitation.

If a test can't be executed by any shared Gitlab-CI runner, we have to
use a runner owned by the Buildroot project. In this case we have to
use a specific tag "buildroot-runner-only".

[1] https://docs.gitlab.com/ci/runners/hosted_runners/linux/#machine-types-available-for-linux---x86-64
[2] https://gitlab.com/buildroot.org/gitlab-oss
[3] https://docs.gitlab.com/ci/runners/hosted_runners/#gitlabcom-hosted-runner-workflow

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/gitlab-runner.json | 765 +++++++++++++++++++++++++++++
 1 file changed, 765 insertions(+)
 create mode 100644 support/testing/gitlab-runner.json

diff --git a/support/testing/gitlab-runner.json b/support/testing/gitlab-runner.json
new file mode 100644
index 0000000000..c163b4b1fa
--- /dev/null
+++ b/support/testing/gitlab-runner.json
@@ -0,0 +1,765 @@
+{
+    "tests": {
+        "tests.boot.test_atf.TestATFAllwinner.test_run": { "runner": "Tier1" },
+        "tests.boot.test_atf.TestATFAllwinner.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildArmSgi575.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildArmVexpressFvpAarch64.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildArmVirtQemu.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildArmVirtQemuKernel.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildQemuSbsa.test_run": { "runner": "Tier1" },
+        "tests.boot.test_edk2.TestEdk2BuildSolidrunArmada80x0mcbin.test_run": { "runner": "Tier1" },
+        "tests.boot.test_grub.TestGrubi386BIOS.test_run": { "runner": "Tier1" },
+        "tests.boot.test_optee_os.TestOptee.test_run": { "runner": "Tier1" },
+        "tests.boot.test_syslinux.TestSysLinuxX86EFI.test_run": { "runner": "Tier1" },
+        "tests.boot.test_syslinux.TestSysLinuxX86LegacyBios.test_run": { "runner": "Tier1" },
+        "tests.boot.test_syslinux.TestSysLinuxX86_64EFI.test_run": { "runner": "Tier1" },
+        "tests.boot.test_syslinux.TestSysLinuxX86_64LegacyBios.test_run": { "runner": "Tier1" },
+        "tests.core.test_bad_arch.DetectBadArchTest.test_run": { "runner": "Tier1" },
+        "tests.core.test_file_capabilities.TestFileCapabilities.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestFortifyConserv.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestFortifyNone.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestRelro.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestRelroPartial.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestSspNone.test_run": { "runner": "Tier1" },
+        "tests.core.test_hardening.TestSspStrong.test_run": { "runner": "Tier1" },
+        "tests.core.test_post_scripts.TestPostScripts.test_run": { "runner": "Tier1" },
+        "tests.core.test_root_password.TestRootPassword.test_run": { "runner": "Tier1" },
+        "tests.core.test_rootfs_overlay.TestRootfsOverlay.test_run": { "runner": "Tier1" },
+        "tests.core.test_selinux.TestSELinuxCustomGit.test_run": { "runner": "Tier1" },
+        "tests.core.test_selinux.TestSELinuxExtraModules.test_run": { "runner": "Tier1" },
+        "tests.core.test_selinux.TestSELinuxExtraModulesDirs.test_run": { "runner": "Tier1" },
+        "tests.core.test_selinux.TestSELinuxPackage.test_run": { "runner": "Tier1" },
+        "tests.core.test_selinux.TestSELinuxSetBooleans.test_run": { "runner": "Tier1" },
+        "tests.core.test_timezone.TestAllTimezone.test_run": { "runner": "Tier1" },
+        "tests.core.test_timezone.TestNoTimezone.test_run": { "runner": "Tier1" },
+        "tests.core.test_timezone.TestNonDefaultLimitedTimezone.test_run": { "runner": "Tier1" },
+        "tests.download.test_git.TestGitHash.test_run": { "runner": "Tier1" },
+        "tests.download.test_git.TestGitRefs.test_run": { "runner": "Tier1" },
+        "tests.download.test_gitforge.TestGitHub.test_run": { "runner": "Tier1" },
+        "tests.download.test_gitforge.TestGitLab.test_run": { "runner": "Tier1" },
+        "tests.download.test_ssh.TestSCP.test_run": { "runner": "Tier1" },
+        "tests.download.test_ssh.TestSFTP.test_run": { "runner": "Tier1" },
+        "tests.fs.test_btrfs.TestBtrfs.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutGlibc.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutGlibcMergedUsr.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutMusl.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutMuslMergedUsr.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutUclibc.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr.test_run": { "runner": "Tier1" },
+        "tests.fs.test_cpio.TestCpioFull.test_run": { "runner": "Tier1" },
+        "tests.fs.test_erofs.TestErofs.test_run": { "runner": "Tier1" },
+        "tests.fs.test_ext.TestExt2.test_run": { "runner": "Tier1" },
+        "tests.fs.test_ext.TestExt3.test_run": { "runner": "Tier1" },
+        "tests.fs.test_ext.TestExt4.test_run": { "runner": "Tier1" },
+        "tests.fs.test_f2fs.TestF2FS.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660Grub2External.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660Grub2Internal.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660SyslinuxExternal.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660SyslinuxExternalCompress.test_run": { "runner": "Tier1" },
+        "tests.fs.test_iso9660.TestIso9660SyslinuxInternal.test_run": { "runner": "Tier1" },
+        "tests.fs.test_jffs2.TestJffs2.test_run": { "runner": "Tier1" },
+        "tests.fs.test_oci.TestOci.test_run": { "runner": "Tier1" },
+        "tests.fs.test_squashfs.TestSquashfs.test_run": { "runner": "Tier1" },
+        "tests.fs.test_squashfs.TestSquashfsMaxBlocksize.test_run": { "runner": "Tier1" },
+        "tests.fs.test_squashfs.TestSquashfsMinBlocksize.test_run": { "runner": "Tier1" },
+        "tests.fs.test_ubi.TestUbi.test_run": { "runner": "Tier1" },
+        "tests.fs.test_xfs.TestXfs.test_run": { "runner": "Tier1" },
+        "tests.fs.test_yaffs2.TestYaffs2.test_run": { "runner": "Tier1" },
+        "tests.init.test_busybox.TestInitSystemBusyboxRo.test_run": { "runner": "Tier1" },
+        "tests.init.test_busybox.TestInitSystemBusyboxRoNet.test_run": { "runner": "Tier1" },
+        "tests.init.test_busybox.TestInitSystemBusyboxRw.test_run": { "runner": "Tier1" },
+        "tests.init.test_busybox.TestInitSystemBusyboxRwNet.test_run": { "runner": "Tier1" },
+        "tests.init.test_none.TestInitSystemNone.test_run": { "runner": "Tier1" },
+        "tests.init.test_openrc.TestInitSystemOpenrcMergedUsrFull.test_run": { "runner": "Tier1" },
+        "tests.init.test_openrc.TestInitSystemOpenrcRoFull.test_run": { "runner": "Tier1" },
+        "tests.init.test_openrc.TestInitSystemOpenrcRwFull.test_run": { "runner": "Tier1" },
+        "tests.init.test_systemd_selinux.TestSELinuxSystemdExt4.test_run": { "runner": "Tier1" },
+        "tests.init.test_systemd_selinux.TestSELinuxSystemdSquashfs.test_run": { "runner": "Tier1" },
+        "tests.package.test_4th.Test4th.test_run": { "runner": "Tier1" },
+        "tests.package.test_acl.TestAcl.test_run": { "runner": "Tier1" },
+        "tests.package.test_acpica.TestAcpica.test_run": { "runner": "Tier1" },
+        "tests.package.test_apache.TestApache.test_run": { "runner": "Tier1" },
+        "tests.package.test_atftp.TestAtftp.test_run": { "runner": "Tier1" },
+        "tests.package.test_atop.TestAtop.test_run": { "runner": "Tier1" },
+        "tests.package.test_attr.TestAttr.test_run": { "runner": "Tier1" },
+        "tests.package.test_audit.TestAudit.test_run": { "runner": "Tier1" },
+        "tests.package.test_avocado.TestAvocado.test_run": { "runner": "Tier1" },
+        "tests.package.test_bash.TestBash.test_run": { "runner": "Tier1" },
+        "tests.package.test_bat.TestBat.test_run": { "runner": "Tier1" },
+        "tests.package.test_bats.TestBats.test_run": { "runner": "Tier1" },
+        "tests.package.test_bc.TestBc.test_run": { "runner": "Tier1" },
+        "tests.package.test_bmap_tools.TestHostBmapTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_bmap_tools.TestPy3BmapTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_brotli.TestBrotli.test_run": { "runner": "Tier1" },
+        "tests.package.test_btrfs_progs.TestBtrfsProgs.test_run": { "runner": "Tier1" },
+        "tests.package.test_bzip2.TestBzip2.test_run": { "runner": "Tier1" },
+        "tests.package.test_connman.TestConnMan.test_run": { "runner": "Tier1" },
+        "tests.package.test_coremark.TestCoreMark.test_run": { "runner": "Tier1" },
+        "tests.package.test_crudini.TestCrudiniPy3.test_run": { "runner": "Tier1" },
+        "tests.package.test_cryptsetup.TestCryptSetup.test_run": { "runner": "Tier1" },
+        "tests.package.test_ddrescue.TestDdrescue.test_run": { "runner": "Tier1" },
+        "tests.package.test_dieharder.TestDieharder.test_run": { "runner": "Tier1" },
+        "tests.package.test_dmidecode.TestDmidecode.test_run": { "runner": "Tier1" },
+        "tests.package.test_dos2unix.TestDos2Unix.test_run": { "runner": "Tier1" },
+        "tests.package.test_dpdk.TestDPDK.test_run": { "runner": "Tier1" },
+        "tests.package.test_dropbear.TestDropbear.test_run": { "runner": "Tier1" },
+        "tests.package.test_dtbocfg.TestDtbocfg.test_run": { "runner": "Tier1" },
+        "tests.package.test_dtc.TestDtc.test_run": { "runner": "Tier1" },
+        "tests.package.test_dust.TestDust.test_run": { "runner": "Tier1" },
+        "tests.package.test_ed.TestEd.test_run": { "runner": "Tier1" },
+        "tests.package.test_ethtool.TestEthtool.test_run": { "runner": "Tier1" },
+        "tests.package.test_execline.TestExecline.test_run": { "runner": "Tier1" },
+        "tests.package.test_exfatprogs.TestExfatProgs.test_run": { "runner": "Tier1" },
+        "tests.package.test_file.TestFile.test_run": { "runner": "Tier1" },
+        "tests.package.test_flac.TestFlac.test_run": { "runner": "Tier1" },
+        "tests.package.test_fping.TestFping.test_run": { "runner": "Tier1" },
+        "tests.package.test_gawk.TestGawk.test_run": { "runner": "Tier1" },
+        "tests.package.test_gdb.TestGdbArc.test_run": { "runner": "Tier1" },
+        "tests.package.test_gdb.TestGdbFullTarget.test_run": { "runner": "Tier1" },
+        "tests.package.test_gdb.TestGdbHostOnlyAllFeatures.test_run": { "runner": "Tier1" },
+        "tests.package.test_gdb.TestGdbHostOnlyDefault.test_run": { "runner": "Tier1" },
+        "tests.package.test_gdb.TestGdbserverOnly.test_run": { "runner": "Tier1" },
+        "tests.package.test_ghostscript.TestGhostscript.test_run": { "runner": "Tier1" },
+        "tests.package.test_git.TestGit.test_run": { "runner": "Tier1" },
+        "tests.package.test_gnupg2.TestGnupg2.test_run": { "runner": "Tier1" },
+        "tests.package.test_gnuplot.TestGnuplot.test_run": { "runner": "Tier1" },
+        "tests.package.test_go.TestGoBin.test_run": { "runner": "Tier1" },
+        "tests.package.test_go.TestGoSource.test_run": { "runner": "Tier1" },
+        "tests.package.test_gpsd.TestGpsd.test_run": { "runner": "Tier1" },
+        "tests.package.test_gst1_python.TestGst1Python.test_run": { "runner": "Tier1" },
+        "tests.package.test_gumbo_parser.TestGumboParser.test_run": { "runner": "Tier1" },
+        "tests.package.test_gzip.TestGzip.test_run": { "runner": "Tier1" },
+        "tests.package.test_highway.TestHighway.test_run": { "runner": "Tier1" },
+        "tests.package.test_hwloc.TestHWLoc.test_run": { "runner": "Tier1" },
+        "tests.package.test_hyperfine.TestHyperfine.test_run": { "runner": "Tier1" },
+        "tests.package.test_iozone.TestIozone.test_run": { "runner": "Tier1" },
+        "tests.package.test_iperf.TestIperf.test_run": { "runner": "Tier1" },
+        "tests.package.test_iperf3.TestIperf3.test_run": { "runner": "Tier1" },
+        "tests.package.test_iproute2.TestIpRoute2.test_run": { "runner": "Tier1" },
+        "tests.package.test_iptables.TestIptables.test_run": { "runner": "Tier1" },
+        "tests.package.test_iputils.TestIputils.test_run": { "runner": "Tier1" },
+        "tests.package.test_ipython.TestIPythonPy3.test_run": { "runner": "Tier1" },
+        "tests.package.test_jailhouse.TestJailhouse.test_run": { "runner": "Tier1" },
+        "tests.package.test_jq.TestJq.test_run": { "runner": "Tier1" },
+        "tests.package.test_kexec.TestKexec.test_run": { "runner": "Tier1" },
+        "tests.package.test_kmod.TestKmod.test_run": { "runner": "Tier1" },
+        "tests.package.test_kvmtool.TestKvmTool.test_run": { "runner": "Tier1" },
+        "tests.package.test_lame.TestLame.test_run": { "runner": "Tier1" },
+        "tests.package.test_less.TestLess.test_run": { "runner": "Tier1" },
+        "tests.package.test_libcurl.TestLibCurl.test_run": { "runner": "Tier1" },
+        "tests.package.test_libftdi1.TestPythonPy3Libftdi1.test_run": { "runner": "Tier1" },
+        "tests.package.test_libgpgme.TestLibGpgme.test_run": { "runner": "Tier1" },
+        "tests.package.test_libiio_bindings_python.TestLibiioBindingsPython.test_run": { "runner": "Tier1" },
+        "tests.package.test_libjxl.TestLibJXL.test_run": { "runner": "Tier1" },
+        "tests.package.test_libldns.TestLibLdns.test_run": { "runner": "Tier1" },
+        "tests.package.test_libshdata.TestLibshdata.test_run": { "runner": "Tier1" },
+        "tests.package.test_lighttpd.TestLighttpd.test_run": { "runner": "Tier1" },
+        "tests.package.test_links.TestLinks.test_run": { "runner": "Tier1" },
+        "tests.package.test_lpeg.TestLuaLPeg.test_run": { "runner": "Tier1" },
+        "tests.package.test_lpeg.TestLuajitLPeg.test_run": { "runner": "Tier1" },
+        "tests.package.test_lrzip.TestLrzip.test_run": { "runner": "Tier1" },
+        "tests.package.test_lrzsz.TestLrzsz.test_run": { "runner": "Tier1" },
+        "tests.package.test_lsof.TestLsof.test_run": { "runner": "Tier1" },
+        "tests.package.test_lsqlite3.TestLuaLsqlite3.test_run": { "runner": "Tier1" },
+        "tests.package.test_lsqlite3.TestLuajitLsqlite3.test_run": { "runner": "Tier1" },
+        "tests.package.test_ltp_testsuite.TestLtpTestsuite.test_run": { "runner": "Tier1" },
+        "tests.package.test_ltrace.TestLtrace.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua.TestLua.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua.TestLuajit.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_argon2.TestLuaLuaArgon2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_argon2.TestLuajitLuaArgon2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_augeas.TestLuaLuaAugeas.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_augeas.TestLuajitLuaAugeas.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_cffi.TestLuaLuaCffi.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_cqueues.TestLuaLuaCqueues.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_cqueues.TestLuajitLuaCqueues.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_curl.TestLuaLuacURL.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_curl.TestLuajitLuacURL.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_gd.TestLuaLuaGD.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_gd.TestLuajitLuaGD.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_http.TestLuaHttp.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_http.TestLuajitHttp.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_inotify.TestLuaInotify.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_inotify.TestLuajitInotify.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lgdbm.TestLuaLgdbm.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lightningmdb.TestLuaLightningmdb.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lrexlib_pcre2.TestLuaLrexlibPCRE2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lrexlib_pcre2.TestLuajitLrexlibPCRE2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lunix.TestLuaLunix.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lunix.TestLuajitLunix.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lyaml.TestLuaLuaLyaml.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_lyaml.TestLuajitLuaLyaml.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_periphery.TestLuaLuaperiphery.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_periphery.TestLuajitLuaperiphery.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_sdl2.TestLuaLuaSDL2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_sdl2.TestLuajitLuaSDL2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_utf8.TestLuaUtf8.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_utf8.TestLuajitUtf8.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_zlib.TestLuaLuazlib.test_run": { "runner": "Tier1" },
+        "tests.package.test_lua_zlib.TestLuajitLuazlib.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaexpat.TestLuaLuaExpat.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaexpat.TestLuajitLuaExpat.test_run": { "runner": "Tier1" },
+        "tests.package.test_luafilesystem.TestLuaLuaFileSystem.test_run": { "runner": "Tier1" },
+        "tests.package.test_luafilesystem.TestLuajitLuaFileSystem.test_run": { "runner": "Tier1" },
+        "tests.package.test_lualdap.TestLuaLuaLdap.test_run": { "runner": "Tier1" },
+        "tests.package.test_lualdap.TestLuajitLuaLdap.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaossl.TestLuaLuaossl.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaossl.TestLuajitLuaossl.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaposix.TestLuaLuaPosix.test_run": { "runner": "Tier1" },
+        "tests.package.test_luaposix.TestLuajitLuaPosix.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasec.TestLuaLuaSec.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasec.TestLuajitLuaSec.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasocket.TestLuaLuaSocket.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasocket.TestLuajitLuaSocket.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasyslog.TestLuaLuasyslog.test_run": { "runner": "Tier1" },
+        "tests.package.test_luasyslog.TestLuajitLuasyslog.test_run": { "runner": "Tier1" },
+        "tests.package.test_luvi.TestLuvi.test_run": { "runner": "Tier1" },
+        "tests.package.test_lvm2.TestLvm2.test_run": { "runner": "Tier1" },
+        "tests.package.test_lxc.TestLxc.test_run": { "runner": "Tier1" },
+        "tests.package.test_lynis.TestLynis.test_run": { "runner": "Tier1" },
+        "tests.package.test_lz4.TestLz4.test_run": { "runner": "Tier1" },
+        "tests.package.test_lzip.TestLzip.test_run": { "runner": "Tier1" },
+        "tests.package.test_lzlib.TestLuaLzlib.test_run": { "runner": "Tier1" },
+        "tests.package.test_lzop.TestLzop.test_run": { "runner": "Tier1" },
+        "tests.package.test_make.TestMake.test_run": { "runner": "Tier1" },
+        "tests.package.test_mariadb.TestMariaDB.test_run": { "runner": "Tier1" },
+        "tests.package.test_mawk.TestMawk.test_run": { "runner": "Tier1" },
+        "tests.package.test_mdadm.TestMdadm.test_run": { "runner": "Tier1" },
+        "tests.package.test_memcached.TestMemcached.test_run": { "runner": "Tier1" },
+        "tests.package.test_mender.TestMenderRO.test_run": { "runner": "Tier1" },
+        "tests.package.test_mender.TestMenderRW.test_run": { "runner": "Tier1" },
+        "tests.package.test_micropython.TestMicroPython.test_run": { "runner": "Tier1" },
+        "tests.package.test_mosquitto.TestMosquitto.test_run": { "runner": "Tier1" },
+        "tests.package.test_msr_tools.TestMsrTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_mtd.TestMtd.test_run": { "runner": "Tier1" },
+        "tests.package.test_mtools.TestMtools.test_run": { "runner": "Tier1" },
+        "tests.package.test_mtr.TestMtr.test_run": { "runner": "Tier1" },
+        "tests.package.test_ncdu.TestNcdu.test_run": { "runner": "Tier1" },
+        "tests.package.test_ndctl.TestNdctl.test_run": { "runner": "Tier1" },
+        "tests.package.test_netcat.TestNetCat.test_run": { "runner": "Tier1" },
+        "tests.package.test_netdata.TestNetdata.test_run": { "runner": "Tier1" },
+        "tests.package.test_netsnmp.TestNetSNMP.test_run": { "runner": "Tier1" },
+        "tests.package.test_nftables.TestNftables.test_run": { "runner": "Tier1" },
+        "tests.package.test_nftables.TestNftablesInit.test_run": { "runner": "Tier1" },
+        "tests.package.test_nginx_modsecurity.TestNginxModsecurity.test_run": { "runner": "Tier1" },
+        "tests.package.test_ngrep.TestNgrep.test_run": { "runner": "Tier1" },
+        "tests.package.test_nmap.TestNmap.test_run": { "runner": "Tier1" },
+        "tests.package.test_ntp.TestNtp.test_run": { "runner": "Tier1" },
+        "tests.package.test_nu.TestNu.test_run": { "runner": "Tier1" },
+        "tests.package.test_numactl.TestNumaCtl.test_run": { "runner": "Tier1" },
+        "tests.package.test_oath_toolkit.TestOathToolKit.test_run": { "runner": "Tier1" },
+        "tests.package.test_octave.TestOctave.test_run": { "runner": "Tier1" },
+        "tests.package.test_openocd.TestOpenOCD.test_run": { "runner": "Tier1" },
+        "tests.package.test_openssh.TestOpenSshGlibc.test_run": { "runner": "Tier1" },
+        "tests.package.test_openssh.TestOpenSshuClibc.test_run": { "runner": "Tier1" },
+        "tests.package.test_opkg.TestOpkg.test_run": { "runner": "Tier1" },
+        "tests.package.test_opus_tools.TestOpusTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_parted.TestParted.test_run": { "runner": "Tier1" },
+        "tests.package.test_patch.TestPatch.test_run": { "runner": "Tier1" },
+        "tests.package.test_pciutils.TestPCIUtils.test_run": { "runner": "Tier1" },
+        "tests.package.test_perftest.TestPerftest.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl.TestPerl.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_class_load.TestPerlClassLoad.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_encode_detect.TestPerlEncodeDetect.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_gdgraph.TestPerlGDGraph.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_html_parser.TestPerlHTMLParser.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_io_socket_multicast.TestPerlIOSocketMulticast.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_libwww_perl.TestPerllibwwwperl.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_lwp_protocol_https.TestPerlLWPProtocolhttps.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_mail_dkim.TestPerlMailDKIM.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_x10.TestPerlX10.test_run": { "runner": "Tier1" },
+        "tests.package.test_perl_xml_libxml.TestPerlXMLLibXML.test_run": { "runner": "Tier1" },
+        "tests.package.test_php_apcu.TestPhpApcu.test_run": { "runner": "Tier1" },
+        "tests.package.test_php_lua.TestPhpLuaLua.test_run": { "runner": "Tier1" },
+        "tests.package.test_php_lua.TestPhpLuaLuajit.test_run": { "runner": "Tier1" },
+        "tests.package.test_php_pam.TestPhpPam.test_run": { "runner": "Tier1" },
+        "tests.package.test_php_pecl_dbus.TestPhpPeclDbus.test_run": { "runner": "Tier1" },
+        "tests.package.test_pigz.TestPigz.test_run": { "runner": "Tier1" },
+        "tests.package.test_pixz.TestPixz.test_run": { "runner": "Tier1" },
+        "tests.package.test_podman.TestPodmanIptables.test_run": { "runner": "Tier1" },
+        "tests.package.test_podman.TestPodmanNftables.test_run": { "runner": "Tier1" },
+        "tests.package.test_podman.TestPodmanSlirpIptables.test_run": { "runner": "Tier1" },
+        "tests.package.test_podman.TestPodmanSlirpNftables.test_run": { "runner": "Tier1" },
+        "tests.package.test_podman.TestPodmanTini.test_run": { "runner": "Tier1" },
+        "tests.package.test_polkit.TestPolkitInitd.test_run": { "runner": "Tier1" },
+        "tests.package.test_polkit.TestPolkitSystemd.test_run": { "runner": "Tier1" },
+        "tests.package.test_postgresql.TestPostgreSQL.test_run": { "runner": "Tier1" },
+        "tests.package.test_pppd.TestPppd.test_run": { "runner": "Tier1" },
+        "tests.package.test_proj.TestProj.test_run": { "runner": "Tier1" },
+        "tests.package.test_prosody.TestProsodyLua51.test_run": { "runner": "Tier1" },
+        "tests.package.test_prosody.TestProsodyLuajit.test_run": { "runner": "Tier1" },
+        "tests.package.test_pv.TestPv.test_run": { "runner": "Tier1" },
+        "tests.package.test_python.TestPython3Py.test_run": { "runner": "Tier1" },
+        "tests.package.test_python.TestPython3PyPyc.test_run": { "runner": "Tier1" },
+        "tests.package.test_python.TestPython3Pyc.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_aexpect.TestPythonPy3Aexpect.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_apscheduler.TestPythonPy3Apscheduler.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_argh.TestPythonPy3Argh.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_asn1crypto.TestPythonPy3Asn1Crypto.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_attrs.TestPythonPy3Attrs.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_augeas.TestPythonAugeas.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_autobahn.TestPythonPy3Autobahn.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_automat.TestPythonPy3Automat.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_avro.TestPythonAvro.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_bitstring.TestPythonPy3Bitstring.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_boto3.TestPythonPy3Boto3.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_botocore.TestPythonPy3Botocore.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_can.TestPythonPy3Can.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_cbor.TestPythonPy3Cbor.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_click.TestPythonPy3Click.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_cloudpickle.TestPythonPy3Cloudpickle.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_colorzero.TestPythonPy3Colorzero.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_constantly.TestPythonPy3Constantly.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_construct.TestPythonPy3Construct.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_crc.TestPythonPy3Crc.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_crccheck.TestHostPythonCrccheck.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_cryptography.TestPythonPy3Cryptography.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_dbus_fast.TestPythonPy3DBusFast.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_dbus_next.TestPythonPy3DBusNext.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_dicttoxml2.TestPythonPy3Dicttoxml2.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_diskcache.TestPythonPy3DiskCache.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_distro.TestPythonPy3Distro.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_django.TestPythonPy3Django.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_dtschema.TestPythonPy3Dtschema.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_evdev.TestPythonPy3Evdev.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_farama_notifications.TestPythonPy3FaramaNotifications.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_fastapi.TestPythonPy3Fastapi.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_flask.TestPythonPy3Flask.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_flask_expects_json.TestPythonPy3FlaskExpectsJson.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_fs.TestHostPythonFs.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_git.TestPythonPy3Git.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_gitdb2.TestPythonPy3Gitdb2.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_gnupg.TestPythonPy3GnuPG.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_gobject.TestPythonPy3Gobject.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_gpiozero.TestPythonPy3Gpiozero.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_gymnasium.TestPythonPy3Gymnasium.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_hid.TestPythonHid.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_hkdf.TestPythonPy3Hkdf.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_humanfriendly.TestPythonPy3HumanFriendly.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_hwdata.TestPythonHwdata.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_incremental.TestPythonPy3Incremental.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_iptables.TestPythonPy3Iptables.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_jc.TestPythonPy3Jc.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_jmespath.TestPythonPy3Jmespath.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_magic_wormhole.TestPythonPy3MagicWormhole.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_mako.TestPythonPy3Mako.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_mako.TestPythonPy3MakoExt.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_memray.TestPythonMemray.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_midiutil.TestPythonPy3MidiUtil.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_minimalmodbus.TestPythonPy3Minimalmodbus.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_ml_dtypes.TestPythonPy3MlDtypes.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_mpmath.TestPythonPy3MpMath.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_msgpack.TestPythonPy3MsgPack.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_munch.TestPythonPy3Munch.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_networkmanager_goi.TestPythonPy3NetworkmanagerGoi.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_paho_mqtt.TestPythonPahoMQTT.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_passlib.TestPythonPy3Passlib.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pathspec.TestPythonPathSpec.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pexpect.TestPythonPy3Pexpect.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyalsa.TestPythonPy3PyAlsa.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pybind.TestPythonPybind.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pydantic.TestPythonPy3Pydantic.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pydantic_settings.TestPythonPy3PydanticSettings.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyfatfs.TestHostPythonPyfatfs.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pymupdf.TestPythonPy3PyMuPDF.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pynacl.TestPythonPy3Pynacl.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyndiff.TestPyNdiff.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyproj.TestPythonPy3Pyproj.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyroute2.TestPythonPyroute2.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pysmb.TestPythonPy3Pysmb.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pytest.TestPythonPy3Pytest.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pytest_asyncio.TestPythonPy3PytestAsyncio.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyusb.TestHostPythonPyusb.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_pyyaml.TestPythonPy3Pyyaml.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_qrcode.TestPythonPy3Qrcode.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_requests.TestPythonPy3Requests.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_rpi_gpio.TestPythonPy3RpiGpio.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_rsa.TestPythonPy3RSA.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_rtoml.TestPythonPy3rtoml.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_ruamel_yaml.TestPythonPy3RuamelYaml.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_s3transfer.TestPythonPy3S3transfer.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_scp.TestPythonSCP.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_sdbus.TestPythonPy3Sdbus.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_sdbus_modemmanager.TestPythonPy3SdbusModemmanager.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_sdbus_networkmanager.TestPythonPy3SdbusNetworkmanager.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_sdbus_systemd.TestPythonPy3SdbusSystemd.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_segno.TestPythonPy3Segno.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_serial.TestHostPythonSerial.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_service_identity.TestPythonPy3ServiceIdentity.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_smmap2.TestPythonPy3Smmap2.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_spake2.TestPythonPy3Spake2.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_sympy.TestPythonPy3SymPy.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_tftpy.TestHostPythonTftpy.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_tftpy.TestPythonTftpy.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_transitions.TestPythonTransitions.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_treq.TestPythonPy3Treq.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_twisted.TestPythonPy3Twisted.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_txaio.TestPythonPy3Txaio.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_txtorcon.TestPythonPy3Txtorcon.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_tzlocal.TestPythonPy3TZLocal.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_ubjson.TestPythonPy3Ubjson.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_unittest_xml_reporting.TestPythonPy3UnitTestXmlReporting.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_urllib3.TestPythonPy3Urllib3.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_uvloop.TestPythonPy3Uvloop.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_varlink.TestPythonPy3Varlink.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_waitress.TestPythonWaitress.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_whitenoise.TestPythonPy3Whitenoise.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_xmodem.TestHostPythonXmodem.test_run": { "runner": "Tier1" },
+        "tests.package.test_python_yamllint.TestPythonYamllint.test_run": { "runner": "Tier1" },
+        "tests.package.test_quazip.TestQuazipQt5.test_run": { "runner": "Tier1" },
+        "tests.package.test_quazip.TestQuazipQt6.test_run": { "runner": "Tier1" },
+        "tests.package.test_rasdaemon.TestRasdaemon.test_run": { "runner": "Tier1" },
+        "tests.package.test_rdma_core.TestRdmaCore.test_run": { "runner": "Tier1" },
+        "tests.package.test_redis.TestRedis.test_run": { "runner": "Tier1" },
+        "tests.package.test_rings.TestLuaRings.test_run": { "runner": "Tier1" },
+        "tests.package.test_rings.TestLuajitRings.test_run": { "runner": "Tier1" },
+        "tests.package.test_rrdtool.TestRRDTool.test_run": { "runner": "Tier1" },
+        "tests.package.test_rt_tests.TestRtTests.test_run": { "runner": "Tier1" },
+        "tests.package.test_ruby.TestRuby.test_run": { "runner": "Tier1" },
+        "tests.package.test_rust.TestRustBin.test_run": { "runner": "Tier1" },
+        "tests.package.test_rust.TestRustVendoring.test_run": { "runner": "Tier1" },
+        "tests.package.test_s6.TestS6.test_run": { "runner": "Tier1" },
+        "tests.package.test_s6_networking.TestS6Networking.test_run": { "runner": "Tier1" },
+        "tests.package.test_s6_portable_utils.TestS6PortableUtils.test_run": { "runner": "Tier1" },
+        "tests.package.test_s6_rc.TestS6Rc.test_run": { "runner": "Tier1" },
+        "tests.package.test_screen.TestScreen.test_run": { "runner": "Tier1" },
+        "tests.package.test_sed.TestSed.test_run": { "runner": "Tier1" },
+        "tests.package.test_skopeo.TestSkopeo.test_run": { "runner": "Tier1" },
+        "tests.package.test_snagboot.TestHostSnagboot.test_run": { "runner": "Tier1" },
+        "tests.package.test_socat.TestSoCat.test_run": { "runner": "Tier1" },
+        "tests.package.test_sox.TestSox.test_run": { "runner": "Tier1" },
+        "tests.package.test_sqlite.TestSQLite.test_run": { "runner": "Tier1" },
+        "tests.package.test_strace.TestStrace.test_run": { "runner": "Tier1" },
+        "tests.package.test_stress_ng.TestStressNG.test_run": { "runner": "Tier1" },
+        "tests.package.test_sudo.TestSudo.test_run": { "runner": "Tier1" },
+        "tests.package.test_swipl.TestSWIPL.test_run": { "runner": "Tier1" },
+        "tests.package.test_syslog_ng.TestSyslogNg.test_run": { "runner": "Tier1" },
+        "tests.package.test_tcl.TestTcl.test_run": { "runner": "Tier1" },
+        "tests.package.test_tcpdump.TestTcpdump.test_run": { "runner": "Tier1" },
+        "tests.package.test_tesseract_ocr.TestTesseractOcr.test_run": { "runner": "Tier1" },
+        "tests.package.test_tio.TestTio.test_run": { "runner": "Tier1" },
+        "tests.package.test_tmux.TestTmux.test_run": { "runner": "Tier1" },
+        "tests.package.test_trace_cmd.TestTraceCmd.test_run": { "runner": "Tier1" },
+        "tests.package.test_tree.TestTree.test_run": { "runner": "Tier1" },
+        "tests.package.test_turbolua.TestLuajitTurbolua.test_run": { "runner": "Tier1" },
+        "tests.package.test_uboot_tools.TestHostUbootTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_uboot_tools.TestUbootTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_unbound.TestUnbound.test_run": { "runner": "Tier1" },
+        "tests.package.test_usbip.TestUsbIp.test_run": { "runner": "Tier1" },
+        "tests.package.test_usbutils.TestUsbUtils.test_run": { "runner": "Tier1" },
+        "tests.package.test_vorbis_tools.TestVorbisTools.test_run": { "runner": "Tier1" },
+        "tests.package.test_wget.TestWget.test_run": { "runner": "Tier1" },
+        "tests.package.test_which.TestWhich.test_run": { "runner": "Tier1" },
+        "tests.package.test_xfsprogs.TestXfsProgs.test_run": { "runner": "Tier1" },
+        "tests.package.test_xvisor.TestXvisor.test_run": { "runner": "Tier1" },
+        "tests.package.test_xxhash.TestXxHash.test_run": { "runner": "Tier1" },
+        "tests.package.test_xz.TestXz.test_run": { "runner": "Tier1" },
+        "tests.package.test_z3.TestZ3.test_run": { "runner": "Tier1" },
+        "tests.package.test_zbar.TestZbar.test_run": { "runner": "Tier1" },
+        "tests.package.test_zchunk.TestZchunk.test_run": { "runner": "Tier1" },
+        "tests.package.test_zerofree.TestZerofree.test_run": { "runner": "Tier1" },
+        "tests.package.test_zip.TestZip.test_run": { "runner": "Tier1" },
+        "tests.package.test_zstd.TestZstd.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external.TestExternalToolchainArmGnu.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external.TestExternalToolchainBuildrootMusl.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external.TestExternalToolchainCCache.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external.TestExternalToolchainCtngMusl.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_arm.TestExternalToolchainArmAarch64.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_arm.TestExternalToolchainArmAarch64Be.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_arm.TestExternalToolchainArmArm.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinAarch64beUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArcle750dUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArcle750dUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArclehs38GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArclehs38GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArclehs38UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArclehs38UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmebv7eabihfUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv5eabiUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv6eabihfUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7eabihfUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7mUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinArmv7mUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68k68xxxUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68kcoldfireUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinM68kcoldfireUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazebeUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMicroblazeelUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32elUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r5elUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips32r6elUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64eln32UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64n32UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinMips64r6eln32UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinOpenriscUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc440fpUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e5500GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e5500GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e6500GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e6500GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e6500MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64e6500MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64lepower8GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64lepower8MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64lepower8MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64power8GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64power8GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64power8MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpc64power8MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce300c3UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinPowerpce500mcUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dUclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv64lp64dUclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinS390xz13GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinS390xz13GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinS390xz13MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinS390xz13MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4aebGlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4aebGlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4aebMuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinShsh4aebMuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinSparc64GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinSparc64GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinSparcv8UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinSparcv8UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664corei7UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v2UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v3UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX8664v4UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86core2UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686GlibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686GlibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686MuslBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686MuslStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinX86i686UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcBleedingEdge.test_run": { "runner": "Tier1" },
+        "tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinXtensalx60UclibcStable.test_run": { "runner": "Tier1" },
+        "tests.utils.test_check_package.TestCheckPackage.test_run": { "runner": "Tier1" },
+        "tests.utils.test_get_developers.TestGetDevelopers.test_run": { "runner": "Tier1" },
+
+        "tests.init.test_systemd.TestInitSystemSystemdRoFull.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoFullFactory.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoFullOverlayfs.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoFullOverlayfsVarBackingFstab.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdown.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbroker.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerDbus.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerFactory.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownFactory.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoIfupdownOverlayfs.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoNetworkd.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoNetworkdFactory.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRoNetworkdOverlayfs.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRwFull.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRwIfupdown.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRwIfupdownDbusbroker.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRwIfupdownDbusbrokerDbus.test_run": { "runner": "Tier2" },
+        "tests.init.test_systemd.TestInitSystemSystemdRwNetworkd.test_run": { "runner": "Tier2" },
+        "tests.package.test_aichat.TestAiChat.test_run": { "runner": "Tier2" },
+        "tests.package.test_bitcoin.TestBitcoin.test_run": { "runner": "Tier2" },
+        "tests.package.test_fluidsynth.TestFluidsynth.test_run": { "runner": "Tier2" },
+        "tests.package.test_gstreamer1.TestGstreamer1.test_run": { "runner": "Tier2" },
+        "tests.package.test_libcamera.TestLibCamera.test_run": { "runner": "Tier2" },
+        "tests.package.test_llama_cpp.TestLlamaCpp.test_run": { "runner": "Tier2" },
+        "tests.package.test_zfs.TestZfsGlibc.test_run": { "runner": "Tier2" },
+        "tests.package.test_zfs.TestZfsMusl.test_run": { "runner": "Tier2" },
+
+        "tests.boot.test_edk2.TestEdk2.test_run": { "runner": "Tier3" },
+        "tests.boot.test_grub.TestGrubAArch64EFI.test_run": { "runner": "Tier3" },
+        "tests.boot.test_grub.TestGrubRiscV64EFI.test_run": { "runner": "Tier3" },
+        "tests.boot.test_grub.TestGrubX8664EFI.test_run": { "runner": "Tier3" },
+        "tests.package.test_distribution_registry.TestDistributionRegistry.test_run": { "runner": "Tier3" },
+        "tests.package.test_docker_compose.TestDockerComposeCrun.test_run": { "runner": "Tier3" },
+        "tests.package.test_docker_compose.TestDockerComposeRunc.test_run": { "runner": "Tier3" },
+        "tests.package.test_dosfstools.TestDosFsTools.test_run": { "runner": "Tier3" },
+        "tests.package.test_firewalld.TestFirewalldSysVInit.test_run": { "runner": "Tier3" },
+        "tests.package.test_firewalld.TestFirewalldSystemd.test_run": { "runner": "Tier3" },
+        "tests.package.test_fwts.TestFwts.test_run": { "runner": "Tier3" },
+        "tests.package.test_glxinfo.TestGlxinfo.test_run": { "runner": "Tier3" },
+        "tests.package.test_gnuradio.TestGnuradio.test_run": { "runner": "Tier3" },
+        "tests.package.test_mender.TestMenderSystemd.test_run": { "runner": "Tier3" },
+        "tests.package.test_nodejs.TestNodeJSModuleHostBin.test_run": { "runner": "Tier3" },
+        "tests.package.test_openblas.TestOpenBLAS.test_run": { "runner": "Tier3" },
+        "tests.package.test_openjdk.TestOpenJdk.test_run": { "runner": "Tier3" },
+        "tests.package.test_python_pyqt5.TestPythonPyQt5.test_run": { "runner": "Tier3" },
+        "tests.package.test_python_scipy.TestPythonPy3SciPy.test_run": { "runner": "Tier3" },
+        "tests.package.test_uboot_openssl_pkgconfig.TestUbootOpensslPkgConfig.test_run": { "runner": "Tier3" },
+        "tests.package.test_weston.TestWeston.test_run": { "runner": "Tier3" },
+        "tests.package.test_wine.TestWine.test_run": { "runner": "Tier3" },
+        "tests.package.test_xen.TestXenAarch64.test_run": { "runner": "Tier3" },
+        "tests.package.test_xen.TestXenArmv7.test_run": { "runner": "Tier3" },
+        "tests.package.test_zfs.TestZfsUclibc.test_run": { "runner": "Tier3" },
+        "tests.toolchain.test_aarch64_64k.TestAarch64Pages64kGlibc.test_run": { "runner": "Tier3" },
+        "tests.toolchain.test_aarch64_64k.TestAarch64Pages64kMusl.test_run": { "runner": "Tier3" },
+        "tests.toolchain.test_aarch64_64k.TestAarch64Pages64kuClibc.test_run": { "runner": "Tier3" },
+        "tests.package.test_flutter.TestFlutter.test_run": { "runner": "Tier4" },
+        "tests.package.test_glslsandbox_player.TestGlslsandboxPlayer.test_run": { "runner": "Tier4" },
+        "tests.package.test_kmscube.TestKmsCube.test_run": { "runner": "Tier4" },
+        "tests.package.test_perl_dbd_mysql.TestPerlDBDmysql.test_run": { "runner": "Tier4" },
+
+        "tests.package.test_bcc.TestBcc.test_run": { "runner": "Tier5" },
+        "tests.package.test_clang.TestClangCompilerRT.test_run": { "runner": "Tier5" },
+        "tests.package.test_mesa3d.TestMesa3DRusticl.test_run": { "runner": "Tier5" },
+        "tests.package.test_nodejs.TestNodeJSBasic.test_run": { "runner": "Tier5" },
+        "tests.package.test_nodejs.TestNodeJSModuleHostSrc.test_run": { "runner": "Tier5" },
+        "tests.package.test_rust.TestRust.test_run": { "runner": "Tier5" }
+    }
+}
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
