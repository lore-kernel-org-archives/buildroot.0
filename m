Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B2D374A3
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F115E6F4B0;
	Fri,  5 Dec 2025 20:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPd8UTY3XXH7; Fri,  5 Dec 2025 20:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C94C6F49C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967727;
	bh=g301qx0//fPICaQok2J2ed3qDbeG6eYtmNRz0nmF7Mk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ds7zePQxnP6YwBoO8LnSVV827c/MtgE1WrNrTQ8NHRUGfvuBZLTmh860EmBKw1uvt
	 m1XHjr/cusL5D642MhvcYBZl3eKZxY8QBdEcC6vMmx5zLnHB394dWsQ8CqMg2L3SaH
	 axk6nRELqjwBZ4w7t60wKq7+AwqcYCARZOSkC/uIQbakDn/kvBm6/fZq18dh42T0/7
	 1igKpeEQW1eiRZ0iM9JduXQr7Ot8xfiOK2m991f9CmT3lVD3WhlRnXFpwICyJwmkvC
	 krjdIYv5ZfbkG7Yf+4BpOrZrayYJj9rJKIFf82LY2PAan0KrT/b9pzx98Hbln/FIOd
	 Za6pxs4aou7eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C94C6F49C;
	Fri,  5 Dec 2025 20:48:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 867D5E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83DBE84C0E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuULvN4uWv4v for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7445384BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7445384BC7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7445384BC7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:48:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B510B19F59C;
 Fri,  5 Dec 2025 21:48:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 21:48:41 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 21:48:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251205183916.1783507-1-bernd@kuhls.net>
References: <20251205183916.1783507-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c20752fa2eaa5d70ff8e16cc8bef61b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764967722;
 bh=FnKO7kK2ZEP2a8BWFFwfIifJrRYbjDfEahIT4OtGxjs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H56EPLm86i5U6XJNhTW9yt4oX3xQeOm0qI5GvIluE84aiat1SphgfoUnfsDNnGfme
 ooWVfZwM1q08cFnSJkRLmFzt25XLX4ZCBxmubndOedd1EyT+MR/Cx4S3XP8mezQI6p
 qWlBks+Z3fgCVbvlwlUFmVaPX4+jewS52zPtyZBsSF4husbACYoO3LzFKej+fUhO7H
 5wbF2MCgdmB10CAfWveDEkFHkfdPDeTOItVLpa5NH/j9I+23r3m7Ufw4Xzds2NjE2n
 aI3kOEMjNeZQyo1Vm9/IyBuT8M76M7ZVe75iBYb7mh7M4OXOGHL2mi4k15M7GNYfo9
 PLc5ima/98J7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H56EPLm8
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.66
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

On 05/12/2025 19:39, Bernd Kuhls wrote:
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.66
> 
> Fixes CVE-2025-55753, CVE-2025-58098, CVE-2025-59775, CVE-2025-65082 &
> CVE-2025-66200.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
