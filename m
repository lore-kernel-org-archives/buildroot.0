Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B4ACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E883613FF;
	Fri, 16 Oct 2026 13:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tShPzKhKm9Zs; Fri, 16 Oct 2026 13:14:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D71066142A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156444;
	b=ZSIHswmjrB64HGMwwddLSWSf6QeJXNJWe3iYQHialXFm5bJWynYO57a3SI+k1rzU8+GH
	 ZiK5lvZ4TbqNQwUQ2/eUASOUxdr51UMVeCtsHw+nfP5ymNuid2h6QFpFMPLm0xIGXCISt
	 3ndDTR5V+PuTg7uSv7fBDFt/Jyn5TQjN+nVJiynOGVGu5J037ihLTdYG+B/1yyH4v0rSv
	 ucSd1hsYYXOYiDcstlIteqyGHAvtZ137pdTX/nZN76uNDO/o1W8JQIwdPWHkN2hyOawuK
	 VgpbNJMvjzuFxzsVvwpVm4voRmGfMce5JAWN24LrB0sPU/L6EOEoUnknT9h9+++M4rg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Snqtahan0KwnDKzis3w3gc5cB3prTN/Zfi+jcUmVxfI=;
	b=c63Szuf6U9C95NXOfcI86q+kceSF0To4cfhpH/ql3gx9fF86txqUOn5GGkc1A4czl6F+
	 kQ8G5PYcVuhSQJAqWoQrWWfmYKyS3vABpNxuBhZAJwUq2JCJcoU7VdJJkJH3+nJgyy1Ft
	 s5yiq9712aK5gll/+5PUnouk8ctdbRDuRQXAhwGjFz4m0AI9Ld+JpmC8A5p2lXcV20Lgd
	 +UKnSJ+Osv+W+1q6giLK9dMNkr82XULmYNNNMJVJ/kDcBacRv94z7qG2mMGftd6RgLdaj
	 /6a2260lMC8Qg7PodxxbLbQq15p/MtIYnVekl6BAHMRH/hQ5XOkXN4rn8CNdRu64uZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156444;
	bh=Snqtahan0KwnDKzis3w3gc5cB3prTN/Zfi+jcUmVxfI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OXJxuzowpmJC+vLlqxPvAQU7keEOaPEFVMU7d4HR/pkDwRG4Fcpoixyi4u+Zt//Nq
	 bV0cYzmk89dnedLmtGAUk5OST2U3/h6a7f2T0+QPiAOhJF2NBAurP4+Gfjz0Sii0u1
	 xmo+A5MSdifq5PJ1a6AnjUiQpOXgpcjvV370EDMAk2TVFYc4eE3F3GI+ip0dKhpDpU
	 ANfCJzBzygB4CCQyhhP57Tgq2kyjsLoxtNkFPNzvTpPBkmmfuQh2fjz35zhVtQ+aJS
	 jydiQEvoVvujkfcKA2eDqoqWOa9r/Ig83ORNSHKbSG3HoiT6uu7maMHMyLnnXgrNzy
	 1OhShivLkZoTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71066142A;
	Fri, 16 Oct 2026 13:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB293105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B09D160F03
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgkEMWtdV4D3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 986F160F0A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=SKOs6tqbB9CPxHDIMm/6NAvdVf2tvacULeRg3zH9vCgRr3+8lzcloZe5QG19Zih5pmRh
 3xlwfMB1yUHtGMGz8WLel5vqpUgYd3BdjWIXL/oqv3y826uDMJkuvImWJXFPtXZzYRSRy
 KvnkuSv4lhayJhxVgbp4ldFGSe+sGqjRuT7W2VJHUXjAh2xSqdzLum7F68PnmktMfZa9r
 PEfjydLYOqhs0a9n7/PDETP6IjxkqOKFXo/Wq+zBzqMOsL21RinyKQ/bzBIxRVfH4UgNs
 aPWevBGP83AHnWNsCkDmaKvJe1gjioyhKYyUuLKAxr+kuu5n+4k4Uk31/OmyjMVuGAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1yFHTvY5tZRuakS4wjsEfvfqEmw80wmG4FmFFnkKZmA=;
 b=QBxEPoqeIuZIPp7HIypfy0p9roGt2AevdqVFsi+p+eSDK6Ppkf9H9BYMaUgIZD/Y46Gw
 YOzqsoDs/eqGcvGRRvEtVEyHm8Zt3JECxR8SR652icRXC7CQMT3u1CDz/zxHS76oZqsqc
 CP1sfSSi4qgh5lSnLV8gYpymfsgWnmIqC/LI7v1g12q9stm12arsxvjQDIxGz0T+pY/tR
 9t3+h3NnSK8OjVUouINM9d6UbHLawImGb1U6jU3+MeNnJ866TrGIhK8X1rQYSpZnDkROV
 6JeXfARD514yPYbubHp9PtHlJXV44op8trapRpAqHxsvEuUO/cfP2XiQ+ZBI2k5EhRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 986F160F0A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87D61960D3; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:47 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ca734db97298028d5fc9b173c655c564c28ba85a
X-Git-Newrev: 03dd7f4a8f9d92ce94d4c1bb620a3b54338d0376
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.87D61960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 add comment to explain spec_version
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
Content-Type: multipart/mixed; boundary="===============2379146089428165070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2379146089428165070==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03dd7f4a8f9d92ce94d4c1bb620a3b54338d0376
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The commit [1] introduced the `cdx_spec_version` variable.
The reason for that variable is not immediately clear. Only the license
schema can use patch revision while the spec version should always
exclude the patch revision.

This commit adds a comment clarifying this.

[1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 319aa2b9ed30f542124a32efbd3b27e92261b4bb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9d3baa23f1..1fbf020a3d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -562,6 +562,10 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    # Only keep the first two numbers of the 'cdx-version' argument.
+    # While the patch revision (e.g. 1.6.2) can be used for the license list,
+    # only the first two numbers (e.g. 1.6) are valid in the schema and the
+    # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",

--===============2379146089428165070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2379146089428165070==--
