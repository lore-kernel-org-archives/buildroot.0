Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6207CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 15:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA4C40BF2;
	Sun, 24 Aug 2025 15:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpIb3C7MIQ8s; Sun, 24 Aug 2025 15:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED6C241A8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6C241A8A;
	Sun, 24 Aug 2025 15:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8660819C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7854B405FA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQSOfzWUc7Wh for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 15:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA5CF405EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5CF405EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA5CF405EB
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:24:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A99C313F854;
 Sun, 24 Aug 2025 17:23:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 17:23:58 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 17:23:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250824075739.386831-1-giulio.benetti@benettiengineering.com>
References: <20250824075739.386831-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bde908c39427c2cc02bad1fdc01f73e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756049039;
 bh=gszYlFY43Q1AIUeOmYRJsYMkAdMvOpazxsI1OF3M+NM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G3D8HMNeHeetQP2csxYCXgA4WwKbFq9RSiFQMteV1v9Vwa6+godbnMFV9eg4jT4xX
 KXo6sufbTlGIsB5+CgVnw/5RW1MoZgsqe5lYoFpM/1wVu61g8TMgKR+GAR4x6qEds+
 hpJFD+N4ryH4Dk9Ap4SvqJqPMB6wqwwdeBn6eBZi8ION2k4BGu8fShgCk66cnd6d1W
 NCupShJ+efoHOBMtLa4uoI+iOZx7Ci45lWRQEcUd9Q6xiT97ftkX8rpJ5hUSe7UDCa
 ttaQqH8F+JFk4DNjB9bha9DF34fce54JsVRhKtH3RVBnbl5JNAl3HHgd9Q+XGSTnux
 Roj/Z/wizudKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G3D8HMNe
Subject: Re: [Buildroot] [for-next] package/harfbuzz: bump to version 11.4.3
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

On 24/08/2025 09:57, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.4.3
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
