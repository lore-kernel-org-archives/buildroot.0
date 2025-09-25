Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAB1CAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B3B40EFA;
	Thu, 25 Sep 2025 19:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exsF_CtLJYkI; Thu, 25 Sep 2025 19:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F6CC40EBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F6CC40EBD;
	Thu, 25 Sep 2025 19:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A5D3177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0B19614AD
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvUpuL2VpFvf for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2ADCD6147C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADCD6147C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ADCD6147C
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:31:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6388BB0053D;
 Thu, 25 Sep 2025 21:31:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Sep 2025 21:31:41 +0200
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 21:31:41 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250924215418.1203802-1-aperez@igalia.com>
References: <20250924215418.1203802-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5ebbc6a1b8ea30765380f925460a9aa1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758828703;
 bh=QsCayqQ+MsIgK39PnlxUmsnqzsldjNwFXjzw4Pz6JkM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mK/RW21BbMF9h0kDZ4uJH4B3Op1DfrfZ34sYsOo/Fctl87Nk0BAeO/6zdYHK2YmEQ
 T/1JxxoOiALpyHPI33kMRc4DrpAQ6s23jtoEtZXRsNTIRQgXVbgRqQqPfSQrAcEifc
 ItE1D5r+yu83FfRJwvQ16cPu1zBsDECHP1SC+9BY3aj7XFIoQcOC3uWaAlzUTH1ah7
 SwCUz3dEg3kQ6P2R8Uj8/DCiHxsBL7iKrGUono4AoMrCcPSWqKPoA5Ujy+6ZShUjcT
 2f5sBueFI7lpSX2ruB66eEeWdwe9lV9wDzJKYT7SQrWbUhI0whgFqGHDCGevoqsvrY
 9VQbcXggwcJ6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mK/RW21B
Subject: Re: [Buildroot] [PATCH] package/sysprof: bump to version 49.0
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

On 24/09/2025 23:54, Adrian Perez de Castro wrote:
> Release notes:
> https://gitlab.gnome.org/GNOME/sysprof/-/blob/49.0/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
