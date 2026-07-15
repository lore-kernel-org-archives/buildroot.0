Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC4C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA706072B;
	Wed, 15 Jul 2026 19:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKG8DLLz87Iu; Wed, 15 Jul 2026 19:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D90C60621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784142356;
	bh=YBGe1rKYd0sYUrqv5Mvfnok4WC8niWFAeiKsHN8KkT8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L/p4crOp9R4C637ajYWV6AbdUxMv0XcUbMYnY9ngbwx9sTw7CP5peS6nCrz5BdGtD
	 WF56BLhfewWXx9HNm7hfFepPh8J1REkM5QD4KR722R2anaPP+xUBvbZIQuI8Izh/2L
	 9NNA7Eg3fzSnO7TZG/vdINkyzRGTwypnbds2Qlcj+88b9kMo9jATyg9oQ2QZ99qS+o
	 QeT0mQQXuZYUaHxfMsW/1CRTkyTFUD6YJaACuIDnzHRT8EevFRSfRLsO334b28f0ID
	 FIhW9L/zHoxcG14tk9vp5KFMFm4gyA+yjU65X0Vadzwa5XIRFE70Fruuyek5Bna/sj
	 6CxWjVwf60BUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D90C60621;
	Wed, 15 Jul 2026 19:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E6F320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8C740703
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duh-nkfH4ZVp for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:05:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4E3A4066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E3A4066A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4E3A4066A
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5B06C780375;
 Wed, 15 Jul 2026 21:05:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jul 2026 21:05:50 +0200
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 21:05:50 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <3c34b47f04166271550dfe7ec813323c7f69a2bc.1784098966.git.yann.morin@orange.com>
References: <3c34b47f04166271550dfe7ec813323c7f69a2bc.1784098966.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <6882cf7bafa6d28d0553d6bf86931986@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784142351;
 bh=VE98CiAxFsFf2U8M4QU2fi4VEedoT+i0ri8VPIlhco4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g815GOEX0gPDlbswyaIuIjbZRpHOt8n3AbxygDgn8opOcRxK4R9uywVh2volDmr87
 jBQW7CFxDoCSF/Pib6wZDPAPhyWC81w8yUK4XLhPkQDyulRmsBbZjCa5H+AgqwyAAE
 UzkxQHc47Y1EXQQKwM37t8iMGi8OJHQBhldicPPnIge9aoGYoTLnEn97VRtm42gUkD
 S7tMiEKwDtc8tnfGkXqzBs0XZ2tr/LtJw6Qw7KtPmdRLYovyiEdX0crV/BSknnL3Lj
 SCp6a5juK4LaPrtUGteOSQC7uDraN60Nl9o+PxZCvAB+J+NFqfOA5x96bg3wl0iQFf
 UkjFuZmrkDg/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g815GOEX
Subject: Re: [Buildroot] [PATCH] package/.skopeo: bump version to 1.23.0
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

On 15/07/2026 09:02, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The go-mod has changed with upstream commit 870378ba1685 (Move skopeo 
> to
> go.podman.io), so adapt appropriately.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
