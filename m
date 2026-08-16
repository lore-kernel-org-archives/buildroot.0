Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174C3C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 08:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E2E40764;
	Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWlcAYVggCKx; Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E764077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786867685;
	bh=kEJyB8VV9VC1lTI3pS+ulGIS7Z6APxiLUoQ7zs3ROSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sAD/Xbr62BZRuLSC0pLNAtcME/MMKH3YXgVvRD1ETbCzTABoEF8yb+HPjRkdZsG0D
	 9qGn68W5FDPjCay5R7Q2jfxZm4t2i2mzRXN5eXeDCRVj07wO7YzlhIgdntqZDHd/XQ
	 C6tryTi69u5+vEF+Zbf3GfN1BRuuC5gjkuGER08Ecvb+qYeUvnk/8cJ2fkCzMPHKL1
	 1ngG3KUpd6LNfmiyHEcK9wd6Sgqpnsw3E6kpDsqNLijYkbvhsJA57PGs65jQ9qisHe
	 u7cJnpUggMnZnV7OyEm0cWJq23oeoJsT2C9Rg5XkGBitYc5z7JkWU7ggeFXdp77EXX
	 5O66cO4X3gn/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E764077B;
	Sun, 16 Aug 2026 08:08:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4872333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE894077B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5xzZh7FBtKJ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 08:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C450640764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C450640764
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C450640764
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:08:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 90204780368;
 Sun, 16 Aug 2026 10:07:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 10:07:58 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 10:07:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260816075242.1844454-1-bernd@kuhls.net>
References: <20260816075242.1844454-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <14a728ac0c09b93ec422b9840e76df34@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.3
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

On 16/08/2026 09:52, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
> https://blog.hartwork.org/posts/expat-2-8-3-released/
> 
> Fixes CVE-2026-72522.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
