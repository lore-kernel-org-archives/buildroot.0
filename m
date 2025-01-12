Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A43E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD159408F0;
	Sun, 12 Jan 2025 11:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktD-aL3irauN; Sun, 12 Jan 2025 11:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D75AF40908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75AF40908;
	Sun, 12 Jan 2025 11:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E68942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD8B980553
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSZsRpchBUsN for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 074EC804DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 074EC804DE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 074EC804DE
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4FC15780331;
 Sun, 12 Jan 2025 12:17:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:17:22 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:17:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111175322.2920538-1-james.hilliard1@gmail.com>
References: <20250111175322.2920538-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6c42b02b5827ebeb64bdfab11479823b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680643;
 bh=X/RiC3XLp9oiOSqSVe+UxGXRLY5twDD5vrOAQ585mvY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6sJpeRP1Rf1zDXBNLGkfyWvr9dAr17Kk2LzVpShyjtT3dLetmGmG6LSlhpyXH5p2
 7q2OLxPUCUz1veID2rpsIdVnuYLkDmdbZIPKpH7BjbwJioJwh/OwtqZUK991rwLE0C
 ehNQAeBpPuAdS5NULwktrxQrMnLJMJG3S+Uo7H/o8yMrI61wnkvj8LZE/BRV3z1ArG
 h4tCb4cm1BHgNR1Ayqaf4SfC8TddOHiwqeyVEGuu8Eh+EgEnY86NmAbNsmPxkp+ehi
 ekDTUon9238RlIAY8am21u09PExKeThrsX1BXsJWs/qVbm0ULayUrVMUWkmbRHsZLt
 EckOTnyHLZi4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C6sJpeRP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlparse: bump to
 version 0.5.3
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

On 11/01/2025 18:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
