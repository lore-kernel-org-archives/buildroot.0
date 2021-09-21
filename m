Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4BFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6002761183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6002761183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3437E406CE;
	Tue, 21 Sep 2021 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fyvslrn8-smr; Tue, 21 Sep 2021 20:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF48406D2;
	Tue, 21 Sep 2021 20:22:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 099C51BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB65D82D49
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zly9cBJoUvYZ for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2761B82D45
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255698;
 bh=HYwJXkFRY+sJkFzVZl2I9PML7NIf/PyMf/5ieim+xZI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=L+noV124ZqcNcXE0Vk4yzpfKv5XkO7oqBWGkb5ENgFGuFczmobnwPGasQ8IMMSldm
 AV4SSKQhh/uG6eu6m/vDvztkpEPSS2UDEwDo7KFyw9buvh4JJWer5wz+R50WYG1kbX
 RJ/0YWRkI+iTvlwxVz416AeWdwEGWWHafLl+vg08=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M26vB-1mQqSp0Vy5-002YlI; Tue, 21 Sep 2021 22:21:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:32 +0200
Message-Id: <20210921202137.7092-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:UJKvOK03SMaO/0PHpiDoE5i/p1wV/1f9SEqKb7KQsVoAeijdmkf
 JbtPNImXC04RVkLetFBZcjeMzagulKvjiYMDCJ6IQn/99LeMplw/zoiV36MZtn9WJYQj4JI
 iZmw+eVLTT+7jOs5TfYv5NBS11/s2etSHkuuOlQEvN7l0AkRoGxoy33+Y3CF2YwLmK8YdXR
 Ohagd4BEBoRTLyE16XD9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N3BLQQXQ240=:ZAU2eR2WGSJY9/PUkg7zPg
 HxNWrv1IPMFXucF4l8pEAqJjIhiHFSA0X/VACHQ1sl/zk0P4lhNgCMtBUMkx/O7/0HkmyHHQ1
 i05bmPUntL0eWLShg74a/fMhRNrCt8OfiqglEJJeEZFQrno+o2n76hFYZxLfTXqWRhjeUBWF7
 Kqmp5mUTv0VxCzbZbzWiLx9bkwgSwezHcKABA5gugY/V0/ZsxnKGouf0md44m/OwZYnvpCyO6
 xSkNW5HxoE/r8rLgGxliRdk1N8ik8WiaFpotn4/F49JXuWQxQrqQvB9oUPXMbwcfTZqjkKkVD
 1FIKaL/ai8gvxV+hoNrV6ytsS6op8A61lQKrwAfrRa83VMRdYxHnoF4hq5F82SjrzCk7lUmoC
 RBBDrCr9S2Pn63mwlzSum3jw9gMjWTX0lMFx7FYi1Gx3Aal0DqF2afTTIU1KIqsDvnAKaQVfr
 mOrbPbl06RzViwaH7KF15GGRsyqO+mdTNFFkYMJT/KjPg9qesWIbqxgd9GJAndkVT8D6ijD9h
 zCaNm9UGXHWYqJC0d+fTpFwZfyOYleiaDQksKPvSJbNsLunynCAQ76s1fDK09xKWrlBH9hRkV
 cQG9fKuL5M6jFSsXDRhx2yjKa63dzXtGyQY8ENQQK6GJxGESmTUmUELN4eShmKMdzqfwYD+/a
 FyIHOWsive8FIfXVx7bLQKNHDNQnyTdcxRfuGP3VcuMLehe2g0VHvEsx3XRqINiEhUR+1e4GZ
 ll24iquZhJt3vD/wTDJBVpu00YFBv1QiVT/9Cot+7+gBLcnEI2L90+DqDAQV9qDKJ1rSFaHi8
 bqtuEo9NIEqMgMq0I5t5zc3umSyIoPWstOC4sIENJpE0pMKVHYL56XcyqX8BnMZea20B++FLG
 IXB08NenwLGo1kcY0OqE6CgOZbDsAWikFJV5jBEBAsjMyzzLAcavyeQME1NDVhBlaBnr2MHmS
 yh+Uq8EFoCqapkVdBXU/jnw5gPjXtJ1JfJHsnJesFDIdh2wUtUKfh7rBNkavxilK60FzQEEEJ
 xqxs1r7CaVO4zVxw6GiP2tzLdi8nSJjYwhxrXv4GVqnN/I4U77HaX0tZqf3iDiV8Qfcuaahgu
 z26QLepuX1zaOA=
