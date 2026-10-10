Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6958CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775C06061D;
	Sat, 10 Oct 2026 20:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NaS-8JZ6j93; Sat, 10 Oct 2026 20:25:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C0EDA60628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663956;
	b=f0YGI5TK10ULgvbcCwJCFgb2EEOuHtGOFb8c5iL6Fo+BvYuaCa+nMjhydB7UjSZ3Cg5a
	 n9pAC+B/3tiN7KcXkr42igbIyZCKE6wcMaOA6Fc3ROMs/PdD4pqY+1YbygjTm3AU2Tzba
	 MxaEFvg9uz3N/HYRsv4hjEawram5xLQA+qNbg6rkZscFEhJ0YNDJdJkq84BjzyUaamoEd
	 9DggPt+oYMOAalItJYQJ0+ZrMQHlXx2LD2TicvwJMc1ECoWeJ3ONVwaouHvOerJlfPUaj
	 0OxevLBZhDfN0uiaaA2KFIXjhKCVUc7OWE23Ne3CW4vCBYPoGzm89SwAmS5BnAnNfwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zhS9mh8Cn2FQ5WQaf6OoUxvg1veaeM3MsFWD4rynxD0=;
	b=iILLHqvoEKXCLzDZ5sfG7QZmeVYoTO8fQDHg/mWaAlTgK9mnGDBvAleZxYJ+P7623mho
	 vZt+as1tUwBCL5NzjNrMyRFbFkodlJXvBdBbpgFa+BwYgEsdbnk6iy5tByTZNyohwW5SG
	 hCYPIHgssUuJWX/ERLbY7jutsrdCVBArZbHRM0tCTB5F/EKhfoYapMuYI3+1KDIhl32VW
	 K5T/lSfb++mTkjbxB9h8szXFH3bmXLIorh8tay/xororqK5qaA/UU5EvA1RRVsck0ruhr
	 E+rLosukFTmmnJ3djkvoiEOJmhxQp7ecIyDDzzXUfjhMiATHjYwkWpSFU/5OautN4lQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663956;
	bh=zhS9mh8Cn2FQ5WQaf6OoUxvg1veaeM3MsFWD4rynxD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dr+D0sdK6UPmcWl9ulR77g3mb6tANi8f3Ut5r8ZaoK4Y0Pr1Owm5S8Ii0uWNsmGsa
	 9AYsxAKX6rc0fS3BFfBAnYug/NvOamiiv1j1bVnV7E/7zxOJm0vZdLHRaZAm1ycNQm
	 q+K1RFLR41UB1v36ERbQiorCdl44XGfYH1lDWpaiphdbl5r8KJ7qzeyt2c15hr5b/s
	 8xdI2n6n6vJst5EpsNjCOsjGWtZQcSBAFu9kav+Yjze4fKjVyXuYQfmYOOIwKwnj3k
	 8DNesMDAyxIbh4LgzvBbhQQqgU0OlWsHFArb9Kp4vkiAGi6GHxVB+WCQ/VFHuhZq/R
	 jxssdPXjt16Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EDA60628;
	Sat, 10 Oct 2026 20:25:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B6A356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C5C400AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OM43MS1LO6Yp for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ECA4740068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=l51Psz5mk06CnG8Kw3l9yFNDKuTADZVYQxnlmtDjfap4Vjgytgg7pxzdfbVnDm9mXzqa
 qV3S58VAEjp71YMM/1bzMkR3PVZtsToj2wPZG61JTQ4bItOJP7vpc8d1aFvMDS5Yj/iIg
 UvPEDXstPu4vQYU4r5K33SGfppbmS6QI2jr7JH4+0WRI8vgj4jIxuL7tDvPfPXETRaniQ
 Zx9fOysFXvUnwpYYc+PDZ6bm5mX6gG2lc9QbsMpg8miMSMrWuvZF7NyzxYtA5hDtM6Dfe
 Nor5l+1aGHLJGWS9S562SEbYCT49tK0tilryUaPxP1PflbdHbPPhkJs1CUQh+CNf2hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=c3ga+sFLUdfhXEFQ1zd0i7GSUDiuIdDbYqLji6TLbWs=;
 b=G3l/qqCtXIQWol9/I0Rn65HGQt4PzZzrcV6gRnAATpYc9eiZ/7OLRAoqvx3s0O7J99OH
 Ku94Gj8YY2G+a7VpnEhFHxbVJYWzG305A24dEZSIZN1Vvd7cgHdC4C0mVpV7tDeKfjIcA
 zh0N1S/ofRdyHFWod6ta8gbGgPGfsKMBF+11ZYcmTF5FaV2WKonSU/c6chH0xXMHRL181
 moPVifvGnIqWl0JVRf2oMMPQ8Ls/t4rI12Z7sRFvG+bt3gwHgZoYnY/awbk8K9lZviMsO
 ySblpjbIyNR3+HInCUrq6IkD/Yf9Yeva4AZg+zJRp3tHIVOobKG78UeiIgf0aAjWUuA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA4740068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E4D293537; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 072ed8e5d62be96422c2b4625fe4259d1f5654ef
X-Git-Newrev: f680fe2a61dd90693e245ee0efd433c8d4aa8bab
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.9E4D293537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: make
 urllib.error import explicit
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f680fe2a61dd90693e245ee0efd433c8d4aa8bab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit [1] introduced a code block that references
'urllib.error.URLError'. There is no explicit import of 'urllib.error'.
While this is not an issue in practice, ruff complains that the import
is not explicit.

[1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
