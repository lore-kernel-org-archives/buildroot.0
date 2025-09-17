Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0CCAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5423084535;
	Wed, 17 Sep 2025 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRSQTCBpThdn; Wed, 17 Sep 2025 19:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81FD28453C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FD28453C;
	Wed, 17 Sep 2025 19:38:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4CF279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30FC74143B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFAwIII8yt5L for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 306474142E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306474142E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 306474142E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:38:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9DDEE19F5A7;
 Wed, 17 Sep 2025 21:38:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 21:38:38 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 21:38:38 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250917185344.2881523-1-thomas.perale@mind.be>
References: <20250917185344.2881523-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <a8ce719acfe7a59191b15d59937719ef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758137919;
 bh=iyM1kuRby7sVHWTX3aW4x+AWQWJP/7sJVOgdJMi55w0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e5Db6VafLS8ULhi7E74DzHtm3wm3SqPXC4eatspGT6/0dFpKux/uYqlpf6NCSUJ3s
 WekCgBB/NynV+iQKgCdH8QU5PZSxG3gzLEIeVvs7VQZjtgqKvLHj5VEliwKDr1Xfcv
 MvEkZ0RbquBOjD42VZlmQG33VnO+SpfQnt3l0OQfttajZSAko+rg4hFf12+hCne5S+
 OXonTLSMi8PXD9J9k3VLjyWKsNkcM7+APcLEcij5gQsxfJESHsxVeR0KGJBvDQdcuu
 qBKgfq50zJqnJATb3VKqjx+0gnBLCwf5kjF4x53vXYbcI9s5RYEPT6+Tg8XNK5K6GM
 Zj5zEpyOgTsbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e5Db6Vaf
Subject: Re: [Buildroot] [PATCH 1/1] package/lua/5.1.5: add patch for
 CVE-2014-5461
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

On 17/09/2025 20:53, Thomas Perale via buildroot wrote:
> This CVE is specific for the version 5.1.5 still present in Buildroot.
> It has been fixed in 5.2.3 and thereby doesn't affects the other
> versions available in Buildroot.
> 
> - CVE-2014-5461
> 
> Buffer overflow in the vararg functions in ldo.c in Lua 5.1 through
> 5.2.x before 5.2.3 allows context-dependent attackers to cause a denial
> of service (crash) via a small number of arguments to a function with a
> large number of fixed arguments.
> 
> For more information see:
>   - https://security-tracker.debian.org/tracker/CVE-2014-5461
>   - https://udd.debian.org/patches.cgi?src=lua5.1&version=5.1.5-11
> 
> A patch present in Debian is used to address this vulnerability.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
