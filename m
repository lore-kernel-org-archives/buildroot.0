Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EA7C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB3F60693;
	Sun,  9 Aug 2026 15:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNUHbLzqp5y4; Sun,  9 Aug 2026 15:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3682660603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786287635;
	bh=6n/NwI1Lk11ErSQ0rsfv1fT2fsJi70YAHzlHrrWmx98=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X542YCPhZj5qu/g3rz6vVKlnQNsWa780fJ2HgWhvWZJN8WcxH0MCzYHgDVCWfoWCi
	 llZBxwXKVSdp/EonQAfelzMqs2/fdQwgXGZnXcucu/BBYOh9k7DW7gQgqB2N/gyBV+
	 EUz8+cNE4SqdkR5ZD9cCHuG7lnAXx3+4m5V5PjHysRwIN5Xzw/oHWGGOlG8SDsznvU
	 8tPy2uujpLnd6tuzkXtgJHjkh4aCO8AtgJwOOAJaCrOwtOL0E8Y1tXicNcXbGLHD79
	 3h/HnHt0374Cq/uvgSZmDPgfRwgTe8Van/hwOSSun7t/Wo6DimFOrgpM9mz0lCxjrv
	 qN3mcwgtcw0Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3682660603;
	Sun,  9 Aug 2026 15:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AABD28A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FD560603
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nI4EHjY6Glxa for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F027E605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F027E605E6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F027E605E6
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:00:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A9DF2780368;
 Sun,  9 Aug 2026 17:00:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 17:00:28 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 17:00:28 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260714115205.29838-1-mf@go-sys.de>
References: <20260714115205.29838-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <c61de76e5eb3dcc9d0d2f7dbada8ef5c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786287629;
 bh=2SJ6ibBQQ2Z6KcnAUkNXtS4pMk035YIikufkWWr+N6I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VPHOKd3K2giesDm+RkI7f9ZuT4iuvgk+mxKuTg9A0jewVhxLqJ955TUbXSQ+GIPYX
 6u1+rOeYa1guvUgI3g8TK9MkBgJxABajFrv0supI49myF2e0qmYbAjXBB8ABxFJBkD
 +fZBTFAWQX7Le+E1mLl3FGgKJkoeUIjRrivkIzi0LccKTuSL/x940qzehxAku1aviQ
 1aEppm0YhZ1AD/u3HeUo2deX03CUGab5m0oLHCAB71DX+SqgLyMDLW2LAeW86jwDIx
 PugREFlJtRnVl46uDvvcGdKU+kD4zqHZje2UyJfnjQjRFmnN7QYmtv1+7GwA5JyZEd
 XYRJ87i5j7doQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VPHOKd3K
Subject: Re: [Buildroot] [PATCH 1/4] package/sdl3: new package
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

On 14/07/2026 13:52, Michael Fischer wrote:
> Simple DirectMedia Layer 3 is a library that allows programs
> portable low level access to a video framebuffer, audio output,
> mouse, and keyboard. It is not compatible with SDL2.
> 
> https://www.libsdl.org/
> https://wiki.libsdl.org/SDL3/README-migration
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Series applied to master, thanks.

For info, I added unconditional dependencies to toolchains
with wchar and threads. For the details, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/2dd13e328f118363165b47258429604a5ffd3b41

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
