Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B923C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D73C408D9;
	Tue, 18 Jan 2022 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K6ybZMW9Gnq; Tue, 18 Jan 2022 20:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44611408D3;
	Tue, 18 Jan 2022 20:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38E0F1BF995
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22774408D3
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HgVqv-8L2Lk for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 20:17:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7818B4071B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642537030;
 bh=yKbzs+Ofe0wkmT5fOzevolOVgX/j7fO9xHmuJDVffFs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gwvXZCnBzzJ4RqjNf0puH97KMMPAtpbl/Y0W2FPEHE8HOK3gwLLyFOH0cA+eAPIXZ
 Z9RgJsO7vfvcz+c3ytmRXgL8W5f6k9aTholKw6OLMk5ZFUCHpf6GRbg0jvyYqITMn5
 KdC8xEiOyrtHIuD0RTGquvD801++iLEJgrhlPNvM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mlf4S-1mRTYi2WDC-00ih1Q; Tue, 18 Jan 2022 21:17:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 21:17:08 +0100
Message-Id: <20220118201709.25366-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mQgT+2XhY7FJ8/XwYtAPC4uwjQ7ri9hjk0xF2BtRH/QCJzruaCp
 umCNWK4O2LELtswMv8oOLs4bibPIYSXXXC1BKB0Mq08GWjUN2Ao1y70xjD7g27I6G6UbTI+
 MVUSA9ti0W3LCI0cZnI1c02A0b08gbt63FeBvm10L1LiVsLAywDiNO7HzALhldPNNoNO8qC
 MMycLSJhEGtdM59BNupyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:flsaPiBECBI=:jHLer5LbGVpKjLd9ra1iPx
 B6F6+1qT38rmOHL+FyfFGZGztN3f9DddOYhAdq4QR+xXhmcJKF71bfclKQFnG0yWmo0+Wmq0K
 WkX6+clyf+QbX0zBmVjzfx0N/fir8z7uUuzf/AVw1jRIa8fFyVdWFLueQWDrIbeSXJPRKChjg
 jLAzCp8vHlbFyM+JtmzLDHWqRWsXyMnbS0Ueapu9fGxY8KzKa7ghPi6ro6NF120PB2swkbROw
 eZxm7NndLrJHM2RXZa05OLMD0J2aITVNcHjjT+eDtmX4pqgzWDhJn5SxWxB8X7jwbbml7oPwH
 5R0jki0+/Nasss5QMtwQ3GpZ5i/Vc5fzsb6+WMTnrJWFbei20hilkrpTvVZlKBjSqRxfejTtP
 sZF0M332BK4NGUmtryEQNK2fwIkwHxAM74KJSevkOCFHZJ6hvckZGay82I4ycnZ01zoH+z3+/
 7SUNrk6jwhp3lQbdHnTdIKEt+nAMcWoeIUK/asPAJaIpYg2h/ykTWbQTosxMUk0RiHaU2uMD/
 PD/NV4oenUhJyzOdUT1070sV/5q46DCFSl+7mGhZR2ePHDaPjsDPvc/pHEe8SL7toTE3ORQzX
 PSy7mfKQEnRVTHBenCCvTngjTcv1IKHu2MdaQEjf+OrshFjLOXwuLy/kOr58hqWxqmg2WVA19
 3AU9qYewS50B929if+tZsKGL2G+Qy4DKkkiENFudfqRj3lnImmsmw5t574/sIiVlwF2aX6aKI
 g6sh389Fv+XjQsiiGza0yoKrzMcvq7d85X3mG00/+ADMcliecX4RJ7ZTLZqwQnz7TqapwOGIY
 T8HiyFHF7UYIMk3WUQPOJw9ckPvuBaZnzNxY03e0rr7QbcdRKymlHZd6GUKYQOajKqpY1zoAo
 aQ+kPAlqOL1Uxrc/OBjMM9JJB/nvM5NMJBt9WxIllkn07NqjV9Qu95ai2vVtkxutLnbAM58Qz
 4cMEXnr7lDYTa9/yzz3n102kCT/Iz3hf83QlLMAhqq7p4abaiuo8fV4E/YNqYYAuEmAhcveeX
 j1e6Jyq23uw/zVyyujw0u9imF449GvNtWtS9JFkKPjJDJYOAtxNqVTkCI3qB5uFx/ns/GNu7X
 Koq5pHxYp3+0iY=
Subject: [Buildroot] [PATCH v1 1/2] package/efl: change download URL to https
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/efl/efl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 46bce29305..ed0a8acc1d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -6,7 +6,7 @@
 
 EFL_VERSION = 1.26.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
-EFL_SITE = http://download.enlightenment.org/rel/libs/efl
+EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
