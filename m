Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5885FE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2635A60AF4;
	Sun, 12 Jan 2025 11:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7KPdz_u7g4g; Sun, 12 Jan 2025 11:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B07160B59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B07160B59;
	Sun, 12 Jan 2025 11:14:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4274C942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BDF0403EE
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lu8g3D8hglN for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F4AD4027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4AD4027C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4AD4027C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:14:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 54F6B5FFAA;
 Sun, 12 Jan 2025 12:14:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:14:37 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:14:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20250111170219.2902628-1-james.hilliard1@gmail.com>
References: <20250111170219.2902628-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <13b10993aa16ceda338d9872a28951f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680479;
 bh=3338aJv7Qbz3inFvwOeJX+YR/CSHpja3JR2VK+MHvro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=chORf9d3TUfuHBrgR8k6Lm9iZic3IJVd29BEgxyy+Xyrr1GwJFxcuwySqvrTqcTQZ
 dlFB71/rXWUqsDr73CPf9s+MLijXQm/lEy7sz7Vx31KWniX8Lkvp43wjm/qcgwObSR
 hK8IBn61DCn2LCRF8tJ+O7TKYpXQgeWNAq62VsSGhu7gAmv7W8CZNT0FT9KwypIggC
 7AtCIeCkUIWcKbym9C/GPqP+rwqcop8YYlAUFgwxc+qiCY502l3eBhjefvfrSYNfOZ
 hWk55D/24a5VVZLcgcUyoTs9Pd7STqgQi6Pl4kh8UIajDk3yG6crs7HP59XIChnCFY
 Ofi3/WWC+PCeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=chORf9d3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.4
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

On 11/01/2025 18:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
