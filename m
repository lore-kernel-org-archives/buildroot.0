Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4320FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8646A40868;
	Sat,  3 Jan 2026 12:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3Dljkqzhpxj; Sat,  3 Jan 2026 12:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BBC4083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442792;
	bh=0s90tDRyrgnAnHfMSkPeJTErjvNR2sDn6IPvXs5E0zs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eTy0yzon0IDT4TkMNBEDYpJl6mpnMx4/2zBMl4SO/ZrMGx9WOSaPtGc06se5Xl5sO
	 KtnP2QisbVwjF5/jVCKg4dSY2kYsOa9yTjxkBro6BdHMIAuUwcdW4Fx14YTsbg/ANl
	 yL/TAf/Txu2MBWa2HqkUEqcwGy9VrM70CXzpWN9C1GJO+nWiOaeMaHdeBSrhoSsmK0
	 iwuKlD1XhnK9AI8G9ZHyyUe+ecPRSY+RiODq2NPyovv700leQAewqNkISRwXyFJ3HP
	 Q8xQSKUZ7TZizRRhfWF8kBzNB759tYmRo5GWDtC+S6do3SHjrAQACss45PAEoqQ6wI
	 9EZT1f+1/dzrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BBC4083E;
	Sat,  3 Jan 2026 12:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 040D9440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01BEF40499
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsI0VKO0hdtx for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0083140459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0083140459
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0083140459
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:19:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 26B0BB0053D;
 Sat,  3 Jan 2026 13:19:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 13:19:48 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 13:19:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260102232920.573658-1-james.hilliard1@gmail.com>
References: <20260102232920.573658-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <93d08f14d42992776d1ef8a15df45aed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767442789;
 bh=nbYRxYw5P0l+v4AZ6cQRkHYATeSTswsVBGAEjdmmSn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uj2j1JtSjxDeSE40lkjyRdBgL/SuAHZb+skvS3RInabGF4GpmXcDaWx3r4KDO/zrU
 Oo66YiQN9k0B5fGRmrQSTaCQnjvnXee6uyS9E8v81lZZpTM9Y/Mj8Q0D+HsK8vEAhd
 qViNeKKYUgGzl2+aoRQpydbtB6YQpQmILOPrelO9MS3+qGij5rY1WgP0dLHaIVDGit
 p49Njf5Mt/cDgs4K+Nipx/P2cby5JE/2X5YBbYOprL6nSxqTTfQvRnvSnBGlK2qCQr
 W0ZfjRRVNaj8nxKhxyDyZJAV+5pLr+VGNaNGgvA/uV1gjM+E6hZMzSMSfORIUfNAc4
 8WvPtLPCYlKpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uj2j1JtS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-humanize: bump to
 version 4.15.0
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

On 03/01/2026 00:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
