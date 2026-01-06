Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DC8CEFD18
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B89740944;
	Tue,  6 Jan 2026 22:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDLhfG_5Ohrg; Tue,  6 Jan 2026 22:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7194093C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767738171;
	bh=Ll/W8DmoY4zb6DjizZMgji4Y7VYJJaVv+GUKC94bZlk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DFQBb0gxpvsglrBKFYJoHTC1A15lJ4DCmybTDz6znEDkHkMS1MMZjdGpG1oMrIJJY
	 1ZXWhl1pfesK83lWGVEER+AnNi41TtZsaGVRI/Ccpj/4vIuaN5MbZIJxagOVaI7ZnN
	 YjzYjk760iRiq4yoaQE7PsYNa2he/JUDJtjAOzn818ykiPOGIm0hizwgujenrT+KWo
	 5zADTHs4+sywayNqt3DqT8WFTEzs2pJ9cQVGXiImC7bNa7QWWpauCtI++GV83cJxPK
	 KQ+g7nHPfJi1rXFykQjoj3RwBFFaR3AWnjhU9rRopjp8E9UAZG600b9IT7yEQaWh9X
	 iqkl2yOrE9YDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7194093C;
	Tue,  6 Jan 2026 22:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 045B870B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD01C60D4F
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqQY9qoj9qkP for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE4E660C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE4E660C22
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE4E660C22
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B51391A26AD;
 Tue,  6 Jan 2026 22:22:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BD1960739;
 Tue,  6 Jan 2026 22:22:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8391B103C807E; Tue,  6 Jan 2026 23:22:44 +0100 (CET)
Date: Tue, 6 Jan 2026 23:22:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20260106232243.0a97bcd4@windsurf>
In-Reply-To: <20260103132552.3979708-5-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
 <20260103132552.3979708-5-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767738165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4cx9nJlGizWNX9/vkdgOhPisH9w5E23x7xrlwezTI8U=;
 b=x/6hqHz/bACVNfx0t3p52nL+xaWu9t5vh6Lcv8zL9ikZhDH8e9SpElmb2BzawnwKVdvZYQ
 nS+ASXmb/ic94L8Qvnmmb14iYpc3utFeMyN7pfp0gqmpdjTMVgZrnK9nSdH1WzcvYt8YvC
 /Ses+givUsIS0kVZpHlge+Z9PI394lura6NOs0ZuGj4myX/ISxupEhYEZ6gvBIxrIv9CN2
 jTYDKeo7V+J1ehelOEomMVKdZ4JF4IfJsT331SfLDvxZ1zssuUINaOTc1iDyVXqTffaD3b
 pWfiTCTrGB7lg/FQEEMGnJgVU32sR13LIutU4eGnuUQQ17GDsR4IGfkn6DvKAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=x/6hqHz/
Subject: Re: [Buildroot] [PATCH v4 4/5] package/quota: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Jan 2026 14:25:51 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Package quota requires libtirpc rpcdb option enabled with non-glibc
> toolchains since the bump of libtirpc to version 1.3.7 with buildroot
> commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
> commit:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> These build errors, caused by the forementioned upstream commit, only
> occur with non-glibc toolchains:
> https://patchwork.yoctoproject.org/comment/30091/
> "but I believe it breaks the build with musl"
> as shown by our autobuilders:
> 
> https://autobuild.buildroot.net/?reason=quota-4.10
> 
> Fixes:
> https://autobuild.buildroot.net/results/fb0/fb0adbb7687d8db4228e2fc1ce7a7272486fd3ef/
> "svc_socket.c:(.text+0x2c): undefined reference to `getrpcbynumber'"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/quota/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
