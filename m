Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF7CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAA360A3C;
	Sat, 10 Oct 2026 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkRoM5q3gpLH; Sat, 10 Oct 2026 20:26:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6DED60751
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663973;
	b=V+3Y1k/pouRGbSRrug0njTIk0pf8cbeWSzALbFtgcRH9fth7qaOqDBaQ+qxGV1KNM0qY
	 GWR7/G4/uRZgyYlNBOFcFsAwfx0T+qCWAFkk10BN+5W/Mgj6TA778wTSBwOFiCHRy2sJK
	 XSa2PyC0a5PXe1U6reuzE+DGpx5SolxP0AoQzxhklslmdxl616BS48MAwLcWhQEmvY06q
	 /+tl4102e1/z+aO7UM6NkAIsiU+2IidYDsxDbW1vQwruzF9hPU7xea2V2KA7ck/7H+WRm
	 LkZ2mD1fmOzDLHwfNMdtylEtZvz2OFMQvCduKPzcX1K+t0L5ComPQZUNG/3uPRQXnuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pPFuGHSxqJhfn+AtjCZvnPCBGj9jhK4a+wQ6u4dO1Cc=;
	b=dyTLPRGKbJsH0TCtmStVIhOBR9tOsjOlrspBpu9x37ahzYPVCToQ6ytFOfxQLElKyPpG
	 C707dm3Ozvc/NYoq8FgSiLk0HhO8umJuhP9WCWHqwb6w/dIu8zRnLPEhWf6Df2ns3mIWC
	 ZVO27PhSw7v8YI9AVxRQghN5mWEk9FHhMjlpzOtv1WJ5fBUXegq0YKMLvKY++5uAqtKIg
	 BggjxkMOa/s/fJ4YNhS3uEpCWRVkKhd95Pgc2blwGBnAOSP7Lvk7xjaTeTfccGXzYtK7E
	 4wMg3Jwcv2dWJRBq5R8LgG4OknclylvWhlnsxNP64lITnBWWSDMSLpx4hEqbfWISuRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663973;
	bh=pPFuGHSxqJhfn+AtjCZvnPCBGj9jhK4a+wQ6u4dO1Cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mmoCcjgCb1k6cqJ75EDaSuHAFetV2Snu9fsBmDXUJDKyWhde3IQzE74lx15HqqFOw
	 HWPVXRxOZgEQZFOnC5smveV6lkYEl3OQO5JPWFua9ZzZU83+UtKXWZH3Z02uBwHMmD
	 BLyNfJ7nVo12gwK996kLeTPU386MMN1NBOVNLEDAxl3LlRNawRTHaHoRGqHnpy7jzt
	 X2r0LR+8f4LJaCZ7KQBDil1JUY5qb9bPf5IyVDWnhVXxeD1blyBu9yoWWgh7+fMrtn
	 WPzw5cxHMvRv2ORgVES+qmCcwgZ1CoIR5SMHN3Vmh2ZXgAcAiBoV5HRi5WZXA0cuuM
	 jTM9HY0LGlpdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DED60751;
	Sat, 10 Oct 2026 20:26:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7B7156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ED81400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZneITwK454LQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E02DF40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663955;
 b=PuZPY4i3iA++8UBrxCei4GS/ByYmYPGH9WKnDEjeqb9Yvw1VLojJ3ybPOkB9gWILpQ5I
 tyQFoZuXxIEzeSwwvcFeTDSt2kMlJ4b8HKBYWig6pJnb1B90mve5nXojAAYhAc/rt+EEt
 7nSHGeK5hOeDtrovJwMOT/QytMdIqPurUiswfrP80OqB7Iyo8jQ8Dl3qMTSVru57/wR/S
 YIFMDjh32ETFMZYVtVxISmVxSMpzlETyEm8fvJdBTOlBILC9jP14SYS2Z/Rn1Ar99XKRF
 mr07/WVnF/Pzt7MkLHOmrztqTtbasbrO7tgktHciKcDC2Sf4w6gNQqHMLoXKpV8UXBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663955;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w85phQCerWL8bPcb3yf8DouwDsInHWjeowQ8V1ASvvw=;
 b=CySg9CG6AeBT1im1E7JWDd3b29n/dyD38BclaPzyNIBuvSz1jn0NhnYgOtjtdf9WLr/W
 z12lVoqfxLaPqhlZZtSzD7eBSR87+qEphTItnz1ks6Sj66//5tshpfmQrzzDKQjzMchxJ
 hntNggmu2bmVGEYu7mtVNNE2y4C7udko+SciRNxB8QEtF3s0lGC4jmRaJw3R3mSDhXA0E
 aZ23rm4514jmByUfQG096IPNpi+xSzJLp045+OY1fq9NrXKQZHy/C7V/CmMic00ZDvOtG
 +tPJwIT6YS01tI5qalniMvwZoLBQoKXqeg3Aoe2vUZtPyl5epBZAFC1njypyi/oFkXA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E02DF40068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F61193536; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f257f27aeca27c85bca662ac179db335ab5b43b4
X-Git-Newrev: 072ed8e5d62be96422c2b4625fe4259d1f5654ef
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.8F61193536@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 testing/tests/utils/test_generate_cyclonedx.py: test scp-style git sites
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/072ed8e5d62be96422c2b4625fe4259d1f5654ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The commit [1] fixed a formatting bug with the SCP style git sites
declaration.

Add this style of link to the test case to keep a track of it.

[1] ebcfdb8b0a utils/generate-cyclonedx: fixup scp-style git sites

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/testing/tests/utils/test_generate_cyclonedx.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index e6640fbd0d..b91add2349 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -149,6 +149,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 "uris": [
                     "git+git://git.example.org/foo",
                     "svn+https://svn.example.org/foo",
+                    "git+git@example.org:project/foo.git",
                     "https+https://sources.buildroot.net/foo",
                     "http|https+https://mirror.example.org/foo",
                 ],
@@ -172,6 +173,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
                     "url": "https://svn.example.org/foo",
                     "comment": "svn repository",
                 },
+                {
+                    "type": "vcs",
+                    "url": "ssh://git@example.org/project/foo.git",
+                    "comment": "git repository",
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
