Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BACEC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E68B60AEF;
	Sat, 15 Feb 2025 21:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skVgpFVcrHIc; Sat, 15 Feb 2025 21:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4DC60AE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4DC60AE2;
	Sat, 15 Feb 2025 21:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62232DE
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41D5B4052D
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDYAmpVgj7AJ for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 21:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A33D40378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A33D40378
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A33D40378
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 21:13:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F3F2CB00535;
 Sat, 15 Feb 2025 22:12:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 22:12:59 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 22:12:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250215133320.257965-1-peter@korsgaard.com>
References: <20250215133320.257965-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f86d497a9d6a40eaf40621825f4bf5a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739653981;
 bh=60Mjn28X4KYZHwxmA2t8PVuPJAgAl8vfI+sfKne53D4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gdYSz9sNTDgx6/BrVewAzjM01h/iO87Y4g0gzne050VELShoKwcq6I5AKbsY8xwki
 3mHdZQ6PpLkHfsDjUkctiDKn2yQ56A5WK4389LGqdsUHnz/xgc2LmrCxTJdaikU4Kh
 jelRXj+Yd5VXljocmijzTCQqhUU86RbIjOqj9Tpa/FVP/z007KAMbBsLf20U6AtbHK
 3rXDB/64gRSjP9nsTxy9+9X8kdm4IB8MzqFn5VGAD5GhzQnIjEtx1zfAHG8GC3QtOG
 vhJlEyRlUOZOdjQRqPz9T9cLWVxvyc9q6B/1zYqhuf6QDi3gyWiJDDR4eelz+qhjgg
 /s8glp5plU0PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gdYSz9sN
Subject: Re: [Buildroot] [PATCH] package/imagemagick: bump to version
 7.1.1-43
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

On 15/02/2025 14:33, Peter Korsgaard wrote:
> For various bugfixes.  Notice that 7.1.1-36 fixed a security 
> vulnerability
> (CVE-2024-41817), but that issue is specific to the AppImage version:
> 
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8rxc-922v-phg8
> 
> Release notes:
> https://github.com/ImageMagick/ImageMagick/releases/tag/7.1.1-43
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
