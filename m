Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB981C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 792E340983;
	Tue, 14 Jul 2026 11:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SGfXQkwqa_f; Tue, 14 Jul 2026 11:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCABC40412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784029838;
	bh=EiottV8D+LjItMZVsZ146pxB90Zvii92qdoFZeibYf8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DgKu6yXcV2xAkbiUbTVwpKSNo5xU37G2uzAiBsonUlJNiCnL2mPv6zEA99CJnEKus
	 /C5BULwxTu0QgUpP/A0h9socG03dr4wt/svBVuo/NkYS2fPx4gHXHFjsXD/mrB2Qqf
	 16PNU7fzOd1qRgJIHb37BOJS1KzoUVCIu7lmYJr+WI0/cI7t1vSr4DGtgCmwZWCjcC
	 WhRYHnlpDnMUyi/t6M5yXd5o3FgTQeaTyG2wzh9RpjZ+rLUscL+rAlz893TrxrLeie
	 9E2uo58xiYtHzoDJxAHNi0sEfG+5nrLjvU8uT1V7G58gq3D0O8bQAAL7q1suZdYQY2
	 mLcw/spvEXflQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCABC40412;
	Tue, 14 Jul 2026 11:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7BEF9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD791608D5
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ1lO-wscow4 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0DEDD605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEDD605A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DEDD605A7
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B48F713F8A2;
 Tue, 14 Jul 2026 13:50:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 13:50:32 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 13:50:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260531174816.1681614-1-bernd@kuhls.net>
References: <20260531174816.1681614-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <1861fb25c13b6d7a8b5481d13c47606e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784029834;
 bh=0PTYTYpENXAKqnGempuAqvAKQEdCVrZ1WRF/EpFJCp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nOtIGqBoWsFaxmWQrDaQ758fmxy+7eZczYfrb2gffKgQf3QReZc23O5K37bFnhthr
 unw7oHgV8mDSybYkoR2yoHmct+HRmx/1IwcM5VBN/JZGTonyAc7uxNtnHakQkKB7SW
 P3ZyLxv3io/b10MB95YdBdlrxmWCcD+zOyr8+fm1csiLTZU02xcNLFJvWvBgPLHNVM
 uwn/NB86BdZ5QCyRAJbc6iWr6cbb8uQU7baXO/O/kKIrG6Zzgd9bT0ALsnnKI3ZXC0
 d78gjkIWVzagHkEFSJNZ36w1XS+h6QMNKqifLpcjSFGdh0wsdPYZ1wPjsr8ZASDupo
 qoP9FdTpwoS0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nOtIGqBo
Subject: Re: [Buildroot] [PATCH/next v2 1/2] package/minizip-zlib: bump
 version to 1.3.2
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

On 31/05/2026 19:48, Bernd Kuhls wrote:
> https://github.com/madler/zlib/releases/tag/v1.3.2
> https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
> 
> Added upstream patch which adds ints.h as installed header to prevent
> build errors which would be caused by this bump.
> 
> Updated license hash due to copyright year bumps:
> https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
> https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