Subject: [Buildroot] [PATCH v5 1/6] package/rpi-firmware: rework boot/config
 file handling
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Try to be less smart (focused on the one target/one use-case),
instead reduce the rpi-firmware package to a selectable list
of (verbatim) installed firmware files.

- change rpi-firmware config handling from rpi-variant/rpi-flavour
  choices to bootcode.bin, pi-default/-extended/-cut-down and
  pi4-/default/-extended/-cut-down selection

- add BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option to select installable
  config.txt file

- remove config.txt modify code/handling from raspberry post-image.sh
  script

- add different customized config.txt files to the raspberry board
  section

- change dtoverlay krnbt from 'dtoverlay=miniuart-bt,krnbt=on' to extra line
  with explanation comment

- change raspberry defconfigs to select appropiate rpi-firmware
  and config.txt files

- change genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
  use start4.elf and fixup4.dat

- update board/raspberrypi/readme.txt (add optional files fixup4.dat,
  start4.elf and zImage)

With this changes a better support for custom use-cases should
be possible, specially multi-target SD cards as suggested by
Stefan Agner ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
    use start4.elf and fixup4.dat

Changes v2 -> v3:
  - remove duplicated BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4 from
    configs/raspberrypi4_64_defconfig
  - fix BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE entry from
    configs/raspberrypi4_64_defconfig
  - change firmware list to one-assignment style (suggested by Yann E. MORIN)
  - change firmware install to make-level foreach loop (suggested by Yann E. MORIN)

Changes v3 -> v4:
  - fix config.in typo (Patch vs. Path)
  - fix 64bit config.txt files (kernel image name zImage vs. Image,
    previously done by 'post-image.sh --aarch64')

Changes v4 -> v5:
  - rebased
  - incorporate krnbt option
  - add rework boot/config file handling for cm4io and cm4io_64
  - update board/raspberrypi/readme.txt
---
 board/raspberrypi/config_0w.txt               | 29 +++++++
 board/raspberrypi/config_3.txt                | 29 +++++++
 board/raspberrypi/config_3_64bit.txt          | 32 ++++++++
 board/raspberrypi/config_3_qt5we.txt          | 26 +++++++
 board/raspberrypi/config_4.txt                | 29 +++++++
 board/raspberrypi/config_4_64bit.txt          | 36 +++++++++
 board/raspberrypi/config_cm4io.txt            | 26 +++++++
 board/raspberrypi/config_cm4io_64bit.txt      | 30 +++++++
 .../raspberrypi/config_default.txt            |  4 +-
 .../raspberrypi/genimage-raspberrypi4-64.cfg  |  4 +-
 board/raspberrypi/genimage-raspberrypi4.cfg   |  4 +-
 .../genimage-raspberrypicm4io-64.cfg          |  4 +-
 .../raspberrypi/genimage-raspberrypicm4io.cfg |  4 +-
 board/raspberrypi/post-image.sh               | 33 --------
 board/raspberrypi/readme.txt                  |  9 ++-
 configs/raspberrypi0_defconfig                |  3 +
 configs/raspberrypi0w_defconfig               |  4 +-
 configs/raspberrypi2_defconfig                |  3 +
 configs/raspberrypi3_64_defconfig             |  4 +-
 configs/raspberrypi3_defconfig                |  4 +-
 configs/raspberrypi3_qt5we_defconfig          |  4 +-
 configs/raspberrypi4_64_defconfig             |  2 +-
 configs/raspberrypi4_defconfig                |  2 +-
 configs/raspberrypi_defconfig                 |  3 +
 configs/raspberrypicm4io_64_defconfig         |  2 +-
 configs/raspberrypicm4io_defconfig            |  2 +-
 package/rpi-firmware/Config.in                | 78 ++++++++-----------
 package/rpi-firmware/rpi-firmware.mk          | 34 +++++---
 28 files changed, 334 insertions(+), 110 deletions(-)
 create mode 100644 board/raspberrypi/config_0w.txt
 create mode 100644 board/raspberrypi/config_3.txt
 create mode 100644 board/raspberrypi/config_3_64bit.txt
 create mode 100644 board/raspberrypi/config_3_qt5we.txt
 create mode 100644 board/raspberrypi/config_4.txt
 create mode 100644 board/raspberrypi/config_4_64bit.txt
 create mode 100644 board/raspberrypi/config_cm4io.txt
 create mode 100644 board/raspberrypi/config_cm4io_64bit.txt
 rename package/rpi-firmware/config.txt => board/raspberrypi/config_default.txt (79%)

