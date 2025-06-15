Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6893C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 16:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D49380DCE;
	Sun, 15 Jun 2025 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7W8he2e8xhG; Sun, 15 Jun 2025 16:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9002180DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9002180DBF;
	Sun, 15 Jun 2025 16:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE6D198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B7880DC3
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZbykJQxan-Y for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 16:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2361480DBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2361480DBC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2361480DBC
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:04:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 40ABEB00539;
 Sun, 15 Jun 2025 18:04:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 18:04:55 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 18:04:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250610150527.96508-1-buildroot@bubu1.eu>
References: <20250610150527.96508-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <c3a21a83c93933585182d4c744c016d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750003497;
 bh=885F2Ufi2eUr3RUNT5NDIeLw9z3+SuAz9QePQANeJt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eNLY8P04DBVNQTb3BDsSGJumFS1PHG/0hINfbYthYKLbqBegxqVMuqKwFc+6nVo9s
 xT5RiJaH3UMPKD/18RFSmd0DUBqAwX0rPhwPDwe0nGlHMuXRugr7EZFUZG38AKWUsP
 zegzkSFkdFedwi0CD3PviNT/D4B/rhH/jLdQNfbrnTOxYrZisIPhB+oRLOJJrrIuY+
 isfF3B3SJ4xIYIdFWDVS2m/bsZZ4YjvmO8aG/1TVCRy1hLZrNSzKuWuvXYXyJtlpmi
 PcDltfMkWqyGEPgesDRr5pOtpkxbg14FtSgXyOUyfdksOfeBbhbFi1btxE5BMidXD4
 CxM+HXAYREUyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eNLY8P04
Subject: Re: [Buildroot] [PATCH 1/2] package/python-requests: security bump
 to 2.32.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2025 17:05, Marcus Hoffmann via buildroot wrote:
> Fixes: CVE-2024-47081
>   Fixed an issue where a maliciously crafted URL and
>   trusted environment will retrieve credentials for
>   the wrong hostname/machine from a netrc file.
> 
> Release notes: https://github.com/psf/requests/releases/tag/v2.32.4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
