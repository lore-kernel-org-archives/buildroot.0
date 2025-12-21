Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2FDE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 14:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A5A460A6A;
	Sun, 21 Dec 2025 14:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEJH6shRozbb; Sun, 21 Dec 2025 14:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C5B60810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766328859;
	bh=7+R6ijDEfVeQSptpSSHr7cGLHUehv/MTiIEuoavPBxY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bNQ093ROUXXmj6w5o3E3dGrKktIXmVbdJe2HjxXv3HIQI4haQlU+ye13EurS1WcwZ
	 A0rg0FAg2+pbriwsBAVONfYAwTPIFpH04abDRFD/HJ9CQi+LVrjMyOQcVQnaHTpSmo
	 Q/gpfNPAQ6XIcTnyj95sm/+DNdJXhYBnNchm1y1SxCPDs2cQ8SSljF5waJiuEnxmUC
	 l8wQseumVA2TmbbAO3JbO2TM/iIc+wUf1ueVbJxEk14lWekCRMNdeCqCoAdl7DD7rL
	 hl8Huca+xq+KvLxPNhCYEQEook5EzYJB/a8d0cPoEX8TLR2Gt2VJHKLHUi4IpPzTXI
	 4T4xH/NIjfz1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C5B60810;
	Sun, 21 Dec 2025 14:54:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B113C195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9782F400BA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdiULyFiUl5u for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 14:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C1C040092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C1C040092
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C1C040092
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:54:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 95B5B13F86A;
 Sun, 21 Dec 2025 15:54:11 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 15:54:11 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 15:54:11 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251214223650.223987-1-petr.vorel@gmail.com>
References: <20251214223650.223987-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <39a07351c4f9f8eb511b2c306b957fec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766328853;
 bh=mpPWxc8530ssWvKgNdhU369curgSDmYbMipACQ6soQ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sSd5N1NpXVMnyucrgr4sVeIaWQ1FNEFiEDIQhlRDGz19+MYEW77WCvCtiQ1/43gCe
 W5KE3QOXi6T3chROz3pZ28BIuHRv3smCBA2yPKsw1a/kMWbkhmI4l15OCLVxnjP05/
 rWdBl2/3dTNyOsm9vq1wo0pSaMPG9F5dT9EMI/dNf1qlPmymHfWoDi15WLfj6q03Lk
 jC4v5i6TsA1w0sxi3ukXDQ/IOsolx67VfLuD33C96B7VNh87cynQ7owAniFw+UyTqe
 du+d0MnzqNLRK7t/FWVrt4dnCnJAbmVcBXzqLSDw1u0NwikhHr5k3xH+xMq13LXoyq
 /7tpEB/wPDOBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sSd5N1Np
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20250930
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

On 14/12/2025 23:36, Petr Vorel wrote:
> Changelog:
> https://github.com/linux-test-project/ltp/releases/tag/20250930
> 
> Remove patches backported from this release.
> 
> Remove LTP_TESTSUITE_AUTORECONF (patch, which required it was 
> backported
> from this release).
> 
> Require kernel headers for uclibc >= 4.5 for uclibc due F_GETOWN_EX 
> from <fcntl.h>.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
