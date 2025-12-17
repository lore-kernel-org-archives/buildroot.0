Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79005D65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F510611F8;
	Wed, 17 Dec 2025 21:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9Tv_CjAF4c8; Wed, 17 Dec 2025 21:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03AA861174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007931;
	bh=E7EXkRJXvENcgmu/uvF8nC5XLFwrRXJX9DBrpBPLheE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TUxymY7pG0m388Pqq1uKYL1ZLDbdVUGztumw1Dim1u6pFsIMskYfJWp0/y4tkK1Qk
	 aueU2sR41F8C/zsWp4wRWMqUsji/8Ll3SEQsxO+TYRZqqn4MgLcEgL21ABygVetpL/
	 2Ze6I400oWohIP+32pG6hovkF/04/NlGf0QnrxCu3qxrPdA3QVcghu2xtQfdqGHDeQ
	 8LH7cXi0ed5tXVnHQapMvyKeC1lHXHmZPpfnE/WDlQxIIboCQyQ5TjsRUhvefVWy04
	 X6O99y95biPh/ACEN9PITciMzJmPIGFUqbwpwydirQPvUplgfUJFImGhpt/VGhf/CL
	 SOrBgj0ymsH+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03AA861174;
	Wed, 17 Dec 2025 21:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA3C5375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2A140617
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaqBftSfvUVM for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEE974050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEE974050C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEE974050C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7AE032003D0;
 Wed, 17 Dec 2025 22:45:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 22:45:21 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 22:45:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>, Christophe Vu-Brugier <cvubrugier@fastmail.fm>, James
 Hilliard <james.hilliard1@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <5e24710624cfcdae669e5a0aefdb4826@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766007927;
 bh=ZpojA7l0kayENN4bhrQoWSPZ5Pi+mOXNpZ56mkCjWuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iNwxXY6KjxpNzpjH4CWN6FBzp/mOKPtyaBKhGejdW32hi0umK2djeqlLlQO+oczd4
 q7dZCIAa4TOYydoe2Q3Ne/nmIVmFhlvUmuUFw1sFywqm5PTnify0nCmPRBavBXd43v
 MWPMsENc9dKfigC909kPz1A+n9ZPOWb7dRGIc6HkeahmPJd6C33o/i7EIGdWhC7W5x
 1oLJXmFf1gZnzALzDyn9dxQKrJzHKl/+TXHTDMAO8kVJGkAwqDWPPhbmerZzc2e641
 NQVycw5XNuCGxq5AcZoQ/yqgmzb1Pbr3n8fXYszA6tzivBdVZKhxinS9jR3FUOq+4N
 cJmrgo3ap2q2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iNwxXY6K
Subject: Re: [Buildroot] [PATCH 01/26] package/python-setuptools-rust: bump
 version to 1.12.0
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

On 16/12/2025 20:40, Bernd Kuhls wrote:
> https://github.com/PyO3/setuptools-rust/blob/v1.12.0/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