diff --git a/board/raspberrypi/config_0w.txt b/board/raspberrypi/config_0w.txt
new file mode 100644
index 0000000000..195bad449e
--- /dev/null
+++ b/board/raspberrypi/config_0w.txt
@@ -0,0 +1,29 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
new file mode 100644
index 0000000000..195bad449e
--- /dev/null
+++ b/board/raspberrypi/config_3.txt
@@ -0,0 +1,29 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
new file mode 100644
index 0000000000..34412fa9e8
--- /dev/null
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -0,0 +1,32 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/config_3_qt5we.txt b/board/raspberrypi/config_3_qt5we.txt
new file mode 100644
index 0000000000..752310b179
--- /dev/null
+++ b/board/raspberrypi/config_3_qt5we.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=200
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
new file mode 100644
index 0000000000..ea02d3f071
--- /dev/null
+++ b/board/raspberrypi/config_4.txt
@@ -0,0 +1,29 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
new file mode 100644
index 0000000000..41c7e97e99
--- /dev/null
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -0,0 +1,36 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
+
+dtoverlay=vc4-kms-v3d-pi4
+dtoverlay=imx219
+#dtoverlay=ov5647
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/config_cm4io.txt b/board/raspberrypi/config_cm4io.txt
new file mode 100644
index 0000000000..01f60395b3
--- /dev/null
+++ b/board/raspberrypi/config_cm4io.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_cm4io_64bit.txt b/board/raspberrypi/config_cm4io_64bit.txt
new file mode 100644
index 0000000000..6cd8a729cd
--- /dev/null
+++ b/board/raspberrypi/config_cm4io_64bit.txt
@@ -0,0 +1,30 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable 64bits support
+arm_64bit=1
+
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_default.txt
similarity index 79%
rename from package/rpi-firmware/config.txt
rename to board/raspberrypi/config_default.txt
index 4a92a4dd95..c09ecca1a9 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_default.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
index 854e0c7e31..3c480e98f0 100644
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
index 60e1f23bcc..4e4742f3ef 100644
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
index 32a7ca897d..63806d0c31 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-cm4.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
index 5a42bcfbb4..3ee9bf551a 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-cm4.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index a6728c686e..6cad20fb9e 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -7,39 +7,6 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-for arg in "$@"
-do
-	case "${arg}" in
-		--add-miniuart-bt-overlay)
-		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
-dtoverlay=miniuart-bt,krnbt=on
-__EOF__
-		fi
-		;;
-		--aarch64)
-		# Run a 64bits kernel (armv8)
-		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# enable 64bits support
-arm_64bit=1
-__EOF__
-		fi
-		;;
-		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
-		# Set GPU memory
-		gpu_mem="${arg:2}"
-		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		;;
-	esac
-
-done
-
 # Pass an empty rootpath. genimage makes a full copy of the given rootpath to
 # ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
 # space. We don't rely on genimage to build the rootfs image, just to insert a
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 62cb248633..98c44d80a1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -87,11 +87,14 @@ After building, you should obtain this tree:
     |   +-- bootcode.bin
     |   +-- cmdline.txt
     |   +-- config.txt
