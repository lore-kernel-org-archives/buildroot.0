Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2BC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1CE081197;
	Sun, 10 Aug 2025 14:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpAm2iG0P5me; Sun, 10 Aug 2025 14:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E20B88220A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20B88220A;
	Sun, 10 Aug 2025 14:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 630E9138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5509140194
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8coVCovgcZoa for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A866400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A866400B8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A866400B8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:08:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5837919F5C3;
 Sun, 10 Aug 2025 16:08:54 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Aug 2025 16:08:54 +0200
MIME-Version: 1.0
Date: Sun, 10 Aug 2025 16:08:54 +0200
To: Thomas Huth <huth@tuxfamily.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250810095425.9828-1-huth@tuxfamily.org>
References: <20250810095425.9828-1-huth@tuxfamily.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <a7474e6bf1b667ed3fc921c7cf68439e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754834935;
 bh=6ttQsfN1L7w8dznK6cunEjUIN/YK18GU5j2iHjR8bgY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HMmiFNtcryKiii95UcbSnDJ+iixfmHp2sOvyRNZ4XZmN8jbxyXRHbMswHEIsBCdgC
 m++OhMsGvN4yZjFBDZx4V2kdo4A4WAtlg7stRL9R8zBmzCWKCng5XjIyt99O2vmo0M
 eaOYCzey3pR6o/+a+/OhR33eM7ceKPZVkqEbuaWTeYuEvwHiSFpUGhBfaAZZEahN7t
 maFHhUM033FfzJniYsbSLjN9oAwnQfhykAvjbl6G9v8huUDnnr8qqz/dtt4OqmSZiw
 woUu3AbZeQlUS8fnjz7Kd9Pf1gYWzGCNv//RK0FJXSs8y2DYKmdJzqoXzvfhAI/aQz
 bLwm/76mm0jkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HMmiFNtc
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: Update email address of Thomas
 Huth
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

On 10/08/2025 11:54, Thomas Huth wrote:
> Since tuxfamily.org is slowly fading away, update my mail address
> to something that is more future-proof.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
