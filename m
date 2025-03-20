Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58BEC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C1640D02;
	Thu, 20 Mar 2025 22:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U95s6Te6ry9i; Thu, 20 Mar 2025 22:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E9740D29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9E9740D29;
	Thu, 20 Mar 2025 22:19:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A783212F
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E4C8376E
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaYtMdYqHAz9 for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 069CF83280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 069CF83280
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 069CF83280
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:19:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0AAB42003A4;
 Thu, 20 Mar 2025 23:19:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:19:03 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:19:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317214602.3050196-1-james.hilliard1@gmail.com>
References: <20250317214602.3050196-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <292f38dc59277d0ef662b3c75e871b9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509145;
 bh=9swLxoluMyvp1mXBCE4FWqZ6g+P2EKBOJgIktXK3HyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sP81Z3U7czXJvQY+DPmqTeXTGtR12zzAbVinn21DBAcs/BuvM9y3mp09s7BVo6CNG
 NtNn1lRtMyKj0bZKGbEWbqXSDAbn4SUdHF9f42SMQa2X8UQtqan/Gwz6tVuvRmrZmW
 /hw3YWeN//u36kxHncRPL9G/6xEwPKWtnZ8WV7gYJRSqW0/eZeSTIKsuPyBZ1iqkGI
 LmcxrDH3EVGK81ZUGuzf03kWZMi9PZBvYw4HQ/zpFEyiSVSKJfAC/XhsWsg+1w+7HC
 GxsLiBhdU0UNpGPe5hBfgn7TKFytzHogHF4rQylN/I3pEBSeO2fnzuuskamexGzaGB
 CRf2c/zah/ZpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sP81Z3U7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.14
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

On 17/03/2025 22:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
