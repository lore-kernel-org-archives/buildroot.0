Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC12E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8024B81786;
	Sun, 21 Dec 2025 22:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47wbN8s7Q_bF; Sun, 21 Dec 2025 22:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C5D81587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355284;
	bh=WPhJ/KsWepsEv1BDrZGo3hk8IzRV8MP7kb6Dt7ckRCk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zp4sHsNak1ns5Xc1y8iLf2vteywU8sLIUm4dhotEdVwQcOWZOaIk+DfIL7GqxuNXk
	 oKWI0XHrwfVE20itekS54wC1Ng8ofqcaWbepSprAAZNhiboW/5TD1lQf2Llvs+PYCE
	 p1LShe1mo3kcjYe2qStPHbfqISmvpdHZJALDy103+808bhUv7z2laOXftntJ7Th/4T
	 Q9gXyXRmQQGFLI/tELpqyXme5yM8scOnnWgG22B+dk//RCPHO5PFsLxo73YMbhVPO5
	 mG4wseYGZLTo5kp6HCr6R3YWdg9uedX3EQzXhicfrlcZZYyJzWjftIcZyu/RwAuc0g
	 Wx+rlyQ7EUtzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C5D81587;
	Sun, 21 Dec 2025 22:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CECE195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E01960810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t55SztHb-T3 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F297607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F297607F3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F297607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:14:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 01AA9B0054E;
 Sun, 21 Dec 2025 23:14:34 +0100 (CET)
Received: from 2a0d:e487:416e:93a3:8e76:a104:4b1e:c615
 via 2a0d:e487:416e:93a3:8e76:a104:4b1e:c615 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 23:14:34 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 23:14:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>, Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga
 <offougajoris@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <08f04f8ac6ed4eb8d71dd3898690ac88@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766355280;
 bh=yrG/C5f+1eDYNMd681HCcqwEY5gNpG+ObzmAmb5ajeo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wi0VkPDHEskeijQyC7UNNwkzLMOdyLWZ1hh6cQScmMmRANf9AGP1sTpEs66jJvL5N
 4fyzQb8ZNvKWWLQoDRI3A86nyOxQ3mMSvgQet0FCd8TGnWXSfZ1zZ1XNr6jIMujWRy
 OaUQmZWS4triCb3qxiqcCGmiyq1A8s9jr77O6G0M+jz+vO+OFTcAOKe2GC1Sojtyj7
 1kkyR5J7KTPSzzMUwehVbyhzg7BBdPyMyHonPAUA6XE7PF3O87s5zKUJUdx/f5wFtR
 O7YUgS+3s82OeNPdswOL6sGt7oSm1zx1ESZNA++uqPDBTK6SpkdZNp9a1BlMbu8P1o
 LDgH22FqdkwTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wi0VkPDH
Subject: Re: [Buildroot] [PATCH 01/18] package/python-colorlog: bump version
 to 6.10.1
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

On 20/12/2025 22:41, Bernd Kuhls wrote:
> https://github.com/borntyping/python-colorlog/releases/tag/v6.10.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master (except python-iwlib bump). Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
