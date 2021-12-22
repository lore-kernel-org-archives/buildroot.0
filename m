Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE84C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A778760FCF;
	Wed, 22 Dec 2021 17:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3ut2GA9mtlU; Wed, 22 Dec 2021 17:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CF860F7F;
	Wed, 22 Dec 2021 17:49:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFE441BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE7618278F
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZDhTmLUccp4 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:49:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A64826FF
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:49:22 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id EC7EB20B7179;
 Wed, 22 Dec 2021 09:49:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC7EB20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640195362;
 bh=Phmy9fsZ9vstoJKhWzt3wXLoB39h/QJY7I3gf1cgnEI=;
 h=From:To:Cc:Subject:Date:From;
 b=YI2Toq1n1FHdyRgFcyRQ9FS+NFUzxf2iz8JFpjs6nZJD/zFgZH0rjTjh8rWCxiDkp
 ietrgTjFqzRS2syGaOEJglZPhS+Oah0cjdUfIT9tbrrzjHJ27s6cM9b2yJ2+i3gudT
 yAIMDMIHFGwCJ+Lt6Fs0S2Rs9PoXcp3TrFjSiKVI=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:49:03 +0100
Message-Id: <20211222174905.71902-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] Enable BTF headers for Linux kernel
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Francis Laniel <laniel_francis@privacyrequired.com>

Hi.


First of all, I hope you are fine and the same for your relatives.

Extended Berkeley Packet Filter (eBPF) is a virtual machine inside the kernel
which permits executing safe code [1].
This code can, for example, be used to hook kernel events.

BPF Compile Once - Run Everywhere (BPF CO-RE) is thought as an evolution of
conventional BPF program [2].
BPF CO-RE relies on BPF Type Format (BTF) to be executed on different kernels.
This is done thanks to libbpf, the BPF loader, which resolves symbols contained
into the BPF binary against symbols offered by the kernel.

Kernel shares its BTF symbols through /sys/kernel/btf/vmlinux which is enabled
by CONFIG_DEBUG_INFO_BTF.
Nonetheless, CONFIG_DEBUG_INFO_BTF relies on pahole to convert DWARF symbols to
BTF [3].
Thus, this series enable BTF headers for Linux kernel by:
1. First, adding pahole as host package by compiling it from source taken from
its git repository.
2. Second, adding pahole as kernel dependencies if user selected
BR2_PACKAGE_HOST_PAHOLE.

I understand Buildroot and BPF can seem to be far from each other at first
glance.
But Buildroot, while mainly used to generate embedded Linux systems, is also
used to generate "qemu ready" image [4].
More particularly, minikube, a tool used to deploy Kubernetes locally, relies on
buildroot to generate its system image [5, 6].

I use minikube daily to test a tool we develop for Kubernetes and I wrote a
patch to enable CONFIG_DEBUG_INFO_BTF [7, 8].
Thus, I thought it could be a good idea to share this patch upstream as this
feature would be welcomed by the community [9].

Regarding the series itself, I tested it by compiling a system for
qemu_x86_defconfig with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE.
Then, I booted the system using qemu to check if /sys/kernel/btf/vmlinux exists,
which is the case:
Welcome to Buildroot
buildroot login: root
# [ -f /sys/kernel/btf/vmlinux ] && echo yes
yes

If you have any remarks regarding this series, feel free to share as I would be
happy to handle them to increase this contribution quality.

Changes since v1:
* Added pahole COPYING hash.
* Jumped pahole version from v1.22 to v1.23.
* Added host-elfutils as host-pahole dependencies (it does not build without).
* Built dynamically libppf for pahole instead of statically.
* Added BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE which acts like
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF. If CONFIG_DEBUG_INFO_BTF is set and this
option not, kernel .config will not be written and an error will be printed.

Francis Laniel (2):
  package/pahole: new host package
  linux: add BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE

 DEVELOPERS                    |  3 +++
 linux/Config.in               | 12 ++++++++++++
 linux/linux.mk                | 12 ++++++++++++
 package/Config.in.host        |  1 +
 package/pahole/Config.in.host |  8 ++++++++
 package/pahole/pahole.hash    |  3 +++
 package/pahole/pahole.mk      | 18 ++++++++++++++++++
 7 files changed, 57 insertions(+)
 create mode 100644 package/pahole/Config.in.host
 create mode 100644 package/pahole/pahole.hash
 create mode 100644 package/pahole/pahole.mk


Best regards and thank you in advance for your reviews.

---
[1] https://man7.org/linux/man-pages/man2/bpf.2.html
[2] https://nakryiko.com/posts/bpf-portability-and-co-re/
[3] https://elixir.bootlin.com/linux/v5.15.10/source/lib/Kconfig.debug#L315
[4] https://petermalmgren.com/qemu-buildroot/
[5] https://github.com/kubernetes/minikube
[6] https://github.com/kubernetes/minikube/blob/7dc8836303721c4486c007945beb5272cf28601c/deploy/iso/minikube-iso/configs/minikube_defconfig
[7] https://github.com/kinvolk/inspektor-gadget
[8] https://github.com/kinvolk/minikube/commit/44327414939f8acc08e095e789bc41f7dc73099e
[9] https://github.com/kubernetes/minikube/pull/12707#issuecomment-986990849
--
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
