Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D942CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E02060A6D;
	Tue,  7 Oct 2025 19:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IMFPpxuSb8k; Tue,  7 Oct 2025 19:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B82E460877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B82E460877;
	Tue,  7 Oct 2025 19:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D96399DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAFD3810EA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52weWsxj85ON for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 135FD810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135FD810E8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 135FD810E8
 for <buildroot@busybox.net>; Tue,  7 Oct 2025 19:22:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2618419F5A5;
 Tue,  7 Oct 2025 21:22:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 21:22:04 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 21:22:04 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251007070527.335465-1-francois.perrad@gadz.org>
References: <20251007070527.335465-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2a2b4c27235e304ac0e484ce337aeaa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759864925;
 bh=kkhR00QLjcOnICME63iW8sC4t/V92V34qc/WgsBVGYc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LxU0j8UIYYoeeVKAwKjxJOa6374eXqxu/tZRo7G7ru3H/8EFNGLVRp7UGlOyWs/Nk
 6B7ZiLYI8SFwIdM3EvzpA6YBj3CH+gv4MSbP37W+zKdt+65v32hsWsamOn8NM276bq
 jdWVETklr0UOVyBSGBw/QPJ0Fcnq/kNRWLchp4s71xQt4mNa1p3hiYYB9+msNLsNga
 PS1E45fVlz5pCsU/s67HDt2OujRSbw1sWFCcGjEYn7xZSVVywQ5fdzXXClqMHHAak4
 8k12LXRMg7D6fQfQzLYZB6fsQSlVQrSmzEptaANIVDJKqfXO82U0CNUzYH7ZlNyDEU
 LU1rwUfwXBKsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LxU0j8UI
Subject: Re: [Buildroot] [PATCH 1/2] package/4th: switch to https
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

On 07/10/2025 09:05, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