-    |   +-- fixup.dat
-    |   +-- start.elf
+    |   +-- fixup.dat               [1]
+    |   +-- fixup4.dat              [1]
+    |   +-- start.elf               [1]
+    |   +-- start4.elf              [1]
     |   `-- overlays/               [2]
     +-- sdcard.img
-    `-- zImage
+    +-- Image                       [1]
+    `-- zImage                      [1]
 
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 5d611aae3f..f6e4f552fc 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -20,6 +20,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 394ef9c574..bbe25e2874 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -16,6 +16,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0w/config_0w.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -29,4 +32,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 516cc378d4..79f3d98692 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -22,6 +22,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 210ded73c4..def387cacc 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3-64/config_3_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 58b2abcfb8..1b39ac378c 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-r
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 24e1f53bae..2506025756 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -31,6 +31,9 @@ BR2_PACKAGE_QT5BASE_PNG=y
 BR2_PACKAGE_QT5WEBENGINE=y
 BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_CA_CERTIFICATES=y
 BR2_PACKAGE_NTP=y
@@ -48,4 +51,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --gpu_mem_1024=200"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 05331f7ae7..0ce05f30ef 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index d954c845d8..930522f20b 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index fd869693fa..8c70a2be6a 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-c
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 4abff0f2d9..73bb2b98f3 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -38,4 +39,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 6fa9e5bc9f..80f509b5f9 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -38,4 +39,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f5a25c5680..9e401829c6 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -11,63 +11,53 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 if BR2_PACKAGE_RPI_FIRMWARE
 
-choice
-	bool "rpi variant"
+config BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN
+	bool "rpi 0/1/2/3 bootcode.bin"
 	help
-	  The Raspberry Pi 4 introduced a slightly different naming
-	  convention and set of boot files. This option controls which
-	  format to use.
+	  The bootcode.bin for versions Zero/1/2/3 (not needed on rpi4,
+	  because it has been replaced by boot code in the onboard
+	  EEPROM).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	bool "rpi 0/1/2/3"
+	bool "rpi 0/1/2/3 (default)"
 	help
-	  The default set of files, for versions pre-4
+	  The default set of files for versions Zero/1/2/3.
 
-config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	bool "rpi 4"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
+	bool "rpi 0/1/2/3 (extended)"
 	help
-	  The Raspberry Pi 4 files
-endchoice
+	  The extended set of files for versions Zero/1/2/3 (additional
+	  GPU features, eg. more audio/video codecs).
 
-choice
-	bool "Firmware to boot"
-	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
+	bool "rpi 0/1/2/3 (cut-down)"
 	help
-	  There are three different firmware files:
-	    - the default firmware, that enables standard GPU
-	      features;
-	    - the extended firmware, that enables additional GPU
-	      features (eg. more audio/video codecs);
-	    - the cut-down firmware, for emergency situations, with
-	      only features required to boot a Linux kernel.
-
-config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
-	bool "default"
+	  The cut-down set of files for versions Zero/1/2/3 (only
+	  features required to boot a Linux kernel).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	bool "rpi 4 (default)"
+	help
+	  The default set of files for versions 4 (standard GPU
+	  features).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X
+	bool "rpi 4 (extended)"
 	help
-	  The default firmware, that enables standard GPU features.
+	  The extended set of files for versions 4 (additional GPU
+	  features, eg. more audio/video codecs).
 
-config BR2_PACKAGE_RPI_FIRMWARE_X
-	bool "extended ('x', more codecs)"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
+	bool "rpi 4 (cut-down)"
 	help
-	  The extended firmware, that enables additional GPU features
-	  (eg. more audio/video codecs).
+	  The cut-down set of files for versions 4 (only features
+	  required to boot a Linux kernel).
 
-config BR2_PACKAGE_RPI_FIRMWARE_CD
-	bool "cut-down ('cd', emergency)"
+config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
+	string "Path to a file stored as boot/config.txt"
 	help
-	  The cut-down firmware, for emergency situations, with only
-	  features required to boot a Linux kernel.
-
-endchoice
-
-config BR2_PACKAGE_RPI_FIRMWARE_BOOT
-	string
-	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4"     if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	  Path to a file stored as config.txt in the boot partiton
+	  of the generated SD card image.
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6a2bf05248..38a84100e9 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -10,6 +10,27 @@ RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
+RPI_FIRMWARE_FILES = \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+
+define RPI_FIRMWARE_INSTALL_BIN
+	$(foreach f,$(RPI_FIRMWARE_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/boot/$(f) $(BINARIES_DIR)/rpi-firmware/$(f)
+	)
+endef
+
+ifneq ($(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
+define RPI_FIRMWARE_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 $(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE) $(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -41,19 +62,10 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 endef
 endif # INSTALL_VCDBG
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
-# bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
-define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
-	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-endef
-endif
-
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
-	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
+	$(RPI_FIRMWARE_INSTALL_BIN)
+	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
