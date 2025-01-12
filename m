Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E91E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3626C6064A;
	Sun, 12 Jan 2025 11:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXs1E8IJUaDw; Sun, 12 Jan 2025 11:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A9B6079C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A9B6079C;
	Sun, 12 Jan 2025 11:36:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BE868
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93F3C400E4
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR4i2gE2Cf5H for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C76034061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76034061D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C76034061D
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:36:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 26CAC13F88F;
 Sun, 12 Jan 2025 12:36:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:36:32 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:36:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111184835.2950916-1-james.hilliard1@gmail.com>
References: <20250111184835.2950916-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <244305768577a962fe9fa975335409d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681793;
 bh=zrLh5Be+T6pseq4RgFOC/3bnWDMzj8DUUEInd1yVBSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rFmC8qyiA3+1HUkTTuqwMqEf7Wr+Rz92H+FgKYkgiSHveFc3svMdu1Eu+9BlZcORX
 MOi4F1YM5c6eBBjaXPW4LjcUPbxzlks55hm9WSeT2Zu2c6Arj+4SDnYyty+CBJ9ovo
 PymrO5WX5BOl6smNSRs5j9nzETa2S6LO63tmAsjoGsvNFyNBv8xplX/rPJaf266163
 sAVajCj604uQNjthF0Q8RYDinHqVZmpSBdioR5273BV00wGAGXoARuI+WZMmfs9C08
 uhy1udvEQUmj4rQiTEcHJdk0pKlM8az0sVJzcuxwPmVKKmojjJaXloA+l3K+70lZem
 oRLVRL01NyxGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rFmC8qyi
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil:
 bump to version 2.9.0.20241206
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

On 11/01/2025 19:48, James Hilliard wrote:
> Add license file which was previously missing.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
