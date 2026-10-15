Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409AECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02D5F61374;
	Fri, 16 Oct 2026 13:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ue_yGr9CT1Bk; Fri, 16 Oct 2026 13:13:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D26CD61396
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156412;
	b=CjM3Jy5/Aelkvybq3pM/sFcEfYRMFzxFLFCPnBkp1h7la9qfscP642qIy0eVRRYmWJlO
	 tWlufetkJ16wmJ3NcWQu2WNSZr4AwggOnIWVgbBCCW9NhuxHM+WEeVqLpNKvunM30MJwc
	 URdORozuond/3rj7HIX6LG3DMTwuo3gcNA3x0B/voxu9KfB/mN5/ka/uj+gQfKvlKjfVN
	 XcsQIlEyvK+phqPgis40yxeYUxg24jJK77ZlfvwWu14sw4D2bUDl1v4AG+PFKmuSjv+PC
	 Djh+c14kj67K4ghoBJH1fipa3kMPolfg2Q56yypASThd3g8W0h1oNZ/CEU2eBa9IXZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=M+hehUjK9q+2O+J1MB6lG9OmCH55GbTZRhEWYSMeEug=;
	b=mKv5p815M94fntFlnM1AuavyRa40r+2OlNUk1TLCAhiyKGHv0sXCRBgxDKEeeTCGc6B+
	 6Xh+ZFAf+TyGwt78B52FbjtkdBXhQ2JKFvGfvbMAuBFRKy5VXJv1Pn0EVpb4AOkJdgsG7
	 1c3krp5MRefk0MkWqBrvfXOsTssydJwmTvWiqTRpHCxOZ4eI5lrexyucTwNA/pgQ8rXJP
	 EIlIwT6ZUg+4eL7A6EDriOi3Y5G3wxoaYiYStN0iYiYy7nlQgh3zGk0/apb1Lp8zOZ2X+
	 wihbS+bZ3CIfMSBDDPED7Qp5hDeeNo5onz4Iiq+BxxvW2IxdxbXjs3PsG6vC89aAgUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156412;
	bh=M+hehUjK9q+2O+J1MB6lG9OmCH55GbTZRhEWYSMeEug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eUg4LPUXXR4cZbk8Bp9LN1pFapmAv4DVE0qqN/yEHBln53GFJcSkJJOJSzy+g54sn
	 /E/cH4y+1XO2737NWFLZf4vFD/Hnn16xbL3xKS2xSSlZvTAR54ZSUsB/lWWDmaFTAs
	 3v4/Xg/z3FWPXKvdVxijEnIXg1uupF5yFEs9Irq+MlEaeeDY25h2vLV94bF45MTRhP
	 r44pfikS5MPB+mVtxTLMhxBnhRxioQ8OLZZAZwrSoShCVUqJPC3CBGyG+rZNBOG1Hx
	 IUh+D08AhFQYdDmb2K/ipuAYGcXTfLgs3H1l7Rm2D4sgIE3P8TMlHzvRGwDkYIY4/t
	 fJxIzTsyWsa9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26CD61396;
	Fri, 16 Oct 2026 13:13:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4859CF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 366D160F0C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz8wZx8L5iui for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 644FB60F43
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=k0N+v5aaJVc0iJU2UjaNP53oWP9VdPIBSfVBBGUEHSDWCrM73nlqWx9/ZJ1KPZjmOrKb
 IvYEAIzQeJr1fFrWYhPBl4AZkBZDA0bWbu+x3uM3lFVQiXNDuzdHP1hSQBZFd7ud9j/9T
 8XSwnl/p5VOfWtU35drQ4UBRYXpbJM/9vME9wbHa58dztpDXnXLnaxPPF3rGPKkmfibFB
 RPmruZ/YQnfehSiwms1Dw/0L/qVOuzHnJwx6pK0sK9kJWNlfxoC1pgT1/JUvUPTZ4+iOv
 DMCi7QTEsL+1MIhtNI3ARjA7rPWeXA+ScfMOruLLNOiPFo/B0fy81haOvnkN/45Ga8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=H36PtiQkdccHwheVounWW+e/5e/anenZ+xIpw5WmFJo=;
 b=BZQWd7PUkU56i9826S1AI/gX1WbYI8y1Yq5ck8nOLKBmM9p1G5vrIxlxZEWf7DBM5fbw
 wAhOicG3Luaw96PxwbXIs++kTBClVQmmZgl09OXupXH29tJnH4Y+EI+3tzpZ0xj5yuCIG
 BRx/7xt54R/XU9gVxNJ5FfWAg613KGv1zIGEIqwCkSYqIusi3S+MJCfzFUf6d/saxmk7g
 Pqmh1fy34hj1lfttdVGL6x+XXfcS/BYeb6tjnCe7IyTj76zCoT7tWPJlkbg73yKvbgjhk
 WeWb9bt4Dx8hyABkWkhuw9fchdPlepRAceadkKZm1E6XQND2sPmrvDXu3EGREnP9BpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644FB60F43
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54AC3960D9; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: db245058c1cbb712018c30aa30a4b691d55ed595
X-Git-Newrev: d2e9e37a39befa3f04abe50329251c469c43ff1b
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.54AC3960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6137817355046186093=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6137817355046186093==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2e9e37a39befa3f04abe50329251c469c43ff1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============6137817355046186093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6137817355046186093==--
