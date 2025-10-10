Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D7ACCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A7D83E1B;
	Fri, 10 Oct 2025 12:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61Fb_6AaM1UR; Fri, 10 Oct 2025 12:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE37C83EEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE37C83EEB;
	Fri, 10 Oct 2025 12:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01087119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB90C40B7D
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLif42WvTEQ6 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B93B440B30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93B440B30
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B93B440B30
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 15F5419F733;
 Fri, 10 Oct 2025 14:05:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 14:05:13 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 14:05:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251010065606.3819391-1-james.hilliard1@gmail.com>
References: <20251010065606.3819391-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5db1493ce4adb0ef6ab303522ffdb38b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760097915;
 bh=vwph1JMDP7FSm/xTH73jGh7M4h4a5dBZynry9EaHrZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q4aIaUyjhZvcaOlmVoR57bA9Rjm9cJl/9f59HcOxIr+AyNBUoWwpHusCQmzMR2vBD
 O1gVpaZ9A4hEN8Bykae78CxB6GwJUxZC3V4S+omXkz+HrUNxbOYdw7cgfzd/uxfbma
 RM7omkldWUwD0DBi80StyTY+IZbp6BT4lf1s4oC2zRZISZgjPiP4uyD2iHSiPu4an2
 ctmFCgblYoPp2I2ZkeNkJsiusYguv5vOOVuJgDw/006wEDxJ52lGLBUHEC7i9ejzvo
 lofTTp1bv4WD6Kj6u5MrhATQLmqujQgb6kHJIMJazQQpYIsusnVoH+ZKJookaCnduj
 px3p2yLDP2/zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q4aIaUyj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version
 0.9.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/10/2025 08:56, James Hilliard wrote:
> Drop pydantic/tomli-w runtime dependencies, add anyio runtime
> dependency.
> 
> Migrate from poetry to pdm-backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
