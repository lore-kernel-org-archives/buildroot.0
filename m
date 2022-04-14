Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFDBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C13E81C6F;
	Thu, 14 Apr 2022 17:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwuzMtZCwGyP; Thu, 14 Apr 2022 17:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3AFA81C56;
	Thu, 14 Apr 2022 17:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A61EE1BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9381440124
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2icWggU9phR for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:44:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8BD405B4
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:44:14 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8E127203A056;
 Thu, 14 Apr 2022 10:44:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8E127203A056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649958254;
 bh=7vV5jjlWfNUc8GV8XtVOuMOfWzqDsSyCuhYPqBSOcP4=;
 h=From:To:Cc:Subject:Date:From;
 b=SWSbuOOFCNpBwrID7iyvzivsHdJjP1cDG0zcW1z8GnGxKNHMdyA2W0a2J14b3z6A6
 2S1b5CEQ4PQ8Freb1Q1C8ePh6cG3FNuOMa85bymqacUehDRVkb7W7mVyruLgZ9a6se
 uxbpHMf7EoBED+oysJlLrae74dboklVnZ4/ylNWQ=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:43:55 +0100
Message-Id: <20220414174358.38059-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Bump sysdig to 0.29.1
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
Nonetheless, I am currently having a problem with this package, hence why I
marked this contribution as RFC.
Indeed, falcosecurity-libs is built a first time, then another one when sysdig
will be built because I set a cmake options to indicate falcosecurity-libs
source directory.
Sadly, I do not really see how to fix this issue...
Maybe by making falcosecurity-libs package a generic-package?

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

Francis Laniel (3):
  nlohmann-json: add new package.
  falcosecurity-libs: add new package
  package/sysdig: bump to 0.29.1

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  2 +
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
 package/falcosecurity-libs/Config.in          | 38 +++++++++
 .../falcosecurity-libs.hash                   |  5 ++
 .../falcosecurity-libs/falcosecurity-libs.mk  | 62 ++++++++++++++
 package/nlohmann-json/Config.in               |  7 ++
 package/nlohmann-json/nlohmann-json.hash      |  3 +
 package/nlohmann-json/nlohmann-json.mk        | 14 ++++
 ...BUNDLED_DEPS-before-getting-nlohmann.patch | 50 +++++++++++
 ...ATCH_COMMAND-to-fix-lua-types-and-fu.patch | 82 -------------------
 ...gainst-libabseil-cpp-which-grpc-uses.patch | 47 -----------
 package/sysdig/Config.in                      | 31 ++-----
 package/sysdig/sysdig.hash                    |  1 +
 package/sysdig/sysdig.mk                      | 39 ++-------
 15 files changed, 233 insertions(+), 184 deletions(-)
 create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/Config.in
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
 create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
 create mode 100644 package/nlohmann-json/Config.in
 create mode 100644 package/nlohmann-json/nlohmann-json.hash
 create mode 100644 package/nlohmann-json/nlohmann-json.mk
 create mode 100644 package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.patch
 delete mode 100644 package/sysdig/0001-libsinsp-Apply-PATCH_COMMAND-to-fix-lua-types-and-fu.patch
 delete mode 100644 package/sysdig/0002-Link-against-libabseil-cpp-which-grpc-uses.patch


Best regards and thank you in advance.
---
[1] https://marc.info/?l=buildroot&m=164951521629400
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
