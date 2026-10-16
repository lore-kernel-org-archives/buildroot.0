Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537C0CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD6760FEA;
	Fri, 16 Oct 2026 13:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STp6UZ_FGOxV; Fri, 16 Oct 2026 13:10:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CC946100E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156246;
	b=mE3PEMRmMPAZo6ZSvyTK5/N1heFkSiBxp6abdSeTSuUWQh4auW/H2g9rbMFZxnqyYLRe
	 DwKr6ka3+7tQek745fr0mqvTYXE1AvrIvWpyZLn0MDF/EUnUQaq8WXfZhEpebc5CTCAco
	 D0rEMilO5ly9lT5tYMApVWeU0v0Cp/U4yIdv9zF9pxRrWYov8t+UBedIAS85OUKvU1TvV
	 PnsP7QqdDiusTLj2lohBBsMnCY5cBIDjlPWi/2x6wk3PsFQI2IRY/JlPdFZzihX9VHpns
	 Ewm50h3lYR4El4KRlR3+we6i+3ymFms6dITxd7Yo+gNIVRI+Ub42T3cXLjrXR+wR9QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8zslpKfKMfWVPeUHLsChmk7r4dWDW3PpLrO3UIqMF5I=;
	b=GxbiHIydj0Pv6+RXB2fdvPWzrpPXtJkOGdtFwG1kX3BetwYJ+6UIiuvuEhv4RrRl2pDn
	 w7aXxOKdrMWBeBdi8LeJPkaavqwqeLOICg8hrubtQ20+otedmsEwrOV15URjQx/lPsMkz
	 jQvvNnTxU44Vcsx+dhKIIz65qOYPNH08TXjU9Xu+pZopOrZB2obtmEZiyhP+8rwjJyJif
	 ijfDB1dMe0D5et2Ar1lhpUqr88o2hMfV0wwLwx3LN52LC7oTBVRHtxKzneP5neU2444+N
	 gfkESFTNCXZP2KjBZzAGWWR7Zh2jsRyWpNpyf8d6nf6C94ZUskIIMHkbWor0o7SfpZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156246;
	bh=8zslpKfKMfWVPeUHLsChmk7r4dWDW3PpLrO3UIqMF5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WqzTOcNIi7UirHmW+nXABYCZe7T+WH6rBkoLYbRWd5OLNMj8XOOI2RvD7zk9G76j/
	 MIqi7pqXKvMFuyISclfZ30W19ZAgrwhMhnnrqopxMyPFBAzBb0bj65RdAuVFCpOS53
	 doCKb+XUsF2S0HRkSOmLZyIKb+bHCFM/PNRd58jzv13PJIYlAPKY1dTkXbfBdE7IOs
	 NDvOqKc+qLumJXLgi2yLPHmgLk+8XOOmnpHanCNJxEmrEDqffBA0X3w303ZypoZ2ZF
	 K4N28jYEgZ2C3+ioUlgkeypJ6568m3Tfu92rH+TNf5RSQFolvpqn8F95R42TWQYGQb
	 8mv+iy5l0tPCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC946100E;
	Fri, 16 Oct 2026 13:10:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34253920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 247B480772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW-D5GURhoQL for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 122E7814C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=FpeC4U4ph8OWOgxLaFgo/coMVsjLmBT0gRTMaKziZgNyeal+mOFHCMEmR77acVz23B1V
 O2b2SQHBpVSDOVqC2p8vr/NSw6/Po3rxo0EbRoGRdsGTgCN8TmbFp6LFu8JQGoP/yXchX
 REfyoH5eScxNgIABkz41jOm0+OUVKw/i4XGUGYrm0/5Cj2Mh+s42+y47HpxwdiNJ3IpF+
 sVSf9em0oDodLHvckQ33YF0xW9o0ZfIlNXYcq0BL5z3hGxsxWXZ2uFK9g9XSS8Scm4XMP
 OhtiI0Ngdgbc68qKmC2jUnt/C9/ngBwzOpnfCZSdW00j/Jw2VahX12M9cN6/bUv9QbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pdmK50ChK+EZjAjP+91BcjgyPxuIRylDfLzOdPFhdoI=;
 b=sqRRHSF+ins1tDt4SRernQAkQSHIMS2Ob0F7iQZ/qCs8JpOWCRebwPqeIp4aer9rYsQA
 YLlmreSnuqLWeQNnEVOWeVvc1er5Gy70fF4dP6hfHoatjDMnMV0hdzRiI7W46/xL1RNm3
 aJilyzaPovs6hK8jKUsBrmi1ev/vZ6HYwHen5yVL1PW8n2aitj49qbkpMHZPSgzE78qLW
 iifTMB0hGdcQHgEvCMvq8HhQkcoPwjjdOPLkc9EmY9WAD/GmGFDgsMRP6M8gplpQBZHOY
 9GPVM5KZIqDXRuA4pEbjVw3CsdbDwc2SRggTYMZPCEFgwwiPXx1fgTKf5B/ICfbCPCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 122E7814C0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02125960DA; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36aa234a0130f21e295d09eb3c4d776d6d5145a2
X-Git-Newrev: 3ef62296032b3696b83034cd0591d8f568e02c19
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.02125960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 improve help text
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
Content-Type: multipart/mixed; boundary="===============1188472438880626221=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1188472438880626221==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ef62296032b3696b83034cd0591d8f568e02c19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The argparse has a set of arguments you can pass to the ArgumentParser
object to improve the looks of the help message.

The example usage used to be defined in the "description" but a "usage"
field exists [1].

Also link to the documentation in the epilog [2].

[1] https://docs.python.org/3/library/argparse.html#usage
[2] https://docs.python.org/3/library/argparse.html#epilog

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c13eabf18f6541bb264aa1b041ee56206c95c810)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index c292ef7840..9d3baa23f1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,9 +529,9 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-        description='''Create a CycloneDX SBoM for the Buildroot configuration.
-            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-        ''',
+        description="Create a CycloneDX SBoM for the Buildroot configuration.",
+        usage="make show-info | utils/%(prog)s > sbom.json",
+        epilog="For more information see https://buildroot.org/downloads/manual/manual.html#_generating_cyclonedx_sbom",
         formatter_class=argparse.ArgumentDefaultsHelpFormatter
     )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),

--===============1188472438880626221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1188472438880626221==--
