Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B9CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB6541588;
	Sun,  3 May 2026 17:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3TsZB1R6tls; Sun,  3 May 2026 17:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C34A24153F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777830704;
	bh=B8JV0rbIJYQ64uXrf+9+NP0vMu5c5QIRii8T9KWQrWY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gLiZLujYZ/rAg5dC6PZPljWjLautV0Yo2vs9YON0mC7LAY7UiQAWo1a0vEP68jVaO
	 +JDfDs6MYKpmDYLKsg/0cWQolmdw0aX3q4bNvK2pwezX8IjdJ+D8T4PFAGHwxQTyVy
	 347xvjIxmeiu/VHp1W37gsI1YyuNjMZ0hEMuHNkta8FITIDcSct9/XxmOyDhjRUWWB
	 xUWltwFgCly9FWWfV5DdZFbrNeqEijsomwjjGeLGp6a4yVw7vEK+jumbEjmhUX1nst
	 w0TdWzXPSEAjS8i5n1/MkSWJlikahCFSkbgHcHoJsF9jrWWir0Y+tEpBjSYgvCU012
	 W8bikScb0adYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34A24153F;
	Sun,  3 May 2026 17:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 561E225D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4759E40747
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oUz-m4hLzlQ for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 427AC402DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427AC402DC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 427AC402DC
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:51:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 28F4A2003AE;
 Sun,  3 May 2026 19:51:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 19:51:39 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 19:51:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260502170253.2852221-1-bernd@kuhls.net>
References: <20260502170253.2852221-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <75fae2bde29a719a80ccaac9ddbf8c6d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777830700;
 bh=kDLwBtosgJdLQwic0n2HkaYeViI5a+rPDOogloI5Ii0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AS9m+ZUftnNgWBOy/dhrHwLy4UVDam6FQamOu2c7api/Bz2NDP3drvElkKI5v7lPp
 BR5dQAfBAnGrx367gC2hUW+a8k1GW5GKUxc0FeSnoySKJ4TkVF5HRacnUZtsBBxKEI
 1nD8a1pejVDgnVIrghE3d4gOdphgP+HHCU7sO0klfR9b9aRh/Iwlo5PbnHEvuB0v6d
 CA3vS9i1+fAyAiY/0bF/qC74vLetAt3gL2qU6jKoGon35jnxmJsPtwtnECourNEYt7
 QLX5JF7F4FU51d3f+NKWxPgBWn6D0AYiCtDscOgGHU9OS5AN2dJcB9NyBL6Oj2iOeW
 +StLPGSudnWZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AS9m+ZUf
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: enable parallel build
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

On 02/05/2026 19:02, Bernd Kuhls wrote:
> Buildroot commit 7643670052a7adc1c2a5f275664774c6d50e6a3d disabled
> parallel builds in 2012.
> 
> Upstream fixed the problem in 2021:
> https://github.com/net-snmp/net-snmp/commit/855e1c28dad53d6263c6c0c302438d2dc3128cc5
> https://github.com/net-snmp/net-snmp/commit/9ea3d8b93c9bb7da7fea13ee6c92356a6b82a5fb
> with version 5.9.1 which was added to buildroot with commit
> 83b4337354014a5425a0ee081b94d4d0991f8d47.
> 
> Tested with -j100.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
