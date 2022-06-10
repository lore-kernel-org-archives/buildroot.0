Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F77C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC595419A1;
	Fri, 10 Jun 2022 16:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74QN1WRhBsek; Fri, 10 Jun 2022 16:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1783E41994;
	Fri, 10 Jun 2022 16:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5ABA1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948FD41994
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nwotm_gBabRg for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:54:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D7634198C
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 16:54:56 +0000 (UTC)
Received: from pwmachine.lan (247.red-2-137-223.dynamicip.rima-tde.net
 [2.137.223.247])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1CB6820BE6AE;
 Fri, 10 Jun 2022 09:54:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1CB6820BE6AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1654880095;
 bh=su2K5tbLX+TQfj8FUf8So7hfPQzl3MOXaEyCR63wbfM=;
 h=From:To:Cc:Subject:Date:From;
 b=DoCH+hxRRfvoxIYWJKWcsLbKVO/CFZuyunZCqqQq8a/WGc0kWXFCC5QcCJyPhKmjM
 yzcMp8+C8KjPliyecsuhCmNF2TD95BrI+qd1p+DImdVjLDxRg77TZbAbqjniALycsc
 RyNm3oWpddIYwmtZs933UEpee5l8x3kAnYFKkOlI=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 17:54:40 +0100
Message-Id: <20220610165441.84812-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 0/1] libbpf: Remove bpf.h in linux.mk
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
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone.


I hope you are fine and the same for your relatives.

The goal of this contribution is to fix this a recurrent building problem which
happens in buildroot CI (sorry for only taking care of this now...) [1].
Actually, to build host-pahole, we install host-libbpf uapi headers to the host
but we remove bpf.h to avoid a conflict with this file while building the
kernel [2].
Then host-pahole will use the system uapi headers to be built.
The problem with this approach is that it works while the system uapi headers
permits building host-pahole which is not the case within buildroot CI.

So, a solution to this problem would be to keep bpf.h when installing uapi
headers and to remove it right before building the kernel to avoid the conflict.
As a consequence, we are able to build host-pahole with a good bpf.h and we can
then build the kernel.

I sadly know this approach is far from being perfect but this is the only way I
see to fix this build problem... So, if someone has a better idea I am up to
implement it!

Francis Laniel (1):
  package/libbpf: remove bpf.h in linux.mk

 linux/linux.mk           | 23 +++++++++++++++++++++++
 package/libbpf/libbpf.mk | 21 ++++-----------------
 2 files changed, 27 insertions(+), 17 deletions(-)


Best regards and thank you in advance.
---
[1] http://autobuild.buildroot.net/results/7b3f560a773791e00b8bb32f64c0d39749b809b1/build-end.log
[2] https://github.com/buildroot/buildroot/blob/f3f441aea23dbf84fec85a9cef1aaf276c4484f0/package/libbpf/libbpf.mk#L61
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
