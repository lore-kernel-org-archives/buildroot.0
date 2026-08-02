Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6759BC55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 16:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F25060693;
	Sun,  2 Aug 2026 16:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRLrKAS-t3Yr; Sun,  2 Aug 2026 16:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F2936061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785689201;
	bh=oF3DJNwBo8Dvu95QJmEASNAxh6RwEUcpsjW4lI/dP1k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PXCJBP/aMueyo//qkKGpB/zrh2BunDoO5ZLWbxcAEwvTCYYCZBZqcVCTK+QvE++TX
	 rjW+OQPR1c8K3iRt4tKeCuRBEBHArTbKinJgvWxhBmyzYy1OeB4qC5hYwYG8DyDl/N
	 qGmgllZNX6PjElt+ZQvVr6fI6JhbhLATWv0/S+aCVLusTJWCmJZ8gODU/eZA3BOfFJ
	 qt2hQfR5EdhMY3WTVAL9ybWepkZiku7Wi5y7bIgaVQpr88utsCNAKhIN1lavWthi4r
	 BXCFY7zJxc+2XYreyWgz60vXSR6anHCDICsGL3dRlCQqXOLxQa8DbxuBNoTcBZiJ/+
	 ZJb9TqRDx3Ynw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2936061A;
	Sun,  2 Aug 2026 16:46:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5C882CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B80F80BFB
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3F9ygzQtzMFB for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 16:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC22480B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC22480B3C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC22480B3C
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 16:46:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5D44D13F8B9;
 Sun,  2 Aug 2026 18:46:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 18:46:35 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 18:46:35 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260610064643.70497-1-francois.perrad@gadz.org>
References: <20260610064643.70497-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <4604583f330849cbdb2ef1da50a985a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785689196;
 bh=wzAWZDXCZozGeHp4HdTKLNHnrGYTKTdDRFMLZ5KfE/8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NC9OW35b1s63u53A1zNn7vlWJjO3nqiHGf0WdVdvyfmK1ZSeQgVzeLlXmycpiuLl/
 oppqCjeDN4CUF8SUopAhX/vE8LJ+dCVDkZYYsJ2F2JRgcW7V9ZjQ1GpujFN3rqaG8Q
 8EIzAi4ek5pynTLm0INyIfXTK0T0AKjqkwoiPrK90K1coFdcNN3Klsf1L/Th8IXOHC
 9gQXrtvUuYrWcksDmPOFRQ/FuU76VUVKLnVQY4F6y1fZqDVdgKFhcfQRVpbZH79vXD
 gQS66ZbZu4yPBg7pjwOyhsu+h28F12crPiOSnSDCV2UMcn1FIPpC4yLwDh7vpl9JpG
 QkBv0mVVSmgEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NC9OW35b
Subject: Re: [Buildroot] [PATCH 1/2] package/lua-argparse: bump to version
 0.7.2
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

On 10/06/2026 08:46, Francois Perrad via buildroot wrote:
> for changelog, see:
> https://github.com/luarocks/argparse/blob/0.7.2/CHANGELOG.md
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
