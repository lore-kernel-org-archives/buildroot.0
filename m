Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36B7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD36415A4;
	Mon, 25 Apr 2022 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKrdE1sskCYa; Mon, 25 Apr 2022 16:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FDE41504;
	Mon, 25 Apr 2022 16:44:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765D91BF31C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BC354022C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pYwGKZtZWbZ for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 16:44:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E7C14017A
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 16:44:06 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id CFAB220E61D4;
 Mon, 25 Apr 2022 09:44:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CFAB220E61D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650905045;
 bh=j/i0Gv95kmPS2voyk61+Ajibi78llga7VUgelRED5dw=;
 h=From:To:Cc:Subject:Date:From;
 b=IVprfENntGGKSdNVz8ODoPxbZSl6v9qNJauB9oPjI7DX8hWARkqKwiE0akEdqDppV
 LN7cM5Jw3fL7pHrXLWjnh3Xdpn1/h+vxHPna4J5xXw79BeYzhpt0mL6rf03L3HMUHn
 S9KeAz0OokH25SilRkO6a1S5X/Q633WkrVnBWXII=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 17:43:17 +0100
Message-Id: <20220425164319.24788-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v4 0/2] Bump sysdig to 0.29.1
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
# scap: loading out-of-tree module taints kernel.
scap: driver loading, scap 0.1.1dev
scap: adding new consumer (____ptrval____)
scap: initializing ring buffer for CPU 0
scap: CPU buffer initialized, size=8388608
scap: starting capture
2 14:29:14.500045202 0 <NA> (113) > switch next=10 pgft_maj=212 pgft_min=1175 vm_size=45204 vm_rss=18256 vm_swap=0
...
97 14:29:14.514272929 0 <NA> (113) > switch next=114 pgft_maj=213 pgft_min=1180 vm_size=45204 vm_rss=18256 vm_swap=
scap: deallocating consumer (____ptrval____)
scap: no more consumers, stopping capture

So, if you see a particular way to fix the problem I described above or any
problem with this contribution, feel free to share it!

Changes since:
 v3:
  - Make falcosecurity-libs a generic-package and a kernel-package.
  The generic-package will download us the libraries (libscap and libsinsp)
  which will be built by sysdig.mk.
  The kernel-package will build the kernel module.
  This permitted to simplify the overall contribution architecture by removing
  some patches.
 v2:
  - Add linux CONFIG_ option to execute falcosecurity-libs kernel module.
  - falcosecurity-libs driver name was set so sysdig automatically loads it.

Francis Laniel (2):
  falcosecurity-libs: add new package
  package/sysdig: bump to 0.29.1

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
 package/falcosecurity-libs/Config.in          | 38 +++++++++
 .../falcosecurity-libs.hash                   |  5 ++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 75 +++++++++++++++++
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 51 ++++++++++++
 ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 -------------------
 ...gainst-libabseil-cpp-which-grpc-uses.patch | 47 -----------
 ...e-Add-libsinsp.a-as-IMPORTED-library.patch | 59 +++++++++++++
 package/sysdig/Config.in                      | 31 ++-----
 package/sysdig/sysdig.hash                    |  4 +-
 package/sysdig/sysdig.mk                      | 55 ++++++-------
 13 files changed, 295 insertions(+), 188 deletions(-)
 create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/Config.in
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
 create mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
 delete mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
 delete mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch
 create mode 100644 package/sysdig/0002-cmake-Add-libsinsp.a-as-IMPORTED-library.patch


Best regards and thank you in advance.
---
[1] https://marc.info/?l=buildroot&m=164951521629400
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
