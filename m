Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660BEC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC07C407A1;
	Thu, 17 Sep 2026 08:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRu_gJxqRFGD; Thu, 17 Sep 2026 08:23:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33E8740778
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789633419;
	b=rGmSYXIwWtQ6LTBCrkz6FeOijHL8DqiYwLJdJZqk5NkW7KOcgqQ5VpezvoYU2pNb1B1Q
	 DKkUE8rjqO+CGmf8CrBEoNoPfyZws3eadw6UOSwg1USkqbd67CrAZbm5cP4ihWJQ0mnAY
	 OS407Xy7fpiIXIvQUhuuuqq1el6CunbrotJFlzvuj41m7O5awDyMBgKehHaGkF0wBPIA/
	 s3OffWZV0btoc2UxLC5nNZIXqEDOQl/zOtYs/ArDVYrFRK5vqL8E+RMGGPwSZxrKh0ZG6
	 NIy9rJyuRCHZrIZRCfcHDoOWmZEzbpKdLc1zd6/KvkcM0ZzSp6N77ufdmjrVcKntsEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789633419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=t2fSA81JEnTprDAZC8Gu6JDCN+LSEpxJJRT1v5lBsAA=;
	b=jNmRUxIW+fQOoCBMEC5g21XMUjSM1rXne9PooJh1uicBGvnA4A336/MYMcxcFz9nzfuN
	 8MOZSMeCgaM/sPSkU655RhBdfY0HOFIx/tmjrO8MjjDZlhZ9iN6qthli5NQLdZPCuQmPv
	 XR35K+yZTfqzrX1WbPAoU+0XGph3tMDw80dTmoO5m10S849akzYQcGxaJL61JCMsD4Pat
	 wDlJ5FNu6BpXKjGKR8JHgwiTvQXXgDYxwh4WbTkhSJU8wVRIYfN3tXLGY0muF1KX8MYSk
	 nB8unQDz+WdDFjK8N3qd0UX+AhZpjnbx8qdG4tSwHVtinQrCT6uDHKqdfRhgiml8eWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789633419;
	bh=t2fSA81JEnTprDAZC8Gu6JDCN+LSEpxJJRT1v5lBsAA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GD6vAV/rXTpkU1ERUJtIGl3iIi643LULlZqBjiPc8lCjdM5lx5QAUF3PN1yYoT0gG
	 cxoiEW2yx8Tfm+fSn4n4ixoSWE3rOhvd8h2Z8aULdD/HH5S9pmR7xQyJn3XjbZrj3u
	 jF7C2Z8cZQgL8wfW2qc3xEA59gEfCEUgAsoTbFdfP8JqN2z70QCBZKGLOpHSpiesfW
	 xilnO3iYl4hRQzKFPnxC34ih/frA/gm1h8Z7dkWAupgo+XMV8WysA+gMgN1O2lIqq6
	 vTG3UPdlR6nfCyT8JJo+ynEdMusWmIkJsm/Ss9sYb9TqpF8QYn4yf+dVbMHEtm/T7U
	 uAzZasTwdDWFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E8740778;
	Thu, 17 Sep 2026 08:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20861224
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1180980EC6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdaN1zuNYJT9 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:23:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BC35D80A9B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=46.105.63.230
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789633416;
 b=VK+/O2lZOX7QI5Wtam2K7dHJZEcW+C63lAX4Dsh9Hq0aiFClVZL0oA6jWHHyMnHpJ48+
 cXtoa6ER+HcL1wNn4F5PiEO+gjK8BuszwLczjSr0X0UQ1X05KJqb8VWzBBnDICHEVbIPj
 L0/LjIOIbV2IqUN4krWPNRu4zy9sV3pklkr/AV3rllv2DwhzQovfh29Tyk1WWf25xsCvS
 mVcYBPmUdQ4qKtYVv3RvZVk1mAPQdSndxK9cUYIIs8v92J9tAHXBzorJNKbumfF4stTnh
 QDFSCzJNzSPc8WzO29F1gVo38pvg3SpkAqz6pEBwBnwDf9yRd/UvlBQBcTsJbYyK6sA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789633416;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=FbCCZcl1pJyOgW2RqRtU105V0RpHQylecJ1lgqDOc5o=;
 b=dx6mFg0jfxcbqW9I7jHE/HLTWBEqSxTht2YEOB5OghH+H0o1wj2yqP5UOMf+zCxXRkrH
 0zyz00X0xiH6+iQHUT0wdmbMTRuH1ErIdEdv7kpo/z7uGCTWTRnwGE2KzFr6MzM5qE8bB
 meFCDk6Yyj+H/Hn1pkAsZdoq504VqJJPa17feqTbY8V2qUFxEbXCDCFgwaocYmOAQfb3q
 7xqMmRsaSJFbsI5RACQ8FyZBi4JaMlz1CUXu9LibyRHYoiQqI1njXagvr6r304Cj2Uk57
 mQ9fdvGJCOS/r6l7yutYdqdjUUzFaSntjC4fq+ecQnGj5NbNLCFBcShNjWThA8u64sA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=RJXidcj9; 
 arc=none smtp.remote-ip=46.105.63.230
