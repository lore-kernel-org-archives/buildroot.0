Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126C4C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D12C941019;
	Sun,  3 Aug 2025 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvAYU162CSSR; Sun,  3 Aug 2025 14:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D61341022
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D61341022;
	Sun,  3 Aug 2025 14:37:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2617F1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 064DE80EE1
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EYeTTK2RGGf for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59BB580ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BB580ED9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59BB580ED9
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:37:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ACC2320039E;
 Sun,  3 Aug 2025 16:37:27 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 16:37:27 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 16:37:27 +0200
To: colin.foster@in-advantage.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250731014623.3277975-1-colin.foster@in-advantage.com>
References: <20250731014623.3277975-1-colin.foster@in-advantage.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <402c170903176e141660a44c35139e08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754231848;
 bh=qQPY7Ers4YzMBpvANNxVKfprtW6MpLacrAtWZDOynGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZO8qkYATw7Fn1d1rc3aNpzEOiR6O1X+ofOZedTle0UhMHpTn7WJ7Xs4rRULv8kps
 c5ReeqO+UnsiMfPAi3c2noc9iqhjU6XoZuh/g5jeM5X7O2htdkjEBmmowjgT/jqHFJ
 TiGA0PbXzu6Clb7dgzOyTiv7GJeeStps8amUho9rZisMimWe9aEThoY73XdWF0XnGy
 YoOGshbF6mLOu/rQ5QdF8dXudLFDSBPIL22k03SAw2Dfw/sBkQvIunZuQODM+OIekg
 OXKD/OJ4xYazz4NmvudY2XLUhHNHCRdD6z0EVLjtDpK3ca5EuxrK1D8tkXy3hW3I4X
 n9eKXRhBS3pbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fZO8qkYA
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: bump to
 version 1.4
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

On 31/07/2025 03:46, colin.foster@in-advantage.com wrote:
> From: Colin Foster <colin.foster@in-advantage.com>
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
