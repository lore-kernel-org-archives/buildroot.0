Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EA7C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09C9608FD;
	Tue, 14 Jul 2026 10:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toEZRFeRAfiP; Tue, 14 Jul 2026 10:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7CB60657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784023235;
	bh=sXN4YDPe2BqTR9J3QEIoOvjrgbZNFwMDemtMdMT0qa8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Soh+dzfQZKI5ErqnKT+CJOM3awaT65Kj/1QHYepbCNZ5YPbcxrYkU16VoGOLGv3VQ
	 TeZ7qErmDjAUbexXATXOM/agMJkf6eNyuwQ9+ipKw645OS4vi0QBq4xDgCDr7edzMq
	 JUpVHHImvczanAkZjvCvbcffY6YjWb2i9IG2PkgpgRnolt5ce0IoiwL4Npf6AapAfW
	 7Z0zp3WCkPSwk5t80jL/PVufyswpQLyCNRV/ToaRqSKP5Erz+3pH9gB4XsvaDfv+b2
	 L0j1mscUQJ7FIwZK5hjURifKAGQeb7NirhcMjXM41fSbpBG7yPP3iQ00fzKCNwrbSH
	 1U7SB0hKYTkng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7CB60657;
	Tue, 14 Jul 2026 10:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B8D96C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11EBB80C06
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABBsD_fx7igG for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C05BC808BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05BC808BD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05BC808BD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BB4226012F;
 Tue, 14 Jul 2026 12:00:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 12:00:29 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 12:00:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260622225652.211757-1-james.hilliard1@gmail.com>
References: <20260622225652.211757-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <560a5fcc24d75499a5d750d2cf48c82b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784023230;
 bh=Y2f8PZoH6KU80uQiXBZdMVtFker0yG+XIWrwU0yV4j8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xlx6WlcZKMVRsIntxYXrL1hrRnk18a1HnnQqEGXZs6sloyRvcXEkPKQIMt0Q/MtAm
 yrCuqNQ+l1j31Bpe+NeLwqD7zwBIK2TsFWYtvd6TKkB2lFRQhdvKRhpJFgPN++Xqg9
 OikO9cwjOJJf6HFsgjhpmRDcr0HKGcD4lS/GZ7fRjViOPZYiI+5zCf37c/Z9tfV5jz
 kVNOTtFmOZqAnA7xOPGrMo93tgAPtKpNfi1b64w1eBkULuAl4aetp+mQg8p8EC3IpA
 Z1rI6DuzvA6nvDlnSCx+uD4AJo4OZZXcik9fdICgyTG29DsIsZWGjQ3QPY9dlz92Kc
 jo34u17030zAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xlx6WlcZ
Subject: Re: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.6.1
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

On 23/06/2026 00:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
