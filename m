Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C5DFCA17B
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 19:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22EAC40CA9;
	Mon,  9 Mar 2026 19:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rK6hYUBI15uJ; Mon,  9 Mar 2026 19:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBB440CA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773085349;
	bh=bOrTq5wjG+LhEVbZoTggWnZe50k52ZLHISyQo1FhfbI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H8yC09kM0lHPwkyZLDwOCMXsXuikvDsJHD9gn8KR0ftppV5K8ljn/RnPBl5ILttUm
	 6GjrNp6+3PqiK+YCBOCPXJeAhEwl/ge7P01JhL2AySsqlORUPJ3BskWerHXHeRSreR
	 ZpvInRnnh/QkTK9jVZewuHp08vWcTcTUoTy/N4PLnb9p8N0z4jzEklEPBcPrz3bntD
	 JsFGgtrKbe5dpszzKFezZEfqfDvSd+VovhupFiGoXHFo5i2Wc8AdI6+uWsDQJ4OZhc
	 IsSs3/aP/0uzJ5V8bg3m5OQdp5bjrZHlMxDYRgBu/SKbPBoPU00OAS0a05DuaighT8
	 /DP3odN/epzVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBB440CA1;
	Mon,  9 Mar 2026 19:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 011B8B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E718440C99
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EigwWizOeyaN for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 19:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F2AC40761
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2AC40761
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F2AC40761
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 19:42:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0E77C5FFB7;
 Mon,  9 Mar 2026 20:42:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 20:42:22 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 20:42:22 +0100
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260309062101.4046141-1-mika.westerberg@linux.intel.com>
References: <20260309062101.4046141-1-mika.westerberg@linux.intel.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <af0a5be9b63a874735338f78cf732ed2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773085344;
 bh=UO0OoZcW1XwCdYBAmncz9QBx1GE5ABez+J5HlyMaM9o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PLMFWUdZ69lVuiiAMuR4dymLLw+Z8JUMBKBgK4kJpRMbtKaKwcPXhFkeVE+p3Aved
 e9OnSk8VlJa4KP6TuqqebHjUlBRcfKtJcR5yJAB+A6d/pUt3aL3f9K2UVUrUzwDEGj
 eG0RAN1LC+pqdrP80LI8GzFiqtghGTzdve5RZDb8gs4bnjTImN5+dsCcJEypH767QP
 jIuf3T2gt/HMmyPMNFS5T1OLv7P3DJgdUwpgU+0eYj5pDj2USJc3S03edc83W2PkKe
 /0MID4bdGW0yV3DVrSLyv8hHG3Za15KNokkW7TN0GFCOJX7NH8B9ae+xKp7QQBCpK7
 CpWNkNGEI8VgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PLMFWUdZ
Subject: Re: [Buildroot] [PATCH RESEND] package/tbtools: bump to version
 0.8.0
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

On 09/03/2026 07:21, Mika Westerberg wrote:
> Update to the latest release of tbtools. For change log, see:
> https://github.com/intel/tbtools/compare/v0.6.0...v0.8.0
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
