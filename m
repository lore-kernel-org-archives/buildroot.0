Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1999E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE58E8126D;
	Sat, 11 Jan 2025 14:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wggJ3W8pO8Fx; Sat, 11 Jan 2025 14:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D786E81199
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D786E81199;
	Sat, 11 Jan 2025 14:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B00940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6920660677
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mom3hLt1q7a4 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B33E560634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33E560634
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B33E560634
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:48:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 61B7B13F880;
 Sat, 11 Jan 2025 15:48:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51504])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 15:48:26 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 15:48:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250111130237.2458003-1-james.hilliard1@gmail.com>
References: <20250111130237.2458003-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ab8735cdb40b5da14804547a4d979bdd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736606908;
 bh=tobyK/WzJ31qQP8uXfS/u51W2+UK2DqyCjjUerHOwEQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dOAguq6kzD9vwDFa9lBqi5SywHgoFQTHBDXUr/ziIPnvxQlDaKsqjV7g8dzckqLuv
 aQ9c+cZI9s66qSOVLPe/qcyhmhJiudiHD6i6FRzuAgf7tVSs8OawAqb3Ah3YQsh54H
 5enTLB4NcmH3RKux/UU30bAjYs4abJybn3YB2eW3WqWS/BMHKNWaNosWhR6Kd0dRcq
 Nw6xNAcKDMfxSnj+Vs+1U38nIxP01KjFODqnPdCVpmEjwuYfNf0JjDptj0R52yn293
 MEnMA/ZsmOM9ZgW+gHZ2Sci51wkNE8KwskMxv7rDAifhBvT69QkbaK05JqPlbZX2YB
 yJyFqfvyVDgFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dOAguq6k
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-mailbox-server: bump to version 0.5.1
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 14:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
