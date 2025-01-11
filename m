Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCE7E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5561780D26;
	Sat, 11 Jan 2025 17:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMnSroLRKOA5; Sat, 11 Jan 2025 17:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACF783A74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ACF783A74;
	Sat, 11 Jan 2025 17:57:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EBFF940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF56410D0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyAa_aXxWVOP for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FE0140F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE0140F48
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FE0140F48
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:57:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A9818B00565;
 Sat, 11 Jan 2025 18:57:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:57:10 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:57:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111153904.2850028-1-james.hilliard1@gmail.com>
References: <20250111153904.2850028-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <835c937166f88e82c7dfe5f8556094b9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618231;
 bh=dZAVHEYZVBVdJSFAm3KfXirINerWr6Z08ZLyoUmmqxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fp6q0By6ykeHriD7JSYYNg0nwDhjbZlmHaSUnupmSaC8X9nn4uUUbiCbde/NWPMiw
 9Yd2lHEP9tEyF96ctUaRBHXSElwRvNEVeP4wdfEbIK+KWcAO60jncyyIAvYAqRXAEx
 zz7VVt7hwG85MHtgDqZG/cTC+QxVCuGIQ+i4z/Ua+VIAYZrH/zxietenLnlTgwUkll
 0fiTUeSyehd4AFSzHkQqGMzSPC1ochZxdQDcNv+GPsjfT1ICAAcYP/wwfTxMOqsgD1
 VNHzLOOwU420RPRCyvs/akqg5E99+Tdh4a++T5TEi+GT/xea9HaOdaYL0z/wMHhL2C
 QcXuLnQumShdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fp6q0By6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump
 to version 2.7.1
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

On 11/01/2025 16:39, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
