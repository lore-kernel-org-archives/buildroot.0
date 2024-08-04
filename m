Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1682AC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 17:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E06B40485;
	Sun,  4 Aug 2024 17:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXXm_MuOqbFS; Sun,  4 Aug 2024 17:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA21403B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA21403B7;
	Sun,  4 Aug 2024 17:24:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10D081BF340
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 17:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B5776065A
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 17:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIrsFZIoGSWP for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 17:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 011086064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011086064C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 011086064C
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 17:24:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5F35213F879;
 Sun,  4 Aug 2024 19:24:15 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37864])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Aug 2024 19:24:15 +0200
MIME-Version: 1.0
Date: Sun, 04 Aug 2024 19:24:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
In-Reply-To: <20240730134030.422533-1-egorenar@linux.ibm.com>
References: <20240730134030.422533-1-egorenar@linux.ibm.com>
User-Agent: Webmail Free/1.6.7
Message-ID: <737456d3a2c0d74abb6ed17a1b62342a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722792256;
 bh=oHt+SA0Q4lKim2y6TLsnMpHWahE5xOUXhABM28ybzow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YPhFPCQtg3mQNB3s2hQL4yQCSRJA4rTcHhBOFE3UduuLGkPkmfMmsSPqbpRjzfC2J
 Xgt+JlTNK3SVp8cQDAti2gghmygJgYl2d9aOFmr4MSseCmwxht8XJVWMwASETt58s3
 XiYt2IBcosQMuMB+9XNxUo+OalSbAgZ6W8dg1qQlODwa5yrsTvcQe93/cdtVwIeAD/
 hivOjBkOWLmuYhK21g5sGLVlkMStCr8o8jez+hq+7p/YU3pH9HWsfL7R8CwS8tAxAs
 cnJNsGTzgz3OCeP+3hvka6ulmikhQz+tSqsZBscj7HwZ5/YWnNuGqrlzFocHpJ3Yjz
 +NlWtO/gCBQgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YPhFPCQt
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/qemu: update defconfigs to
 Linux 6.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

On 30/07/2024 15:40, Alexander Egorenkov wrote:
> Linux version is changed to 6.10.2 (LTS) for all qemu defconfigs.

What is your source to tell Kernel v6.10 is a LTS?

I usually check [1] or [2] for that information. Looking at those, it
is still v6.6 marked as LTS. Kernel homepage [3] still shows v6.10
as "stable".

[1] https://www.kernel.org/category/releases.html
[2] 
https://git.kernel.org/pub/scm/docs/kernel/website.git/log/content/releases.rst
[3] https://www.kernel.org/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
