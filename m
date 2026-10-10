Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F073CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E718660719;
	Sat, 10 Oct 2026 20:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VxlCsycB7n6; Sat, 10 Oct 2026 20:25:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01DB9606E3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663958;
	b=Ienw4E35FkZA6tEZwvvNqYJ/z52QCd/3oSH2bO9OVjFmYqG9+QfGyDAla2u7ud1xuUwH
	 SQafuaQYD3xcSh4HTQE7ONKx8LGJkzhJVW52Rcn6zbEO9gXn72kvhWbBbu1qbaiEQj9GZ
	 D8U+QKPbHvyUogAMxPiZdwwO32aKlYiUMWN00qhCk7cgV6JKNq7LVnD81ADE4p+8+2IrZ
	 +J9tbCKcJcgp3znIDB1tpFS3buR8+c8T/9hc2RoNYeQKZoeyu0DdW7OMXvf4zmnm/sLXH
	 DVeCa5B81rvne8fJe+YrsH+3tE36zViMnjQENn/j0ZNYb20wAAWGwfzK5feNYytsduQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XCa+PckCZO7lStxJD6RR/yswi9zz2md/ZomQ5WJLp88=;
	b=l84fz7kS3TYt8pVvpgUHXX5AB5LVz77C2Q1NN9PsDC/2VcHKho5bTdeaFZKapqA9sQ9x
	 ZY40Z9V9nMNx3U3A9z1Fnhk/pbTri+XQNjtEJ4XHgs4UVzRDSufYckq2fngevF1Z2XQaK
	 C2C8s7aJogPVL8hSFIdHm6qDTtaakQhW/5iKBKuRyAGXu+x/4EyCki/pKt1L7iVpahMxK
	 TeGoMGeYhQxw5m0xAEzZJ+YeqBUtUBMHoA88hFayVqRO4+oWbLgeDXHB95ffro9WGGixe
	 B1IrGd+pPAoARdPNbQs+w/++IW4Ono8g0iigpN2dMWWYSzHum02yQSZ7G4+Q5ZOJRvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663958;
	bh=XCa+PckCZO7lStxJD6RR/yswi9zz2md/ZomQ5WJLp88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oxvKKeuqD2w9WjDUqbcHijt9vcRKhGx6moEJIfDGoha8Eudx4ydSyyE8TnpRCF38v
	 u+peSUvRv1b3eRXZ4aG+hEtscB+AmT+lLBhnMNqruN1biBz6/H9uzvVzIybc8QOzxu
	 UNUxP+ogyQb1020eQNaMOTdiigWmD3sTYgBnfSl3xpFfF70X1rR/dgaGNDhWemFmzP
	 ofPbJ68kdd6kVEaLum/QrexcNrVg32dF10/F1FIudy/TZ7imO9tPB/TC5IpjaNRbNU
	 1LukdJJ4TlsxmiE+MQ8PLgbRHU/OhXPlQwszYFJbCAc4uPb8sq0E8bwes/HVM4p69v
	 7oNu50q9LHRuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01DB9606E3;
	Sat, 10 Oct 2026 20:25:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E85C39D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE6F400D5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xe6R_kNQRRLv for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 07C39400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=p36Fo/ljMJqf6wcNlcuIDDyQ9Ma6Tdv7idiVtar4Bz5K4BfYH8EZD52gi6A5p/fMgfR1
 /3MfOBx6yFt/pwijm/Tme6sNKRcay2TZHLv5hgLy88/caJASp3Z6m8zoacMzFjqV0axsu
 mr02oBlov+Wc5COTw8DyTn5h6jgnT1H5ucyYsv5fCvNjmrBQXk0AVkzS3x/lIQCV89bFT
 /UzHWoLDGnqbssZGUsleTKN2yOfM1ybK76PxOGtxkpInRhIeqOPm0xRbgwfnaeYmz8jHb
 N4ERdBSCWX/zH8CARDaFoUM6LVIo77V34qiQj+D44U6uDW+jR5PPzKi+94eIYQSdYNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=70GUyq2Dgc6BFr2Ko392QWkeyO2CiCNA30T/fc4TUfA=;
 b=CxOqBmY1Rml2MY3bP4oHkRP6H3dIkIGpB4JqwwpR7Lf+YiQOaMlovFH7A+Pfz4XPWvih
 BAywCaI1D+v4DLlZg2/5AmhCIlVELUficTDH8BVqfVJEv5RPHBLzhywTuD0D+UqbDVh0/
 AHyFPn4iSPle6HU4uWDFwnunp2uYsrL2K7iF6lzXzhUJ7reLX2LoX70VUW4MnYAa7eIbE
 kkiuegKuI+J8pFXskVvYjBDpZ0SrzzmxeL5YG2PORWXjL9Ecvb9GbmWzGdS2BUWO/RJVO
 9Qt40qDjI4LPtZt5ae6yN01vSGPRqd3fkYmP3tHqM0fnn/GVUDiuO+F51UTypTF/d7A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C39400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC8F293492; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f680fe2a61dd90693e245ee0efd433c8d4aa8bab
X-Git-Newrev: 074e650219f98357fe051f82e9fbfe007851a865
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.AC8F293492@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: add "id"
 property to resolves
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/074e650219f98357fe051f82e9fbfe007851a865
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CycloneDX spec defines the "components.pedigree.patches.resolves"
object [1] as supporting both a "name" & "id" property.

The definition provided for the "id" property is the following [2]:

> The identifier of the issue assigned by the source of the issue

And for the "name" property [3]:

> The name of the issue

The "resolves" object was introduced in commit [4] and only used the
"name" property to link to the vulnerability it resolves.

In example [5] provided on the CycloneDX website, both the "name" & "id"
properties are set in the security example.

In the vulnerability context, and more precisely the CVEs, the "name"
and the "id" are the same and thus the value can be duplicated across
the two properties.

This commit replicates the behavior documented in [5] to improve
compatibility with tools.

[1] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves
[2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_id
[3] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_name
[4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
[5] https://cyclonedx.org/use-cases/pedigree/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 45f9682da6..098f62bf2c 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -233,6 +233,7 @@ def cyclonedx_patches(patch_list: list[str]):
                     "resolves": [
                         {
                             "type": "security",
+                            "id": cve,
                             "name": cve
                         } for cve in cves
                     ]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
