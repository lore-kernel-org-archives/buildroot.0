Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 16:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F1E84105;
	Fri, 15 Apr 2022 16:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kU1HJgnUiIAF; Fri, 15 Apr 2022 16:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2FA840F0;
	Fri, 15 Apr 2022 16:20:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 521871BF2BC
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 16:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4675140865
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 16:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkdHW-uml8ci for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 16:20:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA894403CA
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 16:20:08 +0000 (UTC)
Received: from pwmachine.lan (238.red-83-59-6.dynamicip.rima-tde.net
 [83.59.6.238])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3884920C3546;
 Fri, 15 Apr 2022 09:20:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3884920C3546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650039607;
 bh=ZW7fZwEIBsrKKnDGicNwGTVxNqJjnq2Y/wKfrhGp0fg=;
 h=From:To:Cc:Subject:Date:From;
 b=N8hpOc704IHC6r14Bd5m8MGLoS/gdknrX/pU8b/5wUnwH+7Dcekct2HwsbtM/8/nn
 qUQrzjtOv9oeOzB1TT/oNy1JLZbxFTZuGz7T7o/n31StnR9hU0f44rL9dRaA/YZm8n
 BS94irCG5u4N6W+1inlwjZa/+sPNO+VEVmr4rvfM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 15 Apr 2022 17:19:53 +0100
Message-Id: <20220415161955.86520-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] Bump sysdig to 0.29.1
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


In this contribution, I bumped sysdig version to 0.29.1.
Indeed, following this discussion [1], Arnout Vandecappelle noted sysdig 0.27.1
cannot be cross-compiled to, e.g., aarch64 because it uses the open() syscall.

To fix this, I bumped sysdig to 0.29.1.
Sadly, some components of sysdig, like libsinsp, libscap and the kernel modules,
were moved to falcosecurity/libs.
So, I added the falcosecurity-libs package.
A new patch was added to sysdig recipe to avoid compiling again
falcosecurity-libs.
Nonetheless, this patch is a bit big, so I prefered to keep the RFC tag to
gather your opinion about it.

I was nonetheless able to build and run sysdig with start-qemu.sh:
Welcome to Buildroot
buildroot login: root
# insmod /lib/modules/5.15.18/extra/falco.ko
falco: loading out-of-tree module taints kernel.
falco: driver loading, scap 0.1.1dev
# sysdig | head
falco: adding new consumer 00000000b5aaf410
falco: initializing ring buffer for CPU 0
falco: CPU buffer initialized, size=8388608
falco: starting capture
2 17:18:14.088681520 0 sysdig (330) > switch next=11 pgft_maj=203 pgft_min=1165 vm_size=46264 vm_rss=18072 vm_swap=
...
24 17:18:14.095103470 0 sysdig (330) > switch next=0 pgft_maj=204 pgft_min=1165 vm_size=46264 vm_rss=18072 vm_swap=
falco: deallocating consumer 00000000b5aaf410
falco: no more consumers, stopping capture

So, if you see a particular way to fix the problem I described above or any
problem with this contribution, feel free to share it!

Changes since:
 v1:
  - Drop nlohmann-json patch and use json-for-modern-cpp in place.
  - Add a patch to avoid building falcosecurity-libs twice.

Francis Laniel (2):
  falcosecurity-libs: add new package
  package/sysdig: bump to 0.29.1

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
 package/falcosecurity-libs/Config.in          | 38 +++++++++
 .../falcosecurity-libs.hash                   |  5 ++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 63 ++++++++++++++
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 51 ++++++++++++
 ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 -------------------
 ...gainst-libabseil-cpp-which-grpc-uses.patch | 47 -----------
 ...e-Add-libsinsp.a-as-IMPORTED-library.patch | 59 +++++++++++++
 package/sysdig/Config.in                      | 31 ++-----
 package/sysdig/sysdig.hash                    |  4 +-
 package/sysdig/sysdig.mk                      | 55 ++++++-------
 13 files changed, 283 insertions(+), 188 deletions(-)
 create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/Config.in
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
 create mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
 delete mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
 delete mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
 create mode 100644 package/sysdig/0002-cmake-Add-libsinsp.a-as-IMPORTED-library.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