X-Greylist: delayed 4200 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Sep 2026 08:23:33 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=RJXidcj9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.230;
 helo=7.mo575.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC35D80A9B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:23:33 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.231.97])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4hlmyQ6jKVz61QF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:06:38 +0000 (UTC)
Received: from ghost-submission-c7b579475-t7vw7 (unknown [10.110.188.175])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9BB6AC04BB;
 Thu, 17 Sep 2026 07:06:38 +0000 (UTC)
Received: from quimesis.be ([37.59.142.103])
 by ghost-submission-c7b579475-t7vw7 with ESMTPSA
 id tv7KF36Rq2qcIDsACFZ/tQ
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 17 Sep 2026 07:06:38 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a4b5619f-0954-437d-97bd-e123895f9055,
 8A94A716474959CFB9616324D37364D589FF58DE)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 81.245.109.59
From: agennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:06:30 +0200
Message-ID: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
x-ovh-tracer-id: 10483816983375974358
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEy/OijcOSi4fO7K8w4mJs+z2/HwRAwLoTFXyEAY0uB3z6JvaziaSkadYYdi8dtxfTDSskLlHuC5/HfjBUBJAnmVdrOCcIx6h4F8BgimvjBmKJjMenllQmAWFDPY7eoDee5UpYkh0kiw997WXGnVGNM8fGjfC/mS/acn/BGcBA83w5tNNDkMkdJMTD7pfTmJgvp843Bar69095Xrm8HynP6MHIMM+du1c4RTNTlHvKwpvzHhaPAcp9rtH9MqYq6p5+f58eAyJmnQV7bIOHnCJl7ufB9N9JZCJBGonZ9VfJbnRp8grnvxbh8FaqN7LRznWZmO6Oyj17gzotNyyAuWeoJphuOz+Nc9Jd4b0NPERjq466asM3OHjZO9oraLjKBe6q6tq1m5kf4JpCESOL70kKTP7iMoz4zOi9AyiFArzGltGdzvdVtK6bB/7VrwPqyRaiQ7GoT7n5Ry7yT2TUjPZeF7nVBFGaYBLkgPEAbUPTy3Nn8VRVvt8lKeeKCMz2Bj9cv0WEO0CwhRThCSY/qV7qbgQTGo9hvhexBv3H5B9TDhVsW7o4AmcQ5aDlw/BIkLU7NL2YHZp12urLoJQwPjb5FhclZJ67wfMk1geuakzI0iiJvoxtquMVoLinjdumr1LCCQ4ZnvnU1x6CzQWYM7wM9T1ebW//lo8a7WuKwzPW8nw
DKIM-Signature: a=rsa-sha256; bh=FbCCZcl1pJyOgW2RqRtU105V0RpHQylecJ1lgqDOc5o=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789628798; v=1;
 b=RJXidcj9PFLnhPLpCUE1C4L7ZG01B9jCebylpCurGcga6kPvPuC9UiY7SRno01GE3ttQM8ec
 aI94Y0HVtQ3KFRzVzxP0I60qERdg7JtXQFZvcrejN8Q6kPK/epgoKNriLqlg777VfsCOUICLAXD
 ojlTdQ2kRlsbzwwQUQUoS2/f9/yV5Y84y5K6FbCV0P2F8+1L/0Vf08LVnxiQq36dZqVdMqPARdF
 axizBIrIkndf6t/X4lPCCAP2WJBSMl0VZdVZHZrnQJgl/dEIOd7uGJtZRh9dq8t/SKcQnLvSdbv
 hJf2/8Qmq1puIZVgfmjC1r94O6pa37/hVLlEoBtGlc+zw==
Subject: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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
Cc: agennart <antoine.gennart@quimesis.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version fails to build with Linux 6.13 and newer because
mlinux/moal_main.h includes the removed net/lib80211.h header.

The header was removed by Linux commit 02f220b52670 ("wifi:
ipw2x00/lib80211: move remaining lib80211 into libipw").

The new NXP release skips this obsolete header for kernels newer
than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
compatibility fixes.

Signed-off-by: agennart <antoine.gennart@quimesis.be>
---
 package/nxp-mwifiex/nxp-mwifiex.hash | 2 +-
 package/nxp-mwifiex/nxp-mwifiex.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.hash b/package/nxp-mwifiex/nxp-mwifiex.hash
index 559e89cb37..662f6c27bd 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.hash
+++ b/package/nxp-mwifiex/nxp-mwifiex.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  dcffe6c48babf7db82aac4704b056cffc06a1f80008cd9c23ab0479fc890ba99  nxp-mwifiex-lf-6.6.52_2.2.0.tar.gz
+sha256  cbbfcd497e85d6da8a29d28209baa924102b31dce8a299aadbcb8f530506b2dc  nxp-mwifiex-lf-6.18.20_2.0.0.tar.gz
 sha256  67d461bc478d220fcdf99c59d8ea17fffbd1881718281aa4947eb608fcd568bb  LICENSE
diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 46678a2c91..7e29e2e5c1 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NXP_MWIFIEX_VERSION = lf-6.6.52_2.2.0
+NXP_MWIFIEX_VERSION = lf-6.18.20_2.0.0
 NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
 NXP_MWIFIEX_LICENSE = GPL-2.0
 NXP_MWIFIEX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
