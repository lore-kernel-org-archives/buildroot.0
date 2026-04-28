Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F829FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D7D6109E;
	Tue, 28 Apr 2026 18:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMl1naZYaBhz; Tue, 28 Apr 2026 18:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B3461076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401774;
	bh=La8DsP7YZP4TqYbvt4WBzo/EhBaVuaX3z8JmX33ARfM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Flo8KWEJN0LF+7iL77s2I7Xjhc2p4x1QaDXlrmb+2xG82So0GPzYUAm/l0E535lQu
	 qo8SzbHIFscWwrP5OhMFHQ2xq81Y/3RtEaAR5BYnrNVs/rF7XTrcWfYKLmlqJGwYPn
	 q858WSdTDKppWy4VErf8ZSwc2aQe3/RZi/fDngSX2T2LhusIShLiv/zfMVwJhrX+ME
	 HQYgeqBCxtcy8abUBdePZ/Wn9g85hzx0YgemFKFRUL2nLz0fhC4z+yB+fBrxO0PyzV
	 gvnTglmBVt91ZHD+1F7ia/fOExgXXnK1HRC19bk/kP5JmPoa0+CuuNmGTOoYkvI+QK
	 ENJGfxexSP/qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B3461076;
	Tue, 28 Apr 2026 18:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E267E1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB9661076
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vlct3zJY-v6 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F34B60F26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F34B60F26
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F34B60F26
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A37F0B0056A;
 Tue, 28 Apr 2026 20:42:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:42:47 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:42:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alex Suykov <alex.suykov@gmail.com>
In-Reply-To: <20260426132319.1325484-1-bernd@kuhls.net>
References: <20260426132319.1325484-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <4b27c63ab2d60e131a64029051dda7ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401769;
 bh=7HGFNCtNLgHva297xQxkH7/U7QCj6JQRATjemmrkdtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ftaE+oj8HO/awUPleRF1CDgMtV1l4Ltoc/Kpzkza7BrUxDaQM81zci827mz7eARic
 QSOsfnwfLL+OPBtUYchFpus7OOJgo8cwAS17QGOt7YB5a/lcWIjmbtsjjAj2naatLk
 Tcabdxz79YzksOmpjYVFoUdF1lW7VrD04b+GV+s+2HnggFsnjtNquc+7PtklF9hx1B
 UUH5P4gXpDv5NYfxnrFWxRA82YQV+2s3sDymzih3H7g4j0SX3vkVEy7Y7dJ1qbzfN5
 opy1o/iSSIUifuzNytH3vv1lJwbvJh5Ni4X8PXJr2UCf//UGL/JDZNJWBSWW1wsCg7
 jRV3F1jQpeLew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ftaE+oj8
Subject: Re: [Buildroot] [PATCH 1/1] package/vboot-utils: bump version to
 7dfa482d6a843e1e25b615d6b0200028cedce29f
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

On 26/04/2026 15:23, Bernd Kuhls wrote:
> Removed patch 0001 due to upstream removal of the patched file:
> https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/1accb279b195241cdd6ea47f95747bb8664442a2%5E%21/
> 
> Renumbered remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
