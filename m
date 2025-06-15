Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B447BC61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B57260605;
	Sun, 15 Jun 2025 10:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0kYi_bwFrb8; Sun, 15 Jun 2025 10:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11FB607C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11FB607C2;
	Sun, 15 Jun 2025 10:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 148B8198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF7C640073
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCtZogmLQm-s for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BFA84004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFA84004E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BFA84004E
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:37:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2DB8819F740;
 Sun, 15 Jun 2025 12:37:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:37:12 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:37:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250614113514.78033-1-bernd@kuhls.net>
References: <20250614113514.78033-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e55db204a2bbbc601cdad1173b3ef0f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749983834;
 bh=aYCQ5rtKE8Bqhvr5xQjMo5fxPBQTndKplMn27Q0556o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WnDtR+mNfjEWUDAi1s5a3DWPP6HDg3cxvQ8aMdjxn5w7eUK1kLglNp6RhWhG2pNN2
 LYAoYUA9PYNJY0uSKVnqF69vKHEJmfFOmtJEokM4wpb1PMGADjXIwW/6S+1NN9qqeS
 3EKFtWUD+89hPi3XclIpx1VU5TdP9BitI3qhaAwHt+vua1ZPR6PBlz/RacV2F6OEfE
 FiaiC1iP16my6zUnTrFaU5lrRGxYW0X9mYn4WyF/mSqGMMSdy8vIvc4NSPHtWneUgB
 jrA74UhYI+6piqBhX/+j9lLtJA8KO1UzvIT9I+qJDiqcXwtWVOiL1ta5zBBFBpHIl7
 g4ah04sznZh4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WnDtR+mN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-glslang: fix
 host-python3 dependency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/06/2025 13:35, Bernd Kuhls wrote:
> python-glslang is a host-only package and the host-python3 dependency
> was wrongly added as target dependency with buildroot commit
> f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
