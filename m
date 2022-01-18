Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EBDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 16:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5810B405D3;
	Tue, 18 Jan 2022 16:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2NPEnWNd1ZL; Tue, 18 Jan 2022 16:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ED624051C;
	Tue, 18 Jan 2022 16:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195831BF5A4
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 16:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D6A4051C
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 16:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65WgFiH7qlhR for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 16:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CE9B40022
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642522735;
 bh=4hmjk5BNU6BmE/jt6O49yrZenATL6LTMnfSFw3uHmUI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=b1UO8P66UrAUTsgx1BHOzKLrZzDf1qlBqsReRLLmeBGo2vdVgE6HFJsCLshfzbMAP
 Abg5cevUDYEy1AjxHhJBOqbiFcRIXdX6RMoOfTmQZG74C87Xr0w5HstKxdKTHnu0hu
 G6KPO/kE+nTAb/t5sdFjAbERV1y++B+HaqeA9Rjk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbivM-1mb4PA3Y0U-00dEE3; Tue, 18 Jan 2022 17:18:54 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 17:18:53 +0100
Message-Id: <20220118161853.27777-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:2+ErOQdj9q6f3IjgpFODhbksbmYyu0Ob4VOm2spEnXnxJmwKrWg
 5iLXanAiQxsXch+ArUbOKchy1BONYfjy8xwxb5y8R+k5viMn3th25pTiQQAJkIdw2nOPLeu
 FSApxChRV83t4z1wAWmSNJtWGauGHcJuUNhFN0uo8yLcsZjEXO7zY2gUdzrqIMbhTIeoewU
 odmzwo0EZVTUWDaljcHOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XE8ao7ebm6U=:WlLwMatG+SVffEAVu+uEc+
 2ZDjYR7XDE74fpPTvfZ42X6qEfseog3SzoncM/ULc5Xe4piMkae7TjqCOH3CDAeZRYCjD9XAs
 UW4kksecsI3PaE0hcoQg4zBjh8NzfIiWmkylPFtvyXOwOKn6eW3C5tryO8R9R8votOvEZz/6g
 fqXweLdsQvVVOLY82vK7JACZUV+/vfedvCTm0LnE4d7I8YnTBgSAWgrpzWuwMSc1PvWlHaKpN
 S1Vyd/IztirdHxzUbrAPurrJBApFJyYHuOaU7qc6GIvTSmkc7RzxQggrM186Jdo25AAM5bc/M
 tRh0pFhQJ8oXzYvLRk86Gael5JFhYJjCx8zYqJ97xzNBH5c5k3RdsMTF8nyNErRHb9POZqHlF
 0CgqUxGbU5Xem+vU54JOYrPtnTtwbEYbs3dmVppy88LtkbXO8YDvnXOTyyW/mzTmWLMEQCrSS
 fYhBW9YzV46FMMg5xziYuiwA6rWNpXTQ7yvTI4ZCv/XnXxSIrcmB4+Z8JdWBJ5HvBq1gpz+fA
 LquLsz9ZQrQ2zMMIvdouiyJLpHSJxcSUylttMkxPZh+kP1qns6/uDLdmsDzUIp0+NXSVVJUsU
 KUUjIrHl1DiIlNojIadvH9vJI9VzUgirVWBqEW2dSSkKQWNJmBKRIPjjyRsfhI52q8oZTCnf1
 OVE3CmGaaXy7o4SJrNKmvXNeOMnhtGBZVi9dZsFAlK7qRl/zkN1bmNMG01jmlTTbL8vGv1ZaB
 ZNiJtTItDdMeXQDozihC8hLTN/+agbacxoVKVgIgN8NnQwbZq+rQWE4VlN7IEMgIPJGp3vuCN
 J7wCpj47ERi1QwqCBf6aAfHrRyP4uY1guUuqr56AuUoMB93mZR9K41tOILqa96A4NI8VKI+Qk
 yX7R157SuEKoBMnbkivIDqcKH2obhPtFzp4j4XvSxolx8kCx49sK16QYLvnoSOjz47pl98zfH
 lD27rUhj1JPYlXjy4DN9Rh1zkK3aCflcVra+rmfY4CqNUBgs/OLlmKvMC0BYoVadXbjsIFo8/
 Ro2IYO/r0hqX6KItT0gO6Uhr6KgpKDIjGk+lmDGv+qFnEW5H1NwQ+ht/xOCthd6q8u1tlLc1X
 OKvyD+P7U1pVY8=
Subject: [Buildroot] [PATCH v1] package/strace: bump version to 5.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update license file hash for COPYING (copyright year update)

Changelog (from [1]):

  Noteworthy changes in strace 5.16 (2022-01-10)
  ==============================================

  * Improvements
    * Implemented --secontext=mismatch option to find mismatches in SELinux
      contexts.
    * Implemented decoding of futex_waitv syscall introduced in Linux 5.16.
    * Implemented decoding of BPF_LINK_GET_NEXT_ID and BPF_LINK_GET_FD_BY_ID bpf
      syscall commands.
    * Enhanced decoding of BPF_MAP_CREATE, BPF_PROG_TEST_RUN, and BPF_PROG_LOAD
      bpf syscall commands.
    * Enhanced decoding of BTRFS_IOC_FS_INFO ioctl command.
    * Updated lists of AUDIT_*, BPF_*, BTRFS_*, DEVCONF_*, FAN_*, ETH_P_*,
      IPV4_DEVCONF_*, KVM_*, NDA_*, SO_*, and V4L2_* constants.
    * Updated lists of ioctl commands from Linux 5.16.

  * Bug fixes
    * Fixed build for older Android.

[1] https://strace.io/files/5.16/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index ff89447bfd..30c90e8e39 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.15/strace-5.15.tar.xz.asc
-sha256  ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc  strace-5.15.tar.xz
-sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
+# https://strace.io/files/5.16/strace-5.16.tar.xz.asc
+sha256  dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285  strace-5.16.tar.xz
+sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 4b70531aa7..c8c3590f6e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.15
+STRACE_VERSION = 5.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
