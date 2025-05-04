Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A50C369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 17:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38C4681D2D;
	Sun,  4 May 2025 17:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNsA0WyAg046; Sun,  4 May 2025 17:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D2C581992
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D2C581992;
	Sun,  4 May 2025 17:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E35EA
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299F481992
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNqDo9Do_ezX for <buildroot@buildroot.org>;
 Sun,  4 May 2025 17:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E715F81354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E715F81354
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E715F81354
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:45:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5194260140;
 Sun,  4 May 2025 19:45:29 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:49494])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 May 2025 19:45:29 +0200
MIME-Version: 1.0
Date: Sun, 04 May 2025 19:45:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com, "Joseph Zikusooka
 (ZIK)" <zik@jambula.net>
In-Reply-To: <20250503135217.490404-2-zik@jambula.net>
References: <20250503135217.490404-1-zik@jambula.net>
 <20250503135217.490404-2-zik@jambula.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <a2c4686681f792b59307a5c2a00985f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746380733;
 bh=mzlJ7D9V9QNRx5kJzhfPDNHvTWic1h87pzwPywFnf70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z+xTiay524GEJpgxkGl3urAA3U80BVT865M7+NN1FXLqc3Asb46nD+Th8FiQE2O5b
 OF2ooJ7bvWXg/yuuBP7ofFVeeQmC6jrrhUvGbbBhfE9q+weazmr/+iGvV4qAOD0NPb
 ZIDxjyzLBgczeYQ3zN8wXtzx7jgcVRjgNftrk2N9iIIp5pAlALKJxk+59NiHx+NkWI
 m3hJAQJtfBJVLZtbmc4xUL1uUNo0ZaCE/xkyeQovgvH1j+e0wuhgcBP7QMDVWwFEru
 P3MuDYXGiKWe8W9F4n0K+Uyt7kEHszvk1zHENXccg6pLGIUUhsrCu5F0qiTx8gKAwH
 pzWSeMkcC6gGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z+xTiay5
Subject: Re: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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

Hi Joseph,

On 03/05/2025 15:52, Joseph Zikusooka (ZIK) wrote:
> This is a temporary workaround to address build issues with host-m4 
> when using GCC 15, as encountered on
> the recently released Fedora 42. The issue stems from stricter compiler 
> behavior introduced in recent
> versions of GCC.
> 
> A proper fix has already been committed upstream and will be included 
> in the next release of GNU m4:
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
> 
> Until that version is available in buildroot, this patch ensures 
> continued compatibility and successful
> builds.
> 
> More context:
> https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html
> 
> Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>

I applied this patch to master. I reworded the commit log and
applied the workaround only when host gcc-15 is detected. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/7a07a9d155b8f601d68f07ee0ed1dc8d48907644

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
