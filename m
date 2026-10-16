Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DB3CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7E260EB5;
	Fri, 16 Oct 2026 13:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbIi-5z4YIJe; Fri, 16 Oct 2026 13:09:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A49D460EBC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156173;
	b=HjWCk4EtybS4j84iBSEALXpjSKT6vVYplC9300iqO93e+DNoJPp6RFvn0oHI6CGxXJUe
	 xV3dDfM5QLq+0xyKqn/kPxo0RYrO/HrUWQC06Zzqa0+EM9uxFYuPtK8NNwfRN5TjwFDKF
	 gnCc0NjfVKse2KrQlYPPY3lbtEIzzcnNkFQjpQQ2ZBrFrqQVEGWk+OMFq7hTvbY4X6Mj1
	 TbeV9fuA/BugOeRQ20sJTF/IaQL//VPpJ21D3eyJnsq6yIQRCdeHsPef1q0MFvTRCTCJn
	 T80VGRnXktARclyBcFjXtwDzwOIr9sXrvS09J2wsC+lpxt3HBiRUOGkohpYuUjTR4lA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=CSSCFb1nmndyPq9n+Bq8xhV5to15eXLndr0oaMkxuT4=;
	b=KxZvAulXy0ALbBJdYeI/n4fJAdSPvwBdN54TTPFrykRSZMkEGdv8oIczS2OiYrOtHwh9
	 ngN1YzssBbiFAb476EbpmRtEqqvzy9ziI13dCIRrlDpek6zb2Tccrw+/6PQdyTs2aHYN+
	 UiWTzcnVcXXoWDrFuQKeB0rXiVZ2d58GF+HZX/45gxduzPMokHUHwGDUR+UF1w7zlCfJC
	 WTbO+VTFDRkpTWpmGcvJOgMxu9l4FYPvq/Zyfzog2kpvarM2gQAoX0IqPwnl9rX86Blvk
	 q2z+FU30RVYgmuXtiwQbh2pHa6mBRW7zNwEqutsQwqiGfKb9nKC08i/t9uiRaPeRsZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156173;
	bh=CSSCFb1nmndyPq9n+Bq8xhV5to15eXLndr0oaMkxuT4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X5q6ZYzudxmbJUh62D5CrRVzHyjzmjub/2VRlyaNpzF7Q8VmHc9atRsM9igUw3AQC
	 46bQkvx6nEau5OeRQytRJYcx6Dy4viPA/fQ3MTrMUkR7Y2E6wkHE4EeTG9zH9/s90i
	 bsm52yG/7SLUp+srZFn3Uq9CKWfieJ0Vd2D3yOY5k5xNXK2S7b5OGfu8vMt51ubHSU
	 MM0fsa5MMq2hC62VUrgUbEqwRL25C4xr2KgpuryN0HtN+6dWWD4/iNkGQuVP/JXOmy
	 UkrS7TkNZ9GgVjJ+hh/amSte/VEV4SmY5UzvNUosW53RJF4Fd4CbPbp8OnQPrKVXN9
	 IYLBYDD/kIoOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49D460EBC;
	Fri, 16 Oct 2026 13:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C54C1F6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A78D409F8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odc3VHpoTV_7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 761AF409F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=hRvx4OuuLVOTXy1x0EN88Fy5jhINWtAW44lY+iCcC8Hlw+aP8OE26FL1wKlAP1AdctiF
 N1SfvsrlVq4NaFg5V22t9kaiQi/IvAlJBsFwFBTcYvcWxrfxaFXjogtXE9cXiT5Rg1Exp
 EHYH6jIMXWGAvnpXwvcOEk92v0SMXDrGpSKsAzoTyw2j51Co4IGKWDLERFzmAGZSX2aiQ
 6klogpeYBd5pAE4meCX0Yk9vdZ76irLhzU8A14HFOExE2/+tRDG4yurQpJ2XQFVmO1O31
 IA1Xbe5PU9XNiZ5b2l3Q0wbvtuvQDsz7ifZbJ4m3jCsGLCOjqNjEoQoYZ9bkkNLaFzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oIVxYK8xVOz047xAvuihEePFCfYwtHXK01tSUydcZCU=;
 b=UwJMwPgBsIvM1sHcxwuoYSAoD12wmuP5KkdKLVKzXmcjJ+49VwtlqWE3jJ+WUuBzGyu1
 QdChksXeS5QojLNyEAJmvnXV1sLqZa8ffklOjHRlP+QUTCFVc+8DCiIxG7l9REvuOVsN3
 yJ9fsPRLd/UK3zRxhS/14P9RX56DrvYdC120983+8k4TA6+Hjl+MX2lbByUzR8wEqO3k9
 YkP4BYJg/4bkbZpL1iep5npD3ZJeRohkiwpik4NdiZhWhYpI/8BYwFvsyORtR19P95AaZ
 Uca6NNZ5i5ZHH7qp3NHJXNDWL5D/A9C9Efm5rQFSV8bQbJWezVuUjm6uxCUDvvvBG7g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 761AF409F6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 674AC960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 72a91798dc0e3fbea87183fb2987e53399f18342
X-Git-Newrev: bf3f755c1d2c651ef53a295bb50949ab0c2e1644
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.674AC960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 make urllib.error import explicit
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1572568434481887759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1572568434481887759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf3f755c1d2c651ef53a295bb50949ab0c2e1644
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] introduced a code block that references
'urllib.error.URLError'. There is no explicit import of 'urllib.error'.
While this is not an issue in practice, ruff complains that the import
is not explicit.

[1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit f680fe2a61dd90693e245ee0efd433c8d4aa8bab)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index df12ee84c0..45f9682da6 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -14,6 +14,7 @@ import json
 import os
 from pathlib import Path
 from typing import Iterator
+import urllib.error
 import urllib.parse
 import urllib.request
 import subprocess

--===============1572568434481887759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1572568434481887759==--
