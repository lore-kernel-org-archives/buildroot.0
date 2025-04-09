Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8166C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 19:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65A580FAB;
	Wed,  9 Apr 2025 19:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umwKsW0Iw_vV; Wed,  9 Apr 2025 19:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9CE80DFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9CE80DFF;
	Wed,  9 Apr 2025 19:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5911D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB653403E5
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVTxNz5q_tns for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 19:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCF0940333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF0940333
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCF0940333
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C47C55FFBA;
 Wed,  9 Apr 2025 21:51:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Apr 2025 21:51:53 +0200
MIME-Version: 1.0
Date: Wed, 09 Apr 2025 21:51:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250409141158.2740670-1-buildroot@bubu1.eu>
References: <20250409141158.2740670-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <b5c508f4d87cd31b9f666a89eb804d5c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744228316;
 bh=KbOZldZ3GSzifr2aeIIr7AJWll1awn7f4LCAwD20IK8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XuYCbmjtT4271yiXJa828SecU1/o8hMW7nWkMi1xbdUukJzmwM+qysRjhqOCCXgFZ
 GChUvHzev5Yz1vMpmrXJmx9UXDeVFfKgbgzo83/jt5FLSRJbhWghfNhqT3LeBQbnpK
 WXDTgogELVJ+Tyfqb9i1Nzl2DiVz1/l7hTePEwU0B/4+c5whZAql0xRWlkmI7Cu3BA
 l1kAoCjUiDaBlsl1NEZYYDmdSb6vkp15E9xcxXxpCpbqT09hqy/ahTwuBjt7KBxC3T
 vxKjYGHqUotleIX84AbO5BAFIYwkpqCs4ltbgLyt0lvpmEx9mBoc0rvJMZ6J+YjB6a
 8kvuk9iUaisRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XuYCbmjt
Subject: Re: [Buildroot] [PATCH v2 1/1] package/liblinear: bump to 2.48
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

On 09/04/2025 16:11, Marcus Hoffmann via buildroot wrote:
> Rebase patch for new version.
> Soname changed, so updating accordingly in the mk file.
> COPYRIGHT year got updated[2]
> 
> [1] 
> https://github.com/cjlin1/liblinear/commit/818442728081980e9786cd3e87034d4e2912f0c4
> [2] 
> https://github.com/cjlin1/liblinear/commit/6c0108dcf3f84262530b909c53e778007235bff5
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
