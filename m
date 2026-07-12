Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA0DC44506
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CBB81206;
	Sun, 12 Jul 2026 15:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fau8_Ir_6eor; Sun, 12 Jul 2026 15:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B5B811F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783871922;
	bh=L4NmHijG4ESftar759/gyfTv+N/LTKCLezYd3TCrvII=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IBMbhqh7wneo1cJ1cXDNfTOYigh4kelxnYlC8FZXISlcyWBf5GXy1UEzO5T3HCvQX
	 vHFIL8bnrpY1rz/4/aYvKDv4Praf7dYsYY/phwDy30+7bwdH9gDkprxXjY2j1StwDk
	 mzZRnECRwcG6Z/T70AHMaJmNCx3L+AZMT3Nn9ItommLzHv3DwnHj6W4eMpLLqpsKIj
	 UTGF+GXKupRwpYEvOOLX8YrY5CBuH0hfJzwdDLZ61DVMwfIpAGWVBnMDTVaQgloYDJ
	 Ua62iW1EDGZDx/6m23s4y4v2BQAw3ITf8uqsm1C6vLFbEBzR5+JO+9pBgfZbcZCG9k
	 emRUTG9dC+SPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B5B811F4;
	Sun, 12 Jul 2026 15:58:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E6C2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8614019E
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zraF1diTfyPG for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A697E40180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A697E40180
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A697E40180
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:58:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EBC1F780395;
 Sun, 12 Jul 2026 17:58:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 17:58:36 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 17:58:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260712101705.1533933-1-bernd@kuhls.net>
References: <20260712101705.1533933-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <f56585a877d06d1233204d0b6e7017e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783871918;
 bh=fZoSffYqjbcQ5sRIkQJHbQvR5FoPQpn71OV5uiOwEqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NFrDECjW6x/bi5nl22j4a96mJHvub06olqlgLkY7mbb2sJI9nnw8pk0n/PjfBQ33+
 fwPYEETYcMCyOpPWoG/7I2jCnAB6HqvzaERwr94SnzSkHK0vEDn6w9my7BfqZBqYp7
 lSaUxR9P8iwkoUkTzWE5w0yGOjxip7cJS01P5ZwEx2Zt97GRdVef5dH2cafewWs3n5
 VGa24naH67V/OtqiKbGofVpQDh0wg9tTlIRCU3W6kIL2/qCJ/gkhi7F2o0Eks8F882
 JPVLOp7w4arsKpmT1plFL0vl1UQyRxrFcvCGiwXjFmCvQntpa3KnRm3JiIVnwiZwdE
 dTTOEwAAjtvKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NFrDECjW
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.1
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

On 12/07/2026 12:17, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
