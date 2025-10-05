Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880EDCAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E34D60ECF;
	Sun,  5 Oct 2025 17:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vHHf0NMnrzD; Sun,  5 Oct 2025 17:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0A460ECC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0A460ECC;
	Sun,  5 Oct 2025 17:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6541B909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BBCA40B16
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8NIlsvMd7mp for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFA8440B0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA8440B0D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFA8440B0D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:21:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4304E13F89A;
 Sun,  5 Oct 2025 19:21:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 19:21:00 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 19:21:00 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251001160820.8829-1-ju.o@free.fr>
References: <20251001160820.8829-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <f8e334686d183276af334cf570156341@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759684861;
 bh=lesV+aGNLSdSCTYkMuOacfwyUBERtdeQBmIJ/IvbmUI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Noc1e6Xl+IIotFxeGuvjgSr5RE5kGVBcDQW5bIdO1QHdj19K3Kn/bfNEtfpdK7we8
 jL+gwRob/AlOZIdbL7FbH6Rgnz/876r8EUqm/zUrXuNjdmFiLiDWg5HL4C+QILSZ4D
 IGy9ObOirKhHsDcz+UVtlhPIgIqvVCbRW3/Pm5tl8Cf9tJ5LaWeSgRZ1vUWnPpGhsB
 FS9wyyV1/qn+/sLmEMBmy0mx8hSZJ4WmZvBCNoyiPTuV0sBR5ZZ3aRn0ZEUfXZdDl/
 voJcp4LnQKTpl9nYadBfz1DXzs7lIpVteusPs1eVreOd1B0jXj4Dh29iNhxWA73Vjd
 WDMVED4B//W7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Noc1e6Xl
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.09.00
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

On 01/10/2025 18:08, Julien Olivain via buildroot wrote:
> See release announce:
> https://lists.ubuntu.com/archives/fwts-devel/2025-September/014087.html
> 
> The archive of this new version now includes a "fwts-25.09.00/" top
> directory. Therefore, this commit removes "FWTS_STRIP_COMPONENTS = 0".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
