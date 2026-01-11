Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB8D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A995E80BFD;
	Sun, 11 Jan 2026 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HscksA37Oeuu; Sun, 11 Jan 2026 21:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF4A80BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768166508;
	bh=ae9KfNSztK2SDRwAbNJ3T78qEW5Gq2HnhN0BJM6vPrs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=syjKJHH2QKX2y8mWyQW1Od8G/qLWUN1eqL4N1ff10QSEepPjyKhZSAs0gkRT1Z3JY
	 XrwGL3plWx3G/s0M5Wt3RSjGiloXgY722OZUVNj8dKsemGbgaSUPdmc6MYXdvmJ7FE
	 l2U/+856wNjPgYpcST5OZYJlZnU5N5j1BbR12GieuIox3vsM1QbtPDeNKkNVArMy9e
	 pB5ohJFUIgYi60gViAceB/LxasDKVAZ+3y0+szw8GLXonmJ4qCt47Ic+LcngNrFmFm
	 GGoHn2X+ShwnJTkwbrt+YF6P2zPxQb55+pjP+lKTOFkg5T3iKQ/koyCNJTbaK4284W
	 va4Iy+e2xLCKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF4A80BE9;
	Sun, 11 Jan 2026 21:21:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF5812E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C3D60702
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBf0hkzWUmzu for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 21:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E933A606CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E933A606CA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E933A606CA
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8078078035E;
 Sun, 11 Jan 2026 22:21:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 Jan 2026 22:21:40 +0100
MIME-Version: 1.0
Date: Sun, 11 Jan 2026 22:21:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260110180627.2205930-1-bernd@kuhls.net>
References: <20260110180627.2205930-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <71ad3b1c430e37a0471b7e93d31b40dc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768166502;
 bh=Q48PQkC+ZIVdWN+7Y7LjLNW3/XwZExBk6PhLjuzYRIY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=geAjAMNgsESnF6jdjkoYb1u/5FxNr5CYKkb7Oq12YNEIVdwXIpBNOGZVD1LuDrexn
 vLnYFF6vsr/bmbtI0cgE8pm56J+wOSjEknDopULC4gzpUzrfZxpVKFp3KjSFRVsPom
 8OBRpJGa/SyILGHqnl+84ttKxbxL/cIFhbkrROeaRlPTZ3qiwRNmpjfI62zn4ryd54
 9BgBu1zsmSfZOEJ5dD5SLpZFYpxyniLTP/7k5JVFYcL6WjcXG2Do0m4WBg2fmvoe8l
 wnGwyYnnfZ3cfFLgBM2mZ38X5I7Z0/gmtUt2Lc8zII6bODf+z/3yKZq7lQU975k6dO
 8K8XthZkvGmSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=geAjAMNg
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.18
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

On 10/01/2026 19:06, Bernd Kuhls wrote:
> https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
> 
> Added sha256 tarball hash from github.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
