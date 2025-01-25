Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6F4C0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE1C40483;
	Sat, 25 Jan 2025 14:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YH7Mbzz4WGnf; Sat, 25 Jan 2025 14:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D204340667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D204340667;
	Sat, 25 Jan 2025 14:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4C9941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6680F40BED
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VdzXvBChxu9 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F20940BEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F20940BEA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F20940BEA
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:33:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D71537803A2;
 Sat, 25 Jan 2025 15:33:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54290])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:33:39 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:33:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124183640.3789047-1-james.hilliard1@gmail.com>
References: <20250124183640.3789047-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f9b1e6adc72301936ea514343d9a9b19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815621;
 bh=5TPnYw4C1V7cphtFGaox5ZFKC//lAjgq/m/F2msQahc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dktI3/NrhrBsuf/bt5caL1KRK3o5+FKUTVqV1di81oytIYCKOWcSX7+AzxaG3Lb3/
 WS27tBzyX0p90Nn4YVtecZnsfqop17q5HELYANQbMocMVmF/bQxowE7csbsRMF+zYl
 5PbPlz0v5REZ1Ft5TnImvvIbzqBSChPOeck7HSYn3RwED6lPFNuUI2POLogKwJMZEJ
 D7YRGoX0jYeJwqSNcOedrm+qdW3/F0K41yX9/7zU3W+pHhMgzxrOehqY2ige2dT9jD
 Ooy7WM3ZtbmiGymQBbA5nccTxL4jZTRGKTdnXeH/vty5VN5v5AtvxEEz+MuPsDGPmq
 rGY/FjLejyyPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dktI3/Nr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-executing: bump to
 version 2.2.0
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

On 24/01/2025 19:36, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
