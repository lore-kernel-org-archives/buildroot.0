Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C30CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A071960F0E;
	Fri, 16 Oct 2026 13:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX2-qbCDJIJc; Fri, 16 Oct 2026 13:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D19B6139E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156419;
	b=n1IRvVHV0Zvr0yUwEaFGcsq/Jaow3PhurL/6rsnfkUIxv4aeK6BME+5i9c5CgfiR6mq0
	 ZQ0LTiK8KXnlMjsu0pFG6hYtQPrWSojw/oxGRYWIppJEv9B/zMmVsNfVUzFG0jqG/mprS
	 Fin2+Sn8xp+njMYqr9qTHsmbFYRQUWrKHcEAiNApW/3OBafiMmj6uvd66Vb36Gkhc0e8V
	 DXYXH6V9zCnkRKDtJuxGm/HGFfSfjp1KsKb1wA0ZmHuhMBEtv2dyJh7iuAyvxvjamkScM
	 pD4+Q95eqmfRIQMJeLT1njoPjMP3mTdlOOojoU7VYeGTplCzcAEdw54sfpgkxt0bE0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=y8aXrGJw3VYOoXC5PoSxL0NPOHFINXxpAmfiwTLAMnI=;
	b=GFdOqW4FP4w6AKt8AReLC9hZj/FHozP2KRAAMXSfG4YP4cGgUaWQns8NYfsjYyxgEIOZ
	 rQXsqR0Wuvzq7sng4IsgVDkas8lzUyBWr2h2IokMwpzGs0Se9syuX2hKBklsWmUiiRzQG
	 A+wU2iq6Zuxj+fF94NXKqjkfhTAg34i606vwzBEZO8rI8OULDHNu2kDOS8ycKMDvGjc62
	 4WWFAPnnKjI+w2vt6kXtsMUXCPmxRJ/AanNYd+oB8vdzsS5qcZMTTZgvhjv/KFxmiw8Ch
	 o3m5rL+PXL6N/21J/vcYJWTwkpGdNN5G0Qp3w3rUPF7RYoobcFU6ZDxll3+WkLrgdlA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156419;
	bh=y8aXrGJw3VYOoXC5PoSxL0NPOHFINXxpAmfiwTLAMnI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nriVOqFJOTLmwPOJXYX12eUMbegpC7zTGFHRdmSzp8n8Nwj8aHenhOzFCw62IXIge
	 YfTjXxezWFqHXJ5bg/Ghemb2DCX+gsUDBnOZcBrJD7Vx5m5KAlKvQpMF11j6aMlOjd
	 R7G/xG6xmwjHYlEzDzDv2SzlG+D5+Gk1MHNBhgbCK+9mCShWuS8OdiBHwLG5R7ra/J
	 BLFwckWtU9y9I1608pW7LvzzGZMpAH+IUgY3uKDxvtJTLoOICpfmcNHorEnc8z4cjb
	 QORnYYpdUm/fK1ZSvVYy68aUK20I6IAspJuE5b9vBY9MySUa3YDcCTIWCbm2o9wxq5
	 LCgeCBiS7nG1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D19B6139E;
	Fri, 16 Oct 2026 13:13:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D7F105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F51060F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6Ww8nWuW9BS for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AD8860F45
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=eF0TO5mLldb1YRlOZDSPuZtiFmji5fbrZx5mY/+ExohIbTdwLTw+teA4yt9yLZt69rqr
 DxKHiOjJfpTnLSOHY2kyY6sIYctEF+4WBY30yygzoa0uWex9z6/omWsyVuvo/dW/SXLRU
 DPzHZztnyCx2yDh51yfq+JWd/7Ecr9zeowMqqq8XN8jcUxUwzjL8lOID8Urpwvx9HsMUY
 JUOr7VnJNUZSIb6OARKyRfETMweC0BloGDFtSTe+934OtOV2Q8uTcHhAOhwS1qC+AUVij
 O6S2cJf1kcqaOUzomSakc22Bv9ZmwEf7B+0DfvVfYCEOGgELkYaCgULvsZoXzD2VbAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DH+jO5/E9IZj0rbXWJLmomXxYhZP4xfecGa6B5pLj70=;
 b=ajZoc5KSqtNPtQGxWPcDVoM4KdGXWWhPbqGDswTppf9gCPv3Cs2QKAir8kKF5HwLgAE4
 tvJUl+wUoZKMrcLglDVx5Qc73aNPUey05a6hAXdPfKEQYGCxff+wC2TfJYoXBicuCymFx
 x6QpB/ZxPR7ngHvgCKNrTchx01LbbgnCQU8HkDph++tYDjlSGeaCD5zfu6d3JBZaI0fnz
 NtJMKQbC/AOJaZy4f7X5hdyFw6XBUQCkvbB4SszUpkfM4zZi9+UaEJr3fzc6Pumsjuu0X
 F0mT1t9yD0FWx0OdmsSjyuhJAnwVF2nuR4Q/EcD0sxay8bJ9p8gBDj0qhgPPNO949Xg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AD8860F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B10D95BD2; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1054e4fc0e97c30319bf38ac39a63944915de3c2
X-Git-Newrev: 5e2d464641533ab244f938dc6b67464a641a5dc6
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.8B10D95BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5145822979204960586=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5145822979204960586==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e2d464641533ab244f938dc6b67464a641a5dc6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5145822979204960586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5145822979204960586==--
