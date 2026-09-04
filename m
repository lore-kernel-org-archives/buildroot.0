Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E13C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4913560BBE;
	Fri,  4 Sep 2026 12:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOBykeBf76xf; Fri,  4 Sep 2026 12:15:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5F0A8607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524113;
	b=dNdoqEiAP8BdZ1xB2mZuVwgoHE7mmPFtDy5pSJONPnMHdLB4+OPZH3fok5hpBjwE43eP
	 X7pp8+6MiNErO6Bc4xg5IcDil6wcVSqIMPXKXY2+hum8dZaQq3BBJ5xLOprR+2fXLZCYI
	 Je3N+v8XToU851Ywt4pPB8RpMhiYA7rAYCbSw2sb6YOhguVLKGBNqhnS+0HwhdcEZYxYO
	 0HICd6wNaTVtHuQsSNfOqluJ3O/IvM4YtvOSXkyBZlyF4wQd28jPxV6RWG60Nt+7VFeuS
	 L/39t9shgJpENZ832JY8Br6zHaSWRxEq6rM5Xl8EU0H2hhp8xbtM6a2gLm2goMwoazA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tYRAY6FxpCPzvXsmNrEDJpdpibqAvXDXlZyJ4BzXnGQ=;
	b=ghkBzFmPwWlqyDdkkXHyRUTGmTDNN1Skql7KMWogCqZdTsUZz+wind597soHdyzExNgm
	 PxtsI8l+hx6D2VqXrcMfCzskxj0edohPA1aJgzvSQCfU/nG0f5CRh9I1ieEhrJtOMxbXC
	 19DqUFS88bnV6xcheLLIs0AcLvbFWO7TJs1RedO5vYaV+A8kuBp7tyrQoMQDYhLX3DENV
	 NPodoJEtDSIq7sFBrfq2idZeqA/1YT9iDf9FMwwzesBbvkdWDcXgBN8UTtk2m/J5QBmVh
	 58TQGknqjIfpthGB3aZ7mego//RwJ9dbOIUhHFUsVuWsIDOq+MG9J0BzJw50wgFL0Lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524113;
	bh=tYRAY6FxpCPzvXsmNrEDJpdpibqAvXDXlZyJ4BzXnGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kJG4iZJIkaXVVX9Mt3gSdZZ6dhw6WZR9kNnFIUa39eJ/Hcy3HxKTFmWJ3+WD3/S3+
	 haDwWQfnAnISwYOLh9vfhpfOiC+yKkSR0kH9RpfICgGKQaFNas7Z8HFxWzKaH0R8cb
	 RgUHRobV+uXaCua/wrI1iZfCLbB3wbZHy6rOaW+vK3oKVAPUXkAOK3LCmpJA1Z5XqG
	 x08pA9r5cB0Es9WDLmTD8RsG2zuV0d62UP+zntSVzlO8D1x+Sx0kvMFXi25dFC+ybR
	 4qkquaTCkKvMIMh7diZZa1lbQC8AZKdfUjADYmMbKjAl0w6ppRo0qkxyfdFeHL89SB
	 RMm78tDpCs68A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0A8607FF;
	Fri,  4 Sep 2026 12:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E597EF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E250081174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9ga_g-me8qc for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:15:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B4D0F81173
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524110;
 b=Sj8mVaH/gTirmkhGKE3DTnrgHmWJsajTU2WKB2LAI5l3b19t+sPh3J1HKe2mMyf0zRCM
 4Oxy8pAO85bYnC6fj0xww3/nYWdg6oYPRjWILLOuECO0r4dmJdULdP+MgeU60qHqVO68/
 1I3wgvkEiu412htQKVIa/b95UsQpuz8kwELR/qmlVZH3zUx2agxE94grwmBe9JXGPF7qA
 fdT1+BFNgXM4Nv+KZvkOJalig1gPTkov+8BkwtJXybFi+H6c0HQW8I5+Z++FKZVndF+Ha
 Gpdo48zK97cTuK27b7QHqZMXOf2w2MYRbjnYf4tZ7aHX6GTSXbLyAxv32m18vYzKhLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524110;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OBZ2nB/xTedqL3KSFf+lgREBWU/vp/5pkUP8IwNHI0c=;
 b=kHdQim6vR8Y2y3PaeipACw3jtVGJCYdQi+tRVHnx9wzFKYsWlAZaXdP4Dxf1SRVcGSIp
 cOWl1zTtaK7QNG1KS8XRdmDHdopJMFREsgYJjG+8PYCTLdiyWNABUjG+Z5aTqP5L9FtKi
 Zit+aac7JTi2742zuRqglofHDRF94qrWms4VSbO5ALz0B6p41+1+GJjNdRlI/AYn5l0eZ
 uCHqL1dn/AFuS6EyQhQ6+sJ8FhlBB/xfueAnF6xxbKgY+xd74ROSC0n8c9di2zp5ljhTb
 Mu+nlt/KrXBFIQ5VeDqngVuFfrws31GYpPNgjzHJLhiHS0GVGkb3VKAnZVkm2iQ2Sog==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4D0F81173
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 355C89415F; Fri,  4 Sep 2026 12:14:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 14:06:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 37c37731b16bbfe59709f3408e75c4fe124c00b4
X-Git-Newrev: e2e88e3f0c949086a323dc325b1c9f4334af844e
X-Patchwork-Hint: ignore
Message-Id: <20260904121410.355C89415F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: fix hash for
 README.txt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2e88e3f0c949086a323dc325b1c9f4334af844e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
However README.txt (used as part of the license hash check) has been updated
upstream in [1], without any corresponding hash change in Buildroot, leading
to build failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189

NB: This also affects 2025.02.x & 2026.05.x, so this patch
    should be applied there too.

[1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit cb18f3a74a49a62119857ce1ab712ff4528a1d3d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 57aa3dd49d..ec3e92aaa0 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -2,4 +2,4 @@
 
 sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
+sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
