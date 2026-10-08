Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D66FCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE39B404C8;
	Sat, 10 Oct 2026 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8p-BPvFi1pg8; Sat, 10 Oct 2026 09:27:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3152404F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624452;
	b=JP7qVnYnTkdolgS0e0Sn2WctBvy2EfqDpN9b5/nHGHD6uwXmmqkI2e2L1geM822CUzJ2
	 jf6OvG1syRlqZeLJCjn97kVj/Lje6+4L0TFZxq0vw6rdxHjR2f+lktQ4FA1Sb3G7t87ks
	 WFSVnb2DGiCKJC6Gcf1ONYfGjlIb+MdN63iweQECsrgDjH6++a5ZsBKRUeNAwo+bPm0w6
	 xHqsKlfyukG7mPA3d7I4pRlGejBRz9nqVnC5MYAkChfi5q76sYn3VsTXVav4cqOs2vcj/
	 WEAy9TAhDqTeDAq5gm2aHE7qOPpih3cQ3Dj5Wtqfj4Zbde9Z/1slByr5dgic5xNKv7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=q9A9f+quXOgoeF1yBe9bYeUznzSvAbTQsiC45VImAs8=;
	b=OGyN2P/vwWZWegczlythS8U8ADX2mp8S5zyiNvXEdxLKAmecno2n2Cr1Y+9o1dEwJtNR
	 9pQ4QmGvXfNbXceF3FhtLx4DyzRpg155zPz/wk0x7PNwj8B2YUKe+lDGRXL9QmY/VkTgK
	 ZzbrNUsb3MKD+9jELtJD4N4Z2Zn5FGV+6rkztpjLkTZyYfgMcCsJXPkacmYoEMJffyI1G
	 SwOG2gbUrRAiiB0Tfz8D+tPnAaMTDBZKhpXjTHrwPHe2gOdu5cn9Q5anlIi+XIjLNlkCB
	 443xIZiIFw8Twe5aPqxg1w1XjFT6PeFFmXf8xbQCL7Z0fgyNxlOK2KrZKtIfsyKJ48A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624452;
	bh=q9A9f+quXOgoeF1yBe9bYeUznzSvAbTQsiC45VImAs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ofyl2+XF0ueOIA6GKRjGDx0KiBQkczDoZt4ey6nCsx4/eTuHRS0H+TrRk/LpR9BcS
	 WFjQ81rWaPcDTIoDMGnDfpAJe+eZhMajht2SQrCZ/GrrjshtdKsTKLoFUWuSgedcGJ
	 JQnKXdDspTunsk/l+4G6lBSnnLlBR/a62d0Bj+eXOH+qm/xfLVVSuPPN+/u/4Rtwcv
	 6wEwuvQKUB+9BIXzfMPz+mbDzSHzJoYS3rSYcdXDnjWusJPFGTxJCXIZbtmk3qwtx9
	 BIH5yRRCd5K6z3iW+p3eBqOMhyr2m6Xh5t7OX18ohTwDi4mUzEtsE3be6r/cBG/wWW
	 Smc+VqCd9Qe5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3152404F8;
	Sat, 10 Oct 2026 09:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E50EDDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F5764028C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8vwaQqXs6SR for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3AEE240955
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=qev1wM5lKdm3rw09UqyiPmn84b5ld8GRxAHUu72v20VKwUS0XP6nq8HwoJRDLT5lVMhj
 0h1r/ymuJNov2aNBHvEnhf74bpQMJanMYA4ocuKGmHGIHdfZXOUHlnmZtNWfaqBStWBUt
 aVqZ+cKAHrlycdGDy4b/oNxYpiUb5E/utmycLr2VY/hvyVqk6PIQDsE/2hcZdl1sutJlz
 hvLWQZk9AZ5+xMfEnTtyTXmGDvCy6HayNZ0RkqFsHGWYJ75KxgpLSOOX493RiBL9ieY/h
 Rlq2XMv9nMulkKrmGPlsyqsr4+9zKmxTTVbkjgHfRvoKE4gFhGSZRhu/iTA0r97ulmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=O1tK1A6bwznSA7jqkriD3KU4kaY0v9223L/GapFZcyI=;
 b=NEYaWQ6EUK0r6WmJYj8nbfKPgWlmfaxj0TW0VmDDpGoKoa/DKOTMSCkrK8kScfljhMnv
 LWC1BC7YJcURaKusBYyY6HZUMNW+Ut0reJc8dY0uKpv3SgvNRe773+RioRecA1aDcDyyA
 aMnqWglF3/jptSZ/86y7YAkIm3k4zH1ZM/apZJ7Ra2XfHkJFEjI5rgOddpEnT94O6+Q8L
 7uOR5t0jHoAXokA1Y7DlWw0EpZKFP8fFpiKOToyaalh+QsOn7mZp8sSeO7mfPzMw4O6uW
 dzcy1sA71U7Gns95WaCe1XiWYmnVlqVAP76SoXVgdDtOYoRkXX+Ps0diwdYKR9dybBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AEE240955
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13C4F8F1C0; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:46:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1f979294809978baa39af14050adf19213fa97b2
X-Git-Newrev: f6931bcfd1f987f31e0cdba60c5ae48032c43602
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.13C4F8F1C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux-libs:
 Do not install to target
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3815965561488272166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3815965561488272166==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6931bcfd1f987f31e0cdba60c5ae48032c43602
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

util-linux-libs was introduced as an intermediate package to help break
circular dependencies with util-linux, and therefor only exists to provide
more basic versions of the libraries util-linux provide, to break these
dependency chains.

There is no need to install these to target as they will never be used
there.

Under all circumstances the libraries are built and installed by the main
util-linux package.

This only solves the confict for target, the conflict will remain for
staging as that conflict is much harder to solve.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 8b57f2f4215992fd9f53af92d15b507dd5d433fb)
[raphael: resolve conflict]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 9340d5ae4f..f80ab6c803 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -21,6 +21,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
+# This package is only used to build other packages that have a depdendency
+# on util-linux libraries which in turn may be dependencies for the full
+# util-linux build. The libraries that are actually used on target are built
+# by the util-linux package.
+UTIL_LINUX_LIBS_INSTALL_TARGET = NO
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \

--===============3815965561488272166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3815965561488272166==--
