Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3CECCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51CBD60FB5;
	Fri, 16 Oct 2026 13:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipvsBTB_UYCS; Fri, 16 Oct 2026 13:10:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3F48260FCF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156236;
	b=a3okWOOjBOPd4Z6jYqbODFTw6jOk6KPQPaTFEnmb12jLs2KJTl6zT1AW6ezxTo2NVCqU
	 3K7RIybhVUWJNidy/nnGupxe9I3N0YvA0CHutFZKdvhCtoT+srSEVIe6Gy2qOWdN+jIXs
	 59BkvzNDPzIaOg43UtGjK5IXX64R2R54msw7q2DgfYQd2CwiKBWvwX29EFu0EAZYaVbUf
	 5fPO8a7pki24BdcMq4w5rU2Lc06X2LJfS+9ed+t0C6f+CvPgLmOBLVQ+bKUNTMcKqDeRF
	 wCc+o0942Y6jypMHyQfx+PXWkQOjHWrkDVU9abmnE1AA3EyCIjjWnbw3vf6Ul3NUGGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=we/fWMCbdP+qLNJ68mYY7fwzCrUN5kwBornSYLPJzig=;
	b=BVKYcejuJeIOnr0r6t+dwzHj4pHT+TKxL4tqx2SZMG4SIkboK7dckNMsi2PkV9kx5uZ7
	 uSUk3KG7YBc97QLnD7X9j5aU20YicvKpWW35OJ1aDQEFZn/nkd9+q54m8E3o3ms1Dus+D
	 2Pu6QNOulFvBV/5lbl8MS5LDTtxaurXCe6Ymm6tZwOAc6uC7fL8q+V2bYCx47ZAYJv2Lf
	 8UlV4Okbm440kPkfGHWQ2viw+YRC6Edx9rlSjH4zawcFQgCuwrOwjVYk4+hjAoP396Sx+
	 h+PSaM3Xzqo9Rs6/ApjbXbfG8ZxFR6gjoSG1atKq6LFRZXifFqTF4ruPyQJhR2Mg4/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156236;
	bh=we/fWMCbdP+qLNJ68mYY7fwzCrUN5kwBornSYLPJzig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MDiyBsmX3BmMK06oEDencN3aCVSEkeVeL5XEG91akZO2zVrd5BCSeFYAxF0nc4Kob
	 9vkW4FlAdVwQAbmnIlrrnPWTYgFH5j1ZjCmryx0O3GRt9OMrOFCVZRcKQbh97JakQc
	 cCS7ru0nFLNvTc4LZlaC8wEvYh9CuJxlRl3MCmsu1obqAa/jJEDL7v2Fs6qix22/d1
	 U5NvMn/5m+sLNmjTByBlZUGgTGIVqHHcpVttI3F7GLea8WVMi1V2AW02iTKK5OHYKc
	 3RfvnZB5O2ATV/XlqCaLzpen0WSwQz8k2X/C2T+nIGQ6UzUz3nB6ert+t2HHZWPRbL
	 gd7oUWIQxqtNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F48260FCF;
	Fri, 16 Oct 2026 13:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4253769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D7180772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVx16EKJCuIY for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CF148150D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=nMOamO3KgYg2yJn5lPttlXqtMG26xgglIQMG4DLKdJpr5ju0z9FpMcOOzNUcFSJH+Wyz
 MYlinzpBIBEJz9XuczikSdZ/M4WJpquLMwNsM2Mok0rDZRy1TpJAPmzD+rj5zZL59mC7d
 YLRpW13lsSb1xyNO83ECQCicTSkHksxKhM9OGRi9nTFqdrrQEqQbHn3IxkQgXHCb3gYm3
 F4uPKPw479IxcZDpn9US6smRq4G2XMExwBCyLa/puwO6LabZb0eJZgRt/knJYT3Fec8nF
 Pinlda+3oFGJPUEi38qlk+NdL9hm2rbx2PFH+F1X1REGQu7VA43NEn5tOSvAZgohW9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ggTRi9xuItKOeoJz9MvQdCdSQyOO12EZF3uhBIdoeIM=;
 b=aKY3wwmQO2VcNZL3aXgs4lY8mN98PQMZjx4p7QKEAtl/xjGnEFunE7+igKpKIixfICcX
 aySKm+1HteJo03xkniJi3gtRIPG4k+cW5KCyyYw1nWmX7fMMbjgfkFkUdvfk8mQ4XX6US
 nloSZT+B7OAkRRQ7oZMyGW9HR+1MAUpldC/wzBwGDLJeS4AKeKuF3LI57hmXM0tzYFaqw
 MK0wMETuwdbLTKMNyIiYaG1CzUJtIcv3WgGBsPkXqiFBrfKhOeNHzfr4BWIX56jpqFE06
 C/AOLapUq2NaD54KgflJ+Yhh2oITVvCcE0FFaVgiAyRr0XKyN/qP0olgY+N0wq0ewxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CF148150D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E30C960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9e15cd08a7e1075d824ba7a70cd97e59dd133b0
X-Git-Newrev: 8d80b2751bc0fde1ea81396008c9757c6d26e318
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.8E30C960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 support for v1.7, 1.7.1
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
Content-Type: multipart/mixed; boundary="===============2859317519500268080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2859317519500268080==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d80b2751bc0fde1ea81396008c9757c6d26e318
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7
- https://github.com/CycloneDX/specification/releases/tag/1.7.1

Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
this bump is optional and default remains v1.6.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6e77b6ff697103dd2d961c3260d581b670ab9adc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============2859317519500268080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2859317519500268080==--
