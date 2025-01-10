Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5AEE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 18:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3132060E37;
	Fri, 10 Jan 2025 18:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHINX_VUIbMW; Fri, 10 Jan 2025 18:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5907660E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5907660E48;
	Fri, 10 Jan 2025 18:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52EAD76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 311BA40274
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SD1e4zBt9Cq for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 18:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52DFB4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52DFB4003A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52DFB4003A
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 18:01:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F172B13F8BA;
 Fri, 10 Jan 2025 19:01:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51464])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 19:01:18 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 19:01:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, martin.chabot@gmail.com,
 brandon.maier@collins.com, juju@cotds.org, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com
In-Reply-To: <20250110081154.2481-1-neal.frager@amd.com>
References: <20250110081154.2481-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0d3255473a688460f8c907aa48e19e70@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736532086;
 bh=L6ISztuC/Ep3cythi7P/mJ+kvUjsYKXLBMJT5CXCfGc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mqOsfWgI5BG2TVcjW5KsBtj5wFgoo0GYq7/LE5Qy3JzU7hgQzYaqtrkdUmqRCBWvD
 VtSdXxyUl0GD6nHBSBMV3BkpINAoZyTkhHAodumu+w2yG6EZZb17hhYUoYHoPwI5Fx
 ijC/ooRH2CfEAsGUQkfOnKk3P2sabdWA82tJLAL2Odyn5fEf1z5RUEmc5M8rqXpTd2
 4ukBu9vQJkdsL6X+/VKctxiywFDyh1m2oEPymm1Sj1xgGxYNm016CVXXk5hSXzGynC
 VIvMHJYJhC5SFwveO7diCTaJbexH6WmJaPhPVvLtsnMlhBA/KD2Dh6rV+9URgDxujm
 6BEGl+LicC5pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mqOsfWgI
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx: add hash for Linux
 6.6.60
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

On 10/01/2025 09:11, Neal Frager via buildroot wrote:
> This patch adds the hash for Linux version 6.6.60 for Xilinx boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
