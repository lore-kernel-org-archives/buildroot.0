Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94586CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D75E41BB2;
	Thu, 21 Aug 2025 21:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvC5kK7GUuv3; Thu, 21 Aug 2025 21:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9967641BA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9967641BA7;
	Thu, 21 Aug 2025 21:25:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 670371C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5899461745
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mmy3aiTO7AcB for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ADDE616D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADDE616D2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ADDE616D2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:25:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D521B0054E;
 Thu, 21 Aug 2025 23:25:35 +0200 (CEST)
Received: from [207.164.135.99:38804] via [207.164.135.99] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Aug 2025 23:25:35 +0200
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 23:25:35 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250819213223.905321-2-giulio.benetti@benettiengineering.com>
References: <20250819213223.905321-1-giulio.benetti@benettiengineering.com>
 <20250819213223.905321-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <725df7f9bd33d3dccd4a1285878f7083@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755811537;
 bh=sakWDyuLljP8NPO5+BSQOmGrfNxt97OZAjLxgHanb2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HeAUZh5S3mTBhWdk8Y+xelN6pjbQjCXsqGZxe9F11rGoDXEH7t3rXVfHgwYJ0/s/q
 RgAuKCHs3MJbMLPE4UoZlrvaMs9NCwdTdy2dJFgkRyZ6OORA5J2sNNVk1Qantfj2UN
 MKZFHW1Z3whukxYfGQ7N0DbNE4UI2aEd7/GXzrSVON4sdopf8wMmQS1CbRq/2844Yw
 Y6ANmBeDE3LnW53evC5GHkGQwODhi4xd3A22OQfB976H0FduA35BkZa4PJCnOVk9JY
 kxhct7n3d53YIvN67KJkkAdOWOJy+fyVickyNloZCmi03yOivBV9PlBlW+z2oylR+L
 qOVymWynbIO0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HeAUZh5S
Subject: Re: [Buildroot] [for-next] package/libnss: bump version to 3.115
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

On 19/08/2025 23:32, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
