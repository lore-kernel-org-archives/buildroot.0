Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A518C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:16:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3AB961167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3AB961167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80259414BB;
	Fri, 10 Sep 2021 19:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pkj1TvjfRbqt; Fri, 10 Sep 2021 19:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3967E4071F;
	Fri, 10 Sep 2021 19:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 311431BF82D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203DB60678
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dxaDh-JOSsI for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 19:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EC196066F
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 19:16:20 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id e21so6269362ejz.12
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IytNr0MtyAdi8pdmtiThysYJ0JDJBXrE+odLCksPdHM=;
 b=h0TcLZN1qANtbd4kq+AyCo15aHlqI13qXugIqFCV4mUeFWQDiQeHe/G3dqZnohnTPi
 yLnhtzfCVDk9DOAsma8grs44zTtJ+2YgHG5G0/+bvfOLj2RG2uGmwzgDpcywpooapZqC
 UagrBLBhBVCwym4wSeHzVpJT7D1oAKqeOmiVJBGbV7XwyMm2zlY/+xfzbyH0PmQ6fHe1
 y2O9ve8qE1iDU4cR+5hHTYy21UIbQE2QJhpoSBF7SNUpnM3qTuxb/VHBgGt04uLsZuKQ
 LDVRero2aI0LlNJDc65WtJGdJo6TiaPuiBt9Ga0a1Cj3D8fEM5Av0ZV6l8Ib3Sipgnht
 xinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IytNr0MtyAdi8pdmtiThysYJ0JDJBXrE+odLCksPdHM=;
 b=MxwGOIwae3NvNtZpvp/l8tZBKmirdeuwDhrtMiTurwpi7h1NCFtDI0XcZxa6CMXlWb
 UgpaWBSwUl/hn7cord3tLf3M3BDzCYZdeQOqC1dY0Ih2eFfKVJYrtqEZL2QDDX06nLvE
 UD5XwCgV5j/+RzWud5lvA+p1s4M3+eXFXePxU1cXt2uB+SCtVy/7A9HelbHPBo55FD6M
 CwikQdrf/0AkAVVnnqWwXNNLIraxrjaVUpwocb7++wsBB9Ixr/w5kpeMHR7aa4zuZIXJ
 860+bOfzQ7tdDJbtgl2IRarpoToYuW8PEUNxV14vxtuTszI+1mSQBjZ+9oq25ylKlXbN
 ikRQ==
X-Gm-Message-State: AOAM532BpDkVjKIz0+lzesN2g5AnB2j+Ln6/Y3fu8ocK7Ja+SNB/vzdX
 OoW1cZlXXXF+6X7yxDtklqi6WCdY99as9g==
X-Google-Smtp-Source: ABdhPJylcatxdBJH2WtroNm19pSk7tNizKphG+lQbTsd/JGYetxVqQs92OIWnFdRd4y6YuMEQCZqxw==
X-Received: by 2002:a17:906:7714:: with SMTP id
 q20mr11294232ejm.551.1631301378209; 
 Fri, 10 Sep 2021 12:16:18 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j5sm2849329ejb.96.2021.09.10.12.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 12:16:17 -0700 (PDT)
To: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-4-matthew.weber@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e3ac8256-915e-afbe-0a45-e24adf99a7e1@mind.be>
Date: Fri, 10 Sep 2021 21:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827205430.39745-4-matthew.weber@collins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 3/3] support/testing/tests/fs: test OCI
 format
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 27/08/2021 22:54, Matthew Weber via buildroot wrote:
> This patch adds runtime testing of the OCI archive created by the
> sloci scripting. It launches a containerd instance, imports, and
> runs the OCI container.
> 
> The existing QEMU AARCH64 kernel config was extended to enable common
> options used by a container runtime (cgroup and overlayfs).
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> 
> ---
> The updating of the QEMU AARCH64 kernel config seemed like a better
> option then 1) adding to the docker compose test kernel fragment or
> 2) creating a new fragment for this test.

 I think a new fragment would have been better, but potato potato.

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  board/qemu/aarch64-virt/linux.config |  6 +++
>  support/testing/tests/fs/test_oci.py | 56 ++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 support/testing/tests/fs/test_oci.py
> 
> diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
> index 02e0812ffd..e3a4a92913 100644
> --- a/board/qemu/aarch64-virt/linux.config
> +++ b/board/qemu/aarch64-virt/linux.config
> @@ -3,6 +3,11 @@ CONFIG_POSIX_MQUEUE=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_TASKSTATS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
>  CONFIG_SCHED_AUTOGROUP=y
>  CONFIG_PROFILING=y
>  CONFIG_ARCH_VEXPRESS=y
> @@ -62,5 +67,6 @@ CONFIG_ARM_SMMU_V3=y
>  CONFIG_EXT4_FS=y
>  CONFIG_FUSE_FS=y
>  CONFIG_VIRTIO_FS=y
> +CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
> new file mode 100644
> index 0000000000..eb5548c510
> --- /dev/null
> +++ b/support/testing/tests/fs/test_oci.py
> @@ -0,0 +1,56 @@
> +import os
> +import shutil
> +import infra.basetest
> +
> +
> +class TestOci(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.61"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_CGROUPFS_MOUNT=y
> +        BR2_PACKAGE_CONTAINERD=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
> +        BR2_TARGET_ROOTFS_OCI=y
> +        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
> +        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
> +        BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def login(self):
> +        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda", "console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a57",
> +                                    "-m", "512M",
> +                                    "-drive", "file={},format=raw,if=virtio".format(rootfs)])
> +        self.emulator.login()
> +
> +    def place_test_oci(self):
> +        shutil.copy(os.path.join(self.builddir, 'images', 'rootfs-oci-latest-aarch64-linux.oci-image.tar'),
> +                    os.path.join(self.builddir, 'target', 'oci.tar'))
> +        self.b.build()
> +
> +    def test_run(self):
> +        self.place_test_oci()
> +        self.login()
> +
> +        cmd = "containerd &"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "ctr image import --base-name buildroot-test /oci.tar"
> +        self.assertRunOk(cmd, timeout=120)
> +
> +        cmd = "ctr run --rm --tty buildroot-test:latest v1"
> +        self.assertRunOk(cmd, timeout=120)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
