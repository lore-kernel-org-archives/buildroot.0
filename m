Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21562C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 19:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 986DD84EC8;
	Wed, 25 Jun 2025 19:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDYYmVAKDg-l; Wed, 25 Jun 2025 19:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07B884BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07B884BC9;
	Wed, 25 Jun 2025 19:52:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD7CA43F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F2441794
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 19:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqD4UCepqFDl for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 19:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E47A3407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47A3407CA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E47A3407CA
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 19:52:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 540922003D6;
 Wed, 25 Jun 2025 21:52:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 21:52:00 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 21:52:00 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <ee8e9975-90dc-4a98-915a-3ee5659716d5@grenoble.cnrs.fr>
References: <ee8e9975-90dc-4a98-915a-3ee5659716d5@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <36bd2b2f993e8e22494c9dcf04f66534@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750881124;
 bh=VZwjcx494gIKGwQYSUEDW7gQcWmN8yvNW0YKEY+lIwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UvhTWxQl2q/D4ny0TWpdCYug7J+RiUHVwLM5T5tHbsbil7Oiu5w8fQG26h3Lmo7rD
 sKa6Le47YGmTNyhdJqnYW9kmAzHv1LctY25eJ6lSF632ML04fZnvgandclEBoGY+lC
 IoCUWuUhl6S7lWyIbfEi6xp53AD1Tp57jgvuws/5zgthbOJeZ5s+2L1Acu0p7X9QsT
 lp+xBpR3t+yeLK7Pt3tRU/71BuTLSE9nHCNEEX79cwJ20olI02bUiSTA200Nv13yCU
 QmdzgkJelPabBYqhnZHrjAPWpQquUc8G7O3ccWbWjoD/e/YqGx82vh/dlVxpKnyrp1
 MmeVCEVDLAjNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UvhTWxQl
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 15 version
 selection
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

On 25/06/2025 15:39, Edgar Bonet via buildroot wrote:
> This patch allows to use an external toolchain based on gcc 15.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
