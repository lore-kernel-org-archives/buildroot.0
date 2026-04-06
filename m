Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972DF46C54
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E089B80EFC;
	Mon,  6 Apr 2026 15:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFdF7Sg1DA-x; Mon,  6 Apr 2026 15:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A6480EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775491058;
	bh=+wc5Hm/ZkSTmaSppO1ADlsNZgWctjikSBunjEkmS8no=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gnSFTP2LiOdJJnxRvBp+6Yfjh6mPlCVutt1oFG+s9YlinnDWBtT+p3pgzvfvds+2Z
	 jR4WHZdu9akJGWEv4CShoKU30PqOoBU9E85HIoYcKXgsQlruAAGDZjybt13+snBi3D
	 31ZV+aaEQrmYuXamw/XLxCXmT+4G+yQKJdec1EF/VDYwEBzt+4T8HNGC7HpxE/lWvW
	 o9pxGm+QBWZBQ6VsNJDpvX76SdxFM2Zj+nHsukHel+Itu7xRGcTnH8U+xcVkBImMrj
	 o4yRDnoEi4w7D4p5lfL9/T78l+uUnBt7wCRKLfFBuzx3PVClepOzdDyy5KzFOxAejN
	 mTkrWX+EdXLaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A6480EE8;
	Mon,  6 Apr 2026 15:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2791EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDA860A3F
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDfTEWLb1zMp for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 472D560906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 472D560906
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 472D560906
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:57:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 08B0120039E;
 Mon,  6 Apr 2026 17:57:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 17:57:30 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 17:57:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260405115353.2468900-1-bernd@kuhls.net>
References: <20260405115353.2468900-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fffdb7017fa11473074bb036152e2d5e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775491054;
 bh=inb4jICKwAZqocZNtKM06kvSxQP4lPgmjDvk8hsMTKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tMGG5eiNI1pkQC2NAfkuKJbUZSarbJkEIoh89kgT/UPcXFfIjNwHxwoA2fOFfuIkK
 uggZAiIYnNIu7P+hsccreGck6BQLqvrXdkfiUft7xaaKsxdBobqce+qnYYA4vUv0iE
 8uJZrJ1qa300IsebYTMOUqFmIFFstTrmT1Wjn2FXVfvI479NU4jX/KyYZqhUg1e8ho
 qecqdf/0S7z/wNKfFg8ovPV5xu7AMGj0uNGXa4nxXvovvko/wkz18ZsYH9hh9xfgeY
 9/zFEj3U7SyIqeaQoTS/RU7Uo3AloUBIjg8F1UAqfcqgxrS53hZUSnt7xFxtxOXzOd
 DUUudCaQgmAdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tMGG5eiN
Subject: Re: [Buildroot] [PATCH 1/3] package/serd: bump version to 0.32.8
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

On 05/04/2026 13:53, Bernd Kuhls wrote:
> https://gitlab.com/drobilla/serd/-/blob/v0.32.8/NEWS
> 
> Updated license hash due to upstream commit:
> https://gitlab.com/drobilla/serd/-/commit/e864af0d8d6002ad07adc4695894c01e0fe24c2c
> https://gitlab.com/drobilla/serd/-/commit/43cefdcd3e7aac63d9009d927ed21a7536dc85a0
> https://gitlab.com/drobilla/serd/-/commit/943edeac0cb8e85f42e5d475477546924edbb4a7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
