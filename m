Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C30CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63571822E6;
	Sun, 16 Nov 2025 19:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NR2NGjjtqjFt; Sun, 16 Nov 2025 19:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1779822BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1779822BF;
	Sun, 16 Nov 2025 19:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDF41A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 19:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A65B7822BF
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 19:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_aI0eJiE-CU for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 19:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2258822BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2258822BB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2258822BB
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 19:03:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5CD9F78035B;
 Sun, 16 Nov 2025 20:02:59 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Nov 2025 20:02:59 +0100
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 20:02:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20251116184721.3825784-1-bernd@kuhls.net>
References: <20251116184721.3825784-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2fece7f2cd244ba3c88d37b574e8317@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763319781;
 bh=7KeiANJotTdgWw604CYgj79Srx7MXbwmLA2Am9FjGgI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r0TEmD7T5MtUL7JNv2l6t/OW+u7mtcj3ULfrHPBr6MSYLsaT7ANmPd9XqO8Esyf+a
 wOV6BQC2DYs2ywI9SQhhnwIpvk2rvPeQNT/GGbzQHfX9Mf9pK2r3ZltwhXhMhzZ5DC
 Z0gK7sAcXTK2HzNHPtOk9fw5/u6CVW+57qW8CPn9Sq0DMmOiubvRgkUpMnIqaOZWHx
 wCZZYRfHXQo6fkaGEKKW8rHr9g9lFD/TOTXv7P1uX0FzRz3DVarzd5jHAVS5GDIgBa
 3ojwqoOsfu4iJbVBIGEDygtSyx8EL1rW2DLmwUrVmlFtfcjP9BNtN0IXdFPtRJQI3I
 36YCIKbnzEMfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r0TEmD7T
Subject: Re: [Buildroot] [PATCH v2 1/1] package/batman-adv: bump version to
 2025.4
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

On 16/11/2025 19:47, Bernd Kuhls wrote:
> Changelog:
> https://git.open-mesh.org/batman-adv.git/tree/CHANGELOG.rst?h=v2025.4
> 
> Removed patch which is included in this release.
> 
> Upstream removed network coding support:
> https://git.open-mesh.org/batman-adv.git/commit/?id=2cefbadba8b2c547058b7d2e5da96692ef3580d7
> Add legacy support for the corresponding Config.in option.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
