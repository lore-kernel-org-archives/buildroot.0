Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48CC35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1EA4123E;
	Wed, 19 Mar 2025 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmoDV8W7NHF7; Wed, 19 Mar 2025 20:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0499E4124E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0499E4124E;
	Wed, 19 Mar 2025 20:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BF7916E
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BF4C813F2
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev7Gu7_ZFfFT for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 785F9813D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785F9813D5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785F9813D5
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:15:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 376022003E3;
 Wed, 19 Mar 2025 21:14:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Mar 2025 21:14:58 +0100
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 21:14:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317090618.403247-1-br015@umbiko.net>
References: <20250315103547.1083333-2-br015@umbiko.net>
 <20250317090618.403247-1-br015@umbiko.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <df311dd156bc256c3fd067ddf22f9612@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742415299;
 bh=IejHV8jKnMkqPY74OVVP1Zw96sdG2LhYnNMmQcLNIss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DtTMRE+wnIWezbuL/TTIsf4xAVIl6WCM6iL+yyr+cYdohYehqrH1FjVrczDVAIF+J
 TYr/5qISZdIB5pIti4w9iemOuM7Ujs9pW/47JKB12JpSpQu+0AtZgWQ8M/bTSL86hJ
 BLDvB/EAuIHyj44D+hPUlMnVde1A0wKlHbjZwCYts+fvQ6A8lTIiqv9Lb3EpVvFk3G
 WaTEdjv8Emcu/BstSs57hZ8rLtI8iM/7hH/Lx3Aux/x5WkiVVXAPxdzDR8g+R97esp
 ZiwMQ4nwe9qHfT5zLeMWVWwAASgRJIyQyxa/+j4fjRj14lJeQcYkLKZ62N8Y7nfqzU
 1CSMagB1bjyzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DtTMRE+w
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mpd: update version to 0.24
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

On 17/03/2025 10:06, Andreas Ziegler wrote:
> Require C++20, drop dependency on boost, require new minimum versions 
> for
> tools and libraries:
> 
> package        mpd-0.24 buildroot
>   gcc          12       12.4.0
>   meson         1.0      1.7.0
>   alsa-lib      1.1      1.2.13
>   ffmpeg        4.0      6.1.2
>   libfmt        9       11.0.2
>   libmpdclient  2.15     2.22
>   libnfs        4.0      5.0.3
>   libsoxr       0.1.2    0.1.3
[...]
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
