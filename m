Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4505BC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DA140963;
	Sun,  5 Jul 2026 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbrgcR0LB4xc; Sun,  5 Jul 2026 20:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 647D34095E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783283374;
	bh=PLjNqA0zoo/hhCiplqQ0fSaLrGhUFO92psa6tZ6jHJs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XCtH52aJdXbP4Nl+rwaruT08ijV0P8l7Cpfs0NGAwn6GFlks10Xaa2q6XeTPw7Z8i
	 DHURyWn1QZ7lNE2NUeINxAEz5wR/yjd437Gr0TpUlt/bY/vN+HTP+t69ls3ddHcQ+4
	 QGClVf8AxhBJ9R9iqMTYgn1zOgMQnt0LiBx/xL8ozaNtKWEXMBLmbyT63Csb2E78kY
	 uKoJHKUW73udvH76VrGlwWV2CXH0dLJhBYFndg5wXcG0xkF3rdIdncdirsRMrPX/tN
	 IQq5NGZs2mG38WLZ4W7Cnx+PTMApbXDpWwgR8/1OQAvMQ3Km6V1oB04mldW08VzpT+
	 2E2I0yIuTA9HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 647D34095E;
	Sun,  5 Jul 2026 20:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A137316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FFFF4095E
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy0vBfnmBX2K for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 20:29:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF1FB408D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1FB408D7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF1FB408D7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 20:29:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1256E780371;
 Sun,  5 Jul 2026 22:29:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 22:29:25 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 22:29:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260705172616.3104270-1-bernd@kuhls.net>
References: <20260705172616.3104270-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <60183c85bdeb9c6d0f5526e1bcfd2818@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783283368;
 bh=bhi+4XAcRFF8jEXuML6ujBZZvQ0hQIIZqaBxVBQx5Nc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFcoHHcp5D5+V97cj/XSWGRQ6fGluizv/r2WejTpgEckJM5jdpXQWBdvyfh0JsxB1
 KJPlZHZxtncWXdjNjEys8TALanSEshhq8OHvqgIjGGfywHZOpcW+gxSgGcLcgLY8Vx
 R95OzyGUBR5qB3URzaHNkuEdhOesXen6auIPcY4Bw2hHwoE5x+m9PZOMGDeVO6kCnO
 7TCtJLUDoONebpXQuSvYXgLR0Ptduu2n16hgnO8J0OeY79yXvtkOGk+Xo4mRj5qdRo
 dTrOV4chfHDUUxYJsZ9ltul7HOj6llXhVBN9w7levmG2R//TBXYwudeFNVyb+hIGIi
 iiah/ENX6xKkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JFcoHHcp
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: add upstream patches
 to fix build with fmt 12.2.0
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

On 05/07/2026 19:26, Bernd Kuhls wrote:
> Buildroot commit cc5c36afffd71e6e01a9371f1a7316fc10a8e3f9 bumped fmt to
> version 12.2.0 which breaks the gerbera build. To fix the problem we 
> add
> two upstream patches.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
