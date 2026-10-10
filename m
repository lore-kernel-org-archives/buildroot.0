Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD89CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9807608F9;
	Sat, 10 Oct 2026 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onTGdkASijbV; Sat, 10 Oct 2026 20:26:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 89888608EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663966;
	b=NqHSYzOVKzK2K+qi8S7d23/usCZEJNmtx3lkiIUocpaJzN5GGKLDqXQU9pPhExMm2sLR
	 DA0mrMpu25Z/E2zkYj+LhlVN9RDQGJcZBpLaw+9kArb3BpicG+QOl3vnnBvgGQe+XXw+S
	 77GJrZ3+ZfBPayXO4f1BkphTo3GaTZbFLV3FNhciXmuST/1n9EW1vwsB0zUlS5Jy8QvlX
	 z/uFsFSL5SZt9nswoaFyKJpadVVYZ0Wbwu9iOPkVtn0DaVU0IWdSFdzh9HRnPMY5cEb4j
	 40E6bcmj3GyTrE4VGciXRusUQEZsrftJ2s16dITMrJn1UrlriUNtLI+GWw++upkl/aQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aDhTMNTJNbEU3viOW12JJxJkMsmtlVB3OJYLD/QHBFM=;
	b=biLSeY/budyhW3XIusroOPmaGfTGU+DWHE5i7LCpiUfiEpUpnaqRpMk3d9N0tsSHMDXF
	 Cw62fUF0fcnGN5EHMcwp7c+2/Ec1EnWqPXtJs9Qu+Y8HVGFBG7B1V0y52xkfHqpPHCkPU
	 5qTnBbusaZe2kqHC0BoDvkVhDLiwrGqNqcOxRrPi+OuYIVbIGDTf7j9tJFJmGQLc67Hlj
	 ovW8ttpTYNOFbL+i05lEFiLA4oqzgmRmAnt7iw+auxIp6MbF7+ClszButbvqgJFTlmeC7
	 uYEq75pgFYgLBzMQVPxrKjiEqZiTxCy86nYRSr+mZY91c4+6fV+hOxiglWJHxzw3ihQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663966;
	bh=aDhTMNTJNbEU3viOW12JJxJkMsmtlVB3OJYLD/QHBFM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pmJOr14zMsZyA0Od51Gzi8AbafPjqaIh8BS/ao/CDNY1/mMc6x0GUOuNgJ+FnucGK
	 YqrH7pVQLf6KFNIK7B9FdQNYraACj5npYGTDLrd3TdFLF8pKUFfKkqGMLd07FOY/4Z
	 It0YcZ5w+No3f25uqsxnOv4Z1fI/J5+3mPQN7AUVm4bpfhuOg6rS41J8UqeqIkvnAD
	 ciOwQN2TADzt8Ni3bsCLa8GzKC6NtuosdjU49hnsFF4YrO4hTsrHTyPwzFUdP8kme0
	 w0dYHDaeS0hH9SSlWGYLpzx7Amzfav9kXul031MBifuV5G89Or4bfIhEPOh3S5+Tty
	 ctiSLt1Jnvl5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89888608EF;
	Sat, 10 Oct 2026 20:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5350D9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38B9940872
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIiuddxTYmMY for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 42CF9407D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=HeOBpq2C8/tQuLn9ugX24WufOJToWjJommYEYfLc5dVmOjrIvCLUaqz1jKEb06vzLONC
 rfBPd1N5jT+Lc7XT+/v+Lq4IFEZ3N4yjtCj4eyAQO89RtyuQvaMpdtgpDvns+ljzqZWqL
 wDOBxZJKlP8e4eprUsebGD9Xnb4fGpkbcfjW7wCxIv1nxBbasnjCmrakVfMXS+H/Y1zE2
 7G0VrVfKe6WpOaP/gb5Qe6KC+y+FucjatPU5AvdCqsLIrnLDAaVfuNXF6ahId0dTOAT7T
 Zzx+U7UMogYwaX33Zpbl/Blk8dIdbVAJ00eSfgnTC1mwV5wNPPY2YYctSywy/42bAJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bMBc9wAKjmOX/eq12IVqA4HUOs7mOTU8OCuwb/KCE+w=;
 b=gpV5AMJW+3ja/qsiEvJHJgEXL0eWog24LO1TKHjC9E+X6MByzkeFhRd87DVqP5aV4pPj
 EEAV84Y2wFNa2nJsF4KyIzIrqCx8pny6/QaxVjcHZ4AudAQJbtSMxPsD6L0hnA/BJc2mQ
 Wd/WlaL7gqoKxgd48GEe7DC5AMvUwEyNG8XXDdprL1qk5YsGRTywPWye7SgAeQ9s62enh
 CFDVFArd+O/2HWtOaLpofWjaQH92O1QvjxqNSNgD8lrRluJ9cJgHoau6wII01YxU9m9vU
 z3syxZ0nc8jrFdswq3R0mGdVTxIQntQEfHChz/zd2oA4PGHyit5h0ja68g1kuGDUNwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42CF9407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE56193537; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 504bb61bc68dabc6d0124901c8e5bec1aa93dc32
X-Git-Newrev: 6e77b6ff697103dd2d961c3260d581b670ab9adc
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.DE56193537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: support for v1.7, 1.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e77b6ff697103dd2d961c3260d581b670ab9adc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7
- https://github.com/CycloneDX/specification/releases/tag/1.7.1

Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
this bump is optional and default remains v1.6.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a60c8e9526..fa20f6c1cf 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -539,7 +539,7 @@ def main():
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
-                        choices=["1.6", "1.6.1", "1.6.2"],
+                        choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
                         help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
