Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EC1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A338F80C83;
	Tue, 21 Dec 2021 15:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGcHkPRbNj5U; Tue, 21 Dec 2021 15:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34D680BBF;
	Tue, 21 Dec 2021 15:01:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 856291BF9AC
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80B354016B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hfTMItpPsxH for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56A45400C6
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0318A20B7179;
 Tue, 21 Dec 2021 06:55:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0318A20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640098515;
 bh=jKEI6a3asQlFW1+aRQh8QqwALCthFNlq95EPck+uQI4=;
 h=From:To:Cc:Subject:Date:From;
 b=putFZWpBu3ii8EVRPZvHQOMv3nBllWakiiBRj54ZHv9WtZ4PC/Kdajax2lWUntkj1
 udVMgoFBKxUor6T21rNTvCo0ID1ZhI6kD36m6g7QBjrf3kZ/T1V36R78cKQyzVnXwX
 ptZ0jy00QnVDNCW/rFl1vNhfQswxX9dDHHH2ozuU=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 15:54:27 +0100
Message-Id: <20211221145428.43829-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 0/2] Enable BTF headers for Linux kernel
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
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
qemu_x86_defconfig and setting:
* BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
* BR2_PACKAGE_HOST_PAHOLE
Then, I booted the system using qemu to check if /sys/kernel/btf/vmlinux exists,
which is the case:
# [ -f /sys/kernel/btf/vmlinux ] && echo yes
yes

If you have any remarks regarding this series, feel free to share as I would be
happy to handle them to increase this contribution quality.

Francis Laniel (2):
  package/pahole: new host package
  linux: Add host-pahole as linux dependencies if selected by user.

 DEVELOPERS                    |  3 +++
 linux/linux.mk                |  6 ++++++
 package/Config.in.host        |  1 +
 package/pahole/Config.in.host |  8 ++++++++
 package/pahole/pahole.hash    |  2 ++
 package/pahole/pahole.mk      | 20 ++++++++++++++++++++
 6 files changed, 40 insertions(+)
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
