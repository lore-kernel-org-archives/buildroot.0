Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67EDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6710760F18;
	Fri, 22 Apr 2022 18:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdHJ3guSz3xs; Fri, 22 Apr 2022 18:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7752D60FE6;
	Fri, 22 Apr 2022 18:16:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A531A1BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1BBE60FE6
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7ip1E6VUriO for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:16:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id B042060F18
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:16:29 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4459320E7045;
 Fri, 22 Apr 2022 11:16:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4459320E7045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650651388;
 bh=MNg2VJdJBm8lg8MWI2gbgon3PjebBUpVOwnwaCJXVPI=;
 h=From:To:Cc:Subject:Date:From;
 b=CH3/3pQbwyxyU6jn7zRrrmriulrUkOcHGZL9sJkZ407zNWYe/MwH42Bo4SmzVFkY+
 fpbt8NHCrR1RsM3tWcOvbJkW9qLgbUxN5FTjpm6Ybm9p5G78We4Zt0c2Q20Z2jy31f
 hedJJT4j0b0I2fD1vqzjjIsvlMHyA3YJ83EaDvIk=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 19:16:10 +0100
Message-Id: <20220422181612.51246-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 0/2] Use host-libbpf for host-pahole.
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Following a failed build involving libbpf, Thomas Pettazzoni suggested me to
remove git submodule from host-pahole to build it the "buildroot way".

So, in this contribution, I first added host recipe to libbpf.
Then, I removed git submobule used by host-pahole to get libbpf to instead use
host-libbpf.

I was able to build and run a qemu image:
Welcome to Buildroot
buildroot login: root
# zcat /proc/config.gz | grep BTF
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y

Nonetheless, I am not really happy with this contribution as I had to add a bad
tweak removing a header file installed by host-libbpf to avoid a kernel build
error:

So, I marked this contribution as RFC to get your opinions about it.

Francis Laniel (2):
  package/libbpf: build for host
  package/pahole: use commit 73383b3a39af

 linux/linux.mk             | 11 +++++++++++
 package/libbpf/libbpf.mk   |  7 +++++++
 package/pahole/pahole.hash |  2 +-
 package/pahole/pahole.mk   | 14 +++++++-------
 4 files changed, 26 insertions(+), 8 deletions(-)


Best regards and thank you in advance.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
