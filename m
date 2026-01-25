Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76FE63CA4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 18:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA92C40831;
	Sun, 25 Jan 2026 18:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAFW2qEMPsUz; Sun, 25 Jan 2026 18:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C0240832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769364260;
	bh=RLScNO4+Jyy7o0HcHpyJ2UL1zOvPbY8x8pxx0HUZeQk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RWLfqwP+vHhWE9nerwoO+5/6hf+WtqolZGxTFdZsYjG3h3vbtbJAXX5Yr0p4GJ+Pp
	 lTocNLfTMZTk+DQzmC8oDkRSu+7zuuluJW7rfLllmqOtv4OjohWTWm2TXEwTjUq/TR
	 zqTAmDsm9lsGmp0lqqKGhOqFe4bl+QquTUoZ5quVd/vxWllLbp5guBT2PAg2CLL4Jj
	 mdnDzfzbHaxJP5VSb/ho4y0Tr+NF0Ik6i/ass6sRPARXXto1P/zt2VXmB/WFFhYpGo
	 Lkxe4k3nkQlmzdue+lhEGoQ3KOoFNeLNH/yt6VrDy2CmDl8W2iaFfLFLnAow/UsPfm
	 UM5OqUz2r2J5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C0240832;
	Sun, 25 Jan 2026 18:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A34C211B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E0140832
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAfBEtim9Xi4 for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 18:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7861140831
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7861140831
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7861140831
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 053B52003DA;
 Sun, 25 Jan 2026 19:04:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 19:04:11 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 19:04:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260121180549.43744-1-bernd@kuhls.net>
References: <20260121180549.43744-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <1255e19c8f2f136ea1157e7909b3d45e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769364254;
 bh=Evc3ZmPHVSpp6Hx+P3Bwk3Sc3Tvfi4qbo+XzPhwWN3w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OCvbcIKsRfbFqvTdoFP44oGuHPmu3roMiZmr8Zk41MklbstnF30McL/nZkHI39avE
 QYrelkQy9uvK5GHcq4gkmuRp82xjvqxrQO/byJ0D6bsfrTMqIbx4Me5nOcN6bXTAwO
 MYc0bgE/0KXTg7t7cPgiF0tQmDZrs1Kw5rsQBHLd5nVlFhohhy8zxoLkKEFJczR+Tf
 LCaLeTy3sZXUKnJW3pB6tvZvOdj2aYJDPeC9xdjJ6vf85cAa/HJez5AAI8mKmgK9ZM
 wu7kr3fAqpqAi2fis0FkXKC5WLPTBpJ6+uA4ZIDw0jr8crgI8sC1PFTFn2fDVPvYtJ
 /EfahC1KlIayA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OCvbcIKs
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.10.1
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

On 21/01/2026 19:05, Bernd Kuhls wrote:
> Switched to tarball hash provided by github.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
