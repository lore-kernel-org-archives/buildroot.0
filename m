Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EEEE668A0
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EC940EB4;
	Fri, 19 Dec 2025 22:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCgDMzYlX6Ed; Fri, 19 Dec 2025 22:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A7440743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184720;
	bh=O/PsVqNR1KEs22f5fTBVFfTzcZM5Hghl6WGoAufAcJ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eLuqEKbgaA9mDelHK3WrrxI4i/m8eDXW5XvvhzeWZgVz+U7i/yNTTD1sekbjsnlYR
	 Yv0Hp2GfIeqxFxceJVEgd0bLrFcwSmoUFVtekm8bs80uuQStGZplMpQ1Mhs+rpXmqv
	 ZmdkjjLQUgb9Le0FDBRQ0vb/QLQGxgouapBiMyqXFlYwkNDpx5ypCDi/e7fgM712si
	 W7scuclq/EYPtQHyUdbzWUU9UyTtPQUcAGBVjjZ32vD6McPHxtLcojIxMCNpBG+Ug4
	 fMkliTnco3j832SXNgtvATZVSRG53i0e253gD0RRk89jj68Q0rQxNDRzlMBBwC8jMN
	 gzhbil0wucklw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A7440743;
	Fri, 19 Dec 2025 22:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C20119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F1364007F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUKMkpXPkAnF for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8626E4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8626E4003A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8626E4003A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3A85AB0051E;
 Fri, 19 Dec 2025 23:51:54 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 23:51:54 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 23:51:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215193752.1776166-1-bernd@kuhls.net>
References: <20251215193752.1776166-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <cecaf7bece7bc878f5d63ae637389743@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766184715;
 bh=ED6PI4yi99jDoUTnPoWuLHjOI5IIfzj7tvSgwButcus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tLWIvO29ndr7j4CH0bH0yn3FgNnN6m/W8sFtCkQH7G1AGjUwGjCgU/DD9Y9vkVJe9
 pXU4x78MkHlVJhIbFrq1XykROF1G1GGEz/rt8Om2EaH/wwBmm9jT5eW19QIsWFOfST
 2xhdqs/oOC2dKy/hizQsOKEwnTteSbZhCFHT4wVx/N0jrmwE+KYSAL+2rQyRprc8zK
 ZnLl3na457t4ixR+dH/WusxEusYqt67N5NDim8+FybDAUoAhkqQ3tHPmVsVr73F/Xn
 7+Ww7p7thSyVecrOa7JIKtZgMU9b6Nib1v2hl4sisGz+Xugty9ECi2mxtAIy0nazH+
 zQdoGU85DwKBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tLWIvO29
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.9.0
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

On 15/12/2025 20:37, Bernd Kuhls wrote:
> Changelog: https://github.com/NLnetLabs/ldns/blob/1.9.0/Changelog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
